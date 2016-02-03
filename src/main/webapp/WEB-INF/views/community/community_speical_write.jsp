<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<jsp:include page="../common/boardCommon_Editor.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$('#community4').addClass("on");	
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
                <jsp:include page="../common/community_menu.jsp" />
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
                <img src="/resources/img/trade1.jpg" alt="" class="top_mainimg">
                <div class="right_contents type2">
                    <p class="title_type1">특강세미나교육</p>
                    <ul class="navi_map">
                        <li><a>커뮤니티 &gt;</a></li>
                        <li><a>특강세미나교육</a></li>
                    </ul>
                    <div class="table_top">
                        <p class="table_type1title2"><span>무료종목도 좋은 정보를 제공합니다.</span></p>
                    </div>
                    <form name="frm" id="frm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                    <input type="hidden" id="insertAction" name="insertAction" value="${insertAction}">
                    <input type="hidden" id="updateAction" name="updateAction" value="${updateAction}">
                    <input type="hidden" id="listPage" name="listPage" value="${listPage}">
                    <input type="hidden" id="seq" name="seq" value="${boardInfo.SEQ}">
                    <div class="table_type1_write">
                        <table>
                            <caption>특강세미나교육</caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:90%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="bb_line1">제목</td>
                                    <td class="bb_line1"><input type="text" id="title" name="title" value="${boardInfo.TITLE}"></td>
                                </tr>
                                <tr>
                                	<c:choose>
                                	<c:when test="${isUpdate eq 'true'}">
                                		<td>
                                			<c:forEach items="${fileList}" var="fileList">
                                				${fileList.file}
                                			</c:forEach>
                                		</td>
                                		<td>
	                                		파일 업로드 <input id="file" name="file" type="file" multiple>
	                                	</td>
                                	</c:when>
                                	<c:otherwise>
	                                	<td colspan="2">
	                                		파일 업로드 <input id="file" name="file" type="file" multiple>
	                                	</td>
                                	</c:otherwise>
                                	</c:choose>                                	
                                </tr>
                                <tr class="">
                                    <th>내용</td>
                                    <td>
                                    	<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;">
                                    	</textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    </form>
                    <div class="table_bottom">
                        <a href="javascript:goList()" class="go_list">목록으로</a>
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
                        <ul class="table_option">
                            <li><a onclick="history.back()">취소</a></li>
                            <c:choose>
                            <c:when test="${isUpdate eq 'true'}">
                            	<li><a id="updateBtn">수정</a></li>
                            </c:when>
                            <c:otherwise>
                            	<li><a id="saveBtn">글쓰기</a></li>
                            </c:otherwise>
                            </c:choose>
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