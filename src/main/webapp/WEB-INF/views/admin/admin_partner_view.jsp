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
    $("#confirmBtn").click(function(){
    	$('#frm').attr('action',$('#confirmPage').val());
    	$('#frm').submit();
    });
    
	$("#updateBtn").click(function(){
		$('#frm').attr('action',$('#updatePage').val());
    	$('#frm').submit();
    });
    
	$("#listBtn").click(function(){
    	$('#frm').attr('action',$('#listPage').val());
    	$('#frm').submit();
    });
});

</script>
</head>
<body>
	<jsp:include page="../common/admin_menu.jsp" />
	<section id="main" class="column">
		<h4 class="alert_info">파트너 정보</h4>
		<article class="module width_full">
			<header><h3>파트너 정보</h3></header>
			<form id="frm" name="frm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
				<input type="hidden" id="seq" name="seq" value="${partnerInfo.SEQ}">
				<input type="hidden" id="isConfirm" name="isConfirm" value="${partnerInfo.IS_CONFIRM}">
				<input type="hidden" id="lsitPage" name="lsitPage" value="${lsitPage}">
				<input type="hidden" id="updatePage" name="updatePage" value="${updatePage}">
				<input type="hidden" id="confirmPage" name="confirmPage" value="${confirmPage}">
				<div class="module_content">
					<table>
						<caption>파트너정보</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
						</colgroup>
						<tbody>
                            <tr>
								<th class="bb_line1">회원이름</th>
								<td>${partnerInfo.NAME}</td>
							</tr>
							<tr>
								<th class="bb_line1">회원아이디</td>
								<td>${partnerInfo.ID}</td>
							</tr>
							<tr>
								<th class="bb_line1">신청구분</th>
								<td>
									<select name="requestCd" id="requestCd">
										<c:forEach items="${requestList}" var="requestList">
											<c:choose>
												<c:when test="${requestList.CD eq partnerInfo.REQUEST_CD}">
													<option value="${requestList.CD}" selected="selected">${requestList.CD_NAME}</option>
												</c:when>
												<c:otherwise>
													<option value="${requestList.CD}">${requestList.CD_NAME}</option>
												</c:otherwise>
											</c:choose>                            					
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th class="bb_line1">사진</td>
								<td class="bb_line1">
									<input type="file" id="file" name="file" style="width: 100%"><br/>
									<c:out value="${partnerInfo.IMAGE}" escapeXml="false" />
								</td>
							</tr>
							<tr>
								<th>소속</th>
								<td>
									<input type="text" id="post" name="post" value="${partnerInfo.POST}">
								</td>
							</tr>
							<tr class="">
								<th>소개글</td>
								<td>
									<textarea name="introduce" id="introduce" cols="30" rows="3" class="contents_write2" >
										${partnerInfo.INTRODUCE}
									</textarea>
								</td>
							</tr>
							<tr>
								<th>슬로건</th>
								<td>
									<input type="text" id="slogan" name="slogan" value="${partnerInfo.SLOGAN}">
								</td>
							</tr>
							<tr>
								<th>정산은행</th>
								<td>
									<select name="bankCd" id="bankCd">
										<c:forEach items="${bankList}" var="bankList">
											<c:choose>
												<c:when test="${bankList.CD eq partnerInfo.BANK_CD}">
													<option value="${bankList.CD}" selected="selected">${bankList.CD_NAME}</option>
												</c:when>
												<c:otherwise>
													<option value="${bankList.CD}">${bankList.CD_NAME}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td>
									<input type="text" id="accountNo" name="accountNo" value="${partnerInfo.ACCOUNT_NO}">
								</td>
							</tr>
							<tr>
								<th>예금주</th>
								<td>
									<input type="text" id="accountName" name="accountName" value="${partnerInfo.ACCOUNT_NO}">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</form>
				<footer>
					<div class="submit_link">
						<c:choose>
							<c:when test="${partnerInfo.IS_CONFIRM eq 'N'}">
								<button type="button" id="confirmBtn">승인</button>
							</c:when>
							<c:otherwise>
								<button type="button" id="confirmBtn">승인취소</button>
							</c:otherwise>
						</c:choose>
						<button type="button" id="updateBtn">수정</button>
						<button type="button" id="listBtn">리스트</button>
					</div>
				</footer>
		</article><!-- end of post new article -->					
	</section>
</body>
</html>