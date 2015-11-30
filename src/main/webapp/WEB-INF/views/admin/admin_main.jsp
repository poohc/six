<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/admin.css" />
<script type="text/javascript" src="/resources/js/jquery-1_11_1_min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	    var date = new Date();
	    
	    var monthEng = new Array();
	    monthEng[0] = "January";
	    monthEng[1] = "February";
	    monthEng[2] = "March";
	    monthEng[3] = "April";
	    monthEng[4] = "May";
	    monthEng[5] = "June";
	    monthEng[6] = "July";
	    monthEng[7] = "August";
	    monthEng[8] = "September";
	    monthEng[9] = "October";
	    monthEng[10] = "November";
	    monthEng[11] = "December";
	    
	    var year = date.getFullYear();
	    var month = date.getMonth();
	    var day = date.getDate();
	    
	    $('#yearSpan').text(',' + year);
	    $('#monthSpan').text(monthEng[month]);
	    $('#daySpan').text(day);
	    
	});
	
</script>
<title>SIX 관리자 페이지</title>
</head>
<body>
		<!-- Content -->
		<div id="content">
			<div class="inner">`
				<!-- Post -->
				<article class="box post post-excerpt">
					<header>
						<h2>SIX 관리자 페이지</h2>
					</header>						
				</article>
				<!-- Post -->
				<article class="box post post-excerpt">
					<header>
						<h2>SIX ADMIN PAGE</h2>
					</header>
					<div class="info">
						<span class="date">
							<span class="month" id="monthSpan"></span>
							<span class="day" id="daySpan"></span>
							<span class="year" id="yearSpan">,2015</span>
						</span>
						<ul class="stats">
							<li><a href="#" class="icon fa-comment">16</a></li>
							<li><a href="#" class="icon fa-heart">32</a></li>
							<li><a href="#" class="icon fa-twitter">64</a></li>
							<li><a href="#" class="icon fa-facebook">128</a></li>
						</ul>
					</div>
					<img src="/resources/img/adminBg.png" />							
				</article>
			</div>
		</div>
		<!-- Sidebar -->
		<div id="sidebar">
			<!-- Logo -->
			<h1 id="logo"><a href="#">SIX</a></h1>
			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="/admin/partnerList.do">SIX 파트너 신청 리스트</a></li>							
				</ul>
			</nav>
		</div>
	</body>
</html>