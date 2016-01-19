<!DOCTYPE html>
<html lang="ko">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FirstOne</title>
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<script type="text/javascript" src="../js/jquery-1_11_1_min.js"></script>
<script type="text/javascript" src="../js/html5.js"></script>
</head>

<body>
<div class="wrapper">
	<div class="skipMenu">
		<a href="#navigation">주메뉴 바로가기</a>
		<a href="#wrap_container">본문 바로가기</a>
	</div>
    <div class="headerArea">
        <div class="headerArea2">
            <a href="index.html" class="logo"><img src="../img/logo.png" alt=""></a>
            <div id="menuwrap">
            <!-- pc 메뉴 -->
                <div id="navigation_pc">
                    <ul id="navigation">
                        <li class=""><a href="sub1.html" class="btnPullDown">퍼스트원의시각</a>
                            <!-- 2뎁스 시작 -->

                            <!-- 2뎁스 끝 -->
                        </li>
                        <li><a href="sub2.html" class="btnPullDown">퍼스트원의다짐</a>

                        </li>
                        <li><a href="sub3.html" class="btnPullDown">투자결정과정</a>

                        </li>
                        <li><a href="sub4.html" class="btnPullDown">투자스토리</a>

                        </li>
                        <li class="on"><a href="sub5_list.html" class="btnPullDown">공지사항</a>
                    </ul>
                </div>
            <!-- pc메뉴 끝 -->
            </div>
        </div>
    </div>
	<!-- contain -->
	<div id="wrap_container">
        <div class="naviArea">
            <ul class="navi">
                <li class="home"><a href="index.html"></a></li>
                <li><a href="sub6_list.html">상담게시판</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>상담게시판</h1>
            <div class="board_write"><!-- board_write -->
                <form>
                    <table>
                        <caption>산학협력 협약체결현황</caption>
                        <colgroup>
                            <col style="width:13%">
                            <col style="width:%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><span class="point">제 목</span></th>
                            <td><span class="enter_st"><input type="text" title="주소"></span></td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="point">작성자</span></th>
                            <td><span class="enter_st"><input type="text" title="세부주소"></span></td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="point">내용</span></th>
                            <td>
                                <div class="edit_area">Edit 들어가는곳</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="btn_box">
                <div class="left_boxs">
                    <a href="#" class="btn_type3">취 소</a>
                </div>
                <div class="right_boxs">
                    <a href="#" class="btn_type1">등 록</a>
                </div>
            </div>
        </div>
	</div>
	<!-- //container -->
    <div id="footer">
        <div class="footerArea">
            <img src="../img/logo.png" alt="">
            <div class="footCont">
                000-000 서울특별시 가나구 다라동 에이비씨 12호    TEL  02.777.7777    FAX  02.777.7777    대표  홍길동   퍼스트원인베스트먼트매니지먼트<br>
                개인정보책임자  홍길동     사업자등록번호  333-33-33333     통신판매업신고  333-33-33333<br>
                Copyright 2015© First One Investment Management. All right reserved.
            </div>
        </div>
    </div>
</div>
<script>
$(function(){
    $('.tab_contents:eq(0)').show();
    $('#tab li a').click(function(){
        $('#tab li').removeClass('on');
        $(this).parent().addClass('on');
        $('.tab_contents').hide();
        var activeTab = $(this).attr('href');
        $(activeTab).show();
        return false;
    });
});


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