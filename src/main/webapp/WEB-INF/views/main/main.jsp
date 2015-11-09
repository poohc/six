<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
		
		$('#logoutBtn').click(function(){
			$('#loginForm').attr('action','/login/logout.do');
			$('#loginForm').submit();			
		});		
		
	});
	
	function goBoardView(boardName,seq){
		
		var action;
		$('#seq').val(seq);
		
		switch (boardName) {
		
		case 'SIX_MARKETFREE_BOARD': action = '/market/marketFreeView.do';
			  break;
		case 'SIX_MARKETISTRATEGY_BOARD': action = '/market/marketIstrategyView.do';
			  break;
		case 'SIX_MARKETANALYSIS_BOARD': action = '/market/marketAnalysisView.do';
		  	  break;
		case 'SIX_MARKETPAY_BOARD': action = '/market/marketPayView.do';
		      break;
		case 'SIX_MARKETBARGAIN_BOARD': action = '/market/marketBargainView.do';
		  	  break;
		case 'SIX_MARKETADV_BOARD': action = '/market/marketAdvView.do';
		  	  break;
		case 'SIX_LEARNCENTER_BOARD': action = '/academy/academyLearningCenterView.do';
		  	  break;
		case 'SIX_LEARNSTRATEGY_BOARD': action = '/academy/academyInvestStrategyView.do';
		  	  break;
		case 'SIX_SNOTE_BOARD': action = '/academy/academySearchNoteView.do';
		  	  break;
		case 'SIX_INFOSECTECH_BOARD': action = '/info/infoSecTechView.do';
		  	  break;
		case 'SIX_INFOSTOCKBRIEFING_BOARD': action = '/info/infoStockBriefingView.do';
		  	  break;
		case 'SIX_INFOGINTERVIEW_BOARD': action = '/info/infoGInterviewView.do';
	  	  	  break;
		default:
			break;
		}
		
		$('#loginForm').attr('action',action);
		$('#loginForm').submit();	
		
	}
	
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
                    <p class="kospi_title2">1,915.53 <span>7.09 (1.75%)</span></p>
                    <p class="kospi_title">KOSPI</p>
                    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
                    <p class="kospi_title">KOSPI</p>
                    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
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
                <p class="latest_title">신용평가사 S&amp;P</p>
                <p class="latest_title2">지난달 청년실업률이 올해 들어 최저치를 기록했다. 14일 통계청이 발표한 '9월 고용동향'에 따르면 지난달 15~29세 청년실업률은 7.9%로 올해 들어 가장 낮았다. 청년실업률은 지난 6월 10.2%로 정점을 찍은 이후 7월 9.4%→8월 8.0%→9월 7.9%로 조금씩 하락했다. 전체 실업률은 3.2%로 전년동월과 같은 수준이었다. 전체 취업자는 전년동월대비 34만 7000명 증가했다. </p>
            </div>
            <ul class="look_ahead">
                <li>
                    <p class="look_title"><span>무료</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                    	<c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETFREE_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                	<li><a href="javascript:goBoardView('SIX_MARKETFREE_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                    <p class="look_title"><span>투자</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETISTRATEGY_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                	<li><a href="javascript:goBoardView('SIX_MARKETISTRATEGY_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                    <p class="look_title"><span>시장</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETANALYSIS_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                	<li><a href="javascript:goBoardView('SIX_MARKETANALYSIS_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETPAY_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                	<li><a href="javascript:goBoardView('SIX_MARKETPAY_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                    <p class="look_title"><span>매매</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETBARGAIN_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                	<li><a href="javascript:goBoardView('SIX_MARKETBARGAIN_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                    <p class="look_title"><span>고급</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_MARKETADV_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                <li><a href="javascript:goBoardView('SIX_MARKETADV_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                <li><a href="#"><p>SIX <br>아카데미</p><img src="/resources/img/mainbanner1.png" alt=""></a></li>
                <li><a href="#"><p>SIX <br>일급정보</p><img src="/resources/img/mainbanner2.png" alt=""></a></li>
                <li><a href="#"><p>특강 <br>세미나</p><img src="/resources/img/mainbanner3.png" alt=""></a></li>
            </ul>
            <ul class="look_ahead2">
                <li>
                    <p class="look_title"><span>SIX</span>주식 배움터</p>
                    <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <c:choose>
                    	<c:when test="${fn:length(boardList.SIX_LEARNCENTER_BOARD) > 0}">
                      		<c:forEach items="${boardList.SIX_LEARNCENTER_BOARD}" var="list" varStatus="loop">
                      			<c:choose>
                      			<c:when test="${loop.index eq 0}">
                      				<c:choose>
                      				<c:when test="${fn:length(list.THUMB_IMAGE) > 0}">
                      					<c:out value="${list.THUMB_IMAGE}" />
                      				</c:when>
                      				<c:otherwise>
                      					<img src="/resources/img/ahead2.gif" alt="주식배움터이미지">
                      				</c:otherwise>
                      				</c:choose>
                      				<a href="javascript:goBoardView('SIX_LEARNCENTER_BOARD','${list.SEQ}')" class="ahead_text">
			                            <p class="aheadtext_title" style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis;">${list.TITLE}</p>
			                            <p class="aheadtext_title2" style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis;">
			                            	<c:out value="${list.CONTENTS}" escapeXml="false"/>
			                            </p>
			                            <p class="aheadtext_title3">${list.CREATE_DATE}</p>
		                        	</a>	
                      			</c:when>
                      			<c:otherwise>
                      			<ul class="look_list2">
			                        <li><a href="javascript:goBoardView('SIX_LEARNCENTER_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>			                        
			                    </ul>	
                      			</c:otherwise>
                      			</c:choose>	
                            </c:forEach>
                      	</c:when>
                      	<c:otherwise>
                      		<img src="/resources/img/ahead2.gif" alt="">
                        	<a href="#" class="ahead_text">
	                            <p class="aheadtext_title">게시글이 없습니다.</p>
<!-- 	                            <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p> -->
<!-- 	                            <p class="aheadtext_title3">2015.09.03</p> -->
                        	</a>
                        	<ul class="look_list2">
                      		<li>게시글이 없습니다.</li>
                      		<li>&nbsp;</li>
                      		<li>&nbsp;</li>
                      		<li>&nbsp;</li>
                      		</ul>
                      	</c:otherwise>                            	
                    </c:choose>
                </li>
                <li>
                    <p class="look_title"><span>SIX</span>투자 전략</p>
                    <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <c:choose>
                    	<c:when test="${fn:length(boardList.SIX_LEARNSTRATEGY_BOARD) > 0}">
                      		<c:forEach items="${boardList.SIX_LEARNSTRATEGY_BOARD}" var="list" varStatus="loop">
                      			<c:choose>
                      			<c:when test="${loop.index eq 0}">
                      				<c:choose>
                      				<c:when test="${fn:length(list.THUMB_IMAGE) > 0}">
                      					<c:out value="${list.THUMB_IMAGE}" />
                      				</c:when>
                      				<c:otherwise>
                      					<img src="/resources/img/ahead2.gif" alt="주식배움터이미지">
                      				</c:otherwise>
                      				</c:choose>
                      				<a href="javascript:goBoardView('SIX_LEARNSTRATEGY_BOARD','${list.SEQ}')" class="ahead_text">
			                            <p class="aheadtext_title" style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis;">${list.TITLE}</p>
			                            <p class="aheadtext_title2" style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis;">
			                            	<c:out value="${list.CONTENTS}" escapeXml="false"/>
			                            </p>
			                            <p class="aheadtext_title3">${list.CREATE_DATE}</p>
		                        	</a>	
                      			</c:when>
                      			<c:otherwise>
                      			<ul class="look_list2">
			                        <li><a href="javascript:goBoardView('SIX_LEARNSTRATEGY_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>			                        
			                    </ul>	
                      			</c:otherwise>
                      			</c:choose>	
                            </c:forEach>
                      	</c:when>
                      	<c:otherwise>
                      		<img src="/resources/img/ahead2.gif" alt="">
                        	<a href="#" class="ahead_text">
	                            <p class="aheadtext_title">게시글이 없습니다.</p>
<!-- 	                            <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p> -->
<!-- 	                            <p class="aheadtext_title3">2015.09.03</p> -->
                        	</a>
                        	<ul class="look_list2">
                      		<li>게시글이 없습니다.</li>
                      		<li>&nbsp;</li>
                      		<li>&nbsp;</li>
                      		<li>&nbsp;</li>
                      		</ul>
                      	</c:otherwise>                            	
                    </c:choose>
                </li>
                <li>
                    <p class="look_title"><span>SIX</span>탐방노트</p>
                    <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <c:choose>
                    	<c:when test="${fn:length(boardList.SIX_SNOTE_BOARD) > 0}">
                      		<c:forEach items="${boardList.SIX_SNOTE_BOARD}" var="list" varStatus="loop">
                      			<c:choose>
                      			<c:when test="${loop.index eq 0}">
                      				<c:choose>
                      				<c:when test="${fn:length(list.THUMB_IMAGE) > 0}">
                      					<c:out value="${list.THUMB_IMAGE}" />
                      				</c:when>
                      				<c:otherwise>
                      					<img src="/resources/img/ahead2.gif" alt="주식배움터이미지">
                      				</c:otherwise>
                      				</c:choose>
                      				<a href="javascript:goBoardView('SIX_SNOTE_BOARD','${list.SEQ}')" class="ahead_text">
			                            <p class="aheadtext_title" style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis;">${list.TITLE}</p>
			                            <p class="aheadtext_title2" style="overflow: hidden;white-space: nowrap;text-overflow:ellipsis;">
			                            	<c:out value="${list.CONTENTS}" escapeXml="false"/>
			                            </p>
			                            <p class="aheadtext_title3">${list.CREATE_DATE}</p>
		                        	</a>	
                      			</c:when>
                      			<c:otherwise>
                      			<ul class="look_list2">
			                        <li><a href="javascript:goBoardView('SIX_SNOTE_BOARD','${list.SEQ}')">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>			                        
			                    </ul>	
                      			</c:otherwise>
                      			</c:choose>	
                            </c:forEach>
                      	</c:when>
                      	<c:otherwise>
                      		<img src="/resources/img/ahead2.gif" alt="">
                        	<a href="#" class="ahead_text">
	                            <p class="aheadtext_title">게시글이 없습니다.</p>
<!-- 	                            <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p> -->
<!-- 	                            <p class="aheadtext_title3">2015.09.03</p> -->
                        	</a>
                        	<ul class="look_list2">
                      		<li>게시글이 없습니다.</li>
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
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                    	<c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOSECTECH_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                <li><a href="javascript:goBoardView('SIX_INFOSECTECH_BOARD',${list.SEQ})">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOSTOCKBRIEFING_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                <li><a href="javascript:goBoardView('SIX_INFOSECTECH_BOARD',${list.SEQ})">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOGINTERVIEW_BOARD) > 0}">
                          		<c:forEach items="${boardList.list}" var="list" end="3">
                                <li><a href="javascript:goBoardView('SIX_INFOSECTECH_BOARD',${list.SEQ})">${list.TITLE}</a><span>${list.CREATE_DATE}</span></li>
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
                    <p class="look_title">나침반추천주</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title">핵심정보</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title">정보원토론실</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
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
