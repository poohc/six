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
		
		$('#frm').attr('action',$('#page').val());
		$('#frm').submit();
		
	});
</script>
</head>
<body>
<form method="post" id="frm" name="frm">
	<input type="hidden" id="seq" name="seq" value="${seq}">
	<input type="hidden" id="page" name="page" value="${page}">
</form>
</body>
</html>
