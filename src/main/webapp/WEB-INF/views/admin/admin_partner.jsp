<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../common/admin_common.jsp" />
<body>
	<jsp:include page="../common/admin_menu.jsp" />
	<section id="main" class="column">
		<h4 class="alert_info">파트너 신청 리스트</h4>
		<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">파트너 신청 리스트</h3></header>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th></th> 
    				<th>ID</th> 
    				<th>이름</th> 
    				<th>신청구분</th> 
    				<th>소속</th>
    				<th>신청일</th> 
    				<th>승인여부</th>
				</tr> 
			</thead> 
			<form method="post" id="frm" name="frm">
			<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
       		<input type="hidden" id="seq" name="seq">
			<tbody> 
				<c:forEach items="${list}" var="partnerList">
					<tr> 
	   					<td><input type="checkbox" id="seq" name="seq" value="${partnerList.SEQ}"></td> 
	    				<td>${partnerList.ID}</td> 
	    				<td>${partnerList.NAME}</td> 
	    				<td>${partnerList.REQUEST_NAME}</td>
	    				<td>${partnerList.POST}</td> 
	    				<td>${partnerList.CREATE_DATE}</td>
	    				<td>
	    					<c:choose>
	    					<c:when test="${partnerList.IS_CONFIRM eq 'N'}">
	    						미승인
	    					</c:when>
	    					<c:otherwise>
	    						승인
	    					</c:otherwise>
	    					</c:choose>
	    				</td> 
					</tr>
				</c:forEach>
			</tbody> 
			</table>
			<c:if test="${fn:length(list) > 0}">
            	<c:out value="${page}" escapeXml="false" />
            </c:if>
			</div>
			</form>
		</div>		
		</article><!-- end of content manager article -->				
	</section>
</body>
</html>