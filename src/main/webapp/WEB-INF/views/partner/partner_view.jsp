<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	
	switch ('<c:out value="${category}" />') {
	
	case 'FREE_INFO': $('#freeTab').css('visibility','visible');
					  $('#paidTab').css('visibility','hidden');
		              $('#categoryFree').addClass("on");
					  $('#categoryInvest').removeClass();
					  $('#categoryMarket').removeClass();
					  $('#partner2').removeClass();
					  $('#partner1').addClass("on");
		              break;
	case 'INVEST_STRATEGY': $('#freeTab').css('visibility','visible');
	  						$('#paidTab').css('visibility','hidden');
						    $('#categoryFree').removeClass();
					  		$('#categoryInvest').addClass("on");
					  		$('#categoryMarket').removeClass();
					  		$('#partner2').removeClass();
					  		$('#partner1').addClass("on");
    				  		break;
	case 'MARKET_ANALYSIS': $('#freeTab').css('visibility','visible');
						    $('#paidTab').css('visibility','hidden');
							$('#categoryFree').removeClass();
					  		$('#categoryInvest').removeClass();
					  		$('#categoryMarket').addClass("on");
					  		$('#partner2').removeClass();
					  		$('#partner1').addClass("on");
    				  		break;
	case 'PAID_INFO'      : $('#freeTab').css('visibility','hidden');
	  						$('#paidTab').css('visibility','visible');
							$('#categoryPaid').addClass("on");
							$('#categoryBargain').removeClass();
							$('#categoryAdvance').removeClass();
							$('#partner1').removeClass();
							$('#partner2').addClass("on");
							break;
	case 'BARGAIN_TECHNIQUES':
							$('#freeTab').css('visibility','hidden');
							$('#paidTab').css('visibility','visible');
						    $('#categoryPaid').removeClass();
							$('#categoryBargain').addClass("on");
							$('#categoryAdvance').removeClass();
							$('#partner1').removeClass();
							$('#partner2').addClass("on");
							break;
	case 'ADVANCE_MARKET' : $('#freeTab').css('visibility','hidden');
							$('#paidTab').css('visibility','visible');
							$('#categoryPaid').removeClass();
							$('#categoryBargain').removeClass();
							$('#categoryAdvance').addClass("on");
							$('#partner1').removeClass();
							$('#partner2').addClass("on");
							break;
	default:
		break;
	}
	
});

function goList(){
	$('#frm').attr('action',$('#listPage').val());
	$('#frm').submit();
}

function updateBoard(){
	$('#frm').attr('action',$('#updateAction').val());
    $('#frm').submit();
}

function deleteBoard(){
	if(confirm('정말 글을 삭제하시겠습니까?')){
		$('#frm').attr('action',$('#deleteAction').val());
		$('#frm').submit();
	} else {
		return false;
	}
}

