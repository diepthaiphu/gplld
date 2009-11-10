 $(document).ready(function() {
   // do stuff when DOM is ready
   $('.pop').hover(function(){
   	// mouseover
	$(this).parent().children('.pop-list').css("display", "block");
   }, function(){
    $(this).parent().children('.pop-list').css("display", "none");
   })
 });
