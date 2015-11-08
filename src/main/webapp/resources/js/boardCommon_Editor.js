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
    })
	     
    $("#updateBtn").click(function(){
    	$('#frm').attr('action',$('#updateAction').val());
        $('#frm').submit();
    });
    
    $('#searchBtn').click(function(){
		$('#frm').attr('action',$('#listPage').val());
		$('#frm').submit();
	});
    
});

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

function goList(){
	$('#frm').attr('action',$('#listPage').val());
	$('#frm').submit();
}

function fileDownLoad(fileName){
	$('#frm').attr('action','/file/fileDownLoad.do');
	$('#fileName').val(fileName);
	$('#frm').submit();
}