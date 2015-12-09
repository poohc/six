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
		location.href = '/main/main.do';		
	}	
</script>
</head>
<body>
	<h3>해당 페이지에 접근 권한이 없습니다. 관리자에게 문의해 주세요.</h3>
	<a href="javascript:goHome()">홈으로 가기</a>
</body>
</html>
