/**********************************************************************************/
// TAB
/**********************************************************************************/
$(function(){
    $('.tab_contents:eq(0)').show();
    $('#tab li a').click(function(){
        $('#tab li').removeClass('on');
        $(this).parent().addClass('on');
        $('.tab_contents').hide();
        var activeTab = $(this).attr('href');
        $(activeTab).show();
        return false;
    });
});


/**********************************************************************************/
// 아코디언
/**********************************************************************************/
$(document).ready(function(){
  $('.white').bind('click', function(){
    var target = $(this).find('span');
    if(target.attr('class') == 'open'){
      target.attr('class','close').text('닫기');
      $(this).next('.text2').show();
    }else{
      target.attr('class','open').text('열기');
      $(this).next('.text2').hide();
    }
  });
});
