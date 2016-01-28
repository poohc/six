<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="./common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$('#cellphone').on("keyup", function() {
		$('#cellphone').val($('#cellphone').val().replace(/[^0-9]/g,''));
		if($('#cellphone').val().length>11){
			$('#cellphone').val($('#cellphone').val().substring(0,11));
		}
	});
	
	$('#investMoney').on("keyup", function() {
		$('#investMoney').val($('#investMoney').val().replace(/[^0-9]/g,''));
		if($('#investMoney').val().length>11){
			$('#investMoney').val($('#investMoney').val().substring(0,11));
		}
	});	
	
});

function goCounseling(){
	if($('input[name="q_1"]:checked').val() == undefined){
		alert('질문 1에 답해주세요');
		$('input[name="q_1"]').focus();
		return;
	}
	if($('input[name="q_2"]:checked').val() == undefined){
		alert('질문 2에 답해주세요');
		$('input[name="q_2"]').focus();
		return;
	}
	if($('input[name="q_3"]:checked').val() == undefined){
		alert('질문 3에 답해주세요');
		$('input[name="q_3"]').focus();
		return;
	}
	if($('input[name="q_4"]:checked').val() == undefined){
		alert('질문 4에 답해주세요');
		$('input[name="q_4"]').focus();
		return;
	}
	if($('#q_5').val().length == 0){
		alert('질문 5에 답해주세요');
		$('#q5').focus();
		return;
	}
	if($('#name').val().length == 0){
		alert('이름을 입력해주세요');
		$('#name').focus();
		return;
	}
	if($('#cellphone').val().length == 0){
		alert('핸드폰 번호를 입력해주세요');
		$('#cellphone').focus();
		return;
	}
	if($('#email').val().length == 0){
		alert('이메일을 입력해주세요');
		$('#email').focus();
		return;
	}
	if($('#investMoney').val().length == 0){
		alert('투자금을 입력해주세요');
		$('#investMoney').focus();
		return;
	}
	
	$('#question1').val($('#q1').text());
	$('#question2').val($('#q2').text());
	$('#question3').val($('#q3').text());
	$('#question4').val($('#q4').text());
	$('#question5').val($('#q5').text());
	
	$('#frm').attr('action',$('#counselingPage').val());
	$('#frm').submit();
}

function goView(seq){
	$('#seq').val(seq);
	$('#frm').attr('action',$('#viewPage').val());
	$('#frm').submit();
}

</script>
</head>
<body>
<div class="wrapper main">
	<!-- header -->
	<jsp:include page="./common/header.jsp" />
	<!-- header End -->
	<form id="frm" name="frm" method="post">
		<input type="hidden" id="counselingPage" name="counselingPage" value="${counselingPage}">
		<input type="hidden" id="seq" name="seq">
		<input type="hidden" id="viewPage" name="viewPage" value="${viewPage}">
		<input type="hidden" id="question1" name="question1">
		<input type="hidden" id="question2" name="question2">
		<input type="hidden" id="question3" name="question3">
		<input type="hidden" id="question4" name="question4">
		<input type="hidden" id="question5" name="question5">	
	<!-- container -->
	<div id="wrap_container">
         <div class="rolling">
            <div class="banner_list_box">
                  <div class="visual">
                       <div class="pic">
                           <ul>
                               <li>
                                   <a href="#"><img src="/resources/f1k/img/visual1.jpg" alt="건강지킴이"></a>
                               </li>
                               <li>
                                   <a href="#"><img src="/resources/f1k/img/visual2.jpg" alt="건강지킴이"></a>
                               </li>
                           </ul>
                       </div>
                       <div class="btn"></div>
					<div class="dirWrap">
						<div class="dir">
							<div class="prev"><span><img src="/resources/f1k/img/left.png"></span></div>
							<div class="next"><span><img src="/resources/f1k/img/right.png"></span></div>
							<div class="blurBox">
								냉철한 시스템과<br>
								정확한 판단력으로<br>
								<span>완벽한 분석을 하는</span><br>
								<em>퍼스트원</em>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
        <div class="mainIconsWrap">
            <ul class="mainIcons">
                <li>
                    <a href="#">
                        <img src="/resources/f1k/img/icon1.png" alt="">
                        <p class="mainIconsTitle">시대의흐름</p>
                        <p class="mainIconsTitle2">시대는 변화합니다<br>끊임없이 변화하고 성장하는 시대의<br>흐름을 정확히 보는 것이 중요합니다.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="/resources/f1k/img/icon2.png" alt="">
                        <p class="mainIconsTitle">기업의본질</p>
                        <p class="mainIconsTitle2">기업의 본질에 집중하며, <br>진정 기업을 판단하려면 보고 듣고 <br> 만져봐야 합니다.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="/resources/f1k/img/icon3.png" alt="">
                        <p class="mainIconsTitle">냉철한분석</p>
                        <p class="mainIconsTitle2">지속적, 안정적으로 이끌어가는 <br>알고리즘 분석 시스템으로 <br>안정적인 성과를 이끌어가고 있습니다.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="/resources/f1k/img/icon4.png" alt="">
                        <p class="mainIconsTitle">퍼스트원의다짐</p>
                        <p class="mainIconsTitle2">고객에게 믿을 수 있는 기업<br>완벽한 투자 결정이 나기전까지 끊임없이<br> 분석하고 또 분석하겠습니다</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="mainCont">
            <ul>
                <li>
                    <p class="mainContTitle">공지사항</p>
                    <a href="/f1k/f1kNoticeList.do" class="viewMore">더보기 +</a>
                    <c:choose>
                    <c:when test="${fn:length(list) > 0}">
                    	<c:forEach items="${list}" var="list" varStatus="loop" begin="0" end="2">
                    	<c:choose>
	                    	<c:when test="${loop.index eq 0}">
		                    	<a href="javascript:goView('${list.SEQ}')" class="mainContLink">
			                        <p class="mainContTitle2">${list.TITLE}</p>
