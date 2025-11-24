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

const shuffle = [1, 2, 3, 4, 5];

function shuffleArray(A) {
  let currentIndex = A.length,
    randomIndex;

  // While there remain elements to shuffle.
  while (currentIndex !== 0) {
    // Pick a remaining element.
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;

    // And swap it with the current element.
    [A[currentIndex], A[randomIndex]] = [
      A[randomIndex],
      A[currentIndex],
    ];
  }

  return A;
}

console.log(shuffleArray(shuffle));