<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
	
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
            <div class="combine">
                <p class="title_type2">회원가입 01</p>
                <p class="useterm_title">이용약관</p>
                <div class="term_box">
                    <span>제 1장 총칙</span><br>
                    이용악관, 개인정보 수집 및 이용 개인정보 제 3자 제공에 모두 동의합니다.
                    사이트에서 제공하는 증권정보는 투자판단의 참고자료로, 투자의 최종 책임은 본 정보를 이용하시는 이용자에게 있습니다. <br><br>

                    <span>제 1조 (목적)</span><br>
                    이 약관은 주식정보거래소(이하 총칭하여 ‘회사’라 칭함)가 제공하는 웹사이트 증권서비스(이하 ‘서비스’라 칭함)의 이용조건 및 절차,
                    기타 필요사항을 규정함을 목적으로 합니다.<br><br>

                    <span>제 2조 (약관의 효력 및 변경)</span><br>
                    (1) 이 약관은 그 내용을 회사의 웹사이트에 게시하거나 기타의 방법으로 회원에게 공지하고,
                    이에 동의한 회원이 서비스에 가입함으로써 효력이 발생합니다.

                    <span>제 3조 (약관의 효력 및 변경)</span><br>
                    (1) 이 약관은 그 내용을 회사의 웹사이트에 게시하거나 기타의 방법으로 회원에게 공지하고,
                    이에 동의한 회원이 서비스에 가입함으로써 효력이 발생합니다.
                </div>
                <div class="check_radio">
                    <input type="radio" name="first_term" id="term_agree">
                    <label for="term_agree">동의합니다.</label>
                    <input type="radio" name="first_term" id="term_agree2">
                    <label for="term_agree2">동의하지 않습니다.</label>
                </div>
                <p class="useterm_title">개인정보 수집 및 이용안내</p>
                <div class="term_box">
                    <span>1. 수집하는 개인정보 항목</span><br>
                    회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br>
                    - 수집항목 : 이름, 로그인ID, 비밀번호, 휴대전화번호, 이메일, 서비스 이용기록, 접속로그, 쿠키, 접속 IP 정보, 결제기록 <br>
                    - 개인정보 수집방법 : 홈페이지(회원가입)    <br>    <br>

                    <span>2. 개인정보의 수집 및 이용목적</span><br>
                    회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br>
                    - 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 구매 및 요금 결제<br><br>
                </div>
                <div class="check_radio">
                    <input type="radio" name="first_term2" id="term_agree3">
                    <label for="term_agree3">동의합니다.</label>
                    <input type="radio" name="first_term2" id="term_agree4">
                    <label for="term_agree4">동의하지 않습니다.</label>
                </div>
                <div class="center_btn">
                    <button class="btn_cancel">취소</button>
                    <button class="btn_ok">확인</button>
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
<script>
/**********************************************************************************/
// 팝업창 닫기
/**********************************************************************************/
$(".top_banner").delay(200).slideDown();
$("#close_top_notice").click(close_notice)
function close_notice(){
    $(".top_banner").slideUp();
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

/* * * * * * * * * * * * * * * * * * * * *
비주얼  슬라이드2
* * * * * * * * * * * * * * * * * * * * */
var pic_ls = $(".visuals .pic li").length;
for(var i=0; i<pic_ls; i++){
    $(".visuals .btn").append("<div><span>"+(i+1)+"</span></div>");
}
$(".visuals .btn").append("<a class='stop'></a>");

var bis;
var rans = Math.floor(Math.random() * pic_ls);
bis = rans;
$(".visuals .pic li").eq(bis).addClass("ch");
$(".visuals .btn div").eq(bis).addClass("ch");

$(".visuals .btn div").click(function(){
    if(!$(this).is(".ch")){
        bis = $(this).index();
        $(".visuals .btn div").removeClass("ch");
        $(this).addClass("ch");
        $(".visuals .pic li.ch").animate({"left":"-100%"}, 300).removeClass("ch");
        $(".visuals .pic li").eq(bis).css("left","100%").animate({"left":"0"}, 300).addClass("ch");
    }
});
$(".visuals .prev").click(function(){
    bis--;
    if(bis < 0){bis=pic_ls-1;}
    $(".visuals .btn div").eq(bis).click();
});
$(".visuals .next").click(function(){
    bis++;
    if(bis >= pic_ls){bis=0;}
    $(".visuals .btn div").eq(bis).click();
});

var autosets;
function autoRuns(){
    autosets = setTimeout(function(){
        $(".visuals .next").click();
        autoRuns();
    }, 3000);
}autoRuns();

var stgs = 0;
$(".visuals .btn").on("click", ".stop", function(){
    $(this).removeClass().addClass("gogo");
    stgs = 0;
    clearTimeout(autosets);
});
$(".visuals .btn").on("click", ".gogo", function(){
    if(stgs == 0){
        $(this).removeClass().addClass("stop");
        stgs = 1;
        $(".visuals .next").click();
        autoRuns();
    }
});
$(".visuals .dir span").click(function(){
    $(".visuals .stop").click();
});
$(".visuals .btn div span").click(function(){
    $(".visuals .stop").click();
});
</script>
</body>
</html>