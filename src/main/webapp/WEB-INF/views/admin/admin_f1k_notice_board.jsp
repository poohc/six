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

function goWrite(){
	$('#frm').attr('action',$('#writePage').val());
	$('#frm').submit();
}

</script>
</head>
<body>
	<jsp:include page="../common/admin_menu.jsp" />
	<section id="main" class="column">
		<h4 class="alert_info">F1K 공지사항 리스트</h4>
		<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">F1K 공지사항 리스트</h3></header>
		<div class="tab_container">
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0"> 
			<thead> 
				<tr> 
   					<th>NO</th> 
    				<th>제목</th> 
    				<th>작성자</th>
    				<th>등록일</th>
    				<th>조회</th>
				</tr> 
			</thead> 
			<form method="post" id="frm" name="frm">
			<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
			<input type="hidden" id="seq" name="seq">
			<input type="hidden" id="lsitPage" name="lsitPage" value="${lsitPage}">
			<input type="hidden" id="viewPage" name="viewPage" value="${viewPage}">
			<input type="hidden" id="writePage" name="writePage" value="${writePage}">
       		<tbody> 
       			<c:choose>
	       			<c:when test="${fn:length(list) > 0}">
	       			<c:forEach items="${list}" var="f1kNoticeBoardList">
						<tr onclick="goView('${f1kNoticeBoardList.SEQ}')" style="cursor:pointer;"> 
		   					<td>${f1kNoticeBoardList.NO}</td> 
		    				<td>${f1kNoticeBoardList.TITLE}</td>
		    				<td>${f1kNoticeBoardList.CREATE_USER_ID}</td>
		    				<td>${f1kNoticeBoardList.CREATE_DATE}</td> 
		    				<td>${f1kNoticeBoardList.HIT_COUNT}</td>	    					    				
						</tr>
					</c:forEach>
	       			</c:when>
					<c:otherwise>
						<tr align="center">
							<td colspan="5">공지사항 없음</td>							
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody> 
			</table>
			<c:if test="${fn:length(list) > 0}">
            	<c:out value="${page}" escapeXml="false" />
            </c:if>
            <br/>
            <button type="button" onclick="goWrite()" style="float: right;">글쓰기</button>
			</div>
			</form>			
		</div>		
		</article>				
	</section>
</body>
</html>