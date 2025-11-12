const params = new URLSearchParams(window.location.search);
const id = params.get('id');

window.onload = async (e) => {
  const res = await fetch(`project/backend/getmarkdown.php?id=${id}`, {
    method: "GET",
    credentials: "include"
  });

  const data = await res.json();

  if (!data.success) {
    document.body.innerHTML = `<h1>${data.error}</h1>`;
    return;
  }

  const lec = data.lecture;
  document.querySelector("main").innerHTML = `
    <h1>${lec.nombre}</h1>
    ${marked.parse(lec.markdown)}
  `;

  if (window.MathJax) {
    MathJax.typesetPromise();
  }
}