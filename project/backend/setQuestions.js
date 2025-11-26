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

  // Get all las ecuaciones and preguntas type shit
  const jsonData = JSON.parse(data.body.json);
  const question = jsonData['question'];
  const answers = jsonData['incorrect-answers'];
  answers.push(jsonData['correct-answer']);
  const shuffled = shuffleArray(answers);

  // FILL VALUES FOR THE PREGUNTAS IYKYK
  const questionText = document.querySelector(".m-duolingo__questionContent");
  questionText.textContent = question;
  for (let i = 0; i < 4; i++) {
    const asnwerText = document.querySelector(`.m-duolingo__answer${i+1}`);
    asnwerText.textContent = shuffled[i];
    let isCorrect = shuffled[i] === jsonData['correct-answer'];
    // Si el boton tiene el correct answer then we say good stuff
    asnwerText.addEventListener("click", () => {
      if (isCorrect) {
        alert("CORRECT ANSWER ONG");
      } else { // Sino ps we do el deste de you stupid
        alert("BRO YOU SO STUPID");
      }
    });
  }
});

