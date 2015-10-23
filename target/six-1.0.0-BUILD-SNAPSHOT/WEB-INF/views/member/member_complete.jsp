<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$('#mainBtn').click(function(){
		
	});
	
	$('#loginBtn').click(function(){
		
	});
});
</script>
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
                <p class="title_type2">회원가입 03</p>
                <img src="/resources/img/join_done.jpg" alt="" class="join_done">
                <div class="center_btn">
                    <button class="btn_cancel" type="button" id="mainBtn">메인으로</button>
                    <button class="btn_ok" type="button" id="loginBtn">로그인</button>
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