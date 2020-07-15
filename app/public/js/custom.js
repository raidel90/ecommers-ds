if($("#type_slug").val() == "sections"){
	
	function initialState(){
		$("select[name=subcategory_id]").parent().attr("style", "display:none;");
		$("select[name=brand_id]").parent().attr("style", "display:none;");
		$("select[name=brandscategory_id]").parent().attr("style", "display:none;");
		$("select[name=productstype_id]").parent().attr("style", "display:none;");
	}

	function changeModel(value){
		switch(value){
			  case "brandscategorie":
			    	$("select[name=brandscategory_id]").parent().removeAttr("style");
			    break;
			  case "brandssubcategorie":
			    	$("select[name=subcategory_id]").parent().removeAttr("style");
			    break;
			  case "brand":
			    	$("select[name=brand_id]").parent().removeAttr("style");
			    break;
			  case "productstype":
			    	$("select[name=productstype_id]").parent().removeAttr("style");
			    break;

		}
	}

	initialState();
	changeModel($("select[name=model]").val());

	$("select[name=model]").on("change", function(){
		initialState();
		changeModel($(this).val());
	});
}


if($("#type_slug").val() == "users"){
	const urlParams = new URLSearchParams(window.location.search);
 	if (urlParams.get('r') == 3) {
 		$("select[name=role_id]").val(3).change().parent().toggle();
 		$(".page-title").html($(".page-title").html().replace("Añadir User", "Añadir Empresa"));
 	}else{
 		setTimeout(function(){changeRole(0)}, 250);
 		$($("select[name=role_id] option")[3]).remove();
 		$($("select[name=role_id] option")[0]).remove();
 		$("select[name=role_id]").change().select2();
 		$("select[name=role_id]").val(2).select2();
 	}
	function changeRole(value){
		switch(value){
			  case "3":
			    	$("input[name=insumos]").parent().parent().css("display", "block");
			    break;
			  default:
			    	$("input[name=insumos]").parent().parent().css("display", "none");
			    break;

		}
	}

	

	$("select[name=role_id]").on("change", function(){
		changeRole($(this).val());
	})
}