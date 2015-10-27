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
                            <li><a href="#">일급무료종목 게시판 최근글 링크입니다.</a></li>
                            <li><a href="#">일급무료종목 게시판 최근글 링크입니다.</a></li>
                            <li><a href="#">일급무료종목 게시판 최근글 링크입니다.</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="briefing">
                    <li class="expert_interview">
                        <p class="interview_title">고수들의 인터뷰</p>
                        <p class="interview_title2">조훈현 편</p>
                        <img src="/resources/img/expert_img.png" alt="">
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
                <ul class="look_ahead2 type2">
                    <li>
                        <p class="look_title"><span>일급</span> 무료종목 추천</p>
                        <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <div class="ahead_top">
                            <img src="/resources/img/ahead2.gif" alt="">
                            <a href="#" class="ahead_text">
                                <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                                <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                                <p class="aheadtext_title3">2015.09.03</p>
                            </a>
                        </div>
                        <ul class="look_list2">
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        </ul>
                    </li>
                    <li>
                        <p class="look_title"><span>SIX</span> 비기</p>
                        <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <div class="ahead_top">
                            <img src="/resources/img/ahead2.gif" alt="">
                            <a href="#" class="ahead_text">
                                <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                                <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                                <p class="aheadtext_title3">2015.09.03</p>
                            </a>
                        </div>
                        <ul class="look_list2">
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        </ul>
                    </li>
                    <li class="type3">
                        <p class="look_title"><span>테마</span> 정보</p>
                        <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <div class="ahead_top">
                            <img src="/resources/img/ahead2.gif" alt="">
                            <a href="#" class="ahead_text">
                                <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                                <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                                <p class="aheadtext_title3">2015.09.03</p>
                            </a>
                        </div>
                        <ul class="look_list2">
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        </ul>
                    </li>
                    <li class="type3">
                        <p class="look_title"><span>증시</span> 브리핑</p>
                        <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <div class="ahead_top">
                            <img src="/resources/img/ahead2.gif" alt="">
                            <a href="#" class="ahead_text">
                                <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                                <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                                <p class="aheadtext_title3">2015.09.03</p>
                            </a>
                        </div>
                        <ul class="look_list2">
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        </ul>
                    </li>
                    <li>
                        <p class="look_title"><span>고수들의</span> 인터뷰</p>
                        <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <div class="ahead_top">
                            <img src="/resources/img/ahead2.gif" alt="">
                            <a href="#" class="ahead_text">
                                <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                                <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                                <p class="aheadtext_title3">2015.09.03</p>
                            </a>
                        </div>
                        <ul class="look_list2">
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        </ul>
                    </li>
                    <li>
                        <p class="look_title"><span>실시간</span> 증시일정</p>
                        <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                        <div class="ahead_top">
                            <img src="/resources/img/ahead2.gif" alt="">
                            <a href="#" class="ahead_text">
                                <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                                <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                                <p class="aheadtext_title3">2015.09.03</p>
                            </a>
                        </div>
                        <ul class="look_list2">
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                            <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        </ul>
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