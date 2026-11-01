//trim trailing spaces before submit and clear any stale messages
const btnSave = document.getElementById('btnSave');

if (btnSave) {
    btnSave.addEventListener('click', () => {
        const fields = document.querySelectorAll('.addsite-input');
        fields.forEach(f => f.value = f.value.trim());
    });
}