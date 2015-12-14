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

function goCategory(category){
	$('#category').val(category);
	$('#frm').attr('action',$('#listPage').val());
	$('#frm').submit();
}

function goView(seq){
	$('#seq').val(seq);
	$('#frm').attr('action',$('#viewPage').val());
	$('#frm').submit();
}

function goWrite(){
	$('#frm').attr('action',$('#writePage').val());
	$('#frm').submit();
}

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
            <form id="frm" name="frm" method="post">
            	<input type="hidden" id="category" name="category" value="${category}">
            	<input type="hidden" id="listPage" name="listPage" value="${listPage}">
            	<input type="hidden" id="viewPage" name="viewPage" value="${viewPage}">
            	<input type="hidden" id="writePage" name="writePage" value="${writePage}">
            	<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
               	<input type="hidden" id="seq" name="seq">
               	<input type="hidden" id="partnerSeq" name="partnerSeq" value="${partnerSeq}"> 
               	<input type="hidden" id="id" name="id" value="${id}">              					
            </form>
            <div class="wrap_right">
                <img src="/resources/img/partner1.jpg" alt="" class="top_mainimg">
                 <div class="personInfo">
                    <img src="/resources/img/p_1.png" alt="">
                    <p class="personTitle">${partnerInfo.NAME}</p>
                    <p class="personTitle2">${partnerInfo.REQUEST_NAME}</p>
                    <p class="personTitle3">${partnerInfo.SLOGAN}</p>
                    <p class="personTitle6">${partnerInfo.POST}</p>
                </div>
                <ul class="inform_list">
                    <li>총 정보등록건수<span>${partnerBoardStat.CNT}</span></li>
                    <li>총 다운로드<span>${partnerBoardStat.DOWNLOAD_COUNT}</span></li>
                    <li>정보등록건수 순위<span>${partnerBoardStat.RANK}</span></li>
                    <li>다운로드 순위<span>${partnerBoardStat.DOWNLOAD_RANK}</span></li>
                </ul>
                <ul class="inform_list2">
                    <li id="categoryFree"><a href="javascript:goCategory('FREE_INFO')">무료종목</a></li>
                    <li id="categoryInvest"><a href="javascript:goCategory('INVEST_STRATEGY')">투자전략</a></li>
                    <li id="categoryMarket"><a href="javascript:goCategory('MARKET_ANALYSIS')">시장분석</a></li>
                </ul>
                <div class="right_contents">
                    <div class="tab_contents" id="tab1">
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
                                        <th>번호${partnerSeq}</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:choose>
	                                	<c:when test="${fn:length(list)>0}">
		                                	<c:forEach items="${list}" var="list">
		                                    	<tr>
			                                        <td>${list.NO}</td>
			                                        <td class="t_l">
			                                        	<a href="javascript:goView('${list.SEQ}')">${list.TITLE}</a>
			                                        </td>
			                                        <td>${list.ID}</td>
			                                        <td>${list.CREATE_DATE}</td>
			                                        <td>${list.HIT_COUNT}</td>
		                                    	</tr>
	                                    	</c:forEach>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<tr>
	                                			<td colspan="5">게시물이 없습니다.</td>
	                                		</tr>
	                                	</c:otherwise>
                                	</c:choose>                                                                        
                                </tbody>
                            </table>
                        </div>
                        <security:authorize access="hasRole('ROLE_USER')" var="isUser" />
						<security:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
						<security:authorize access="hasRole('ROLE_PARTNER')" var="isPartner" />
						<div class="table_bottom">
	                        <c:choose>
								<c:when test="${isAdmin || (isPartner && sessionScope.userInfo.username eq id)}">
		                        	<ul class="table_option">
			                            <li><a href="javascript:goWrite()">글쓰기</a></li>
			                        </ul>
		                        </c:when>
	                        </c:choose>	                        
	                    </div>
	                    <c:if test="${fn:length(list) > 0}">
	                    	<c:out value="${page}" escapeXml="false" />
	                    </c:if>
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