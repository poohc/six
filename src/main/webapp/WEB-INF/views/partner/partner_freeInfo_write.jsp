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
	$('#partner1').addClass("on");	
	
	switch ('<c:out value="${category}" />') {
	
	case 'FREE_INFO': $('#categoryFree').addClass("on");
					  $('#categoryInvest').removeClass();
					  $('#categoryMarket').removeClass();
		              break;
	case 'INVEST_STRATEGY': $('#categoryFree').removeClass();
					  		$('#categoryInvest').addClass("on");
					  		$('#categoryMarket').removeClass();
    				  		break;
	case 'MARKET_ANALYSIS': $('#categoryFree').removeClass();
					  		$('#categoryInvest').removeClass();
					  		$('#categoryMarket').addClass("on");
    				  		break;
	default:
		break;
	}
	
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
                <jsp:include page="../common/partner_menu.jsp" />
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
            <form id="frm" name="frm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
            	<input type="hidden" id="listPage" name="listPage" value="${listPage}">
            	<input type="hidden" id="updateAction" name="updateAction" value="${updateAction}">
            	<input type="hidden" id="insertAction" name="insertAction" value="${insertAction}">
            	<input type="hidden" id="seq" name="seq" value="${boardInfo.SEQ}">               					
            	<input type="hidden" id="id" name="id" value="${id}">
            <div class="wrap_right">
                <img src="/resources/img/partner1.jpg" alt="" class="top_mainimg">
                <div class="personInfo">
                    <img src="/resources/img/p_1.png" alt="">
                    <p class="personTitle">최성관</p>
                    <p class="personTitle2">SIX파트너</p>
                    <p class="personTitle3">주식정보의 큰손</p>
                    <p class="personTitle4">OO대학교 경제학과</p>
                    <p class="personTitle5">OO투자증권 FP</p>
                    <p class="personTitle6">SIX투자증권</p>
                </div>
                <div class="right_contents">
                    <div class="tab_contents" id="tab1">
                        <div class="table_type1_write">
                            <table>
                            <caption>SIX 파트너</caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:90%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="bb_line1">제목</td>
                                    <td class="bb_line1">
                                    	<input type="text" id="title" name="title" value="${boardInfo.TITLE}">
                                    </td>
                                </tr>
                                <tr>
                                	<th>카테고리</th>
                                	<td>
                                		<input type="radio" name="category" value="FREE_INFO" <c:if test="${boardInfo.CATEGORY eq 'FREE_INFO'}">checked="checked"</c:if> style="width: 5%">무료종목
                                		<input type="radio" name="category" value="INVEST_STRATEGY" <c:if test="${boardInfo.CATEGORY eq 'INVEST_STRATEGY'}">checked="checked"</c:if> style="width: 5%">투자전략
                                		<input type="radio" name="category" value="MARKET_ANALYSIS" <c:if test="${boardInfo.CATEGORY eq 'MARKET_ANALYSIS'}">checked="checked"</c:if> style="width: 5%">시장분석
                                	</td>
                                </tr>
                                <tr>
                                	<th>가격</th>
                                	<td>
                                		<input type="text" id="price" name="price" style="width: 20%" value="${boardInfo.PRICE}">
                                		&nbsp;기본 가격은 무료입니다.
                                	</td>
                                </tr>
                                <tr>
                                	<th>
                                		첨부파일
                                	</th>
                                	<c:choose>
                                	<c:when test="${isUpdate eq 'true'}">
                                		<td>
                                			<c:forEach items="${fileList}" var="fileList">
                                				${fileList.file}
                                			</c:forEach>
                                			<input id="file" name="file" type="file">
                                		</td>                                		
                                	</c:when>
                                	<c:otherwise>
	                                	<td colspan="2">
	                                		<input id="file" name="file" type="file">
	                                	</td>
                                	</c:otherwise>
                                	</c:choose>                                	
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                    	<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;">
                                    	</textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                        </form>
                        <security:authorize access="hasRole('ROLE_USER')" var="isUser" />
						<security:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
						<security:authorize access="hasRole('ROLE_PARTNER')" var="isPartner" />
						<div class="table_bottom">
                        <a href="javascript:goList()" class="go_list">목록으로</a>
                        <c:if test="${isAdmin || (isPartner && sessionScope.userInfo.username eq id)}">
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
                        </c:if>
                    </div>
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