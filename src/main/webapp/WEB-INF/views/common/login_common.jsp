<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="kospi">
    <p class="kospi_title">KOSPI</p>
    <p class="kospi_title2">1,915.53 <span>7.09 (1.75%)</span></p>
    <p class="kospi_title">KOSPI</p>
    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
    <p class="kospi_title">KOSPI</p>
    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
</div>
<form id="loginForm" action="j_spring_security_check" method="post">
	<div class="login_box">
	    <input type="text" class="id_input" placeholder="아이디"  id="j_username" name="j_username">
	    <input type="password" class="password_input" placeholder="비밀번호" id="j_password" name="j_password">
	    <button class="login_btn">로그인</button>
	    <a href="/login/login.do" class="id_search">아이디/비밀번호찾기</a>
	    <a href="/member/memberNotice.do" class="join">회원가입</a>
	</div>
</form>