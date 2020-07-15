/*
** Top Slider
*/
$('.main-slider').slick({
	arrows: false,
	dots: true,
})

/*
** Producto slider
*/
$('.main-productos--slider').slick({
	slidesToShow: 7,
	prevArrow: '<div class="arrow-prev"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	nextArrow: '<div class="arrow-next"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	centerMode: true,
	responsive: [
	{
		breakpoint: 992,
		settings: {
			slidesToShow: 3,
		}
	},
	{
		breakpoint: 768,
		settings: {
			slidesToShow: 3,
		}
	},
	{
		breakpoint: 576,
		settings: {
			centerMode: false,
			slidesToShow: 3,
		}
	}
	]
})
$('.card-categoria').on('mouseover', function(){
	$(this).parent().find('.card-categoria.active').removeClass('active');
	$(this).addClass('active');
})

/*
** Showcase slider
*/
$('.semillas-slider').slick({
	slidesToShow: 6,
	prevArrow: '<div class="arrow-prev"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	nextArrow: '<div class="arrow-next"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	responsive: [
	{
		breakpoint: 992,
		settings: {
			slidesToShow: 3,
		}
	},
	{
		breakpoint: 768,
		settings: {
			slidesToShow: 2.5,
			// centerMode: true,
		}
	}
	]
})


$('.productos-slider').slick({
	slidesToShow: 5,
	prevArrow: '<div class="arrow-prev"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	nextArrow: '<div class="arrow-next"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	responsive: [
	{
		breakpoint: 992,
		settings: {
			slidesToShow: 3,
		}
	},
	{
		breakpoint: 768,
		settings: {
			slidesToShow: 2.5,
		}
	},
	]
})

$('.todos-usados-slider').slick({
	slidesToShow: 2,
	prevArrow: '<div class="arrow-prev"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	nextArrow: '<div class="arrow-next"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	responsive: [
	{
		breakpoint: 768,
		settings: {
			slidesToShow: 1.1,
		}
	},
	]
})

/*
** Campos Sliders
*/
$('.main-campos--slider').slick({
	slidesToShow: 5,
	prevArrow: '<div class="arrow-prev"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	nextArrow: '<div class="arrow-next"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	responsive: [
	{
		breakpoint: 992,
		settings: {
			slidesToShow: 3,
		}
	},
	{
		breakpoint: 768,
		settings: {
			slidesToShow: 2.5,
		}
	},
	]
})


/*
** Menu
*/
$('.js-btn-menu').on('click', function(){
	$('.main-menu').addClass('active');
})
$('.main-menu--bg').on('click', function(){
	$('.main-menu').removeClass('active');
})


/*
** Modal open
*/
$('.js-modal-login').on('click', function(e){
	e.preventDefault();
	$('.modal-login').addClass('active');
})
$('.modal-overlay').on('click', function(e){
	e.preventDefault();
	$(this).parent().removeClass('active');
})
$('.close_modal').on('click', function(e){
	e.preventDefault();
	$(this).parent().parent().removeClass('active');
})
$('.dropdown-wrap button').on('click', function(e){
	e.preventDefault();
	$(this).parent().toggleClass('active');
})