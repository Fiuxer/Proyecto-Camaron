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

window.addEventListener = ("load", async () => {

  const res = await fetch(`project/backend/fetchQuestions.php?id=${id2}`, { // Uses fetchQuestions.php
    method: "GET",
    credentials: "include"
  });

  const data = await res.json();

  if(data.error) {
    console.error("There was an error fetching the data: " + data.body);
    return;
  } else if (!data) {
    console.error("There was no data fetched");
    return;
  }

  const jsonData = data.body;
  const question = jsonData['question'];
  const answers = jsonData['incorrect-answers'];
  console.log(answers);
});