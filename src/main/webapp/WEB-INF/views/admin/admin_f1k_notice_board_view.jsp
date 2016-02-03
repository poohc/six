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
    $("#listBtn").click(function(){
    	$('#frm').attr('action',$('#listPage').val());
    	$('#frm').submit();
    });
    
    $("#editBtn").click(function(){
    	$('#frm').attr('action',$('#updatePage').val());
    	$('#frm').submit();
    });    
    
    $("#deleteBtn").click(function(){
    	if(confirm('정말 삭제하시겠습니까?')){
    		$('#frm').attr('action',$('#deleteAction').val());
        	$('#frm').submit();	
    	}
    });    
    
});

function fileDownLoad(fileName){
	$('#frm').attr('action','/file/fileDownLoad.do');
	$('#fileName').val(fileName);
	$('#frm').submit();
}

</script>
</head>
<body>
	<jsp:include page="../common/admin_menu.jsp" />
	<section id="main" class="column">
		<h4 class="alert_info">F1K 공지사항</h4>
		<article class="module width_full">
			<header><h3>F1K 공지사항</h3></header>
			<form id="frm" name="frm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
				<input type="hidden" id="seq" name="seq" value="${boardInfo.SEQ}">
				<input type="hidden" id="listPage" name="listPage" value="${listPage}">
				<input type="hidden" id="updatePage" name="updatePage" value="${updatePage}">
				<input type="hidden" id="deleteAction" name="deleteAction" value="${deleteAction}">
				<input type="hidden" id="fileName" name="fileName">
			</form>				
				<table>
                    <tr>
                        <th>제목</th>
                        <td>${boardInfo.TITLE}</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><c:out value="${boardInfo.CONTENTS}" escapeXml="false" /></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${boardInfo.CREATE_USER_ID}</td>
                    </tr>
                    <tr>
                        <th>등록일</th>
                        <td>${boardInfo.CREATE_DATE}</td>
                    </tr>                    
                    <tr>
                        <th>첨부파일</th>
                        <td>
                        	<ul>
                        	<c:forEach items="${fileList}" var="fileList">
                        		<li>
                            		<a onclick="fileDownLoad('${fileList.rFile}')">${fileList.file}</a>
                            	</li>
                            </c:forEach>                   
                            </ul>
                        </td>
                    </tr>
                </table>			
				<footer>
					<div class="submit_link">
						<button type="button" id="editBtn">수정</button>
						<button type="button" id="deleteBtn">삭제</button>
						<button type="button" id="listBtn">목록</button>
					</div>
				</footer>
		</article><!-- end of post new article -->					
	</section>
</body>
</html>