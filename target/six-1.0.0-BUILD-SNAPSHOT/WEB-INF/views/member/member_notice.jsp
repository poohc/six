<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">

	$(document).ready(function() {
		$('.btn_ok').click(function(){
			
			if($(':input[name=first_term]:radio:checked').val() != 'y'){
				alert('이용약관에 동의해 주세요');
				$('#term_agree').focus();
				return;
			}
			
			if($(':input[name=second_term]:radio:checked').val() != 'y'){
				alert('개인정보 수집 및 이용안내에 동의해 주세요');
				$('#term_agree3').focus();
				return;
			}
			
			$('#memberNoticeForm').attr('action','/member/memberJoin.do');
			$('#memberNoticeForm').submit();
			
		});
		
		$('.btn_cancel').click(function(){
			history.back();
		});
	});
		
</script>
</head>
<body>
<form id="memberNoticeForm" name="memberNoticeForm" method="post">
<div class="wrapper main">
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
        <div class="container">
            <div class="combine">
                <p class="title_type2">회원가입 01</p>
                <p class="useterm_title">이용약관</p>
                <div class="term_box">
                    <span>제 1장 총칙</span><br>
                    이용악관, 개인정보 수집 및 이용 개인정보 제 3자 제공에 모두 동의합니다.
                    사이트에서 제공하는 증권정보는 투자판단의 참고자료로, 투자의 최종 책임은 본 정보를 이용하시는 이용자에게 있습니다. <br><br>

                    <span>제 1조 (목적)</span><br>
                    이 약관은 주식정보거래소(이하 총칭하여 ‘회사’라 칭함)가 제공하는 웹사이트 증권서비스(이하 ‘서비스’라 칭함)의 이용조건 및 절차,
                    기타 필요사항을 규정함을 목적으로 합니다.<br><br>

                    <span>제 2조 (약관의 효력 및 변경)</span><br>
                    (1) 이 약관은 그 내용을 회사의 웹사이트에 게시하거나 기타의 방법으로 회원에게 공지하고,
                    이에 동의한 회원이 서비스에 가입함으로써 효력이 발생합니다.

                    <span>제 3조 (약관의 효력 및 변경)</span><br>
                    (1) 이 약관은 그 내용을 회사의 웹사이트에 게시하거나 기타의 방법으로 회원에게 공지하고,
                    이에 동의한 회원이 서비스에 가입함으로써 효력이 발생합니다.
                </div>
                <div class="check_radio">
                    <input type="radio" name="first_term" id="term_agree" value="y">
                    <label for="term_agree">동의합니다.</label>
                    <input type="radio" name="first_term" id="term_agree2" value="n">
                    <label for="term_agree2">동의하지 않습니다.</label>
                </div>
                <p class="useterm_title">개인정보 수집 및 이용안내</p>
                <div class="term_box">
                    <span>1. 수집하는 개인정보 항목</span><br>
                    회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br>
                    - 수집항목 : 이름, 로그인ID, 비밀번호, 휴대전화번호, 이메일, 서비스 이용기록, 접속로그, 쿠키, 접속 IP 정보, 결제기록 <br>
                    - 개인정보 수집방법 : 홈페이지(회원가입)    <br>    <br>

                    <span>2. 개인정보의 수집 및 이용목적</span><br>
                    회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br>
                    - 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 구매 및 요금 결제<br><br>
                </div>
                <div class="check_radio">
                    <input type="radio" name="second_term" id="term_agree3" value="y">
                    <label for="term_agree3">동의합니다.</label>
                    <input type="radio" name="second_term" id="term_agree4" value="n">
                    <label for="term_agree4">동의하지 않습니다.</label>
                </div>
                <div class="center_btn">
                    <button class="btn_cancel" type="button">취소</button>
                    <button class="btn_ok" type="button">확인</button>
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