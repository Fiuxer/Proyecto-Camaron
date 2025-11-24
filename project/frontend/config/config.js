// Llama a la imagen para ver si hay sesión
window.onload = async () => {

const res = await fetch("project/backend/getpfp.php", {
    method: "GET",
    credentials: "include"
});

// Verificación de sesión
const data = await res.json();
if (!data || data.success === false) {
    window.location.href = "/Proyecto-Camaron/login";
    return;
}
}

document.addEventListener('DOMContentLoaded', async () => {
  const form = document.getElementById('profile-form');
  const pfpInput = document.getElementById('pfp');
  const pfpPreview = document.getElementById('pfp-preview');
  const removePfpBtn = document.getElementById('remove-pfp');
  const result = document.getElementById('result');
  const logoutBtn = document.getElementById('logout-btn');

  // Cargar datos del usuario desde la BD
  try {
    const res = await fetch('project/backend/get_user_data.php', { credentials: 'include' });
    const data = await res.json();
    if (data.ok) {
      document.getElementById('name').value = data.name || '';
      document.getElementById('user').value = data.user || '';
      document.getElementById('email').value = data.email || '';
    }
  } catch (e) {
    console.error('Error cargando datos del usuario:', e);
  }

  // Preview selected image
  pfpInput.addEventListener('change', () => {
    const f = pfpInput.files[0];
    if (!f) return;
    const url = URL.createObjectURL(f);
    pfpPreview.src = url;
  });

  removePfpBtn.addEventListener('click', async () => {
    if (!confirm('Eliminar foto de perfil?')) return;
    const resp = await fetch('project/backend/update_profile.php', {
      method: 'POST',
      body: (new FormData()).append ? createForm({remove_pfp:1}) : null
    });
    const json = await resp.json();
    result.textContent = json.message || 'Hecho';
    if (json.ok) pfpPreview.src = 'project/backend/getpfp.php?ts=' + Date.now();
  });

  logoutBtn.addEventListener('click', async () => {
    await fetch('project/backend/logout.php');
    location.href = 'Proyecto-Camaron/login';
  });

  form.addEventListener('submit', async (ev) => {
    ev.preventDefault();
    result.textContent = 'Guardando...';

    const fd = new FormData();
    fd.append('name', form.name.value.trim());
    fd.append('user', form.user.value.trim());
    fd.append('email', form.email.value.trim());
    fd.append('current', form['current-password'].value);
    fd.append('new', form['new-password'].value);
    fd.append('confirm', form['confirm-password'].value);
    if (pfpInput.files[0]) fd.append('pfp', pfpInput.files[0]);

    try {
      const res = await fetch('project/backend/update_profile.php', {
        method: 'POST',
        body: fd,
        credentials: 'same-origin'
      });
      const data = await res.json();
      if (data.ok) {
        result.style.color = '#09c009ff';
        result.textContent = data.message || 'Actualizado';
        // refresh avatar
        pfpPreview.src = 'project/backend/getpfp.php?ts=' + Date.now();
      } else {
        result.style.color = '#7d3232ff';
        result.textContent = data.message || 'Error';
      }
    } catch (e) {
      result.style.color = '#ffffffff';
      result.textContent = '';
    }
  });

  // helper not strictly necessary but kept for clarity
  function createForm(obj){
    const f = new FormData();
    Object.keys(obj).forEach(k => f.append(k, obj[k]));
    return f;
  }
});