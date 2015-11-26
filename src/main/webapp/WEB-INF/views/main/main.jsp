<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript" src="/resources/js/boardMain.js"></script>
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
		
		$('#logoutBtn').click(function(){
			$('#loginForm').attr('action','/login/logout.do');
			$('#loginForm').submit();			
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
            <div class="top_area">
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
                    <c:when test="${fn:contains(stockInfo.KOSPI_UPDOWN_VAL,'▲')}">
                    	<p class="kospi_title2 type2">
                    </c:when>
                    <c:otherwise>
                    	<p class="kospi_title2">
                    </c:otherwise>
                    </c:choose>${stockInfo.KOSPI200} <span>${stockInfo.KOSPI200_UPDOWN_VAL} (${stockInfo.KOSPI200_UPDOWN_PER})</span></p>
                    <p class="kospi_title">KOSDAQ</p>
                    <c:choose>
                    <c:when test="${fn:contains(stockInfo.KOSPI_UPDOWN_VAL,'▲')}">
                    	<p class="kospi_title2 type2">
                    </c:when>
                    <c:otherwise>
                    	<p class="kospi_title2">
                    </c:otherwise>
                    </c:choose>${stockInfo.KOSDAQ} <span>${stockInfo.KOSDAQ_UPDOWN_VAL} (${stockInfo.KOSDAQ_UPDOWN_PER})</span></p>
                </div>
                <div class="rolling">
                    <div class="banner_list_box">
                        <div class="visual">
                            <div class="pic">
                                <ul>
                                    <li>
                                        <a href="#"><img src="/resources/img/rolling1.jpg" alt="건강지킴이"></a>
                                    </li>
                                    <li>
                                        <a href="#"><img src="/resources/img/rolling1_1.jpg" alt="건강지킴이"></a>
                                    </li>
                                    <li>
                                        <a href="#"><img src="/resources/img/rolling1_2.jpg" alt="건강지킴이"></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn"></div>
                            <div class="dir">
                                <div class="prev"><span>이전</span></div>
                                <div class="next"><span>다음</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="visual_movie">
            	<form id="loginForm" method="post" action="j_spring_security_check.do">
            	<input type="hidden" id="seq" name="seq">
            	<security:authorize access="hasRole('ROLE_USER')" var="isUser" />
				<security:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
            	<c:choose>
            		<c:when test="${not empty sessionScope.userInfo}">
            		<div class="login_box type2">
            			<p class="login_title">SIX
            				<c:choose>
	            				<c:when test="${isAdmin}">
	            					<em>관리자</em>
	            				</c:when>            				
	            				<c:when test="${isUser}">
	            					<em>일반회원</em>
	            				</c:when>	                    	
	                    	</c:choose>
	                    	<button type="button" id="logoutBtn">로그아웃</button>
	                    </p>
	                    <p class="login_title2"><em>${sessionScope.userInfo.name}</em> 회원님</p>
	                    <p class="login_title3"><img src="/resources/img/diamond.png" alt=""><em>포인트</em><span>10,000 P</span></p>
	                    <ul>
	                        <li><a href="#">포인트신청</a></li>
	                        <li><a href="#">구매내역</a></li>
	                        <li><a href="#">회원정보</a></li>
	                    </ul>
	                </div>
            		</c:when>            		
            		<c:otherwise>
		                <div class="login_box">
		                    <input type="text" class="id_input" placeholder="아이디"  id="j_username" name="j_username">
		                    <input type="password" class="password_input" placeholder="비밀번호" id="j_password" name="j_password">
		                    <button class="login_btn" id="loginBtn">로그인</button>
		                    <a href="/login/login.do" class="id_search">아이디/비밀번호찾기</a>
		                    <a href="/member/memberNotice.do" class="join">회원가입</a>
		                </div>	                	
            		</c:otherwise>
            	</c:choose>
            	</form>            	
                <div class="rolling_movie">
                    <div class="rolling2">
                        <div class="banner_list_box">
                            <div class="visuals">
                                <div class="pic">
                                    <ul>
                                        <li>
                                            <a href="#"><img src="/resources/img/rolling2.jpg" alt="건강지킴이"></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="/resources/img/rolling2.jpg" alt="건강지킴이"></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="/resources/img/rolling2.jpg" alt="건강지킴이"></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="btn"></div>
                                <div class="dir">
                                    <div class="prev"><span>이전</span></div>
                                    <div class="next"><span>다음</span></div>
                                </div>
                            </div>
                    </div>
                    </div>
                    <div class="movie"><a href="#"><img src="/resources/img/movie.jpg" alt=""></a></div>
                </div>
            </div>
            <ul class="name_card">
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile1.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                   <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile3.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile4.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile1.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile3.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile4.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile1.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile3.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/profile4.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">파트너 페이지 이동</a>
                </li>
            </ul>
            <div class="free_area">
                <p class="free_title">SIX 주식정보거래소의 정보제공자와 만나보세요. 무료정보도 많습니다.</p>
                <a href="#" class="free_more">더보기 +</a>
            </div>
            <div class="latest_popular">
                <p class="latest_title">코스피 상장사 498곳 3분기 실적 분석해보니</p>
                <p class="latest_title2">유가증권시장 소속 상장사들이 올 들어 3분기 연속 '불황형 흑자'를 지속한 것으로 나타났다.

'불황형 흑자'란 회사 외형(매출)은 줄었는데 수익(영업이익·순이익)이 늘어난 것을 말한다. 그만큼 업황이 부진한데도 기업들이 허리띠를 졸라매 억지로 수익을 내고 있다는 얘기다.

17일 한국거래소와 한국상장회사협의회에 따르면 연결재무제표를 제출한 유가증권시장 12월 결산법인 588개 중 90개를 제외한 498개를 분석한 결과 올해 3분기 매출액은 408조1554억원으로 지난해 3분기에 비해 0.44% 감소했다. 반면 영업이익(26조1543억원)과 순이익(5조8979억원)은 전년 동기 대비 각각 24.2%와 42.2% 급증했다. 매출액 대비 영업이익률은 3분기 6.4%로 지난해 같은 기간보다 1.27%포인트 높아졌다. 1000원어치를 팔아 영업이익 64원을 남겼다는 얘기다. </p>
            </div>
            <ul class="look_ahead">
                <li>
                    <p class="look_title"><span>무료</span>종목</p>
                    <a href="javaScript:goBoardList('SIX_MARKETFREE_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                    	<c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETFREE_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_MARKETFREE_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_MARKETFREE_BOARD',${boardList.SIX_MARKETFREE_BOARD[loop.index].SEQ})">${boardList.SIX_MARKETFREE_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_MARKETFREE_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>투자</span>전략</p>
                    <a href="javaScript:goBoardList('SIX_MARKETISTRATEGY_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETISTRATEGY_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_MARKETISTRATEGY_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_MARKETISTRATEGY_BOARD',${boardList.SIX_MARKETISTRATEGY_BOARD[loop.index].SEQ})">${boardList.SIX_MARKETISTRATEGY_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_MARKETISTRATEGY_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>시장</span>분석</p>
                    <a href="javaScript:goBoardList('SIX_MARKETANALYSIS_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETANALYSIS_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_MARKETANALYSIS_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_MARKETANALYSIS_BOARD',${boardList.SIX_MARKETANALYSIS_BOARD[loop.index].SEQ})">${boardList.SIX_MARKETANALYSIS_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_MARKETANALYSIS_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>유료</span>종목</p>
                    <a href="javaScript:goBoardList('SIX_MARKETPAY_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETPAY_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_MARKETPAY_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_MARKETPAY_BOARD',${boardList.SIX_MARKETPAY_BOARD[loop.index].SEQ})">${boardList.SIX_MARKETPAY_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_MARKETPAY_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>매매</span>기법</p>
                    <a href="javaScript:goBoardList('SIX_MARKETBARGAIN_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETBARGAIN_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_MARKETBARGAIN_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_MARKETBARGAIN_BOARD',${boardList.SIX_MARKETBARGAIN_BOARD[loop.index].SEQ})">${boardList.SIX_MARKETBARGAIN_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_MARKETBARGAIN_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>고급</span>시황</p>
                    <a href="javaScript:goBoardList('SIX_MARKETADV_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETADV_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_MARKETADV_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_MARKETADV_BOARD',${boardList.SIX_MARKETADV_BOARD[loop.index].SEQ})">${boardList.SIX_MARKETADV_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_MARKETADV_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
            </ul>
            <ul class="another_link">
                <li>
                    <a href="#">
                        <div class="linktitle_area">
                            <p class="link_title">링크제목입니다</p>
                            <p class="link_title2">게시물의 내용입니다. 게시물의 내용입니다. </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="linktitle_area">
                            <p class="link_title">링크제목입니다</p>
                            <p class="link_title2">게시물의 내용입니다. 게시물의 내용입니다. </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="linktitle_area">
                            <p class="link_title">링크제목입니다</p>
                            <p class="link_title2">게시물의 내용입니다. 게시물의 내용입니다. </p>
                        </div>
                    </a>
                </li>
            </ul>
            <ul class="mainbanner_list">
                <li><a href="javaScript:goBoardList('SIX_ACADEMY')"><p>SIX <br>아카데미</p><img src="/resources/img/mainbanner1.png" alt=""></a></li>
                <li><a href="javaScript:goBoardList('SIX_INFO')"><p>SIX <br>일급정보</p><img src="/resources/img/mainbanner2.png" alt=""></a></li>
                <li><a href="javaScript:goBoardList('SIX_COMMSPEICAL_BOARD')"><p>특강 <br>세미나</p><img src="/resources/img/mainbanner3.png" alt=""></a></li>
            </ul>
            <ul class="look_ahead2">
                <li>
                    <p class="look_title"><span>SIX</span>주식 배움터</p>
                    <a href="javaScript:goBoardList('SIX_LEARNCENTER_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_LEARNCENTER_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_LEARNCENTER_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_LEARNCENTER_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_LEARNCENTER_BOARD','${boardList.SIX_LEARNCENTER_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_LEARNCENTER_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_LEARNCENTER_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_LEARNCENTER_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_LEARNCENTER_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_LEARNCENTER_BOARD',${boardList.SIX_LEARNCENTER_BOARD[loop.index].SEQ})">${boardList.SIX_LEARNCENTER_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_LEARNCENTER_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
			                          	   </c:when>
			                          	   <c:otherwise>
											  <li>&nbsp;</li>	                          	   	   		                          	   
			                               </c:otherwise>
		                               </c:choose>
								   	   </ul>	                          	   	   
                          	   	   </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<div class="ahead_top">
		                            <img src="/resources/img/ahead2.gif" alt="">
		                            <a href="#" class="ahead_text">
		                                <p class="aheadtext_title">게시물이 없습니다.</p>
		                                <p class="aheadtext_title2">&nbsp;</p>
		                                <p class="aheadtext_title3">&nbsp;</p>
		                            </a>
		                        </div>
		                        <ul class="look_list2">
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                        </ul>
                          	</c:otherwise>                            	
                       	</c:choose>
                </li>
                <li>
                    <p class="look_title"><span>SIX</span>투자 전략</p>
                    <a href="javaScript:goBoardList('SIX_LEARNSTRATEGY_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_LEARNSTRATEGY_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_LEARNSTRATEGY_BOARD','${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_LEARNSTRATEGY_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_LEARNSTRATEGY_BOARD',${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].SEQ})">${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
			                          	   </c:when>
			                          	   <c:otherwise>
											  <li>&nbsp;</li>	                          	   	   		                          	   
			                               </c:otherwise>
		                               </c:choose>
								   	   </ul>	                          	   	   
                          	   	   </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<div class="ahead_top">
		                            <img src="/resources/img/ahead2.gif" alt="">
		                            <a href="#" class="ahead_text">
		                                <p class="aheadtext_title">게시물이 없습니다.</p>
		                                <p class="aheadtext_title2">&nbsp;</p>
		                                <p class="aheadtext_title3">&nbsp;</p>
		                            </a>
		                        </div>
		                        <ul class="look_list2">
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                        </ul>
                          	</c:otherwise>                            	
                       	</c:choose>
                </li>
                <li>
                    <p class="look_title"><span>SIX</span>탐방노트</p>
                    <a href="javaScript:goBoardList('SIX_SNOTE_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_SNOTE_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_SNOTE_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_SNOTE_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_SNOTE_BOARD','${boardList.SIX_SNOTE_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_SNOTE_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_SNOTE_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_SNOTE_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_SNOTE_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_SNOTE_BOARD',${boardList.SIX_SNOTE_BOARD[loop.index].SEQ})">${boardList.SIX_SNOTE_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_SNOTE_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
			                          	   </c:when>
			                          	   <c:otherwise>
											  <li>&nbsp;</li>	                          	   	   		                          	   
			                               </c:otherwise>
		                               </c:choose>
								   	   </ul>	                          	   	   
                          	   	   </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<div class="ahead_top">
		                            <img src="/resources/img/ahead2.gif" alt="">
		                            <a href="#" class="ahead_text">
		                                <p class="aheadtext_title">게시물이 없습니다.</p>
		                                <p class="aheadtext_title2">&nbsp;</p>
		                                <p class="aheadtext_title3">&nbsp;</p>
		                            </a>
		                        </div>
		                        <ul class="look_list2">
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                            <li>&nbsp;</li>
		                        </ul>
                          	</c:otherwise>                            	
                       	</c:choose>
                </li>
            </ul>

            <ul class="look_ahead">
                <li>
                    <p class="look_title">식스비기</p>
                    <a href="javaScript:goBoardList('SIX_INFOSECTECH_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                    	<c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOSECTECH_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_INFOSECTECH_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_INFOSECTECH_BOARD',${boardList.SIX_INFOSECTECH_BOARD[loop.index].SEQ})">${boardList.SIX_INFOSECTECH_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOSECTECH_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>                        
                    </ul>
                </li>
                <li>
                    <p class="look_title">증시브리핑</p>
                    <a href="javaScript:goBoardList('SIX_INFOSTOCKBRIEFING_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOSTOCKBRIEFING_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_INFOSTOCKBRIEFING_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_INFOSTOCKBRIEFING_BOARD',${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].SEQ})">${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>     
                    </ul>
                </li>
                <li>
                    <p class="look_title">고수들의인터뷰</p>
                    <a href="javaScript:goBoardList('SIX_INFOGINTERVIEW_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOGINTERVIEW_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_INFOGINTERVIEW_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_INFOGINTERVIEW_BOARD',${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].SEQ})">${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <p class="look_title">테마정보</p>
                    <a href="javaScript:goBoardList('SIX_INFOTHEME_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOTHEME_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_INFOTHEME_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_INFOTHEME_BOARD',${boardList.SIX_INFOTHEME_BOARD[loop.index].SEQ})">${boardList.SIX_INFOTHEME_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOTHEME_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <p class="look_title">무료추천종목</p>
                    <a href="javaScript:goBoardList('SIX_INFOFREEREC_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOFREEREC_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_INFOFREEREC_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_INFOFREEREC_BOARD',${boardList.SIX_INFOFREEREC_BOARD[loop.index].SEQ})">${boardList.SIX_INFOFREEREC_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOFREEREC_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
                <li>
                    <p class="look_title">필수구독자료</p>
                    <a href="javaScript:goBoardList('SIX_NSUBSCRIBE_BOARD')" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_NSUBSCRIBE_BOARD) > 0}">
                          	   <c:forEach begin="0" end="3" varStatus="loop">
                          	   <c:choose>                          	   	   
	                          	   <c:when test="${fn:length(boardList.SIX_NSUBSCRIBE_BOARD) < loop.count}">
	                          	   	   <li>&nbsp;</li>	
	                          	   </c:when>
	                          	   <c:otherwise>
		                          	   <li><a href="javascript:goBoardView('SIX_NSUBSCRIBE_BOARD',${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].SEQ})">${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].CREATE_DATE}</span></li>
	                               </c:otherwise>
                          	   </c:choose>
                          	   </c:forEach>                          	   
                          	</c:when>
                          	<c:otherwise>
                          		<li>게시글이 없습니다.</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          		<li>&nbsp;</li>
                          	</c:otherwise>                            	
                        </c:choose>
                    </ul>
                </li>
            </ul>
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