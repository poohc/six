<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript" src="/resources/js/boardCommon_nonEditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});

</script>

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
                <div class="right_contents">
                    <p class="title_type1">포인트 구입현황</p>
                    <ul class="navi_map">
                        <li><a href="#">마이페이지 &gt;</a></li>
                        <li><a href="#">포인트 구입현황</a></li>
                    </ul>
                    <div class="inform_wrap">
                        <ul class="inform_list">
                        	<li>무료정보 구입<span>100건</span></li>
                            <li>유료정보 구입<span>100건</span></li>
                        </ul>
                        <button class="btn_type5">포인트 환전신청</button>
                    </div>
                    <div class="term_choice">
                        <table class="">
                            <caption>조회기간선택</caption>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:85%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th rowspan="2">조회기간 선택</th>
                                    <td>
                                        <input type="text" class="input_type6" id="calendar1">
                                        <label for="calendar1" class="type6_label"><img src="/resources/img/calendar.png" alt=""></label> -
                                        <input type="text" class="input_type6" id="calendar2">
                                        <label for="calendar2" class="type6_label"><img src="/resources/img/calendar.png" alt="">
                                        <button class="btn_search">조회</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><button class="btn_type6">최근 1주</button>
                                    <button class="btn_type6">최근 2주</button>
                                    <button class="btn_type6">최근 3주</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_type1">
                        <table>
                            <caption>포인트 구입현황</caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:52%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>결제일</th>
                                    <th>콘텐츠</th>
                                    <th>사용포인트</th>
                                    <th>충전포인트</th>
                                    <th>보유포인트</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="">
                                    <td>2015-09-20</td>
                                    <td class="t_l2"><a href="#">유료 판매 정보유료 판매 정보유료 판매</a> </td>
                                    <td><span class="color_type1">3,000P</span></td>
                                    <td><span class="color_type2">50,000P</span></td>
                                    <td>10,000P</td>
                                </tr>
                                <tr class="">
                                    <td>2015-09-20</td>
                                    <td class="t_l2"><a href="#">유료 판매 정보</a></td>
                                    <td><span class="color_type1">3,000P</span></td>
                                    <td><span class="color_type2">50,000P</span></td>
                                    <td>10,000P</td>
                                </tr>
                                <tr class="">
                                    <td>2015-09-20</td>
                                    <td class="t_l2"><a href="#">유료 판매 정보</a></td>
                                    <td><span class="color_type1">3,000P</span></td>
                                    <td><span class="color_type2">50,000P</span></td>
                                    <td>10,000P</td>
                                </tr>
                                <tr class="">
                                    <td>2015-09-20</td>
                                    <td class="t_l2"><a href="#">유료 판매 정보</a></td>
                                    <td><span class="color_type1">3,000P</span></td>
                                    <td><span class="color_type2">50,000P</span></td>
                                    <td>10,000P</td>
                                </tr>
                                <tr class="">
                                    <td>2015-09-20</td>
                                    <td class="t_l2"><a href="#">유료 판매 정보</a></td>
                                    <td><span class="color_type1">3,000P</span></td>
                                    <td><span class="color_type2">50,000P</span></td>
                                    <td>10,000P</td>
                                </tr>
                            </tbody>
                        </table>
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