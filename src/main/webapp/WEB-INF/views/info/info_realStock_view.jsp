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
	$('#info4').addClass("on");	
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
                <jsp:include page="../common/info_menu.jsp" />
                <div class="youtube_channel">
                    <a class="youtube_title">채널<span>+ 더보기</span></a>
                    <div class="youtube_box">
                        <ul class="youtube_list">
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrap_right">
                <img src="/resources/img/introduce1.jpg" alt="" class="top_mainimg">
                <div class="right_contents">
                    <p class="title_type1">실시간증시일정</p>
                    <div class="table_top">
                        <p class="table_type1title2"><span>뭐라고 오늘이 쿼드러플워칭데이라고??
뭐라고 오늘이 기준금리 결정일이라고??</span></p>
<!--                         <div class="table_rightarea"> -->
<!--                             <select name="titleandcontent" id="titleandcontent" title="분류"> -->
<!--                                 <option value="제목">제목</option> -->
<!--                                 <option value="제목">내용</option> -->
<!--                             </select> -->
<!--                             <input type="text"> -->
<!--                             <button>검색</button> -->
<!--                         </div> -->
                    </div>
                    <div class="table_type1_view type2">
                        <table>
                            <caption>공지사항</caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:52%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th colspan="5">${boardInfo.TITLE}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="right_bul tl_c">${boardInfo.CREATE_USER_ID}</td>
                                    <td class="tl_c">조회수 ${boardInfo.HIT_COUNT}</td>
                                    <td></td>
                                    <td class="right_bul type2 tl_c">등록일</td>
                                    <td class="tl_c">${boardInfo.CREATE_DATE}</td>
                                </tr>
                                <tr>
                                	<td colspan="5">
                                	<c:forEach items="${fileList}" var="fileList">
                                		<a href="javascript:fileDownLoad('${fileList.rFile}')">${fileList.file}</a>
                                	</c:forEach>
                                	</td>
                                </tr>
                                <tr class="">
                                    <td colspan="5" class="td_lh">${boardInfo.CONTENTS}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <form name="frm" id="frm" method="post" accept-charset="utf-8">
                    <input type="hidden" id="fileName" name="fileName">
                    <input type="hidden" id="listPage" name="listPage" value="${listPage}">
                    <input type="hidden" id="replyAddAction" name="replyAddAction" value="${replyAddAction}">
                	<input type="hidden" id="replyUpdAction" name="replyUpdAction" value="${replyUpdAction}">
                	<input type="hidden" id="replyDelAction" name="replyDelAction" value="${replyDelAction}">
                	<input type="hidden" id="updateAction" name="updateAction" value="${updateAction}">
                	<input type="hidden" id="deleteAction" name="deleteAction" value="${deleteAction}">
                	<input type="hidden" id="seq" name="seq" value="${boardInfo.SEQ}">
                	<input type="hidden" id="rSeq" name="rSeq">
                	<input type="hidden" id="indent" name="indent" value="${boardInfo.INDENT}">
                	<input type="hidden" id="step" name="step" value="${boardInfo.STEP}">
                	<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
                    <div class="table_comment type3">
                        <p class="comment_title1">댓글쓰기</p>
                        <textarea class="com_text" name="replyText" id="replyText" cols="30" rows="10" placeholder="댓글을 달아주세요.  최대 100자까지 작성할 수 있습니다. 악플은 제재 및 삭제될 수 있습니다. "></textarea>
                        <button class="com_btn" id="replyBtn">등록하기</button>
                    </div>                    
                    </form>
                    <div class="table_bottom">
                        <a href="javascript:goList()" class="go_list">목록으로</a>
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
	                        <ul class="table_option">
		                        <li><a href="javascript:deleteBoard()" id="deleteBtn">삭제</a></li>
		                        <li><a href="javascript:updateBoard()" id="updateBtn">수정</a></li>
	                        </ul>
                        </security:authorize>
                    </div>
                    <ul class="com_list">
                    	<c:forEach items="${list}" var="list" varStatus="loop">
                    	<c:choose>
                        <c:when test="${list.INDENT > 0}">
                        <c:set var="paddingLeft" value="${list.INDENT * 17}" />
                        <li id="reply_${loop.index}" style="padding-left: ${paddingLeft}px;">
                        </c:when>
                        <c:otherwise>
                        <li id="reply_${loop.index}">
                        </c:otherwise>
                        </c:choose>
                            <div class="com_top">
                                <ul class="com_top1">
                                    <li>${list.CREATE_USER_ID}</li>
                                    <li>${list.CREATE_DATE}</li>
                                </ul>                                
                                <ul class="com_top2">
                                	<li><a href="javascript:rReply('${loop.index}','${list.SEQ}','${list.INDENT}','${list.STEP}')">답글</a></li>
                                    <li id="cancelLi_${loop.index}" style="visibility: hidden;"><a href="javascript:cReply('${loop.index}')">취소</a></li>
                                    <c:if test="${sessionScope.userInfo.username eq list.CREATE_USER_ID}">
                                    	<li id="updateLi_${loop.index}"><a href="javascript:rUpdate('${loop.index}','${list.SEQ}','${list.CONTENTS}')">수정</a></li>
                                    	<li><a href="javascript:rDelete('${list.SEQ}','${list.STEP}')">삭제</a></li>
                                    </c:if>
                                </ul>
                            </div>                            
                            <p class="comment_content" id="contents_${loop.index}">${list.CONTENTS}</p>
                        </li>
						</c:forEach>		
						</form>
                    </ul>
                    <c:if test="${fn:length(list) > 0}">
                    	<c:out value="${page}" escapeXml="false" />
                    </c:if>
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