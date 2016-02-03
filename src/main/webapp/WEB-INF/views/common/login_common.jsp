<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>   
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#logoutBtn').click(function(){
			$('#loginForm').attr('action','/login/logout.do');
			$('#loginForm').submit();			
		});
		
	});
</script> 
<div class="kospi">
	<p class="kospi_title">KOSPI</p>
                    <c:choose>
                    <c:when test="${fn:contains(stockInfo.KOSPI_UPDOWN_VAL,'▲')}">
                    	<p class="kospi_title2 type2">
                    </c:when>
                    <c:otherwise>
                    	<p class="kospi_title2">
                    </c:otherwise>
                    </c:choose>
                    ${stockInfo.KOSPI} <span>${stockInfo.KOSPI_UPDOWN_VAL} (${stockInfo.KOSPI_UPDOWN_PER})</span></p>
                    <p class="kospi_title">KOSPI200</p>
                    <c:choose>
                    <c:when test="${fn:contains(stockInfo.KOSPI200_UPDOWN_VAL,'▲')}">
                    	<p class="kospi_title2 type2">
                    </c:when>
                    <c:otherwise>
                    	<p class="kospi_title2">
                    </c:otherwise>
                    </c:choose>${stockInfo.KOSPI200} <span>${stockInfo.KOSPI200_UPDOWN_VAL} (${stockInfo.KOSPI200_UPDOWN_PER})</span></p>
                    <p class="kospi_title">KOSDAQ</p>
                    <c:choose>
                    <c:when test="${fn:contains(stockInfo.KOSDAQ_UPDOWN_VAL,'▲')}">
                    	<p class="kospi_title2 type2">
                    </c:when>
                    <c:otherwise>
                    	<p class="kospi_title2">
                    </c:otherwise>
                    </c:choose>${stockInfo.KOSDAQ} <span>${stockInfo.KOSDAQ_UPDOWN_VAL} (${stockInfo.KOSDAQ_UPDOWN_PER})</span></p>
</div>
<form id="loginForm" action="j_spring_security_check.do" method="post">
	<security:authorize access="hasRole('ROLE_USER')" var="isUser" />
	<security:authorize access="hasRole('ROLE_PARTNER')" var="isPartner" />
	<security:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
	<c:choose>
	<c:when test="${not empty sessionScope.userInfo}">
		<div class="login_box type2">
			<p class="login_title">SIX
				<c:choose>
					<c:when test="${isAdmin}">
         				<em>관리자</em>
         			</c:when>            				
         			<c:when test="${isPartner}">
         				<em>파트너</em>
         			</c:when>
         			<c:when test="${isUser}">
         				<em>일반회원</em>
         			</c:when>		                    	
	        	</c:choose>
	        	<button type="button" id="logoutBtn">로그아웃</button>
	        </p>
	        <p class="login_title2"><em>${sessionScope.userInfo.name}</em> 회원님</p>
	        <p class="login_title3"><img src="/resources/img/diamond.png" alt=""><em>포인트</em><span>${userPoint} P</span></p>
	        <ul>
	            <li><a href="/point/pointBuy.do">포인트신청</a></li>
	            <li><a href="/point/pointUser.do">구매내역</a></li>
	            <li><a>회원정보</a></li>
	        </ul>
	    </div>
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