
function returnToLogin() {
  window.location.href = "/Proyecto-Camaron/";
}

window.onload = async (e) => {

  const res = await fetch("project/backend/getpfp.php", {
    method: "GET",
    credentials: "include"
  });

  const data = await res.json();

  if (data.path) {
    console.log(data.path);
    img = document.querySelector(".pfp-holder");
    img.src = data.path;
    console.log(img.src);
  }
  if (data.user) {
    console.log(data.user);
    const name = document.getElementById("username");
    name.innerHTML = data.user;
  }

  // setTimeout(() => {
  //   document.querySelector(".ad-div").style.display = "grid";
  // }, 2000);
  
  //LOAD LECTURES
  const container = document.getElementById("container");

  const lecturesRes = await fetch("project/backend/getlectures.php", {
    method: "GET",
    credentials: "include"
  });

  const lecturesData = await lecturesRes.json();

  
  // console.log(lecturesData);

  if (!lecturesData || !Array.isArray(lecturesData)) {
    console.error("No data");
    return;
  }

  lecturesData.forEach(lecture => {
    const a = document.createElement("a");
    a.href = `/Proyecto-Camaron/lecture?id=${lecture.id}`;
    a.classList.add("lecture-link");

    const article = document.createElement("article");
    article.textContent = lecture.name;

    a.appendChild(article);
    container.appendChild(a);
  })
  .catch(err => console.error("fetch didn't work", err));
};
