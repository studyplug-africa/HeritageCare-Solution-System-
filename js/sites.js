const rowsPerPage = 8;

const tableBody = document.getElementById('sitesBody');
const allRows = Array.from(tableBody.querySelectorAll('tr'));
const searchInput = document.getElementById('searchInput');
const filterCondition = document.getElementById('filterCondition');
const emptyState = document.getElementById('sitesEmpty');
const paginationInfo = document.getElementById('paginationInfo');
const paginationControls = document.getElementById('paginationControls');

const viewPopup = document.getElementById('viewPopup');
const viewPopupTitle = document.getElementById('viewPopupTitle');
const viewPopupLocation = document.getElementById('viewPopupLocation');
const viewPopupCondition = document.getElementById('viewPopupCondition');
const viewPopupCreated = document.getElementById('viewPopupCreated');
const viewPopupDescription = document.getElementById('viewPopupDescription');
const viewPopupClose = document.getElementById('viewPopupClose');

const deletePopup = document.getElementById('deletePopup');
const deletePopupName = document.getElementById('deletePopupName');
const deletePopupClose = document.getElementById('deletePopupClose');
const deletePopupCancel = document.getElementById('deletePopupCancel');
const btnConfirmDelete = document.getElementById('btnConfirmDelete');
const hiddenDeleteId = document.getElementById('hiddenDeleteId');

let filteredRows = allRows.slice();
let currentPage = 1;

function applyFilters() {
    const search = searchInput.value.toLowerCase().trim();
    const condition = filterCondition.value;

    filteredRows = allRows.filter(row => {
        const cells = row.querySelectorAll('td.view-mode');
        if (cells.length < 5) return false;

        const siteName = cells[0].textContent.toLowerCase();
        const location = cells[1].textContent.toLowerCase();
        const rowCondition = cells[2].textContent.trim();
        const description = cells[3].textContent.toLowerCase();

        const matchesSearch = siteName.includes(search) || location.includes(search) || description.includes(search);
        const matchesCondition = condition === '' || rowCondition === condition;

        return matchesSearch && matchesCondition;
    });

    currentPage = 1;
    renderTable();
}

function renderTable() {
    allRows.forEach(row => row.style.display = 'none');

    const start = (currentPage - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    const pageRows = filteredRows.slice(start, end);

    pageRows.forEach(row => row.style.display = '');

    emptyState.style.display = filteredRows.length === 0 ? 'block' : 'none';

    renderPagination();
}

function renderPagination() {
    const totalPages = Math.ceil(filteredRows.length / rowsPerPage) || 1;

    if (filteredRows.length === 0) {
        paginationInfo.textContent = '';
        paginationControls.innerHTML = '';
        return;
    }

    const start = (currentPage - 1) * rowsPerPage + 1;
    const end = Math.min(currentPage * rowsPerPage, filteredRows.length);
    paginationInfo.textContent = 'Showing ' + start + ' to ' + end + ' of ' + filteredRows.length + ' sites';

    let html = '';
    html += '<button type="button" class="page-btn" data-page="prev" ' + (currentPage === 1 ? 'disabled' : '') + '><i class="fa-solid fa-chevron-left"></i></button>';

    for (let p = 1; p <= totalPages; p++) {
        html += '<button type="button" class="page-btn ' + (p === currentPage ? 'active' : '') + '" data-page="' + p + '">' + p + '</button>';
    }

    html += '<button type="button" class="page-btn" data-page="next" ' + (currentPage === totalPages ? 'disabled' : '') + '><i class="fa-solid fa-chevron-right"></i></button>';

    paginationControls.innerHTML = html;

    paginationControls.querySelectorAll('.page-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            const target = btn.getAttribute('data-page');

            if (target === 'prev' && currentPage > 1) currentPage--;
            else if (target === 'next' && currentPage < totalPages) currentPage++;
            else if (target !== 'prev' && target !== 'next') currentPage = parseInt(target);

            renderTable();
        });
    });
}

// view popup
document.addEventListener('click', (e) => {
    const viewBtn = e.target.closest('.table-action.view');
    if (viewBtn) {
        const row = viewBtn.closest('tr');
        viewPopupTitle.textContent = row.dataset.sitename;
        viewPopupLocation.textContent = row.dataset.location;
        viewPopupCondition.textContent = row.dataset.condition;
        viewPopupCreated.textContent = row.dataset.created;
        viewPopupDescription.textContent = row.dataset.description || 'No description';
        viewPopup.classList.add('open');
    }

    // edit mode toggle
    const editBtn = e.target.closest('.table-action.edit');
    if (editBtn) {
        const row = editBtn.closest('tr');
        row.querySelectorAll('.view-mode').forEach(td => td.style.display = 'none');
        row.querySelectorAll('.edit-mode').forEach(td => td.style.display = '');
        row.querySelector('.actions-cell').style.display = 'none';
    }

    // delete confirm popup
    const delBtn = e.target.closest('.table-action.delete');
    if (delBtn) {
        hiddenDeleteId.value = delBtn.dataset.siteid;
        deletePopupName.textContent = delBtn.dataset.sitename;
        deletePopup.classList.add('open');
    }
});

viewPopupClose.addEventListener('click', () => viewPopup.classList.remove('open'));
viewPopup.addEventListener('click', (e) => { if (e.target === viewPopup) viewPopup.classList.remove('open'); });

deletePopupClose.addEventListener('click', () => deletePopup.classList.remove('open'));
deletePopupCancel.addEventListener('click', () => deletePopup.classList.remove('open'));
deletePopup.addEventListener('click', (e) => { if (e.target === deletePopup) deletePopup.classList.remove('open'); });

searchInput.addEventListener('input', applyFilters);
filterCondition.addEventListener('change', applyFilters);

applyFilters();