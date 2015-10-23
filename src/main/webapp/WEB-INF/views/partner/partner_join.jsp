<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$('#partner2').addClass("on");	
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
                <jsp:include page="../common/partner_menu2.jsp" />
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
                <img src="/resources/img/partner1.jpg" alt="" class="top_mainimg">
                <img src="/resources/img/partner3.jpg" alt="" class="partner3">
                <div class="right_contents">
                    <p class="title_type1">SIX 파트너스 신청</p>
                    <div class="table_top">
                        <p class="table_type1title2"><span>SIX의 이용중 궁금하신 사항에 대하여 문의 주시기 바랍니다.</span></p>
                    </div>
                    <div class="table_type1_write type2">
                        <table>
                            <caption>고객문의</caption>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:85%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="bb_line1">사진업로드</td>
                                    <td class="bb_line1"><input type="text" id="uploadfile"><input type="file"><p class="picup_title">상반신이 나오고 “파이팅”이나 “넘버원” 등의 포즈가 들어간 사진을 주시면 프로필이 더욱 멋있게 구성됩니다.</p></td>
                                </tr>
                                <tr class="">
                                    <th>자기소개</td>
                                    <td><textarea name="" id="" cols="30" rows="10" class="contents_write2"></textarea></td>
                                </tr>
                                <tr>
                                    <th>정산은행</th>
                                    <td>
                                        <select name="" id="">
                                            <option value="">우리은행</option>
                                            <option value="">국민은행</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>계좌번호</th>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <th>예금주</th>
                                    <td><input type="text">가입자 본인 명의의 계좌만 가능합니다.</td>
                                </tr>
                                <tr>
                                    <th>정산률</th>
                                    <td><input type="text">정산률만큼 공제 후 입금합니다.</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p class="table_texttype1">기본 계약기간은 승인 후 24개월입니다.</p>
                                        <p class="table_texttype2">신청서 전송 후 이력서를 이메일로 보내주시기 바랍니다. (보내실 곳 dddd@dadsa.net)</p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_bottom type2">
                        <a href="#" class="go_list">신청하기</a>
                        <a href="#" class="go_list type2">취소</a>
                    </div>
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