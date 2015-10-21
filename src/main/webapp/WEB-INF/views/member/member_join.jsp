<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	
	var date = new Date();
	
	//생년월일 셀렉트 박스 설정
	var startYear = date.getFullYear() - 100;
	
	//초기 설정(년,월,일순)
	for(var i=startYear;i<=date.getFullYear();i++){
		$('<option value="'+ i +'">' + i + '</option>').appendTo('#bYear');
	}
	
	$('#bYear').val(date.getFullYear() - 35);
		
	for(var i=1;i<=12;i++){
		$('<option value="'+ i +'">' + i + '</option>').appendTo('#bMonth');
	}
	
	var lastDay = (new Date($('#bYear').val(),$('#bMonth').val(),0)).getDate();
	
	for(var i=1;i<=lastDay;i++){
		$('<option value="'+ i +'">' + i + '</option>').appendTo('#bDay');
	}	
	
	$('#chkId').click(function(){
		
		if($('#memId').val() != '' && $('#memId').val().length >0){
			
			var formData = $("#memberJoinForm").serialize();
			
			$.ajax({
		        url : "/member/chkValId.do",
		        type: "post",
		        data : formData,
		        success : function(responseData){
		        	if(responseData == 'T'){
		         		alert('사용 가능한 ID 입니다.');
		         		$('#resultChkId').val($('#memId').val());
		         		return;
		         	} else if(responseData == 'A'){
		         		alert('이미 존재하는 ID 입니다.');
		         		$('#memId').val('');
		         	} else {
		         		alert('잘못된 호출입니다. 다시 시도하여 주세요');
		         	}	          
		        }
		    });	
		} else {
			alert('ID 값을 입력해주세요');
			$('#memId').focus();
		}
		
	});
	
	$('#chkEmail').click(function(){
		
		if($('#email1').val() != '' && $('#email1').val().length >0 && $('#email2').val() != '' && $('#email2').val().length >0){
			
			var formData = $("#memberJoinForm").serialize();
			
			$.ajax({
		        url : "/member/chkValEmail.do",
		        type: "post",
		        data : formData,
		        success : function(responseData){
		        			        	
		         	if(responseData == 'T'){
		         		alert('사용 가능한 이메일 입니다.');
		         		$('#resultChkEmail').val($('#email1').val()+'@'+$('#email2').val());
		         		return;
		         	} else if(responseData == 'A'){
		         		alert('이미 존재하는 이메일 입니다.');
		         		$('#email1').val('');
		         		$('#email2').val('');
		         	} else {
		         		alert('잘못된 호출입니다. 다시 시도하여 주세요');
		         	}	          
		        }
		    });	
		} else {
			alert('이메일 값을 입력해주세요');
			$('#email1').focus();
		}
		
	});
	
	$('#memId').on("keyup", function() {
		$('#memId').val($('#memId').val().replace(/[^a-zA-Z0-9]/g,''));
		if($('#memId').val().length>30){
			$('#memId').val($('#memId').val().substring(0,30));
		}
	});
	
	$('#memId').on("change", function() {
		$('#resultChkId').val('');
	});
	
	$('#nickName').on("keyup", function() {
		if(calcMsglength($('#nickName').val())>60){
			alert('닉네임은 60Byte를 넘을 수 없습니다. 다시 입력해 주세요.');
			$('#nickName').val('');
		}
	});
	
	$('#email1').on("keyup", function() {
		$('#email1').val($('#email1').val().replace(/[^a-zA-Z0-9]/g,''));		
	});
	
	$('#email2').on("keyup", function() {
		$('#email2').val($('#email2').val().replace(/[^a-zA-Z0-9.]/g,''));		
	});
	
	$('#cellPhone2').on("keyup", function() {
		$('#cellPhone2').val($('#cellPhone2').val().replace(/[^0-9]/g,''));
		if($('#cellPhone2').val().length>4){
			$('#cellPhone2').val($('#cellPhone2').val().substring(0,4));
		}
	});
	
	$('#cellPhone3').on("keyup", function() {
		$('#cellPhone3').val($('#cellPhone3').val().replace(/[^0-9]/g,''));
		if($('#cellPhone3').val().length>4){
			$('#cellPhone3').val($('#cellPhone3').val().substring(0,4));
		}
	});
	
	$('#bYear').on("change", function() {
		setDay();
	});
	
	$('#bMonth').on("change", function() {
		setDay();
	});
	
// 	$('#bYear').on("keyup", function() {
//    		$('#bYear').val($('#bYear').val().replace(/[^0-9]/g,''));
//    		if($('#bYear').val().length>4){
// 			$('#bYear').val($('#bYear').val().substring(0,4));
// 		}
//    		if($('#bYear').val()>date.getFullYear()){
//    			alert('잘못된 형식입니다.');
//    			$('#bYear').val('');   			
//    		}
// 	});
	
