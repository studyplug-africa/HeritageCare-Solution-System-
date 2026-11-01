const dashToggle = document.getElementById('dashToggle');
const dashSidebar = document.getElementById('dashSidebar');
const dashFrame = document.getElementById('dashFrame');
const dashLinks = document.querySelectorAll('.dash-nav');

dashToggle.addEventListener('click', () => {
    dashSidebar.classList.toggle('open');
});

dashLinks.forEach(link => {
    link.addEventListener('click', (event) => {
        const href = link.getAttribute('href');
        if (href && href.indexOf('Dashboard.aspx?page=') === 0) {
            event.preventDefault();
            const page = href.split('page=')[1];
            dashFrame.src = page + '.aspx';

            dashLinks.forEach(l => l.classList.remove('active'));
            link.classList.add('active');

            if (window.innerWidth <= 768) {
                dashSidebar.classList.remove('open');
            }
        }
    });
});

const logoutLink = document.getElementById('logoutLink');
const logoutModal = document.getElementById('logoutModal');
const logoutCancel = document.getElementById('logoutCancel');
const logoutConfirm = document.getElementById('logoutConfirm');

logoutLink.addEventListener('click', (event) => {
    event.preventDefault();
    logoutModal.classList.add('open');
});

logoutCancel.addEventListener('click', () => {
    logoutModal.classList.remove('open');
});

logoutConfirm.addEventListener('click', () => {
    window.location.href = 'Logoff.aspx';
});

logoutModal.addEventListener('click', (event) => {
    if (event.target === logoutModal) {
        logoutModal.classList.remove('open');
    }
});