function fileDownLoad(fileName){
	$('#frm').attr('action','/file/partnerFileDownLoad.do');
	$('#fileName').val(fileName);
	$('#frm').submit();
}

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
                <jsp:include page="../common/partner_menu.jsp" />
                <div class="youtube_channel">
                    <a class="youtube_title">채널<span>+ 더보기</span></a>
                    <div class="youtube_box">
                        <ul class="youtube_list">
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                            <li><a><img src="/resources/img/youtube2.png" alt=""><p>박준상 TSI 투자 자문역</p></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrap_right">
                <img src="/resources/img/partner1.jpg" alt="" class="top_mainimg">
                <div class="personInfo">
                    <img src="/resources/img/p_1.png" alt="">
                    <p class="personTitle">최성관</p>
                    <p class="personTitle2">SIX파트너</p>
                    <p class="personTitle3">주식정보의 큰손</p>
                    <p class="personTitle4">OO대학교 경제학과</p>
                    <p class="personTitle5">OO투자증권 FP</p>
                    <p class="personTitle6">SIX투자증권</p>
                </div>
                <ul class="inform_list">
                    <li>총 정보등록건수<span>${partnerBoardStat.CNT}</span></li>
                    <li>총 다운로드<span>${partnerBoardStat.DOWNLOAD_COUNT}</span></li>
                    <li>정보등록건수 순위<span>${partnerBoardStat.RANK}</span></li>
                    <li>다운로드 순위<span>${partnerBoardStat.DOWNLOAD_RANK}</span></li>
                </ul>
                <ul class="inform_list2" id="freeTab" style="visibility: hidden;">
                    <li id="categoryFree"><a href="javascript:goCategory('FREE_INFO')">무료종목</a></li>
                    <li id="categoryInvest"><a href="javascript:goCategory('INVEST_STRATEGY')">투자전략</a></li>
                    <li id="categoryMarket"><a href="javascript:goCategory('MARKET_ANALYSIS')">시장분석</a></li>
                </ul>
                <ul class="inform_list2" id="paidTab" style="visibility: hidden;">
                    <li id="categoryPaid"><a href="javascript:goCategory('PAID_INFO')">유료종목</a></li>
                    <li id="categoryBargain"><a href="javascript:goCategory('BARGAIN_TECHNIQUES')">매매기법</a></li>
                    <li id="categoryAdvance"><a href="javascript:goCategory('ADVANCE_MARKET')">고급시황</a></li>
                </ul>
                
                <form name="frm" id="frm" method="post" accept-charset="utf-8">
               		<input type="hidden" id="fileName" name="fileName">
                    <input type="hidden" id="listPage" name="listPage" value="${listPage}">
                    <input type="hidden" id="updateAction" name="updateAction" value="${updateAction}">
                	<input type="hidden" id="deleteAction" name="deleteAction" value="${deleteAction}">
					<input type="hidden" id="partnerSeq" name="partnerSeq" value="${partnerSeq}">
                	<input type="hidden" id="seq" name="seq" value="${partnerBoardInfo.SEQ}">
                	<input type="hidden" id="id" name="id" value="${id}">
                	<input type="hidden" id="category" name="category" value="${partnerBoardInfo.CATEGORY}">
                	<input type="hidden" id="isView" name="isView" value="true">
                </form>
                <div class="right_contents">
                    <div class="table_type1_view type2">
                        <table>
                            <caption>공지사항</caption>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:35%;">
                                <col style="width:15%;">
                                <col style="width:35%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>제목</td>
                                    <td>${partnerBoardInfo.TITLE}</td>
                                    <th>다운로드 수</th>
                                    <td>
                                    	${partnerBoardInfo.DOWNLOAD_COUNT}
                                    </td>
                                </tr>
                                <tr>
                                    <th>작성자</td>
                                    <td>${partnerBoardInfo.CREATE_ID}</td>
                                    <th>작성일</th>
                                    <td>${partnerBoardInfo.CREATE_DATE}</td>
                                </tr>
                                <tr>
                                    <th>첨부파일</td>
                                    <td>
                                    	<c:forEach items="${fileList}" var="fileList">
                                    		${fileList.file}
                                    	</c:forEach>
                                    </td>
                                    <th>조회</th>
                                    <td>${partnerBoardInfo.HIT_COUNT}</td>
                                </tr>
                                <tr>
                                    <th class="bb_line3">가격</td>
                                    <td class="bb_line3">
                                    <c:choose>
	                                    <c:when test="${partnerBoardInfo.PRICE eq '0'}">
	                                    	무료
	                                    </c:when>
	                                    <c:otherwise>
	                                		${partnerBoardInfo.PRICE}    	
	                                    </c:otherwise>
                                    </c:choose>
                                    </td>
                                    <th class="bb_line3">다운로드</th>
                                    <td class="bb_line3">
	                                    <c:forEach items="${fileList}" var="fileList">
	                                		<a href="javascript:fileDownLoad('${fileList.rFile}')">
	                                			<img src="/resources/img/download_bul.png" alt="파트너 첨부 파일 다운로드">
	                                		</a>
	                                	</c:forEach>
                                    </td>
                                </tr>
                                <tr class="">
                                    <td colspan="4" class="td_lh">${partnerBoardInfo.CONTENTS}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <security:authorize access="hasRole('ROLE_USER')" var="isUser" />
					<security:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
					<security:authorize access="hasRole('ROLE_PARTNER')" var="isPartner" />
                    <div class="table_bottom type2">
                        <a href="javascript:goList()" class="go_list">목록으로</a>
                        <c:if test="${isAdmin || (isPartner && sessionScope.userInfo.username eq id)}">
                        	<ul class="table_option">
                       			<li><a href="javascript:deleteBoard()" id="deleteBtn">삭제</a></li>
		                        <li><a href="javascript:updateBoard()" id="updateBtn">수정</a></li>
		                    </ul>
                        </c:if>
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