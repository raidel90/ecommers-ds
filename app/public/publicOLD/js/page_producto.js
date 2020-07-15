/*
** Categoria Producto
*/
$('.premium-carousel').slick({
	slidesToShow: 5,
	prevArrow: '<div class="arrow-prev"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	nextArrow: '<div class="arrow-next"><svg xmlns="http://www.w3.org/2000/svg" width="110.4" height="185.3" viewBox="0 0 110.4 185.3"><path d="M17.8 185.3L.1 167.6 75 92.7l-75-75L17.7 0l92.7 92.7z"/></svg></div>',
	margin: 30,
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
			// arrows: false,
			slidesToShow: 4,
			// slidesToShow: 2.1,
		}
	},
	{
		breakpoint: 576,
		settings: {
			arrows: false,
			slidesToShow: 2.1,
		}
	}
	]
})


function responsiveCollapse(){
	if ($(window).width() < 768) {
		$('.collapse').collapse('hide');
	}else{
		$('.collapse').collapse('show');
	}
}

$( window ).resize(function() {
	responsiveCollapse()
});

responsiveCollapse()
