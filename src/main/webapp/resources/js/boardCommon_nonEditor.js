$(document).ready(function(){
	
    $('#searchBtn').click(function(){
		$('#frm').attr('action',$('#listPage').val());
		$('#frm').submit();
	});
    
    $('#replyBtn').click(function(){
    	if($('#replyText').val() == '' || $('#replyText').val().length == 0){
    		alert('댓글을 입력해주세요');
    		return false;
    	}    	
		$('#frm').attr('action',$('#replyAddAction').val());
		$('#frm').submit();
	});
    
});

$(document).on("click","#rReplyBtn",function(){
	if($('#repFrm').find('[name=replyText]').val() == '' || $('#repFrm').find('[name=replyText]').val().length == 0){
		alert('댓글을 입력해주세요');
		return false;
	}    	
	$('#repFrm').attr('action',$('#replyAddAction').val());
	$('#repFrm').submit();
});

$(document).on("click","#rUpdateBtn",function(){
	if($('#repFrm').find('[name=replyText]').val() == '' || $('#repFrm').find('[name=replyText]').val().length == 0){
		alert('댓글을 입력해주세요');
		return false;
	}    	
	$('#repFrm').attr('action',$('#replyUpdAction').val());
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

function rReply(index,seq,indent,step){
	var replyTextArea = '';
	replyTextArea += '<form name="repFrm" id="repFrm" method="post" accept-charset="utf-8">';
	replyTextArea += '<input type="hidden" id="seq" name="seq" value="'+$('#seq').val()+'">';
	replyTextArea += '<input type="hidden" id="isReply" name="isReply" value="true">';
	replyTextArea += '<input type="hidden" id="rSeq" name="rSeq" value="'+seq+'">';
	replyTextArea += '<input type="hidden" id="indent" name="indent" value="'+indent+'">';
	replyTextArea += '<input type="hidden" id="step" name="step" value="'+step+'">';
	replyTextArea += '<li class="type3" id="replyLi_'+index+'">';
	replyTextArea += '<div class="table_comment type2">';
	replyTextArea += '<p class="comment_title1">댓글쓰기</p>';
	replyTextArea += '<textarea class="com_text" name="replyText" id="replyText" cols="30" rows="10" placeholder="댓글을 달아주세요.  최대 100자까지 작성할 수 있습니다. 악플은 제재 및 삭제될 수 있습니다. "></textarea>';
	replyTextArea += '<button class="com_btn" id="rReplyBtn">등록하기</button>';
	replyTextArea += '</div>';
	replyTextArea += '</li>';
	replyTextArea += '</form>';
	
	if(!$('#replyLi_'+index+'').length){
		$('#cancelLi_'+index+'').css('visibility','visible');
		$('#reply_' + index).append(replyTextArea);
	} 
}

function cReply(index,contents){
	if($('#replyLi_'+index+'').length){
		$('#cancelLi_'+index+'').css('visibility','hidden');
		$('#replyLi_' + index).remove();
		$('#contents_' + index).append(contents);
	}
	
}

function rUpdate(index,seq,contents){
	
	var replyTextArea = '';
	replyTextArea += '<form name="repFrm" id="repFrm" method="post" accept-charset="utf-8">';
	replyTextArea += '<input type="hidden" id="seq" name="seq" value="'+$('#seq').val()+'">';
	replyTextArea += '<input type="hidden" id="rSeq" name="rSeq" value="'+seq+'">';
	replyTextArea += '<li class="type3" id="replyLi_'+index+'">';
	replyTextArea += '<div class="table_comment type2">';
	replyTextArea += '<p class="comment_title1">댓글수정</p>';
	replyTextArea += '<textarea class="com_text" name="replyText" id="replyText" cols="30" rows="10">'+contents+'</textarea>';
	replyTextArea += '<button class="com_btn" id="rUpdateBtn">수정하기</button>';
	replyTextArea += '</div>';
	replyTextArea += '</li>';
	replyTextArea += '</form>';
	
	if(!$('#replyLi_'+index+'').length){
		$('#contents_' + index).text('');
		$('#updateLi_'+index+'').css('visibility','hidden');
		$('#contents_' + index).append(replyTextArea);
	}
	
}

function rDelete(seq,step){
	
	if(confirm('정말 댓글을 삭제하시겠습니까?(관련 댓글이 모두 삭제됩니다.)')){		
		$('#rSeq').val(seq);
		$('#step').val(step);
		$('#frm').attr('action',$('#replyDelAction').val());
		$('#frm').submit();
	} else {
		return false;
	}	
	
}

function goList(){
	$('#frm').attr('action',$('#listPage').val());
	$('#frm').submit();
}

function goWrite(){
	$('#frm').attr('action',$('#writePage').val());
	$('#frm').submit();
}

function updateBoard(){
	$('#frm').attr('action',$('#updateAction').val());
    $('#frm').submit();
}

function deleteBoard(){
	if(confirm('정말 글을 삭제하시겠습니까?(관련 댓글이 모두 삭제됩니다.)')){
		$('#frm').attr('action',$('#deleteAction').val());
		$('#frm').submit();
	} else {
		return false;
	}
}
