const newsSlider = document.getElementById('newsSlider');
const newsSlides = newsSlider.querySelectorAll('.news-slide');
const newsDotsContainer = document.getElementById('newsDots');
const newsPrev = document.getElementById('newsPrev');
const newsNext = document.getElementById('newsNext');

let currentSlide = 0;

newsSlides.forEach((slide, index) => {
    const dot = document.createElement('button');
    dot.classList.add('overview-dot');
    if (index === 0) dot.classList.add('active');
    dot.addEventListener('click', () => goToSlide(index));
    newsDotsContainer.appendChild(dot);
});

const newsDots = newsDotsContainer.querySelectorAll('.overview-dot');

function goToSlide(index) {
    newsSlides[currentSlide].classList.remove('active');
    newsDots[currentSlide].classList.remove('active');

    currentSlide = index;

    newsSlides[currentSlide].classList.add('active');
    newsDots[currentSlide].classList.add('active');
}

function nextSlide() {
    goToSlide((currentSlide + 1) % newsSlides.length);
}

function prevSlide() {
    goToSlide((currentSlide - 1 + newsSlides.length) % newsSlides.length);
}

newsNext.addEventListener('click', nextSlide);
newsPrev.addEventListener('click', prevSlide);

newsSlides[0].classList.add('active');

setInterval(nextSlide, 6000);