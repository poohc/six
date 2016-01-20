<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../common/admin_common.jsp" />
<head>
<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	
	var editor_object = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html", 
        htParams : {
        	// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
            fOnBeforeUnload : function(){},
        },	    
	    //boolean
	    fOnAppLoad : function(){
	    	
	    	if('<c:out value="${isUpdate}" />' == 'true'){
	    		var contents = '<c:out value="${boardInfo.CONTENTS}" escapeXml="false" />';
	    		editor_object.getById["smarteditor"].exec("PASTE_HTML", [contents]); //로딩이 끝나면 contents를 txtContent에 넣습니다.
	    	}
	    }    
    });
            	
	//전송버튼 클릭이벤트
    $("#saveBtn").click(function(){
    	
    	if($('#title').val() == ''){
    		alert('제목을 입력해 주세요');
    		return false;
    	}
    	if($('#title').val() == '' && $('#title').val().length < 3){
    		alert('제목을 3글자 이상 입력해주세요');
    		return false;
    	}
    	
    	if($('#smarteditor').val() == ''){
    		alert('내용을 입력해주세요');
    		return false;
    	}
    	
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $('#frm').attr('action',$('#insertAction').val());
        $("#frm").submit();
    });
	     
    $("#updateBtn").click(function(){
    	editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
    	$('#frm').attr('action',$('#updateAction').val());
    	$('#frm').submit();        
    });
    
    $('#searchBtn').click(function(){
		$('#frm').attr('action',$('#listPage').val());
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
		<h4 class="alert_info">F1K 공지사항</h4>
		<article class="module width_full">
			<header><h3>F1K 공지사항</h3></header>
			<form name="frm" id="frm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
            <input type="hidden" id="insertAction" name="insertAction" value="${insertAction}">
            <input type="hidden" id="updateAction" name="updateAction" value="${updateAction}">
            <input type="hidden" id="listPage" name="listPage" value="${listPage}">
            <input type="hidden" id="seq" name="seq" value="${boardInfo.SEQ}">
            <div class="table_type1_write">
                <table>
                    <caption>SIX 주식배움터</caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:90%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="bb_line1">제목</td>
                            <td class="bb_line1"><input type="text" id="title" name="title" value="${boardInfo.TITLE}"></td>
                        </tr>
                        <tr>
                        	<c:choose>
                        	<c:when test="${isUpdate eq 'true'}">
                        		<td>
                        			<c:forEach items="${fileList}" var="fileList">
                        				${fileList.file}
                        			</c:forEach>
                        		</td>
                        		<td>
                         		파일 업로드 <input id="file" name="file" type="file" multiple>
                         	</td>
                        	</c:when>
                        	<c:otherwise>
                         	<td colspan="2">
                         		파일 업로드 <input id="file" name="file" type="file" multiple>
                         	</td>
                        	</c:otherwise>
                        	</c:choose>                                	
                        </tr>
                        <tr class="">
                            <th>내용</td>
                            <td>
                            	<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:85%; height:312px;">
                            	</textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
            <div class="table_bottom">
                <a href="javascript:goList()" class="go_list">목록으로</a>
                <security:authorize ifAnyGranted="ROLE_ADMIN">
                <ul class="table_option">
                    <li><a href="#" onclick="history.back()">취소</a></li>
                    <c:choose>
                    <c:when test="${isUpdate eq 'true'}">
                    	<li><a href="#" id="updateBtn">수정</a></li>
                    </c:when>
                    <c:otherwise>
                    	<li><a href="#" id="saveBtn">글쓰기</a></li>
                    </c:otherwise>
                    </c:choose>
                </ul>
                </security:authorize>
            </div>
		</article><!-- end of post new article -->					
	</section>
</body>
</html>