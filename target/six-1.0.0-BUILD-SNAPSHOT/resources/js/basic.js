// Mobile GNB Menu
$(function() {
  mobileMenu();
  function mobileMenu(){
    /*
    $(".depth1 li a").click(function(e){
      e.preventDefault();
      $(".depth1 li a").not(this).removeClass("on").next().slideUp();
      $(this).toggleClass("on").next().slideToggle();
      $(".depth2 li a").not(this).next().slideUp();
    });

    $(".depth2 li a").click(function(e){
      if($(this).next().length != 0){

        e.preventDefault();
        $(".depth2 li a").not(this).removeClass("on").next().slideUp();
        $(this).toggleClass("on").next().slideToggle();
      }
      e.stopPropagation();
    });
    */

      $(".depth2 li a").on("click",function(event){
        if($(this).next().length != 0){
          $(".planprice2").text('+');
          event.preventDefault();
          $(".depth2 li a").not(this).removeClass("on").next().slideUp();
          $(this).toggleClass("on").next().slideToggle();
          $(".on .planprice2").text('-');
        }
        event.stopImmediatePropagation();

      });

      $(".depth1 li a").on("click",function(event){

        if($(this).next().length != 0){
          $(".planprice").text('+');
          event.preventDefault();
          $(".depth1 li a").not(this).removeClass("on").next().slideUp();
          $(this).toggleClass("on").next().slideToggle();
          $(".on .planprice").text('-');
          $(".depth2 li a").not(this).next().slideUp();
        }
      });
    };

});


function toggle_mobile_menu() {
  $(".depth2").css('display', 'none');
  $(".navigation_mobile_bg").toggle();
  $("#navigation_mobile").toggle();
}