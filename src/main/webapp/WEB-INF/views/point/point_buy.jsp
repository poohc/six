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
	
	initPoint();
	
	$('#payBtn').click(function(){
		var point = $('input:radio[name="pointRadio"]:checked').val();
		var radioId = $('input:radio[name="pointRadio"]:checked').attr('id');
		var radioCheckResult = false;
		
		alert(point);
		
		if(radioId == 'radio1') radioCheckResult = (point == '30000')?true:false; 
		if(radioId == 'radio2') radioCheckResult = (point == '51000')?true:false;
		if(radioId == 'radio3') radioCheckResult = (point == '103000')?true:false;
		if(radioId == 'radio4') radioCheckResult = (point == '210000')?true:false;
		if(radioId == 'radio5') radioCheckResult = (point == '320000')?true:false;
		
		if(point == '' || point == null){
			alert('적립할 포인트를 선택해 주세요.');
			return false;
		}
		
		var pointArray = [30000, 51000, 103000, 210000, 320000];
		var moneyArray = [30000, 50000, 100000, 200000, 300000];
		
		if(!radioCheckResult){
			alert('잘못된 포인트 입니다.');
			return false;
		}
		
		if(!chkContainValue(point,pointArray) || !chkContainValue($('#chargeMoney').text(),moneyArray)){
			alert('잘못된 포인트 입니다.');
			return false;
		}
		
		$('#sChargeMoney').val($('#chargeMoney').text());
		$('#sChargePoint').val($('#chargePoint').text());
		
		$('#frm').attr('action',$('#payAction').val());
		$('#frm').submit();
		
	});	
	
// 	$('[type=radio]').prop('checked', true).attr('checked',true).trigger('change');
	
	$('input:radio[name="pointRadio"]').change(function(){
		initPoint();
	});
	
});

function initPoint(){
	var point = $('input:radio[name="pointRadio"]:checked').val();
	$('#point').val(point);
	var money;
	
	switch (point) {
	case '30000' : money = 30000;
				   break;
	case '51000' : money = 50000;
	 			   break;
	case '103000' : money = 100000;
	   			    break;
	case '210000' : money = 200000;
	 			    break;
	case '320000' : money = 300000;
	 			    break;
	    default :
				 break;
	}
	
	$('#chargeMoney').text(money);
	$('#chargePoint').text(point);
}

function chkContainValue(value, array){
	
	var result = false;
	
	for(var i=0;i<array.length;i++){
		if(array[i] == value){
			result = true;
		}	
	}
	
	return result;
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
                        <form id="frm" name="frm" method="post">
                        <input type="hidden" id="point" name="point">
                        <input type="hidden" id="sChargeMoney" name="sChargeMoney">
                        <input type="hidden" id="sChargePoint" name="sChargePoint">
                        <input type="hidden" id="payAction" name="payAction" value="${payAction}">
                        
                        <p class="pop_title">결제방법 및 충전할 포인트를 선택하세요.</p>
                        <ul class="select_point">
                            <li>
                            	<label for="radio1"><img src="/resources/img/radio1.jpg" alt=""></label>
                            	<input type="radio" id="radio1" name="pointRadio" value="30000" checked="checked">
                            </li>
                            <li>
                            	<label for="radio2"><img src="/resources/img/radio2.jpg" alt=""></label>
                            	<input type="radio" id="radio2" name="pointRadio" value="51000">
                            </li>
                            <li>
                            	<label for="radio3"><img src="/resources/img/radio3.jpg" alt=""></label>
                            	<input type="radio" id="radio3" name="pointRadio" value="103000">
                            </li>
                            <li>
                            	<label for="radio4"><img src="/resources/img/radio4.jpg" alt=""></label>
                            	<input type="radio" id="radio4" name="pointRadio" value="210000">
                            </li>
                            <li>
                            	<label for="radio5"><img src="/resources/img/radio5.jpg" alt=""></label>
                            	<input type="radio" id="radio5" name="pointRadio" value="320000">
                            </li>
                        </ul>
                        <div class="balance_box">
                            <dl>
                                <dt>결제금액</dt>
                                <dd><span id="chargeMoney"></span> 원 (VAT 포함)</dd>
                                <dt>충전포인트</dt>
                                <dd><span id="chargePoint"></span> P</dd>
                            </dl>
                        </div>
                        <ul class="radio_list">
                        	<c:forEach items="${paymentCd}" var="paymentCd" varStatus="loop">
                        		<li>
                        			<c:choose>
                        			<c:when test="${loop.index eq 0}">
                        				<input type="radio" name="paymentMethod" id="way${loop.count}" checked="checked" value="${paymentCd.CD}">
                        				<label for="way${loop.count}">${paymentCd.CD_NAME}</label>
                        			</c:when>
                        			<c:otherwise>
                        				<input type="radio" name="paymentMethod" id="way${loop.count}" value="${paymentCd.CD}" disabled="disabled">
                        				<label for="way${loop.count}">${paymentCd.CD_NAME}</label>
                        			</c:otherwise>                        			
                        			</c:choose>
                        		</li>
                        	</c:forEach>
<!--                         	<li> -->
<!--                             	<input type="radio" name="paymentMethod" id="way1" value="PAYM0001" checked="checked"> -->
<!--                             	<label for="way1">무통장입금</label> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                             	<input type="radio" name="paymentMethod" id="way2" disabled="disabled" value="PAYM0002"> -->
<!--                             	<label for="way2">신용카드</label> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                             	<input type="radio" name="paymentMethod" id="way3" disabled="disabled" value="PAYM0003"> -->
<!--                             	<label for="way3">휴대폰</label> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                             	<input type="radio" name="paymentMethod" id="way4" disabled="disabled" value="PAYM0004"> -->
<!--                             	<label for="way4">계좌이체</label> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                             	<input type="radio" name="paymentMethod" id="way5" disabled="disabled" value="PAYM0005"> -->
<!--                             	<label for="way5">가상계좌</label> -->
<!--                             </li>                             -->
                        </ul>
                        <div class="center_btns">
                            <button class="btn_type3">취소</button>
                            <button id="payBtn" class="btn_type3">결제하기</button>
                        </div>
                        <div class="limited_info">
                            <p class="limited_tit">카드사 결제한도 안내</p>
                            <p class="limited_tit2">포인트를 충전하는 사이트는 카드사별 정책으로 인해 결제한도 제한이 있습니다. <br>결제 전에 카드사 별 결제한도 조건을 확인하셔서 서비스 이용에 불편이 없으시길 바랍니다. <a href="#">결제한도 확인하기</a></p>
                        </div>
                        </form>
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