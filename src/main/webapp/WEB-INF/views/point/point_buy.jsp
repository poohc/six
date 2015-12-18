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
</head>

<body>
<div class="wrapper main">
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
        <div class="partner_slide">
            <div class="banner_list_box type2">
                <div class="visual type2">
                    <div class="pic">
                        <ul>
                            <li>
                                <a href="#"><img src="/resources/img/partner1_1.jpg" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/partner1_2.jpg" alt="건강지킴이"></a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/partner1_1.jpg" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/partner1_2.jpg" alt="건강지킴이"></a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/partner1_1.jpg" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/partner1_2.jpg" alt="건강지킴이"></a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/partner1_1.jpg" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/partner1_2.jpg" alt="건강지킴이"></a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/partner1_1.jpg" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/partner1_2.jpg" alt="건강지킴이"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="btn type2"></div>
                    <div class="dir">
                        <div class="prev"><span>이전</span></div>
                        <div class="next"><span>다음</span></div>
                    </div>
                </div>
            </div>
        </div>
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
                    <div class="layerPop3">
                        <a href="#" class="close"><img src="/resources/img/layer_close2.png" alt=""></a>
                        <img src="/resources/img/six_pop3.jpg" alt="six정보결제" class="six_pop">
                        <p class="pop_title">결제방법 및 충전할 포인트를 선택하세요.</p>
                        <ul class="select_point">
                            <li><label for="radio1"><img src="/resources/img/radio1.jpg" alt=""></label><input type="radio" id="radio1" name="point_radio"></li>
                            <li><label for="radio2"><img src="/resources/img/radio2.jpg" alt=""></label><input type="radio" id="radio2" name="point_radio"></li>
                            <li><label for="radio3"><img src="/resources/img/radio3.jpg" alt=""></label><input type="radio" id="radio3" name="point_radio"></li>
                            <li><label for="radio4"><img src="/resources/img/radio4.jpg" alt=""></label><input type="radio" id="radio4" name="point_radio"></li>
                            <li><label for="radio5"><img src="/resources/img/radio5.jpg" alt=""></label><input type="radio" id="radio5" name="point_radio"></li>
                        </ul>
                        <div class="balance_box">
                            <dl>
                                <dt>결제금액</dt>
                                <dd>33,000 원 (VAT 포함)</dd>
                                <dt>충전포인트</dt>
                                <dd>33,000 P</dd>
                            </dl>
                        </div>
                        <ul class="radio_list">
                            <li><input type="radio" name="way" id="way1"><label for="way1">신용카드</label></li>
                            <li><input type="radio" name="way" id="way2"><label for="way2">휴대폰</label></li>
                            <li><input type="radio" name="way" id="way3"><label for="way3">계좌이체</label></li>
                            <li><input type="radio" name="way" id="way4"><label for="way4">가상계좌</label></li>
                            <li><input type="radio" name="way" id="way5"><label for="way5">무통장입금</label></li>
                        </ul>
                        <div class="center_btns">
                            <button class="btn_type3">취소</button>
                            <button class="btn_type3">결제하기</button>
                        </div>
                        <div class="limited_info">
                            <p class="limited_tit">카드사 결제한도 안내</p>
                            <p class="limited_tit2">포인트를 충전하는 사이트는 카드사별 정책으로 인해 결제한도 제한이 있습니다. <br>결제 전에 카드사 별 결제한도 조건을 확인하셔서 서비스 이용에 불편이 없으시길 바랍니다. <a href="#">결제한도 확인하기</a></p>
                        </div>
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