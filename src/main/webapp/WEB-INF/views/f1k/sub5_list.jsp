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

$(document).ready(function(){
	$('#searchBtn').click(function(){
		if($('#searchText').val().length == 0){
			alert('검색어를 입력해 주세요');
			$('#searchText').focus();
			return;
		}
		$('#frm').attr('action',$('#listPage').val());
		$('#frm').submit();
	});
});

function goView(seq){
	$('#seq').val(seq);
	$('#frm').attr('action',$('#viewPage').val());
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
	<div id="wrap_container">
        <div class="naviArea">
            <ul class="navi">
                <li class="home"><a href="index.html"></a></li>
                <li><a href="sub5_list.html">공지사항</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>공지사항</h1>
            <div class="selectbox_area">
                <form method="post" id="frm" name="frm">
                	<input type="hidden" id="listPage" name="listPage" value="${listPage}">
                	<input type="hidden" id="viewPage" name="viewPage" value="${viewPage}">
                    <input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
               		<input type="hidden" id="seq" name="seq">
                    <div class="left_area">
                        <p class="total_page">Total <span>${fn:length(list)}</span> 건</p>
                    </div>
                    <div class="right_area">
                        <span class="selectbox">
                            <select id="searchOption" name="searchOption" title="제목/내용">
                                <option value="title" selected="selected">제목</option>
                                <option value="contents">내용</option>
                            </select>
                        </span>
                        <input type="text" id="searchText" name="searchText" title="제목/내용">
                        <button type="button" class="btn_search" title="검색" id="searchBtn">검색</button>
                    </div>
                </form>
            </div>
            <div class="board_list"><!-- board_list -->
                <table>
                    <caption>고객소리함</caption>
                    <colgroup>
                        <col style="width:11%">
                        <col style="width:auto%">
                        <col style="width:11%">
                        <col style="width:11%">
                        <col style="width:11%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="cell_hid" scope="col">NO</th>
                            <th scope="col">제목</th>
                            <th class="cell_hid" scope="col">작성자</th>
                            <th scope="col">등록일</th>
                            <th class="cell_hid" scope="col">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    	<c:when test="${fn:length(list) > 0}">
                    	<c:forEach items="${list}" var="list">
                    		<tr class="new">
                            <th class="cell_hid" scope="row">${list.NO}</th>
                            <td class="left">
                            	<a href="javascript:goView('${list.SEQ}')">${list.TITLE}</a>
                            </td>
                            <td class="cell_hid">관리자</td>
                            <td>${list.CREATE_DATE}</td>
                            <td class="cell_hid">${list.HIT_COUNT}</td>
                        	</tr>
						</c:forEach>                        	
                    	</c:when>
                    	<c:otherwise>
                    		<tr>
	                    		<td colspan="5">
	                    			공지사항이 없습니다.
	                    		</td>
                    		</tr>
                    	</c:otherwise>
                    	</c:choose>                                                
                    </tbody>
                </table>
            </div>
            <c:if test="${fn:length(list) > 0}">
            	<c:out value="${page}" escapeXml="false" />
            </c:if>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>