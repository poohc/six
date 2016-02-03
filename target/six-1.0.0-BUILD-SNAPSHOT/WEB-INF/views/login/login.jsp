<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
		$('#loginBtn').click(function(){
			if($('#j_username').val() == ''){
				alert('ID를 입력해주세요');
				return false;
			}
			if($('#j_password').val() == ''){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			
			$('#loginForm').submit();			
		});
		
	});
	
	<c:if test="${msg != ''}">
  		alert(${msg});
	</c:if>
	
</script>
</head>
<body>

<form id="loginForm" action="j_spring_security_check" method="post">
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
                    <input type="text" class="input_type2" placeholder="아이디" id="j_username" name="j_username">
                    <input type="text" class="input_type2" placeholder="비밀번호" id="j_password" name="j_password">
                    <button class="btn_type2" type="button" id="loginBtn">로그인</button>
                    <div class="id_pw">
                        <a>아이디 /</a>
                        <a> 비밀번호 찾기</a>
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
</form>
</body>
</html>