<%-- 			                        <p class="mainContTitle3">${list.CONTENTS}</p> --%>
		                    	</a>
		                    	<p class="mainContTitle4">${list.CREATE_DATE}</p>
	                    	</c:when>
	                    	<c:otherwise>
		                    	<ul class="noticeList">
			                        <li>
			                        	<a href="#">${list.TITLE}</a>
			                        	<span>${list.CREATE_DATE}</span>
			                        </li>	                        
		                    	</ul>
	                    	</c:otherwise>
                    	</c:choose>
                    	</c:forEach>
                    </c:when>
                    <c:otherwise>
                    	<ul class="noticeList">
	                        <li>
	                        	공지사항이 없습니다.
	                        </li>	                        
                    	</ul>
                    </c:otherwise>
                    </c:choose>
                </li>
                <li>
                    <p class="mainContTitle type2">퍼스트원의 시각</p>
                    <a href="/f1k/f1kSub1.do" class="viewMore">더보기 +</a>
                    <a href="/f1k/f1kSub1.do" class="mainContLink2">
                        <p class="mainContTitle5">트레이딩 시스템을 퍼스트원의 시각과 <br>시스템으로 고객에게 여러분께 <br> 알려드립니다.</p>
                    </a>
                </li>
                <li class="investConsult">
                    <p class="mainContTitle">투자상담</p>
                    <a href="#layer2" class="btnType1 btn-example">상담하기</a>
                     <p class="mainContTitle5">퍼스트원의<br>애널리스트 / 펀드매니저가<br>성의있게 도와드립니다.</p>
                </li>
            </ul>
            <div class="dim-layer">
       	    	<div class="dimBg">
       	    	</div>
        		<div class="consultPopup pop-layer" id="layer2">
            <textarea name="" id="" cols="30" rows="10" class="consultTextarea">약관</textarea>
            <ul class="popupCheckList">
                <li>
                    <p class="popupTitle1" id="q1">1. 주식 투자를 하길 잘했다고 생각하십니까?</p>
                    <ul class="popupRadio">
                       <li>
                            <input type="radio" name="q_1" id="firstli" value="예">
                            <label for="firstli">예</label>
                        </li>
                         <li>
                            <input type="radio" name="q_1" id="firstli2" value="아니오">
                            <label for="firstli2">아니오</label>
                        </li>
                        <li>
                            <input type="radio" name="q_1" id="firstli3" value="잘모르겠다">
                            <label for="firstli3">잘모르겠다</label>
                        </li>
                    </ul>
                </li>
                <li>
                    <p class="popupTitle1" id="q2">2. 주식 투자로 돈을 벌 수 있다고 생각하십니까? 주식시장에 기회가 많다고 생각하십니까?</p>
                    <ul class="popupRadio">
                        <li>
                            <input type="radio" name="q_2" id="firstli" value="예">
                            <label for="firstli">예</label>
                        </li>
                         <li>
                            <input type="radio" name="q_2" id="firstli2" value="아니오">
                            <label for="firstli2">아니오</label>
                        </li>
                        <li>
                            <input type="radio" name="q_2" id="firstli3" value="잘모르겠다">
                            <label for="firstli3">잘모르겠다</label>
                        </li>
                    </ul>
                </li>
                <li>
                    <p class="popupTitle1" id="q3">3. 주식 투자 비중은 얼마나 되십니까?</p>
                    <ul class="popupRadio">
                       <li>
                            <input type="radio" name="q_3" id="firstli11" value="여유자금 일부">
                            <label for="firstli11">여유자금 일부</label>
                        </li>
                         <li>
                            <input type="radio" name="q_3" id="firstli12" value="여유자금 전부">
                            <label for="firstli12">여유자금 전부</label>
                        </li>
                        <li>
                            <input type="radio" name="q_3" id="firstli13" value="실패시 타격">
                            <label for="firstli13">실패시 타격</label>
                        </li>
                    </ul>
                </li>
                <li>
                    <p class="popupTitle1" id="q4">4. 자신의 주식실적은 어느정도라고 생각하십니까?</p>
                    <ul class="popupRadio">
                       <li>
                            <input type="radio" name="q_4" id="firstli11" value="매우잘함">
                            <label for="firstli11">매우잘함</label>
                        </li>
                         <li>
                            <input type="radio" name="q_4" id="firstli12" value="잘함">
                            <label for="firstli12">잘함</label>
                        </li>
                        <li>
                            <input type="radio" name="q_4" id="firstli13" value="보통">
                            <label for="firstli13">보통</label>
                        </li>
                        <li>
                            <input type="radio" name="q_4" id="firstli13" value="못함">
                            <label for="firstli13">못함</label>
                        </li>
                        <li>
                            <input type="radio" name="q_4" id="firstli13" value="매우못함">
                            <label for="firstli13">매우못함</label>
                        </li>
                    </ul>
                </li>
                <li>
                    <p class="popupTitle1" id="q5">5. 보유종목,계좌비중 및 수익률( 예)셀트리온 10%  수익률 -5% )</p>
                    <textarea name="q_5" id="q_5" cols="30" rows="10" class="consultTextarea2"></textarea>
                </li>
            </ul>
            <div class="customerInfo">
                <p class="popupTitle2">고객정보입력</p>
                <p class="popupTitle3"><span>*</span>  표시 필수항목 입니다.</p>
                <ul class="putCtrInfo">
                    <li>
                        <p class="putCtrTitle"><span>*</span>이름</p>
                        <input type="text" id="name" name="name">
                    </li>
                    <li>
                        <p class="putCtrTitle"><span>*</span>핸드폰</p>
                        <input type="text" id="cellphone" name="cellphone">
                    </li>
                    <li>
                        <p class="putCtrTitle"><span>*</span>E-Mail</p>
                        <input type="text" id="email" name="email">
                    </li>
                    <li>
                        <p class="putCtrTitle"><span>*</span>투자금</p>
                        <input type="text" id="investMoney" name="investMoney">
                    </li>
                </ul>
            </div>
            </form>
            <button type="button" onclick="goCounseling()" class="btnType2">상담신청하기</button>
