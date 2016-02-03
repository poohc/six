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
	$('#market3').addClass("on");	
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
                    <p class="title_type1">시장분석</p>
                    <ul class="navi_map">
                        <li><a>정보거래소 &gt;</a></li>
                        <li><a>시장분석</a></li>
                    </ul>
                    <div class="table_top">
                        <p class="table_type1title2">무료종목도 좋은 정보를 제공합니다.</p>
                        <form method="post" id="frm" name="frm">
                        <input type="hidden" id="listPage" name="listPage" value="${listPage}">
                        <input type="hidden" id="viewPage" name="viewPage" value="${viewPage}">
                        <input type="hidden" id="writePage" name="writePage" value="${writePage}">
                		<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
                		<input type="hidden" id="seq" name="seq">                
                        <div class="table_rightarea">
                            <select name="searchOption" id="searchOption" title="분류">
                                <option value="title">제목</option>
                                <option value="contents">내용</option>
                            </select>
                            <input type="text" id="searchText" name="searchText">
                            <button type="button" id="searchBtn">검색</button>
                        </div>
                        </form>
                    </div>
                    <div class="table_type1">
                        <table>
                            <caption>공지사항</caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:32%;">
                                <col style="width:15%;">
                                <col style="width:8%;">
                                <col style="width:10%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>파트너</th>
                                    <th>분류</th>
                                    <th>제목</th>
                                    <th>작성일</th>
                                    <th>가격</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                            	<c:when test="${fn:length(list) > 0}">
                            		<c:forEach items="${list}" var="list">
		                                <tr class="new">
		                                    <td>${list.PARTNER_NAME}</td>
		                                    <td>${list.TYPE_NAME}</td>
		                                    <td class="t_l">
		                                    	<a href="javascript:goView('${list.SEQ}')">
		                                    		<c:if test="${list.IS_NOTICE eq 'T'}">
		                                    		<span class="notice_bul">공지</span>
		                                    		</c:if>
		                                    		${list.TITLE}
		                                    	</a>
		                                    </td>
		                                    <td>${list.CREATE_DATE}</td>
		                                    <td>${list.PRICE}</td>
		                                    <td>${list.HIT_COUNT}</td>
		                                </tr>
	                                </c:forEach>
                            	</c:when>
                            	<c:otherwise>
                            		<tr>
                            			<td colspan="6">
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
<!--                             <li><a href="javascript:goWrite()">글쓰기</a></li> -->
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