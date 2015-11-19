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
                <jsp:include page="../common/partner_menu.jsp" />
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
                <img src="/resources/img/partner1.jpg" alt="" class="top_mainimg">
                <div class="personInfo">
                    <img src="/resources/img/p_1.png" alt="">
                    <p class="personTitle">최성관</p>
                    <p class="personTitle2">SIX파트너</p>
                    <p class="personTitle3">주식정보의 큰손</p>
                    <p class="personTitle4">OO대학교 경제학과</p>
                    <p class="personTitle5">OO투자증권 FP</p>
                    <p class="personTitle6">SIX투자증권</p>
                </div>
                <ul class="inform_list">
                    <li>총 정보등록건수<span>100</span></li>
                    <li>총 다운로드<span>100</span></li>
                    <li>정보등록건수 순위<span>100</span></li>
                    <li>다운로드 순위<span>100</span></li>
                </ul>
                <ul class="inform_list2">
                    <li class="on"><a href="#tab1">무료종목</a></li>
                    <li class=""><a href="#tab2">투자전략</a></li>
                    <li class=""><a href="#tab3">시장분석</a></li>
                </ul>
                <div class="right_contents">
                    <div class="table_type1_view type2">
                        <table>
                            <caption>공지사항</caption>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:35%;">
                                <col style="width:15%;">
                                <col style="width:35%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>제목</td>
                                    <td>무료정보 제목입니다.</td>
                                    <th>다운로드 수</th>
                                    <td>25</td>
                                </tr>
                                <tr>
                                    <th>작성자</td>
                                    <td>홍길동</td>
                                    <th>작성일</th>
                                    <td>2015-09-24</td>
                                </tr>
                                <tr>
                                    <th>첨부파일</td>
                                    <td>abc.pdf</td>
                                    <th>조회</th>
                                    <td>341</td>
                                </tr>
                                <tr>
                                    <th class="bb_line3">가격</td>
                                    <td class="bb_line3">무료</td>
                                    <th class="bb_line3">다운로드</th>
                                    <td class="bb_line3"><a href="#"><img src="/resources/img/download_bul.png" alt=""></a></td>
                                </tr>
                                <tr class="">
                                    <td colspan="4" class="td_lh">주가 흐름을 분석했습니다. 무료로 다운받아 보세요.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_bottom type2">
                        <a href="#" class="go_list">목록으로</a>
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
</body>
</html>