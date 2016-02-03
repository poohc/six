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
</head>
<body>
<form id="mainForm"  name="mainForm" method="post">
<input type="hidden" id="seq" name="seq">
</form>
<div class="wrapper main">
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
        <div class="container">
            <div class="wrap_left">
                <jsp:include page="../common/login_common.jsp" />
                <div class="about_six">
                    <p class="about_sixtitle">SIX 아카데미</p>
                    <ul class="about_sixlist">
                        <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터<span></span></a></li>
                        <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략<span></span></a></li>
                        <li><a href="/academy/academySearchNote.do">SIX 탐방노트<span></span></a></li>
                        <li><a href="/academy/academyNecessarySubscribe.do">필수 구독자료<span></span></a></li>
                    </ul>
                </div>
                <div class="left_ad">
                    <img src="/resources/img/side_banner.png" alt="SIX왼쪽배너">
                </div>
                <div class="youtube_channel">
                    <a class="youtube_title">채널<span>+ 더보기</span></a>
                    <div class="youtube_box">
                        <ul class="youtube_list">
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrap_right">
                <img src="/resources/img/academy1.jpg" alt="" class="top_mainimg">
                <ul class="academy_mainlist">
                    <li>
                        <p class="academy_title2">기초는 이렇게 쌓아야 합니다.</p>
                        <ul class="list_contract">                        	
                        	<c:choose>
	                          	<c:when test="${fn:length(boardList.SIX_LEARNCENTER_BOARD) > 0}">
	                          	   <c:forEach begin="0" end="2" varStatus="loop">
	                          	   <c:choose>                          	   	   
		                          	   <c:when test="${fn:length(boardList.SIX_LEARNCENTER_BOARD) < loop.count}">
		                          	   	   <li>&nbsp;</li>	
		                          	   </c:when>
		                          	   <c:otherwise>
			                          	   <li><a href="javascript:goBoardView('SIX_LEARNCENTER_BOARD',${boardList.SIX_LEARNCENTER_BOARD[loop.index].SEQ})">${boardList.SIX_LEARNCENTER_BOARD[loop.index].TITLE}</a></li>
		                               </c:otherwise>
	                          	   </c:choose>
	                          	   </c:forEach>                          	   
	                          	</c:when>
	                          	<c:otherwise>
	                          		<li>게시글이 없습니다.</li>
	                          		<li>&nbsp;</li>
	                          		<li>&nbsp;</li>
	                          	</c:otherwise>                            	
                        	</c:choose>
                        </ul>
                    </li>
                    <li>
                        <p class="academy_title2 type2">SIX가 직접 발품을 팔아 기업 탐방을 다녀옵니다.</p>
                        <ul class="list_contract type2">
                        	<c:choose>
	                          	<c:when test="${fn:length(boardList.SIX_SNOTE_BOARD) > 0}">
	                          	   <c:forEach begin="0" end="2" varStatus="loop">
	                          	   <c:choose>                          	   	   
		                          	   <c:when test="${fn:length(boardList.SIX_SNOTE_BOARD) < loop.count}">
		                          	   	   <li>&nbsp;</li>	
		                          	   </c:when>
		                          	   <c:otherwise>
			                          	   <li><a href="javascript:goBoardView('SIX_SNOTE_BOARD',${boardList.SIX_SNOTE_BOARD[loop.index].SEQ})">${boardList.SIX_SNOTE_BOARD[loop.index].TITLE}</a></li>
		                               </c:otherwise>
	                          	   </c:choose>
	                          	   </c:forEach>                          	   
	                          	</c:when>
	                          	<c:otherwise>
	                          		<li>게시글이 없습니다.</li>
	                          		<li>&nbsp;</li>
	                          		<li>&nbsp;</li>
	                          	</c:otherwise>                            	
                        	</c:choose>                           
                        </ul>
                    </li>
                    <li>
                        <p class="academy_title2 type2">시장상황에 맞춘 현재의 투자 전략을 제시합니다.</p>
                        <ul class="list_contract type2">
                            <c:choose>
	                          	<c:when test="${fn:length(boardList.SIX_LEARNSTRATEGY_BOARD) > 0}">
	                          	   <c:forEach begin="0" end="2" varStatus="loop">
	                          	   <c:choose>                          	   	   
		                          	   <c:when test="${fn:length(boardList.SIX_LEARNSTRATEGY_BOARD) < loop.count}">
		                          	   	   <li>&nbsp;</li>	
		                          	   </c:when>
		                          	   <c:otherwise>
			                          	   <li><a href="javascript:goBoardView('SIX_LEARNSTRATEGY_BOARD',${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].SEQ})">${boardList.SIX_LEARNSTRATEGY_BOARD[loop.index].TITLE}</a></li>
		                               </c:otherwise>
	                          	   </c:choose>
	                          	   </c:forEach>                          	   
	                          	</c:when>
	                          	<c:otherwise>
	                          		<li>게시글이 없습니다.</li>
	                          		<li>&nbsp;</li>
	                          		<li>&nbsp;</li>
	                          	</c:otherwise>                            	
                        	</c:choose>
                        </ul>
                    </li>
                    <li>
                        <p class="academy_title2 type2">경제 및 금융관련 자료를 한 번에 모아두었습니다.</p>
                        <ul class="list_contract type2">
                            <c:choose>
	                          	<c:when test="${fn:length(boardList.SIX_NSUBSCRIBE_BOARD) > 0}">
	                          	   <c:forEach begin="0" end="2" varStatus="loop">
	                          	   <c:choose>                          	   	   
		                          	   <c:when test="${fn:length(boardList.SIX_NSUBSCRIBE_BOARD) < loop.count}">
		                          	   	   <li>&nbsp;</li>	
		                          	   </c:when>
		                          	   <c:otherwise>
			                          	   <li><a href="javascript:goBoardView('SIX_NSUBSCRIBE_BOARD',${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].SEQ})">${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].TITLE}</a></li>
		                               </c:otherwise>
	                          	   </c:choose>
	                          	   </c:forEach>                          	   
	                          	</c:when>
	                          	<c:otherwise>
	                          		<li>게시글이 없습니다.</li>
	                          		<li>&nbsp;</li>
	                          		<li>&nbsp;</li>
	                          	</c:otherwise>                            	
                        	</c:choose>
                        </ul>
                    </li>
                </ul>
                <p class="line_title">沙上樓閣이 되지 않으려면 기초를 제대로 쌓아야 한다.</p>
                <ul class="look_ahead2 type2">
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
		                            <a class="ahead_text">
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
                        <p class="look_title"><span>SIX</span>투자전략</p>
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
		                            <a class="ahead_text">
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
		                            <a class="ahead_text">
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
                        <p class="look_title"><span>필수</span>구독자료</p>
                        <a href="javaScript:goBoardList('SIX_NSUBSCRIBE_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_NSUBSCRIBE_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_NSUBSCRIBE_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_NSUBSCRIBE_BOARD','${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_NSUBSCRIBE_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_NSUBSCRIBE_BOARD',${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].SEQ})">${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_NSUBSCRIBE_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
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
		                            <a class="ahead_text">
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
                <a class="academy_banner"><img src="/resources/img/academy_banner.jpg" alt=""></a>
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