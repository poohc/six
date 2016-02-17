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
    
    $("#deleteBtn").click(function(){
    	if(confirm("정말 삭제하시겠습니까?")){
    		$('#frm').attr('action',$('#deletePage').val());
        	$('#frm').submit();	
    	}
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
				<input type="hidden" id="seq" name="seq" value="${counselingInfo.SEQ}">
				<input type="hidden" id="listPage" name="listPage" value="${listPage}">
				<input type="hidden" id="deletePage" name="deletePage" value="${deletePage}">
			</form>				
				<div class="module_content">
					<ul class="advice_list">
                        <li>
                            <div class="advice_select" style="float: left;">
                                <p class="question_title">${counselingInfo.QUESTION_1}</p>
								${counselingInfo.QUESTION_1_ANSWER}                                								
                            </div>
                        </li>                        
                        <li>
                            <div class="advice_select" style="float: left;">
                                <p class="question_title">${counselingInfo.QUESTION_2}</p>
								${counselingInfo.QUESTION_2_ANSWER}                                								
                            </div>
                        </li>
                        <li>
                            <div class="advice_select" style="float: left;">
                                <p class="question_title">${counselingInfo.QUESTION_3}</p>
								${counselingInfo.QUESTION_3_ANSWER}                                								
                            </div>
                        </li>
                        <li>
                            <div class="advice_select" style="float: left;">
                                <p class="question_title">${counselingInfo.QUESTION_4}</p>
								${counselingInfo.QUESTION_4_ANSWER}                                								
                            </div>
                        </li>
                        <li>
                            <div class="advice_select" style="float: left;">
                                <p class="question_title">${counselingInfo.QUESTION_5}</p>
								${counselingInfo.QUESTION_5_ANSWER}                                								
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
                                    <th class="bb_line1"><span class="essential">투자금</span></th>
                                    <td class="bb_line1">${counselingInfo.INVEST_MONEY}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
				</div>				
				<footer>
					<div class="submit_link">
						<button type="button" id="listBtn">리스트</button>
						<button type="button" id="deleteBtn">삭제</button>
					</div>
				</footer>
		</article><!-- end of post new article -->					
	</section>
</body>
</html>