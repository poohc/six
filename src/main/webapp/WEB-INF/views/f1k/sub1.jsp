<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="./common/common.jsp" />
</head>
<body>
<div class="wrapper">
	<!-- header -->
	<jsp:include page="./common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
        <div class="naviArea">
            <ul class="navi">
                <li class="home"><a href="#"></a></li>
                <li><a href="#">퍼스트원의시각</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>퍼스트원의 시각</h1>
            <ul class="tab" id="tab">
                <li class="on"><a href="#div1">시스템 트레이딩</a></li>
                <li><a href="#div2">자체 HTS 개발</a></li>
                <li><a href="#div3">퍼스트원의 투자철학</a></li>
            </ul>
            <div id="div1" class="tab_contents" style="display:block">
                <img src="/resources/f1k/img/tab1.jpeg" alt="" class="imgarea">
            </div>
            <div id="div2" class="tab_contents">
                <img src="/resources/f1k/img/tab2.jpeg" alt="" class="imgarea">
            </div>
            <div id="div3" class="tab_contents">
                <img src="/resources/f1k/img/tab3.jpeg" alt="" class="imgarea">
            </div>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>