<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript" src="/resources/js/boardCommon_nonEditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#intro5').addClass("on");	
});
</script>
</head>

<body>
<div class="wrapper main">
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
        <div class="container">
            <div class="wrap_left">
                <jsp:include page="../common/login_common.jsp" />
                <jsp:include page="../common/intro_menu.jsp" />
                <div class="youtube_channel">
                    <a class="youtube_title">채널<span>+ 더보기</span></a>
                    <div class="youtube_box">
                        <ul class="youtube_list">
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a href="#"><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrap_right">
                <img src="/resources/img/introduce1.jpg" alt="" class="top_mainimg">
                <div class="right_contents">
                    <p class="title_type1">무료상담신청</p>
                    <p class="text_type3"><span>SIX</span>의 주식전문가의 상담을 무료로 받아보세요. 아래 항목을 입력하세요.</p>
                    <div class="advice_box">
                        (주)청개구리투자클럽, (주)청개구리인베스트먼트의 인터넷 서비스(이하 ^서비스^라 합니다)를 이용함에 있어 회원님이 청개구리투자 클럽에 제공하신 개인정보가 엄격하게 보호받을 수 있도록 최선을 다하고 있으며 이를 위한 시책으로 개인정보 정책을 제정하여 시행하고 있습니다. 또한 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신 서비스 제공자가 준수하여야 할 관련 법규상의 개인정보보호규정 및 정보통신부가 제정한 개인정보보호지침을 준수하고 있습니다. 청개구리투자클럽, 청개구리인베스트먼트 개인정보보호정책은 정부의 법률 및지침의 변경과 청개구리투자클럽, 청개구리인베스트먼트의 정책 변화에 따라 변경될 수 있습니다. 회원님께서는 청개구리투자클럽, 청개구리인베스트먼트 사이트 방문 시에 수시로 확인하시기 바랍니다. 청개구리투자클럽, 청개구리인베스트먼트의 개인정보 보호정책은 다음과 같은 내용을 담고 있습니다. <br><br>

                        (주)청개구리투자클럽, (주)청개구리인베스트먼트의 인터넷 서비스(이하 ^서비스^라 합니다)를 이용함에 있어 회원님이 개구리투자 클럽에 제공하신 개인정보가 엄격하게 보호받을 수 있도록 최선을 다하고 있으며 이를 위한 시책으로 개인정보 정책을 제정하여 시행하고 있습니다. 또한 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신 서비
                    </div>
                    <div class="check_radio">
                        <input type="radio" name="first_term" id="term_agree">
                        <label for="term_agree">동의합니다.</label>
                        <input type="radio" name="first_term" id="term_agree2">
                        <label for="term_agree2">동의하지 않습니다.</label>
                    </div>
                    <p class="useterm_title">상담내역입력</p>
                    <ul class="advice_list">
                        <li>
                            <p class="advice_title">1</p>
                            <div class="advice_select">
                                <p class="question_title">귀하의 <span>투자금</span>은 얼마입니까?</p>
                                <input type="radio" name="first_term3" id="mount" class="ml_0">
                                <label for="mount">500만원 내외</label>
                                <input type="radio" name="first_term3" id="mount2">
                                <label for="mount2">1000만원 내외</label>
                                <input type="radio" name="first_term3" id="mount3">
                                <label for="mount3">5000만원 내외</label>
                                <input type="radio" name="first_term3" id="mount4">
                                <label for="mount4">1억원 내외</label>
                                <input type="radio" name="first_term3" id="mount5">
                                <label for="mount5">5억원 내외</label>
                                <input type="radio" name="first_term3" id="mount6">
                                <label for="mount6">10억원 내외</label>
                            </div>
                        </li>
                        <li>
                            <p class="advice_title">2</p>
                            <div class="advice_select">
                                <p class="question_title">귀하의 투자 <span>스타일</span>은?</p>
                                <input type="radio" name="first_term4" id="style1" class="ml_0">
                                <label for="style1">단기투자</label>
                                <input type="radio" name="first_term4" id="style2">
                                <label for="style2">중기투자</label>
                                <input type="radio" name="first_term4" id="style3">
                                <label for="style3">장기투자</label>
                            </div>
                        </li>
                        <li>
                            <p class="advice_title">3</p>
                            <div class="advice_select">
                                <p class="question_title">귀하의 <span>투자금</span>은 얼마입니까?</p>
                                <input type="radio" name="first_term5" id="style4" class="ml_0">
                                <label for="style4">단기투자</label>
                                <input type="radio" name="first_term5" id="style5">
                                <label for="style5">중기투자</label>
                                <input type="radio" name="first_term5" id="style6">
                                <label for="style6">장기투자</label>
                            </div>
                        </li>
                    </ul>
                    <p class="useterm_title">고객정보입력</p>
                    <div class="table_type1_write type2">
                        <table>
                            <caption>회원정보 입력</caption>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:85%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="bb_line1"><span class="essential">이름</span>
                                    </th><td class="bb_line1"><input type="text" class="input_type1"></td>
                                </tr>
                                <tr>
                                    <th class=""><span class="essential">휴대폰</span></th>
                                    <td class="">
                                        <select name="" id="">
                                            <option value="">010</option>
                                            <option value="">011</option>
                                        </select>
                                         -
                                        <input type="text" class="input_type1 type4"> - <input type="text" class="input_type1 type4">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">이메일</span>
                                    </th><td class="bb_line1"><input type="text" class="input_type1 type2">@<input type="text" class="input_type1 type3"><button class="btn_type1">중복확인</button></td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">투자금</span>
                                    </th><td class="bb_line1"><input type="text" class="input_type1"> 만원</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p class="text_type3 type2">입력하신 정보로 이메일 또는 휴대폰으로 전화를 드리겠습니다.</p>
                    <button class="red_btn">상담신청</button>
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
</body>
</html>