<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=medium-dpi" name="viewport">
<title>SIX</title>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<script type="text/javascript" src="/resources/js/jquery-1_11_1_min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.newsticker.js"></script>
<script type="text/javascript" src="/resources/js/html5.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/menuTab.js"></script>
<script type="text/javascript" src="/resources/js/basic.js"></script>
<script type="text/javascript" src="/resources/js/jquery.form.js"></script>
<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!--뉴스티커-->
<script type="text/javascript">
	jQuery(function(){
// 		jQuery('#newsticker1').Vnewsticker({
// 			speed: 700,         //스크롤 스피드
// 			pause: 2000,        //잠시 대기 시간
// 			mousePause: true,   //마우스 오버시 일시정지(true=일시정지)
// 			showItems: 1,       //스크롤 목록 갯수 지정(1=한줄만 보임)
// 			direction : "left"    //left=옆으로스크롤, up=위로스크롤, 공란=아래로 스크롤
// 		});

		jQuery('#newsticker2').Vnewsticker({
			speed: 700,         //스크롤 스피드
			pause: 2000,        //잠시 대기 시간
			mousePause: true,   //마우스 오버시 일시정지(true=일시정지)
			showItems: 1,       //스크롤 목록 갯수 지정(1=한줄만 보임)
			direction : "Up"    //left=옆으로스크롤, up=위로스크롤, 공란=아래로 스크롤
		});

// 		jQuery('#newsticker3').Vnewsticker({
// 			speed: 700,         //스크롤 스피드
// 			pause: 2000,        //잠시 대기 시간
// 			mousePause: true,   //마우스 오버시 일시정지(true=일시정지)
// 			showItems: 3,       //스크롤 목록 갯수 지정(1=한줄만 보임)
// 			direction : "Up"    //left=옆으로스크롤, up=위로스크롤, 공란=아래로 스크롤
// 		});
		
// 		jQuery('#newsticker4').Vnewsticker({
// 			speed: 700,         //스크롤 스피드
// 			pause: 2000,        //잠시 대기 시간
// 			mousePause: true,   //마우스 오버시 일시정지(true=일시정지)
// 			showItems: 2,       //스크롤 목록 갯수 지정(1=한줄만 보임)
// 			direction : ""    //left=옆으로스크롤, up=위로스크롤, 공란=아래로 스크롤
// 		});
	});
</script>

<style type="text/css" media="all">
	.newsticker {position:relative;overflow:hidden;width:410px;height:21px;text-align:left;border:0px solid #999}
	.newsticker ul {padding:0;margin:0}
	.newsticker ul li {float:left;width:410px;;padding:0;font-size:12px;color:#df412d;letter-spacing:-1px;height:21px;line-height:21px;list-style:none;overflow:hidden;text-overflow: ellipsis;white-space: nowrap;}
	.newsticker ul li a {color:#df412d}
	.newsticker ul li strong {color:#df412d}
</style>
</head>
</html>