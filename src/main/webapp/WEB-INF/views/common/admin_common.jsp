<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=medium-dpi" name="viewport">
<title>SIX_ADMIN</title>
<link rel="stylesheet" href="/resources/css/layout.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<script type="text/javascript" src="/resources/js/jquery-1_11_1_min.js"></script>
<script type="text/javascript" src="/resources/js/hideshow.js"></script>
<script type="text/javascript" src="/resources/js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.equalHeight.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
      	  $(".tablesorter").tablesorter(); 
});
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
	
	//On Click Event
	$("ul.tabs li").click(function() {
	
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
	
		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
</script>
<script type="text/javascript">
$(function(){
    $('.column').equalHeight();
});

</script>
<title>SIX 관리자 페이지</title>
</head>
</html>