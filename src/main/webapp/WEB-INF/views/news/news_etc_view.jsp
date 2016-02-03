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
	$('#news2').addClass("on");	 
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
                <jsp:include page="../common/news_menu.jsp" />
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
                    <p class="title_type1">기타정보</p>
                    <div class="table_top">
                        <p class="table_type1title">기타정보</p>
                    </div>
                    <div class="table_type1_view type2 type4">
                        <table>
                            <caption>기타정보</caption>
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
                                	<td class="right_bul tl_c"><img src="/resources/img/master.png" alt="six"></td>
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
                                    <td colspan="5" class="td_lh">
                                    ${boardInfo.CONTENTS}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <form name="frm" id="frm" method="post" accept-charset="utf-8">
                    <input type="hidden" id="fileName" name="fileName">
                    <input type="hidden" id="listPage" name="listPage" value="${listPage}">
                    <input type="hidden" id="updateAction" name="updateAction" value="${updateAction}">
                	<input type="hidden" id="deleteAction" name="deleteAction" value="${deleteAction}">
                	<input type="hidden" id="seq" name="seq" value="${boardInfo.SEQ}">
                	<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
                	</form>
                    <div class="table_bottom type2">
                    	<a href="javascript:goList()" class="go_list">목록으로</a>
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
	                        <ul class="table_option">
		                        <li><a href="javascript:deleteBoard()" id="deleteBtn">삭제</a></li>
		                        <li><a href="javascript:updateBoard()" id="updateBtn">수정</a></li>
	                        </ul>
                        </security:authorize>
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