<!--             <div a href="javascript:goCounseling()" class="btnType2">상담신청하기</div> -->
            <a href="#" class="btnType2 type2 btn-layerClose">닫기</a>
        	</div>
        </div>        
	</div>
	<!-- //container -->
    <div id="footer">
        <div class="footerArea">
            <img src="/resources/f1k/img/logo.png" alt="">
            <div class="footCont">
                000-000 서울특별시 가나구 다라동 에이비씨 12호    TEL  02.777.7777    FAX  02.777.7777    대표  홍길동   퍼스트원인베스트먼트매니지먼트<br>
                개인정보책임자  홍길동     사업자등록번호  333-33-33333     통신판매업신고  333-33-33333<br>
                Copyright 2015© First One Investment Management. All right reserved.
            </div>
        </div>
    </div>
</div>
<script>
/**********************************
레이어팝업
***********************************/
$('.btn-example').click(function(){
        var $href = $(this).attr('href');
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });

    }
/* * * * * * * * * * * * * * * * * * * * *
메인비주얼 슬라이드
* * * * * * * * * * * * * * * * * * * * */
    var pic_l = $(".visual .pic li").length;
    for(var i=0; i<pic_l; i++){
        $(".visual .btn").append("<div><span>"+(i+1)+"</span></div>");
    }
    $(".visual .btn").append("<a class='stop'></a>");

    var bi;
    var ran = Math.floor(Math.random() * pic_l);
    bi = ran;
    $(".visual .pic li").eq(bi).addClass("ch");
    $(".visual .btn div").eq(bi).addClass("ch");

    $(".visual .btn div").click(function(){
        if(!$(this).is(".ch")){
            bi = $(this).index();
            $(".visual .btn div").removeClass("ch");
            $(this).addClass("ch");
            $(".visual .pic li.ch").animate({"left":"-100%"}, 300).removeClass("ch");
            $(".visual .pic li").eq(bi).css("left","100%").animate({"left":"0"}, 300).addClass("ch");
        }
    });
    $(".visual .prev").click(function(){
        bi--;
        if(bi < 0){bi=pic_l-1;}
        $(".visual .btn div").eq(bi).click();
    });
    $(".visual .next").click(function(){
        bi++;
        if(bi >= pic_l){bi=0;}
        $(".visual .btn div").eq(bi).click();
    });

    var autoset;
    function autoRun(){
        autoset = setTimeout(function(){
            $(".visual .next").click();
            autoRun();
        }, 3000);
    }autoRun();
    var stg = 0;
    $(".visual .btn").on("click", ".stop", function(){
        $(this).removeClass().addClass("gogo");
        stg = 0;
        clearTimeout(autoset);
    });
    $(".visual .btn").on("click", ".gogo", function(){
        if(stg == 0){
            $(this).removeClass().addClass("stop");
            stg = 1;
            $(".visual .next").click();
            autoRun();
        }
    });
    $(".visual .dir span").click(function(){
        $(".visual .stop").click();
    });
    $(".visual .btn div span").click(function(){
        $(".visual .stop").click();
    });

</script>
</body>
</html>