// 	$('#bMonth').on("keyup", function() {
// 		$('#bMonth').val($('#bMonth').val().replace(/[^0-9]/g,''));
// 		if($('#bMonth').val().length>2){
// 			$('#bMonth').val($('#bMonth').val().substring(0,2));
// 		}						
// 	});
	
// 	$('#bMonth').on("focusout", function() {
// 		if($('#bMonth').val().length!=2){
// 			alert('잘못된 형식입니다.두자리로 입력해 주세요');
// 			$('#bMonth').val('');   			
// 		}
// 		if($('#bMonth').val() > 12){
// 			alert('12월을 넘을 수 없습니다.');
// 			$('#bMonth').val('');
// 		}
// 	});
	
// 	$('#bDay').on("keyup", function() {
// 		$('#bDay').val($('#bDay').val().replace(/[^0-9]/g,''));
// 		if($('#bDay').val().length>2){
// 			$('#bDay').val($('#bDay').val().substring(0,2));
// 		}		
// 	});	
	
// 	$('#bDay').on("focusout", function() {
// 		if($('#bDay').val().length!=2){
// 			alert('잘못된 형식입니다.두자리로 입력해 주세요');
// 			$('#bDay').val('');   			
// 		}
// 		if($('#bDay').val() > 31){
// 			alert('31일을 넘을 수 없습니다.');
// 			$('#bDay').val('');
// 		}
// 	});	
	
	$('#email1').on("change", function() {
		$('#resultChkEmail').val('');
	});
	
	$('#email2').on("change", function() {
		$('#resultChkEmail').val('');
	});
	
	$('#memberJoinForm').submit(function() {
		
		if($('#memId') == '' || $('#memId').val().length == 0){
    		alert('ID를 입력해주세요');
    		$('#memId').focus();
    		return false;
    	} 	  
    	if($('#nickName') == '' || $('#nickName').val().length == 0){
    		alert('닉네임을 입력해주세요');
    		$('#nickName').focus();
    		return false;
    	}
    	if($('#password') == '' || $('#password').val().length == 0){
    		alert('비밀번호를 입력해주세요');
    		$('#password').focus();
    		return false;
    	}
    	if($('#passwordRe') == '' || $('#passwordRe').val().length == 0){
    		alert('비밀번호 확인을 입력해주세요');
    		$('#passwordRe').focus();
    		return false;
    	}
    	if($('#password').val() != $('#passwordRe').val()){
    		alert('비밀번호, 비밀번호 확인 부분이 일치하지 않습니다. 다시 입력해 주세요');
    		return false;
    	}
    	if($('#email1') == '' || $('#email1').val().length == 0){
    		alert('이메일을 입력해주세요');
    		$('#email1').focus();
    		return false;
    	}
    	if($('#email2') == '' || $('#email2').val().length == 0){
    		alert('이메일을 입력해주세요');
    		$('#email2').focus();
    		return false;
    	}
    	if($('#name') == '' || $('#name').val().length == 0){
    		alert('이름을 입력해주세요');
    		$('#name').focus();
    		return false;
    	}
    	if($('#bYear') == '' || $('#bYear').val().length == 0){
    		alert('생년월일을 입력해주세요(년도)');
    		$('#bYear').focus();
    		return false;
    	}
    	if($('#bMonth') == '' || $('#bMonth').val().length == 0){
    		alert('생년월일을 입력해주세요(월)');
    		$('#bMonth').focus();
    		return false;
    	}
    	if($('#bDay') == '' || $('#bDay').val().length == 0){
    		alert('생년월일을 입력해주세요(일)');
    		$('#bDay').focus();
    		return false;
    	}
    	if($(':input[name=gender]:radio:checked').val() == undefined){
    		alert('성별을 입력해주세요');
    		return false;
    	}
    	if($('#cellPhone2') == '' || $('#cellPhone2').val().length == 0){
    		alert('휴대폰 번호를 입력해주세요');
    		$('#cellPhone2').focus();
    		return false;
    	}
    	if($('#cellPhone3') == '' || $('#cellPhone3').val().length == 0){
    		alert('휴대폰 번호를 입력해주세요');
    		$('#cellPhone3').focus();
    		return false;
    	}
    	if($('#resultChkId').val() == ''){
    		alert('아이디 중복확인 버튼을 눌러주세요');
    		return false;
    	}
    	if($('#resultChkEmail').val() == ''){
    		alert('이메일 중복확인 버튼을 눌러주세요');
    		return false;
    	}
    	
    	$('#memberJoinForm').attr('action','/member/memberComplete.do');
    	$('#memberJoinForm').submit();
	});
	
});

function setDay(){
	var lastDay = (new Date($('#bYear').val(),$('#bMonth').val(),0)).getDate();
	
	$('#bDay option').remove();
	
	for(var i=1;i<=lastDay;i++){
		$('<option value="'+ i +'">' + i + '</option>').appendTo('#bDay');
	}
}

