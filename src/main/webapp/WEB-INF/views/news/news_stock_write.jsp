<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript" src="/resources/js/boardCommon_Editor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#news1').addClass("on");	 
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
                <img src="/resources/img/trade1.jpg" alt="" class="top_mainimg">
                <div class="right_contents type2">
                    <p class="title_type1">증권가정보</p>
                    <ul class="navi_map">
                        <li><a href="#">증권가소식 &gt;</a></li>
                        <li><a href="#">증권가정보</a></li>
                    </ul>
                    <div class="table_top">
                    </div>
                    <div class="table_type1_write">
                        <table>
                            <caption>증권가정보</caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:90%;">
                            </colgroup>
                            <form name="frm" id="frm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                            <input type="hidden" id="insertAction" name="insertAction" value="${insertAction}">
                            <input type="hidden" id="updateAction" name="updateAction" value="${updateAction}">
                            <input type="hidden" id="listPage" name="listPage" value="${listPage}">
                            <input type="hidden" id="seq" name="seq" value="${boardInfo.SEQ}"> 
                            <tbody>
                                <tr>
                                    <th class="bb_line1">제목</td>
                                    <td class="bb_line1"><input type="text" id="title" name="title" value="${boardInfo.TITLE}"></td>                                    
                                </tr>                                
                                <tr>
                                	<td>&nbsp;</td>                              	
                                	<td>
                                	<input type="radio" name="chkNotice" value="notice" checked="checked" style="width: 10px;height: 10px;">공지
                                	<input type="radio" name="chkNotice" value="normal" style="width: 10px;height: 10px;">일반
                                	</td>
                                </tr>
                                <tr class="">
                                    <th>내용</td>                                    
                                    <td>
                                    	<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;">
                                    	${boardInfo.CONTENTS}
                                    	</textarea>
                                    </td>
                                </tr>
                            </tbody>
                            </form>
                        </table>
                    </div>
                    <div class="table_bottom">
                        <a href="javascript:goList()" class="go_list">목록으로</a>
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
                        <ul class="table_option">
                            <li><a href="#" onclick="history.back()">취소</a></li>
                            <c:choose>
                            <c:when test="${isUpdate eq 'true'}">
                            	<li><a href="#" id="updateBtn">수정</a></li>
                            </c:when>
                            <c:otherwise>
                            	<li><a href="#" id="saveBtn">글쓰기</a></li>
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