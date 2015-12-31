<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$('#intro1').addClass("on");	
	
	$('#addReplyBtn').click(function(){
		
		if('<c:out value="${sessionScope.userInfo.name}" />' == ''){
			alert('로그인이 필요한 서비스 입니다.');
			return false;
		}
		
		if($('#shortComment').val().length == 0 || $('#shortComment').val() == ''){
			alert('댓글남긴 내용을 입력해주세요');
			return false;
		}
		
		if($('#shortComment').val().length > 100){
			alert('100글자를 넘길 수 없습니다.');
			return false;
		}
		
		$('#frm').attr('action',$('#commentAction').val());
		$('#frm').submit();
		
	});
	
	$('#shortComment').bind('input propertychange', function() {
		
		var commentLength = $('#shortComment').val().length;
		$('#commentLength').text(commentLength);
		
		if(commentLength > 100){
			alert('100글자를 넘길 수 없습니다.');
			return false;
		}
		
	});
	
	
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
                    	<form id="frm" name="frm" method="post">
                    		<input type="hidden" id="commentAction" name="commentAction" value="${commentAction}">
                    		<div class="comment_box2">
	                            <textarea name="shortComment" id="shortComment" cols="30" rows="10" class="left_textarea"></textarea>
	                            <span><em id="commentLength"></em>/100자</span>
                        	</div>
                    	</form>
                        <button class="comment_btn" type="button" id="addReplyBtn" name="addReplyBtn">덧글 남기기</button>
                        <ul class="leftcomment_list">
                        	<c:choose>
                        		<c:when test="${fn:length(shortBoardList) > 0}">
                        			<c:forEach items="${shortBoardList}" var="shortBoardList">
                        				<li>${shortBoardList.CONTENTS}<span>${shortBoardList.NICKNAME}</span></li>
                        			</c:forEach>                        		
                        		</c:when>
                        		<c:otherwise>
                        			<li>덧글이 없습니다.</span></li>		
                        		</c:otherwise>
                        	</c:choose>
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
            <div class="left_side">
                <ul class="left_banner1">
                    <li><a href="#">SIX 아카데미</a></li>
                    <li><a href="#">SIX 일급정보</a></li>
                    <li><a href="#">정보거래소</a></li>
                </ul>
                <div class="left_banner2">
                    <p class="rank_title">RANKING</p>
                    <ul class="ranking_list">
                        <li><a href="#"><img src="/resources/img/rank_img.png" alt=""></a></li>
                        <li><a href="#"><img src="/resources/img/rank_img.png" alt=""></a></li>
                        <li><a href="#"><img src="/resources/img/rank_img.png" alt=""></a></li>
                    </ul>
                </div>
                <div class="dart">
                    <input type="text" class="dart_search">
                    <button class="dart_btn">검색</button>
                </div>
            </div>
            <div class="right_side">
                <ul class="right_banner1">
                    <li><a href="#">정보열람<br>회원가입</a></li>
                    <li><a href="#">SIX 파트너<br>신청</a></li>
                </ul>
                <a href="#" class="right_bn3"><img src="/resources/img/right_bn3.jpg" alt=""></a>
                <a href="#" class="right_bn4"><img src="/resources/img/right_bn4.jpg" alt=""></a>
            </div>
        </div>
		<!-- Left Side -->
        <jsp:include page="../common/left.jsp" />
        <!-- Left Side end -->
        
        <!-- Left Side -->
        <jsp:include page="../common/right.jsp" />
        <!-- Left Side end -->

	</div>
	<!-- //container -->
	<jsp:include page="../common/footer.jsp" />
</div>
</body>
</html>