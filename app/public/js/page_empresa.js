/*
** Categoria Empresa
*/

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
