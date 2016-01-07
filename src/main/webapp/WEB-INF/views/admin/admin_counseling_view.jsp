<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../common/admin_common.jsp" />
<head>
<script type="text/javascript">
$(document).ready(function(){ 
    $("#listBtn").click(function(){
    	$('#frm').attr('action',$('#listPage').val());
    	$('#frm').submit();
    });
});

</script>
</head>
<body>
	<jsp:include page="../common/admin_menu.jsp" />
	<section id="main" class="column">
		<h4 class="alert_info">상담신청 내역</h4>
		<article class="module width_full">
			<header><h3>상담신청 내역</h3></header>
			<form id="frm" name="frm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
				<input type="hidden" id="seq" name="seq" value="${partnerInfo.SEQ}">
				<input type="hidden" id="lsitPage" name="lsitPage" value="${lsitPage}">
			</form>				
				<div class="module_content">
					<ul class="advice_list">
                        <li>
                            <div class="advice_select" style="float: left;">
                                <p class="question_title">귀하의 <span>투자금</span>은 얼마입니까?</p>
								<c:choose>
								<c:when test="${counselingInfo.QNA1 eq 5000000}">
									500만원 내외
								</c:when>
								<c:when test="${counselingInfo.QNA1 eq 10000000}">
									1,000만원 내외
								</c:when>
								<c:when test="${counselingInfo.QNA1 eq 50000000}">
									5,000만원 내외
								</c:when>
								<c:when test="${counselingInfo.QNA1 eq 100000000}">
									1억원 내외
								</c:when>
								<c:when test="${counselingInfo.QNA1 eq 500000000}">
									5억원 내외
								</c:when>
								<c:when test="${counselingInfo.QNA1 eq 1000000000}">
									10억원 내외
								</c:when>
								<c:otherwise>
									투자금 불러오기 오류
								</c:otherwise>
								</c:choose>
                            </div>
                        </li>
                        <li>
                            <div class="advice_select" style="float: left;">
                                <p class="question_title">귀하의 투자 <span>스타일</span>은?</p>
                                ${counselingInfo.QNA2}
                            </div>
                        </li>
                        <li>
                            <div class="advice_select" style="float: left;">
                                <p class="question_title">귀하의 <span>현재</span>재투자 실적은?</p>
                                ${counselingInfo.QNA3}
                            </div>
                        </li>
                    </ul>
                    <p class="useterm_title">고객정보</p>
                    <div class="table_type1_write type2">
                        <table>
                            <caption>회원정보 입력</caption>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:85%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="bb_line1"><span class="essential">이름</span></th>
                                    <td class="bb_line1">${counselingInfo.NAME}</td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">휴대폰</span></th>
                                    <td class="bb_line1">${counselingInfo.CELLPHONE_1}-${counselingInfo.CELLPHONE_2}-${counselingInfo.CELLPHONE_3}</td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">이메일</span></th>
                                   	<td class="bb_line1">${counselingInfo.EMAIL}</td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">상담신청내용</span></th>
                                    <td class="bb_line1">
                                    <c:out value="${counselingInfo.CONTENTS}" escapeXml="false" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
				</div>				
				<footer>
					<div class="submit_link">
						<button type="button" id="listBtn">리스트</button>
					</div>
				</footer>
		</article><!-- end of post new article -->					
	</section>
</body>
</html>