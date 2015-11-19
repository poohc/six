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
                <jsp:include page="../common/info_menu.jsp" />
                <div class="youtube_channel">
                    <a class="youtube_title">채널<span>+ 더보기</span></a>
                    <div class="youtube_box">
                        <ul class="youtube_list">
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrap_right">
                <img src="/resources/img/information1.jpg" alt="" class="top_mainimg">
                <ul class="recent_extract">
                    <li>
                        <ul class="inforecent_list">
                            <li><a href="#">일급무료종목 게시판 최근글 링크입니다.</a></li>
                            <li><a href="#">일급무료종목 게시판 최근글 링크입니다.</a></li>
                            <li><a href="#">일급무료종목 게시판 최근글 링크입니다.</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="inforecent_list">
                            <li><a href="#">식스비기 게시판 최근글 링크입니다.</a></li>
                            <li><a href="#">식스비기 게시판 최근글 링크입니다.</a></li>
                            <li><a href="#">식스비기 게시판 최근글 링크입니다.</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="briefing">
                    <li class="expert_interview">
                        <p class="interview_title">고수들의 인터뷰</p>
                        <p class="interview_title2">복재성 편</p>
                        <img src="/resources/img/expert_man.jpg" alt="">
                    </li>
                    <li class="briefing_li">
                        <ul class="briefing_li2">
                            <li class="morning_briefing">
                                <p class="brief_title">모닝브리핑</p>
                                <ul class="morning_briefing2">
                                    <li>
                                        <p class="morbrief_tit">DOWJONES</p>
                                        <p class="morbrief_tit2">17,915.53</p>
                                        <p class="morbrief_tit3">▼ 7.09 (1.75%)</p>
                                    </li>
                                    <li>
                                        <p class="morbrief_tit">S&amp;P 500</p>
                                        <p class="morbrief_tit2 type2">2,130.40</p>
                                        <p class="morbrief_tit3 type2">▲ 0.49 (0.21%)</p>
                                    </li>
                                    <li>
                                        <p class="morbrief_tit">NASDAQ</p>
                                        <p class="morbrief_tit2 type2">5,915.53</p>
                                        <p class="morbrief_tit3 type2">▲ 0.23 (0.21%)</p>
                                    </li>
                                </ul>
                            </li>
                            <li class="stock_briefing">
                                <p class="brief_title">증시브리핑</p>
                                <p class="brief_content">증시브리핑 증시브리핑
                                증시브리핑 증시브리핑
                                증시브리핑 증시브리핑
                                증시브리핑 증시브리핑
                                증시브리핑 증시브리핑 </p>
                            </li>
                        </ul>
                    </li>
                </ul>
                <p class="line_title">일급과 비기 이 두가지 정보가 궁금하지 않소?</p>
                <ul class="look_ahead2 type2">
                    <li>
                        <p class="look_title"><span>일급</span> 무료종목 추천</p>
                        <a href="javaScript:goBoardList('SIX_INFOFREEREC_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOFREEREC_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_INFOFREEREC_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_INFOFREEREC_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_INFOFREEREC_BOARD','${boardList.SIX_INFOFREEREC_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_INFOFREEREC_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_INFOFREEREC_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_INFOFREEREC_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_INFOFREEREC_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_INFOFREEREC_BOARD',${boardList.SIX_INFOFREEREC_BOARD[loop.index].SEQ})">${boardList.SIX_INFOFREEREC_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOFREEREC_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
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
                        <p class="look_title"><span>SIX</span> 비기</p>
                        <a href="javaScript:goBoardList('SIX_INFOSECTECH_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOSECTECH_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_INFOSECTECH_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_INFOSECTECH_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_INFOSECTECH_BOARD','${boardList.SIX_INFOSECTECH_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_INFOSECTECH_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_INFOSECTECH_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_INFOSECTECH_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_INFOSECTECH_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_INFOSECTECH_BOARD',${boardList.SIX_INFOSECTECH_BOARD[loop.index].SEQ})">${boardList.SIX_INFOSECTECH_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOSECTECH_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
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
                    <li class="type3">
                        <p class="look_title"><span>테마</span> 정보</p>
                        <a href="javaScript:goBoardList('SIX_INFOTHEME_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOTHEME_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_INFOTHEME_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_INFOTHEME_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_INFOTHEME_BOARD','${boardList.SIX_INFOTHEME_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_INFOTHEME_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_INFOTHEME_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_INFOTHEME_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_INFOTHEME_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_INFOTHEME_BOARD',${boardList.SIX_INFOTHEME_BOARD[loop.index].SEQ})">${boardList.SIX_INFOTHEME_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOTHEME_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
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
                    <li class="type3">
                        <p class="look_title"><span>증시</span> 브리핑</p>
                        <a href="javaScript:goBoardList('SIX_INFOSTOCKBRIEFING_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOSTOCKBRIEFING_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_INFOSTOCKBRIEFING_BOARD','${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_INFOSTOCKBRIEFING_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_INFOSTOCKBRIEFING_BOARD',${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].SEQ})">${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOSTOCKBRIEFING_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
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
                        <p class="look_title"><span>고수들의</span> 인터뷰</p>
                        <a href="javaScript:goBoardList('SIX_INFOGINTERVIEW_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOGINTERVIEW_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_INFOGINTERVIEW_BOARD','${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_INFOGINTERVIEW_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_INFOGINTERVIEW_BOARD',${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].SEQ})">${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOGINTERVIEW_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
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
                        <p class="look_title"><span>실시간</span> 증시일정</p>
                        <a href="javaScript:goBoardList('SIX_INFOREALSTOCK_BOARD')" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <c:choose>
                          	<c:when test="${fn:length(boardList.SIX_INFOREALSTOCK_BOARD) > 0}">
                          	   <c:forEach begin="0" end="4" varStatus="loop">
                          	   <c:choose>
                          	   	   <c:when test="${loop.index eq 0}">
                          	   	   	   <div class="ahead_top">
                          	   	   	   <c:choose>
									      <c:when test="${fn:length(boardList.SIX_INFOREALSTOCK_BOARD[loop.index].THUMB_IMAGE) > 0}">
										   	   <c:out value="${boardList.SIX_INFOREALSTOCK_BOARD[loop.index].THUMB_IMAGE}" escapeXml="false" />
										   </c:when>
										   <c:otherwise>
										   	   <img src="/resources/img/ahead2.gif" alt="주식배움터 썸네일 기본이미지">	
										   </c:otherwise>
									   </c:choose>										   
									   <a href="javascript:goBoardView('SIX_INFOREALSTOCK_BOARD','${boardList.SIX_INFOREALSTOCK_BOARD[loop.index].SEQ}')" class="ahead_text type2">
			                               <p class="aheadtext_title">${boardList.SIX_INFOREALSTOCK_BOARD[loop.index].TITLE}</p>
			                               <p class="aheadtext_title2">${boardList.SIX_INFOREALSTOCK_BOARD[loop.index].PARSE_CONTENTS}</p>
			                               <p class="aheadtext_title3">${boardList.SIX_INFOREALSTOCK_BOARD[loop.index].CREATE_DATE}</p>
			                           </a>
			                           </div>	                          	   	   
                          	   	   </c:when>
                          	   	   <c:otherwise>
                          	   	   	   <ul class="look_list2">
                          	   	   	   <c:choose>
	                          	   	   	   <c:when test="${fn:length(boardList.SIX_INFOREALSTOCK_BOARD) >= loop.count}">
										   	  <li><a href="javascript:goBoardView('SIX_INFOREALSTOCK_BOARD',${boardList.SIX_INFOREALSTOCK_BOARD[loop.index].SEQ})">${boardList.SIX_INFOREALSTOCK_BOARD[loop.index].TITLE}</a><span>${boardList.SIX_INFOREALSTOCK_BOARD[loop.index].CREATE_DATE}</span></li>		                          	   	   	
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