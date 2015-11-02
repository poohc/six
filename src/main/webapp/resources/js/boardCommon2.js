$(document).ready(function(){
	 
	$("#updateBtn").click(function(){
    	$('#frm').attr('action',$('#updateAction').val());
        $('#frm').submit();
    });
    
    $('#searchBtn').click(function(){
		$('#frm').attr('action',$('#listPage').val());
		$('#frm').submit();
	});
    
    $('#replyBtn').click(function(){
    	if($('#replyText').val() == '' || $('#replyText').val().length == 0){
    		alert('댓글을 입력해주세요');
    		return false;
    	}    	
		$('#frm').attr('action',$('#replyAction').val());
		$('#frm').submit();
	});
    
});

$(document).on("click","#rReplyBtn",function(){
	if($('#repFrm').find('[name=replyText]').val() == '' || $('#repFrm').find('[name=replyText]').val().length == 0){
		alert('댓글을 입력해주세요');
		return false;
	}    	
	$('#repFrm').attr('action',$('#replyAction').val());
	$('#repFrm').submit();
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

function fileDownLoad(fileName){
	$('#frm').attr('action','/file/fileDownLoad.do');
	$('#fileName').val(fileName);
	$('#frm').submit();
}

function rReply(index,seq,indent){
	var replyTextArea = '';
	replyTextArea += '<form name="repFrm" id="repFrm" method="post" accept-charset="utf-8">';
	replyTextArea += '<input type="hidden" id="seq" name="seq" value="'+$('#seq').val()+'">';
	replyTextArea += '<input type="hidden" id="isReply" name="isReply" value="true">';
	replyTextArea += '<input type="hidden" id="rSeq" name="rSeq" value="'+seq+'">';
	replyTextArea += '<input type="hidden" id="indent" name="indent" value="'+indent+'">';	
	replyTextArea += '<li class="type3" id="replyLi_'+index+'">';
	replyTextArea += '<div class="table_comment type2">';
	replyTextArea += '<p class="comment_title1">댓글쓰기</p>';
	replyTextArea += '<textarea class="com_text" name="replyText" id="replyText" cols="30" rows="10" placeholder="댓글을 달아주세요.  최대 100자까지 작성할 수 있습니다. 악플은 제재 및 삭제될 수 있습니다. "></textarea>';
	replyTextArea += '<button class="com_btn" id="rReplyBtn">등록하기</button>';
	replyTextArea += '</div>';
	replyTextArea += '</li>';
	
	if(!$('#replyLi_'+index+'').length){
		$('#cancelLi').css('visibility','visible');
		$('#reply_' + index).append(replyTextArea);
	} 
}

function dReply(index){
	if($('#replyLi_'+index+'').length){
		$('#cancelLi').css('visibility','hidden');
		$('#replyLi_' + index).remove();
	}
	
}