function calcMsglength(msg)
{
	var nbytes = 0;
	for (i=0; i<msg.length; i++) {
		var ch = msg.charAt(i);
		if(escape(ch).length > 4) {
			nbytes += 2;
		} else if (ch == '\n') {
			if (msg.charAt(i-1) != '\r') {
			nbytes += 1;
			}
		} else if (ch == '<' || ch == '>') {
			nbytes += 4;
		} else {
			nbytes += 1;
		}
	}
	return nbytes;
}

</script>
</head>
<body>
<form id="memberJoinForm" name="memberJoinForm" method="post">
<input type="hidden" id="resultChkId" name="resultChkId">
<input type="hidden" id="resultChkEmail" name="resultChkEmail">
<div class="wrapper main">
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
        <div class="container">
            <div class="combine type2">
                <p class="title_type2">회원가입 02</p>
                <p class="useterm_title">회원정보입력</p>
                <div class="table_type1_write type2 type3">
                    <table>
                        <caption>회원정보 입력</caption>
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:85%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="bb_line1"><span class="essential">아이디</span></td>
                                <td class="bb_line1">
                                	<input type="text" class="input_type1" id="memId" name="memId" style="ime-mode:disabled;">
                                	<button class="btn_type1" type="button" id="chkId">중복확인</button>
                                </td>
                            </tr>
                            <tr>
                                <th class="bb_line1"><span class="essential">닉네임</span></td>
                                <td class="bb_line1"><input type="text" class="input_type1" id="nickName" name="nickName"></td>
                            </tr>
                            <tr>
                                <th class="bb_line1"><span class="essential">비밀번호</span></td>
                                <td class="bb_line1"><input type="password" class="input_type1" id="password" name="password"></td>
                            </tr>
                            <tr>
                                <th class="bb_line1"><span class="essential">비밀번호확인</span></td>
                                <td class="bb_line1"><input type="password" class="input_type1" id="passwordRe" name="passwordRe"></td>
                            </tr>
                            <tr>
                                <th class="bb_line1"><span class="essential">이메일</span></td>
                                <td class="bb_line1">
	                                <input type="text" class="input_type1 type2" id="email1" name="email1">@<input type="text" class="input_type1 type3" id="email2" name="email2">
	                                <button class="btn_type1" type="button" id="chkEmail" name="chkEmail">중복확인</button>
	                            </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="bg_type2">
                                    <p class="table_texttype3">회원정보</p>
                                </td>
                            </tr>
                            <tr>
                                <th class="bg_type2">성명</th>
                                <td class="bg_type2"><input type="text" class="input_type1" id="name" name="name"></td>
                            </tr>
                            <tr>
                                <th class="bg_type2">생년월일</th>
                                <td class="bg_type2">
                                	<select id="bYear" name="bYear"></select> 년
                                	<select id="bMonth" name="bMonth"></select> 월
                                	<select id="bDay" name="bDay"></select> 일
<!--                                 	<input type="text" class="input_type1 type4" id="bYear" name="bYear"> 년 -->
<!--                                 	<input type="text" class="input_type1 type5" id="bMonth" name="bMonth"> 월  -->
<!--                                 	<input type="text" class="input_type1 type5" id="bDay" name="bDay"> 일 -->
                                </td>
                            </tr>
                            <tr>
                                <th class="bg_type2">성별</th>
                                <td class="bg_type2">
                                	<input type="radio" id="male" name="gender" class="radio_gender" value="M">
                                	<label for="male" class="gender_label">남자</label>
                                	<input type="radio" id="female" name="gender"  class="radio_gender" value="F">
                                	<label for="female">여자</label>
                                </td>
                            </tr>
                            <tr>
                                <th class="bg_type2"><span class="essential">휴대폰</span></th>
                                <td class="bg_type2">
                                    <select id="cellPhone1" name="cellPhone1">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="019">019</option>
                                    </select>
                                     -
                                    <input type="text" class="input_type1 type4" id="cellPhone2" name="cellPhone2"> - <input type="text" class="input_type1 type4" id="cellPhone3" name="cellPhone3">
                                </td>
                            </tr>
                            <tr>
                                <th class="bg_type2"></th>
                                <td class="bg_type2">등록된 휴대폰 번호는 아이디/비밀번호 찾기를 위하여 저장되며 SMS 수신동의 입력시 각종 주식정보에 대 하여 문자를 보내드립니다. </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="center_btn">
                    <button class="btn_cancel">취소</button>
                    <button class="btn_ok" type="submit">확인</button>
                </div>
            </div>
            <!-- Left Side -->
            <jsp:include page="../common/left.jsp" />
            <!-- Left Side end -->
            
            <!-- Left Side -->
            <jsp:include page="../common/right.jsp" />
            <!-- Left Side end -->  
        </div>
	</div>
	<!-- //container -->
	<jsp:include page="../common/footer.jsp" />
</div>
</form>
</body>
</html>