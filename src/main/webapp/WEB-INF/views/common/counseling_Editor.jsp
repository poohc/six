<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
        } 
    });
 	
	$("#saveBtn").click(function(){
		
		if($('input:radio[name="first_term"]:checked').val() != 'Y'){
			alert('약관에 동의해 주세요');
			return false;
		}
		
		if($(':radio[name="qna1"]:checked').length < 1){
			alert('첫번째 질문에 답해주세요');
			return false;
		}
		
		if($(':radio[name="qna2"]:checked').length < 1){
			alert('두번째 질문에 답해주세요');
			return false;
		}
		
		if($(':radio[name="qna3"]:checked').length < 1){
			alert('세번째 질문에 답해주세요');
			return false;
		}
		
	    //id가 smarteditor인 textarea에 에디터에서 대입
	    editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	    // 이부분에 에디터 validation 검증
	    
	    if($('#smarteditor').val() == ''){
			alert('상담 신청 내용을 입력해주세요');
			return false;
		}
	    
	    //폼 submit
	    $('#frm').attr('action',$('#insertAction').val());
	    $("#frm").submit();
	});
	
});

</script>
</head>
</html>