<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<jsp:include page="../common/boardCommon_Editor.jsp" />
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
                    	<c:choose>
                    	<c:when test="${fn:length(terms) > 0}">
                    		<c:forEach items="${terms}" var="terms">
                    			<c:out value="terms.TERMS_HTML" escapeXml="false" />
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise>
                    		<div>약관이 없습니다.</div>
                    	</c:otherwise>
                    	</c:choose>                        
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
                                <input type="radio" name="qna1" class="ml_0" value="500만원 내외">
                                <label for="mount">500만원 내외</label>
                                <input type="radio" name="qna1" value="1,000만원 내외">
                                <label for="mount2">1,000만원 내외</label>
                                <input type="radio" name="qna1" value="5,000만원 내외">
                                <label for="mount3">5,000만원 내외</label>
                                <input type="radio" name="qna1" value="1억원 내외">
                                <label for="mount4">1억원 내외</label>
                                <input type="radio" name="qna1" value="5억원 내외">
                                <label for="mount5">5억원 내외</label>
                                <input type="radio" name="qna1" value="10억원 내외">
                                <label for="mount6">10억원 내외</label>
                            </div>
                        </li>
                        <li>
                            <p class="advice_title">2</p>
                            <div class="advice_select">
                                <p class="question_title">귀하의 투자 <span>스타일</span>은?</p>
                                <input type="radio" name="qna2" class="ml_0" value="단기투자">
                                <label for="style1">단기투자</label>
                                <input type="radio" name="qna2" value="중기투자">
                                <label for="style2">중기투자</label>
                                <input type="radio" name="qna2" value="장기투자">
                                <label for="style3">장기투자</label>
                            </div>
                        </li>
                        <li>
                            <p class="advice_title">3</p>
                            <div class="advice_select">
                                <p class="question_title">귀하의 <span>현재</span>재투자 실적은?</p>
                                <input type="radio" name="qna3" class="ml_0" value="수익중">
                                <label for="style4">수익중</label>
                                <input type="radio" name="qna3" value="손실중">
                                <label for="style5">손실중</label>
                                <input type="radio" name="qna3" value="제자리중">
                                <label for="style6">제자리중</label>
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
                                    </th><td class="bb_line1"><input type="text" class="input_type1" name="name" value="${memberInfo.NAME}"></td>
                                </tr>
                                <tr>
                                    <th class=""><span class="essential">휴대폰</span></th>
                                    <td class="">
                                        <select name="cellPhone1" id="cellPhone1">
                                            <option value="010" <c:if test="${memberInfo.CELLPHONE1 eq '010'}">selected="selected"</c:if>>010</option>                                            
                                            <option value="011" <c:if test="${memberInfo.CELLPHONE1 eq '011'}">selected="selected"</c:if>>011</option>
                                            <option value="016" <c:if test="${memberInfo.CELLPHONE1 eq '016'}">selected="selected"</c:if>>016</option>
                                            <option value="017" <c:if test="${memberInfo.CELLPHONE1 eq '017'}">selected="selected"</c:if>>017</option>
                                            <option value="018" <c:if test="${memberInfo.CELLPHONE1 eq '018'}">selected="selected"</c:if>>018</option>
                                            <option value="019" <c:if test="${memberInfo.CELLPHONE1 eq '019'}">selected="selected"</c:if>>019</option>
                                        </select>
                                         -
                                        <input type="text" class="input_type1 type4" value="${memberInfo.CELLPHONE2}"> - <input type="text" class="input_type1 type4" value="${memberInfo.CELLPHONE3}">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">이메일</span></th>
                                   	<td class="bb_line1">
                                   		<input type="text" class="input_type1 type2" value="${memberInfo.EMAIL1}">@
                                   		<input type="text" class="input_type1 type3" value="${memberInfo.EMAIL2}">
                                   		<button class="btn_type1">중복확인</button>
                                   	</td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">상담신청내용</span>
                                    </th><td class="bb_line1">
                                    <textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;">
                                    </textarea></td>
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