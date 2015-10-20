<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function() {
	
	$('#chkId').click(function(){
		
		var formData = $("#memberJoinForm").serialize();
		
		$.ajax({
	        url : "/member/chkValId.do",
	        type: "post",
	        data : formData,
	        success : function(responseData){
	            alert(responseData);	          
	        }
	    });
		
	});
	
});
</script>
</head>
<body>
<form id="memberJoinForm" name="memberJoinForm" method="post">
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
                                <td class="bb_line1"><input type="text" class="input_type1" id="memId" name="memId"><button class="btn_type1" type="button" id="chkId">중복확인</button></td>
                            </tr>
                            <tr>
                                <th class="bb_line1"><span class="essential">닉네임</span></td>
                                <td class="bb_line1"><input type="text" class="input_type1" id="nickName" name="nickName"></td>
                            </tr>
                            <tr>
                                <th class="bb_line1"><span class="essential">비밀번호</span></td>
                                <td class="bb_line1"><input type="text" class="input_type1" id="password" name="password"></td>
                            </tr>
                            <tr>
                                <th class="bb_line1"><span class="essential">비밀번호확인</span></td>
                                <td class="bb_line1"><input type="text" class="input_type1" id="password_re" name="password_re"></td>
                            </tr>
                            <tr>
                                <th class="bb_line1"><span class="essential">이메일</span></td>
                                <td class="bb_line1"><input type="text" class="input_type1 type2" id="email1" name="email1">@<input type="text" class="input_type1 type3" id="email2" name="email2"><button class="btn_type1">중복확인</button></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="bg_type2">
                                    <p class="table_texttype3">회원정보</p>
                                </td>
                            </tr>
                            <tr>
                                <th class="bg_type2">성함</th>
                                <td class="bg_type2"><input type="text" class="input_type1" id="name" name="name"></td>
                            </tr>
                            <tr>
                                <th class="bg_type2">생년월일</th>
                                <td class="bg_type2"><input type="text" class="input_type1 type4" id="bYear" name="bYear"> 년 <input type="text" class="input_type1 type5" id="bMonth" name="bMonth"> 월 <input type="text" class="input_type1 type5" id="bDay" name="bDay"> 일</td>
                            </tr>
                            <tr>
                                <th class="bg_type2">성별</th>
                                <td class="bg_type2"><input type="radio" id="male" name="gender" class="radio_gender"><label for="male" class="gender_label">남자</label><input type="radio" id="female" name="gender"  class="radio_gender"><label for="female">여자</label></td>
                            </tr>
                            <tr>
                                <th class="bg_type2"><span class="essential">휴대폰</span></th>
                                <td class="bg_type2">
                                    <select id="cellPhone1" name="cellPhone1">
                                        <option value="">010</option>
                                        <option value="">011</option>
                                        <option value="">016</option>
                                        <option value="">017</option>
                                        <option value="">018</option>
                                        <option value="">019</option>
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
                    <button class="btn_ok">확인</button>
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