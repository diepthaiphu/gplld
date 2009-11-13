$(document).ready(function() {

$('.pop').each(function() {
	var pop = $(this);
	var popList = $(this).parent().children('.pop-list');
	$(this).hover(function(){
		popList.css("display", "block");
	}, function(){})
	popList.hover(function(){}, function(){
		popList.css("display", "none");
	})
}
);

$('form').jqTransform();

});
