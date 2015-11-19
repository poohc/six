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
	$('#academy4').addClass("on");	
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
                <jsp:include page="../common/academy_menu.jsp" />
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
                <img src="/resources/img/academy1.jpg" alt="" class="top_mainimg">
                <div class="right_contents">
                	<form method="post" id="frm" name="frm">
                	<input type="hidden" id="listPage" name="listPage" value="${listPage}">
                    <input type="hidden" id="viewPage" name="viewPage" value="${viewPage}">
                    <input type="hidden" id="writePage" name="writePage" value="${writePage}">
               		<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
               		<input type="hidden" id="seq" name="seq">
                    <p class="title_type1">필수 구독자료</p>
                    <div class="table_top">
                        <p class="table_type1title2"><span>정보의 비대칭성을 해결하는 주식정보거래소 SIX
실시간 정보구독하기</span></p>
                        <div class="table_rightarea">
                            <select name="searchOption" id="searchOption" title="분류">
                                <option value="title">제목</option>
                                <option value="contents">내용</option>
                            </select>
                            <input type="text" id="searchText" name="searchText">
                            <button type="button" id="searchBtn">검색</button>
                        </div>
                    </div>
                    </form>
                    <div class="table_type1">
                        <table>
                            <caption>공지사항</caption>
                            <colgroup>
                                <col style="width:7%;">
                                <col style="width:62%;">
                                <col style="width:7%;">
                                <col style="width:17%;">
                                <col style="width:7%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                            	<c:when test="${fn:length(list) > 0}">
                            		<c:forEach items="${list}" var="list">
		                                <tr class="new">
		                                    <td>${list.NO}</td>
		                                    <td class="t_l">
		                                    	<a href="javascript:goView('${list.SEQ}')" class="plus_img">
		                                    	<c:choose>
			                                    	<c:when test="${fn:length(list.THUMB_IMAGE) > 0}">
			                                    		<c:out value="${list.THUMB_IMAGE}" escapeXml="false" />
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    		<img src="/resources/img/academy_bul.jpg" alt="SIX 주식배움터 기본 이미지">	
			                                    	</c:otherwise>
		                                    	</c:choose>
		                                    	<div class="acatitle_area">
                                    				<p class="academy_title">${list.TITLE}</p>
                                    				<p class="academy_title2">${list.PARSE_CONTENTS}</p>
                                    			</div>
		                                    	</a>
		                                    </td>
		                                    <td>${list.CREATE_USER}</td>
		                                    <td>${list.CREATE_DATE}</td>
		                                    <td>${list.HIT_COUNT}</td>
		                                </tr>
	                                </c:forEach>
                            	</c:when>
                            	<c:otherwise>
                            		<tr>
                            			<td colspan="5">
                            				공지사항이 없습니다.
                            			</td>
                            		</tr>
                            	</c:otherwise>                            	
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_bottom">
                        <security:authorize ifAnyGranted="ROLE_ADMIN">
                        <ul class="table_option">
                            <li><a href="javascript:goWrite()">글쓰기</a></li>
                        </ul>
                        </security:authorize>
                    </div>
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