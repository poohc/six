<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<div class="kospi">
    <p class="kospi_title">KOSPI</p>
    <p class="kospi_title2">1,915.53 <span>7.09 (1.75%)</span></p>
    <p class="kospi_title">KOSPI</p>
    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
    <p class="kospi_title">KOSPI</p>
    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
</div>
<form id="loginForm" action="j_spring_security_check.do" method="post">
	<c:choose>
	<c:when test="${not empty sessionScope.userInfo}">
		
	</c:when>
	<c:otherwise>
		<div class="login_box">
		    <input type="text" class="id_input" placeholder="아이디"  id="j_username" name="j_username">
		    <input type="password" class="password_input" placeholder="비밀번호" id="j_password" name="j_password">
		    <button class="login_btn">로그인</button>
		    <a href="/login/login.do" class="id_search">아이디/비밀번호찾기</a>
		    <a href="/member/memberNotice.do" class="join">회원가입</a>	    
		</div>
	</c:otherwise>		
	</c:choose>
</form>