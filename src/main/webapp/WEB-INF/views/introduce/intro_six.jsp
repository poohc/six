<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$('#intro1').addClass("on");	
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
        <div class="container">
            <div class="wrap_left">
                <jsp:include page="../common/login_common.jsp" />
                <jsp:include page="../common/intro_menu.jsp" />               
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
	<jsp:include page="../common/footer.jsp" />
</div>
</body>
</html>