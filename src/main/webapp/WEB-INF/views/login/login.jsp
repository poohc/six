<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
</head>

<body>
<div class="wrapper main">
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
        <div class="container">
            <div class="combine type2">
                <p class="title_type2">로그인</p>
                <img src="../../img/login.jpg" alt="" class="login_img">
                <div class="login_box2">
                    <input type="text" class="input_type2" placeholder="아이디">
                    <input type="text" class="input_type2" placeholder="비밀번호">
                    <button class="btn_type2">로그인</button>
                    <div class="id_pw">
                        <a href="#">아이디 /</a>
                        <a href="#"> 비밀번호 찾기</a>
                    </div>
                </div>
            </div>
            <!-- Left Side -->
            <jsp:include page="../common/left.jsp" />
            <!-- Left Side end -->
            
            <!-- Left Side -->
            <jsp:include page="../common/right.jsp" />
            <!-- Left Side end -->
        </div>
	</div>
	<!-- //container -->
	<jsp:include page="../common/footer.jsp" />
</div>
</body>
</html>