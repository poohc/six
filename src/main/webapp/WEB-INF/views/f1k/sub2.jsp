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
                <li><a href="sub6_list.html">퍼스트원의 다짐</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>퍼스트원의 다짐</h1>
            <ul class="promise">
                <li>
                    <img src="/resources/f1k/img/promise1.png" alt="">
                    <div class="promiseCont">
                        <p class="promiseTitle">01</p>
                        <p class="promiseTitle2">최고의 자문 성과로 <br>고객에게 믿을 수 있는 <br>기업이 되겠습니다.</p>
                    </div>
                </li>
                <li>
                    <img src="/resources/f1k/img/promise2.png" alt="">
                    <div class="promiseCont">
                        <p class="promiseTitle">02</p>
                        <p class="promiseTitle2">고객의 자산을 <br>플러스 하는 것이 <br>최우선의 목표 입니다. </p>
                    </div>
                </li>
                <li>
                    <img src="/resources/f1k/img/promise3.png" alt="">
                    <div class="promiseCont">
                        <p class="promiseTitle">03</p>
                        <p class="promiseTitle2">완벽한 투자 결정이 <br>나기전까지 끊임없이 분석 <br>하고 또 분석하겠습니다. </p>
                    </div>
                </li>
            </ul>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>