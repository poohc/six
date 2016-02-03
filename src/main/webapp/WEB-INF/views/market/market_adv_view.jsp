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
	$('#market6').addClass("on");	
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
                <jsp:include page="../common/market_menu.jsp" />
                <div class="youtube_channel">
                    <a class="youtube_title">채널<span>+ 더보기</span></a>
                    <div class="youtube_box">
                        <ul class="youtube_list">
                            <li><a><img src="/resources/img//youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img//youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img//youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img//youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img//youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrap_right">
                <img src="/resources/img//trade1.jpg" alt="" class="top_mainimg">
                <div class="right_contents type2">
                    <p class="title_type1">고급시황</p>
                    <ul class="navi_map">
                        <li><a href="/market/marketMain.do">정보거래소 &gt;</a></li>
                        <li><a href="/market/marketAdv.do">고급시황</a></li>
                    </ul>
                    <div class="table_type1_view type2">
                        <table>
                            <caption>공지사항</caption>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:35%;">
                                <col style="width:15%;">
                                <col style="width:35%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>제목</td>
                                    <td>${boardInfo.TITLE}</td>
                                    <th>다운로드 수</th>
                                    <td>${boardInfo.DOWNLOAD_COUNT}</td>
                                </tr>
                                <tr>
                                    <th>작성자</td>
                                    <td>${boardInfo.ID}</td>
                                    <th>작성일</th>
                                    <td>${boardInfo.CREATE_DATE}</td>
                                </tr>
                                <tr>
                                    <th>첨부파일</td>
                                    <td>
                                    	<c:forEach items="${fileList}" var="fileList">
                                		<a onclick="fileDownLoad('${fileList.rFile}')">${fileList.file}</a>
                                		</c:forEach>
                                	</td>
                                    <th>조회</th>
                                    <td>${boardInfo.HIT_COUNT}</td>
                                </tr>
                                <tr>
                                    <th class="bb_line3">가격</td>
                                    <td class="bb_line3" colspan="3">${boardInfo.PRICE}</td>
                                </tr>
                                <tr class="">
                                    <td colspan="4" class="td_lh">
                                    	${boardInfo.CONTENTS}
                                    </td>
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