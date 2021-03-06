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
                <div class="kospi">
                    <p class="kospi_title">KOSPI</p>
                    <p class="kospi_title2">1,915.53 <span>7.09 (1.75%)</span></p>
                    <p class="kospi_title">KOSPI</p>
                    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
                    <p class="kospi_title">KOSPI</p>
                    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
                </div>
                <div class="login_box">
                    <input type="text" class="id_input" placeholder="아이디">
                    <input type="text" class="password_input" placeholder="비밀번호">
                    <button class="login_btn">로그인</button>
                    <a href="#" class="id_search">아이디/비밀번호찾기</a>
                    <a href="#" class="join">회원가입</a>
                </div>
                <div class="about_six">
                    <p class="about_sixtitle">SIX</p>
                    <ul class="about_sixlist">
                        <li class="on"><a href="#">SIX란?<span></span></a></li>
                        <li><a href="#">공지사항<span></span></a></li>
                        <li><a href="#">결제방법<span></span></a></li>
                        <li><a href="#">고객문의<span></span></a></li>
                    </ul>
                </div>
                <div class="left_comment">
                    <p class="left_comment_title">덧글</p>
                    <div class="comment_box">
                        <div class="comment_box2">
                            <textarea name="leftcomment" id="leftcomment" cols="30" rows="10" class="left_textarea"></textarea>
                            <span><em>0</em>/100자</span>
                        </div>
                        <button class="comment_btn">덧글 남기기</button>
                        <ul class="leftcomment_list">
                            <li>기대됩니다. 앞으로 좋은 사이트로 발전하시길 바랍니다. <span>nickname</span></li>
                            <li>기대됩니다. 앞으로 좋은 사이트로 발전하시길 바랍니다. <span>nickname</span></li>
                            <li>기대됩니다. 앞으로 좋은 사이트로 발전하시길 바랍니다. <span>nickname</span></li>
                            <li>기대됩니다. 앞으로 좋은 사이트로 발전하시길 바랍니다. <span>nickname</span></li>
                            <li>기대됩니다. 앞으로 좋은 사이트로 발전하시길 바랍니다. <span>nickname</span></li>
                        </ul>
                    </div>
                </div>
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
                <img src="/resources/img/introduce1.jpg" alt="" class="top_mainimg">
                <div class="right_contents">
                    <p class="title_type1">SIX란?</p>
                    <img src="/resources/img/introduce2.jpg" alt="">
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
	<footer>
        <div id="footer">
            <ul class="look_ahead4">
                <li><a href="#"><p class="look_title">SIX 파트너 신청</p></a></li>
                <li><a href="#"><p class="look_title">고객센터</p></a></li>
                <li><a href="#"><p class="look_title">회원가입</p></a></li>
            </ul>
            <div class="footer_top">
                <div class="footer_top2">
                    <ul class="sitemap_list">
                        <li>
                            <p class="sitemap_title">SIX 소개</p>
                            <ul class="sitemap_list2">
                                <li><a href="#">SIX란?</a></li>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">결재방법</a></li>
                                <li><a href="#">고객문의</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">SIX 아카데미</p>
                            <ul class="sitemap_list2">
                                <li><a href="#">SIX 주식배움터</a></li>
                                <li><a href="#">SIX 투자전략</a></li>
                                <li><a href="#">SIX 탐방노트</a></li>
                                <li><a href="#">필수구독자료</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">SIX 일급정보</p>
                            <ul class="sitemap_list2">
                                <li><a href="#">일급 무료종목 추천</a></li>
                                <li><a href="#">식스비기</a></li>
                                <li><a href="#">테마정보</a></li>
                                <li><a href="#">실시간 증시일정</a></li>
                                <li><a href="#">증시브리핑</a></li>
                                <li><a href="#">고수들의 인터뷰</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">SIX 파트너</p>
                            <ul class="sitemap_list2">
                                <li><a href="#">SIX 파트너</a></li>
                                <li><a href="#">SIX 파트너 순위</a></li>
                                <li><a href="#">SIX 파트너 신청</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">정보거래소</p>
                            <ul class="sitemap_list2">
                                <li><a href="#">무료정보</a></li>
                                <li class="ti_5"><a href="#"> - 무료종목</a></li>
                                <li class="ti_5"><a href="#"> - 투자전략</a></li>
                                <li class="ti_5"><a href="#"> - 시장분석</a></li>
                                <li><a href="#">고급정보</a></li>
                                <li class="ti_5"><a href="#"> -유료종목</a></li>
                                <li class="ti_5"><a href="#"> -매매기법</a></li>
                                <li class="ti_5"><a href="#"> -고급사항</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">커뮤니티</p>
                            <ul class="sitemap_list2">
                                <li><a href="#">자유게시판</a></li>
                                <li><a href="#">종목 토론방</a></li>
                                <li><a href="#">SIX 이용후기</a></li>
                                <li><a href="#">특강 세미나 교육</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">이벤트</p>
                            <ul class="sitemap_list2">
                                <li><a href="#">진행중 이벤트</a></li>
                                <li><a href="#">종료 이벤트</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <ul class="bn_list">
                <li><a href="#"><img src="/resources/img/bn1.png" alt="한국거래소"></a></li>
                <li><a href="#"><img src="/resources/img/bn2.png" alt="우리투자증권"></a></li>
                <li><a href="#"><img src="/resources/img/bn1.png" alt="우리투자증권"></a></li>
                <li><a href="#"><img src="/resources/img/bn2.png" alt="우리투자증권"></a></li>
                <li><a href="#"><img src="/resources/img/bn1.png" alt="우리투자증권"></a></li>
                <li><a href="#"><img src="/resources/img/bn2.png" alt="우리투자증권"></a></li>
            </ul>
            <div class="footer_bottom">
                <div class="footer_bottom2">
                    <a href="#" class="foot_logo"><img src="/resources/img/foot_logo.png" alt="six"></a>
                    <div class="footer_text">
                        <ul class="foot_link">
                            <li><a href="#">회사소개</a></li>
                            <li><a href="#">문의하기</a></li>
                            <li><a href="#">SIX주식정보거래소</a></li>
                        </ul>
                        <div class="foot_text">
                            <p class="foot_text1">000-000 서울특별시 구로구 독산동 현대 2222호    TEL  02.777.7777    FAX  02.777.7777     대표  박준상    아이엔티인베스트</p>
                            <p class="foot_text1">개인정보책임자  민병철    사업자등록번호  333-33-33333    통신판매업신고  333-33-33333</p>
                            <p class="foot_text1">Copyright 2015© STOCK INFORMATION EXCHANGE. All right reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</footer>
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