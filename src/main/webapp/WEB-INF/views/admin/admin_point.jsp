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

$(document).ready(function(){
	$('#confirmBtn').click(function(){
		
		if($('input:checkbox[name="chkPoint"]:checked').length == 0){
			alert('승인할 포인트를 체크해 주세요');
			return false;
		}
		
		if(confirm('해당 체크 포인트를 승인하시겠습니까?')){
			$('#isConfirm').val('Y');
			$('#frm').attr('action',$('#confirmAction').val());
			$('#frm').submit();
		} 
		
	});
});

$(document).ready(function(){
	$('#cancelBtn').click(function(){
		
		if($('input:checkbox[name="chkPoint"]:checked').length == 0){
			alert('취소할 포인트를 체크해 주세요');
			return false;
		}
		
		if(confirm('해당 체크 포인트 승인을 취소 하시겠습니까?')){
			$('#isConfirm').val('N');
			$('#frm').attr('action',$('#confirmAction').val());
			$('#frm').submit();
		} 
		
	});
});

function pageMove(page){
	$('#currentPage').val(page);
	$('#frm').attr('action',$('#listPage').val());
	$('#frm').submit();
}

</script>
</head>
<body>
	<jsp:include page="../common/admin_menu.jsp" />
	<section id="main" class="column">
		<h4 class="alert_info">포인트 신청 리스트</h4>
		<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">포인트 신청 리스트</h3></header>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr>
					<th></th> 
   					<th>ID</th> 
    				<th>이름</th> 
    				<th>신청포인트</th> 
    				<th>금액</th>
    				<th>결제수단</th>
    				<th>신청일</th> 
    				<th>승인여부</th>    				
				</tr> 
			</thead> 
			<form method="post" id="frm" name="frm">
			<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
			<input type="hidden" id="seq" name="seq">
			<input type="hidden" id="lsitPage" name="lsitPage" value="${lsitPage}">
			<input type="hidden" id="confirmAction" name="confirmAction" value="${confirmAction}">
			<input type="hidden" id="isConfirm" name="isConfirm">
       		<tbody> 
       			<c:choose>
	       			<c:when test="${fn:length(list) > 0}">
	       				<c:forEach items="${list}" var="pointList">
							<tr>
								<td>
									<input type="checkbox" name="chkPoint" value="${pointList.SEQ}">										
									<input type="hidden" name="point" value="${pointList.POINT}">
									<input type="hidden" name="id" value="${pointList.ID}">
								</td>
								<td>${pointList.ID}</td>
			   					<td>${pointList.NAME}</td>
			   					<td>${pointList.POINT}</td> 
			    				<td>${pointList.MONEY}</td>
			    				<td>${pointList.PAYMENT_METHOD_NAME}</td>
			    				<td>${pointList.CREATE_DATE}</td> 
			    				<td>
			    					<c:choose>
			    					<c:when test="${pointList.IS_CONFIRM eq 'N'}">
			    						미승인
			    					</c:when>
			    					<c:otherwise>
			    						승인
			    					</c:otherwise>
			    					</c:choose>
			    				</td>	    				
							</tr>
						</c:forEach>
	       			</c:when>
	       			<c:otherwise>
	       				<tr>
	       					<td colspan="8">
	       						<center>포인트 신청 내역이 없습니다.</center>
	       					</td>
	       				</tr>
	       			</c:otherwise>
       			</c:choose>				
			</tbody> 
			</form>
			</table>
			<c:if test="${fn:length(list) > 0}">
            	<c:out value="${page}" escapeXml="false" />
            </c:if>
            	<div style="float: right;">
            		<br/>
		            <input type="button" id="confirmBtn" name="confirmBtn" value="승인">
<!-- 		            <input type="button" id="cancelBtn" name="cancelBtn" value="취소"> -->
		            <br/>
	            </div>
			</div>
			</form>			
		</div>		
		</article>				
	</section>
</body>
</html>