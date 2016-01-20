<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="./common/common.jsp" />
<script type="text/javascript">
function fileDownLoad(fileName){
	$('#frm').attr('action','/file/fileDownLoad.do');
	$('#fileName').val(fileName);
	$('#frm').submit();
}
</script>
</head>

<body>
<div class="wrapper">
	<!-- header -->
	<jsp:include page="./common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<form method="post" id="frm" name="frm">
	<input type="hidden" id="fileName" name="fileName">
	</form>
	<div id="wrap_container">
        <div class="naviArea">
            <ul class="navi">
                <li class="home"><a href="/f1k/main.do"></a></li>
                <li><a href="/f1k/f1kNoticeList.do">공지사항</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>공지사항</h1>
            <div class="board_view"><!-- board_view -->
                <table>
                    <caption>${boardInfo.TITLE}</caption>
                    <colgroup>
                        <col style="width:%">
                        <col style="width:%">
                        <col style="width:35%;">
                        <col style="width:%">
                        <col style="width:%">
                        <col style="width:%">
                        <col style="width:%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" colspan="7">
                            <p class="t_title">${boardInfo.TITLE}</p>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">작성자</th>
                        <td>관리자</td>
                        <td class="cell_hid"></td>
                        <th scope="row">등록일</th>
                        <td>${boardInfo.CREATE_DATE}</td>
                        <td class="cell_hid">조회수</td>
                        <td class="cell_hid">${boardInfo.HIT_COUNT}</td>
                    </tr>
                    <tr>
                        <td colspan="7" class="text">
                           <c:out value="${boardInfo.CONTENTS}" escapeXml="false" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">첨부파일</th>
                        <td colspan="6" class="add_file">
                            <ul>
                            <c:forEach items="${fileList}" var="fileList">
                             	<li>
                             		<a href="#" onclick="fileDownLoad('${fileList.rFile}')">${fileList.file}</a>
                             	</li>
                            </c:forEach>
                            </ul>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_box">
                <div class="right_boxs">
                    <a href="sub5_list.html" class="btn_type1">목 록</a>
                </div>
            </div>            
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>