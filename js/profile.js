// open the correct popup when a card icon is clicked
document.querySelectorAll('.card-icon-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const popupId = btn.getAttribute('data-target');
        const popup = document.getElementById(popupId);
        if (popup) popup.classList.add('open');
    });
});

// close popups via close buttons or cancel — also clear the hidden flag
document.querySelectorAll('[data-close]').forEach(btn => {
    btn.addEventListener('click', () => {
        const overlay = btn.closest('.popup-overlay');
        overlay.classList.remove('open');
        const hiddenField = overlay.querySelector('input[type="hidden"]');
        if (hiddenField) hiddenField.value = '';
    });
});

// close popups when clicking the overlay — also clear the hidden flag
document.querySelectorAll('.popup-overlay').forEach(overlay => {
    overlay.addEventListener('click', (event) => {
        if (event.target === overlay) {
            overlay.classList.remove('open');
            const hiddenField = overlay.querySelector('input[type="hidden"]');
            if (hiddenField) hiddenField.value = '';
        }
    });
});

// reopen popups that were submitted (so the message stays visible)
window.addEventListener('DOMContentLoaded', () => {
    const infoOpen = document.getElementById('hfInfoOpen');
    const passwordOpen = document.getElementById('hfPasswordOpen');

    if (infoOpen && infoOpen.value === 'true') {
        document.getElementById('infoPopup').classList.add('open');
    }

    if (passwordOpen && passwordOpen.value === 'true') {
        document.getElementById('passwordPopup').classList.add('open');
    }
});