<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../common/admin_common.jsp" />
<head>
<script type="text/javascript">

function pageMove(page){
	$('#currentPage').val(page);
	$('#frm').attr('action',$('#listPage').val());
	$('#frm').submit();
}

function goView(seq){
	$('#seq').val(seq);	
	$('#frm').attr('action',$('#viewPage').val());
	$('#frm').submit();
}

</script>
</head>
<body>
	<jsp:include page="../common/admin_menu.jsp" />
	<section id="main" class="column">
		<h4 class="alert_info">상담 신청 리스트</h4>
		<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">상담 신청 리스트</h3></header>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th>이름</th> 
    				<th>연락처</th> 
    				<th>이메일</th>
    				<th>투자금</th>
    				<th>신청일</th>
				</tr> 
			</thead> 
			<form method="post" id="frm" name="frm">
			<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
			<input type="hidden" id="seq" name="seq">
			<input type="hidden" id="lsitPage" name="lsitPage" value="${lsitPage}">
			<input type="hidden" id="viewPage" name="viewPage" value="${viewPage}">
       		<tbody> 
       			<c:choose>
	       			<c:when test="${fn:length(list) > 0}">
	       			<c:forEach items="${list}" var="counselingList">
						<tr onclick="goView('${counselingList.SEQ}')" style="cursor:pointer;"> 
		   					<td>${counselingList.NAME}</td> 
		    				<td>${counselingList.CELLPHONE_1}-${counselingList.CELLPHONE_2}-${counselingList.CELLPHONE_3}</td>
		    				<td>${counselingList.EMAIL}</td>
		    				<td>${counselingList.INVEST_MONEY}</td> 
		    				<td>${counselingList.CREATE_DATE}</td>	    					    				
						</tr>
					</c:forEach>
	       			</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">상담내역 없음</td>							
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody> 
			</table>
			<c:if test="${fn:length(list) > 0}">
            	<c:out value="${page}" escapeXml="false" />
            </c:if>
			</div>
			</form>			
		</div>		
		</article>				
	</section>
</body>
</html>