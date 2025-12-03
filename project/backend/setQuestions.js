/* THE JSON SHOULD COME IN LIKE THIS
{
  question: "SOME LONG ASS QUESTION TYPE SHIT",
  correct: "Blah Blah Blah",
  incorrect: [
    "Bleh Bleh Bleh",
    "HUP!",
    "Hublublublublu"
  ]
}

The code will transform this into
questionContent.textContent = "SOME LONG ASS QUESTION TYPE SHIT";
/ The place where the correct answer is will be random
shuffle(everything)
button1.textContent = "HUP!";
button2.textContent = "Hublublublublu";
button3.textContent = "Blah Blah Blah";
button4.textContent = "Bleh Bleh Bleh";

buttons.addEventListener("click or sum I don't remember", (element) => {
  if (element.target.textContent == correctAnswer) {
    alert("YOURE SO GOOD, Good boy~");
  } else {
    alert("Stupid retard");
  }
})
*/

const params2 = new URLSearchParams(window.location.search);
const id2 = params2.get('id');

function shuffleArray(A) {
  let cInd = A.length, rInd;
  while (cInd !== 0) {
    rInd = Math.floor(Math.random() * cInd);
    cInd--;
    [A[cInd],A[rInd]] = [
      A[rInd],
      A[cInd],
    ];
  } return A;
}

window.addEventListener("load", async () => {

  const res = await fetch(`project/backend/fetchQuestions.php?id=${id2}`, { // Usa fetchQuestions.php
    method: "GET",
    credentials: "include"
  });

  const data = await res.json();

  if(data.error) { // Sum errors just in case de que tenemos oneathose errores
    console.error("There was an error fetching the data: " + data.body);
    return;
  } else if (!data) {
    console.error("There was no data fetched");
    return;
  }

  
  const questionArray = data.body;
  let currentIndex = 0;
  
  const questionText = document.querySelector(".m-duolingo__questionContent");
  const asnwerText = [
    document.querySelector("m-duolingo__answer1"),
    document.querySelector("m-duolingo__answer2"),
    document.querySelector("m-duolingo__answer3"),
    document.querySelector("m-duolingo__answer4"),
  ];

  function loadQuestions() {
    const q = questionArray[currentIndex];
    const answers = q['incorrect-answers'];
    answers.push(q['correct-answer']);
    const shuffled = shuffleArray(answers);

    questionText.textContent = q['question'];

    asnwerText.forEach((btn, i) => {
      btn.textContent = shuffled[i];
      const isCorrect = shuffled[i] === q['correct-answer'];
      console.log(shuffled[i]);
      
      btn.onclick = () => {
        if (isCorrect) {
          console.log("Yoooo W speed");
        } else {
          console.log("U never getting into Agartha");
        }
      }
    });

  }
  loadQuestions();
});

