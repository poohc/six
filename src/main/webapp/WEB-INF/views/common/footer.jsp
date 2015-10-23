<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<footer>
        <div id="footer">
        	<ul class="look_ahead4">
                <li><a href="/partner/partnerJoin.do"><p class="look_title">SIX 파트너 신청</p></a></li>
                <li><a href="#" onclick="javascript:alert('준비중입니다.')"><p class="look_title">고객센터</p></a></li>
                <li><a href="/member/memberJoin.do"><p class="look_title">회원가입</p></a></li>
            </ul>
            <div class="footer_top">
                <div class="footer_top2">
                    <ul class="sitemap_list">
                        <li>
                            <p class="sitemap_title">SIX 소개</p>
                            <ul class="sitemap_list2">
                                <li><a href="/main/introSix.do">SIX 란?</a></li>
								<li><a href="/main/introNotice.do">공지사항</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">SIX 아카데미</p>
                            <ul class="sitemap_list2">
                                <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터</a></li>
                                <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략</a></li>
                                <li><a href="/academy/academySearchNote.do">SIX 탐방노트</a></li>
                                <li><a href="/academy/academyNecessarySubscribe.do">필수구독자료</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">SIX 일급정보</p>
                            <ul class="sitemap_list2">
                                <li><a href="/info/infoFreeRec.do">일급무료종목추천</a></li>
                                <li><a href="/info/infoSecTech.do">식스비기</a></li>
                                <li><a href="/info/infoRealStock.do">실시간 증시일정</a></li>
                                <li><a href="/info/infoStockBriefing.do">증시브리핑</a></li>
                                <li><a href="/info/infoGInterview.do">고수들의 인터뷰</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">SIX 파트너</p>
                            <ul class="sitemap_list2">
                                <li><a href="/partner/partnerMain.do">SIX 파트너</a></li>
                                <li><a href="/partner/partnerJoin.do">SIX 파트너 신청</a></li> 
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">정보거래소</p>
                            <ul class="sitemap_list2">
                                <li><a href="/market/marketFree.do">무료종목</a></li>
								<li><a href="/market/marketIstrategy.do">투자전략</a></li>
								<li><a href="/market/marketAnalysis.do">시장분석</a></li>
								<li><a href="/market/marketPay.do">유료종목</a></li>
								<li><a href="/market/marketBargain.do">매매기법</a></li>
								<li><a href="/market/marketAdv.do">고급사항</a></li>
                            </ul>
                        </li>
                        <li>
                            <p class="sitemap_title">커뮤니티</p>
                            <ul class="sitemap_list2">
                                <li><a href="/community/communityFreeboard.do">자유게시판</a></li>
                                <li><a href="/community/communityDiscussion.do">종목토론방</a></li>
                                <li><a href="/community/communityReview.do">SIX 이용후기</a></li>
                                <li><a href="/community/communitySpeical.do">특강 세미나 교육</a></li>
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