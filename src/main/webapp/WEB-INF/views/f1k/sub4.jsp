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
                <li class="home"><a href="index.html"></a></li>
                <li><a href="sub4.html">투자스토리</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>투자스토리</h1>
            <div class="story">
                <div class="storyTitle">발로 뛰는 기업분석 </div>
                <div class="storyTitle2">IR 미팅과 점진적인 기업접근으로 인한 기업의 디테일한 분석</div>
                <div class="storyTitle3">“발로 뛰는 기업분석만이 살아 남을 수 있다"</div>
                <div class="storyTitle4">근본이 사라지지 않듯이 전통적인 분석법은 영원할 것 입니다.</div>
                <img src="/resources/f1k/img/story1.png" alt="">
            </div>
            <div class="story type2">
                <div class="storyTitle">시스템을 이용한 완벽한 기술 분석</div>
                <div class="storyTitle2">2년 5개월간의 성과검증과정을 거치고 도입된 시스템을 투자결정전 <br>완벽한 매수시점을 분석하는 기술적 분석 병행</div>
                <div class="storyTitle3">“차가운 분석은 따뜻한 결과를 가져온다.”</div>
                <div class="storyTitle4">냉철한 시스템 분석으로 티끌의 오차도 허용하지 않을 것 입니다.</div>
                <img src="/resources/f1k/img/story2.png" alt="">
            </div>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>