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
	function goHome(){
		location.href = '/admin/adminMain.do';		
	}	
</script>
</head>
<body>
	<h1>에러가 발생했습니다. 다시 시도하거나 관리자에게 문의해 주세요.</h1>
	<a href="javascript:goHome()">홈으로 가기</a>
</body>
</html>
