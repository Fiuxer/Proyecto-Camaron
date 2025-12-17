const params2 = new URLSearchParams(window.location.search);
const id2 = params2.get("id");

function shuffleArray(arr) {
  let i = arr.length;
  while (i > 0) {
    const j = Math.floor(Math.random() * i);
    i--;
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

window.addEventListener("load", async () => {
  try {
    const res = await fetch(
      `project/backend/fetchQuestions.php?id=${id2}`,
      {
        method: "GET",
        credentials: "include",
      }
    );

    const data = await res.json();

    if (!data || data.error) {
      console.error("Backend said sygau:", data);
      return;
    }

    const questionArray = data.body;
    let currentIndex = 0;

    const questionText = document.querySelector(
      ".m-duolingo__questionContent"
    );

    const answerButtons = [
      document.querySelector(".m-duolingo__answer1"),
      document.querySelector(".m-duolingo__answer2"),
      document.querySelector(".m-duolingo__answer3"),
      document.querySelector(".m-duolingo__answer4"),
    ];

    function loadQuestions() {
      const raw = questionArray[currentIndex];

      // 🔥 THIS IS THE IMPORTANT PART
      // raw = [id, something, "JSON STRING"]
      const parsed = JSON.parse(raw[2]);

      console.log("Parsed question:", parsed);

      const incorrect = Array.isArray(parsed["incorrect-answers"])
        ? parsed["incorrect-answers"]
        : [];

      const allAnswers = shuffleArray([
        ...incorrect,
        parsed["correct-answer"],
      ]);

      questionText.textContent = parsed.question;

      answerButtons.forEach((btn, i) => {
        btn.textContent = allAnswers[i];

        btn.onclick = () => {
          if (allAnswers[i] === parsed["correct-answer"]) {
            console.log("YOOOO W SPEED 🔥");
          } else {
            console.log("Kevin answer 💔");
          }
        };
      });
    }

    loadQuestions();
  } catch (err) {
    console.error("JS imploded:", err);
  }
});
