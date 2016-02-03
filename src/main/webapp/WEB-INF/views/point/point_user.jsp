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
<link rel="stylesheet" href="/resources/css/jquery-ui.css" type="text/css" />
<script src="/resources/js/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#startDate").datepicker({
        showOn: "both", 
        buttonImage: "/resources/img/calendar.png", 
        buttonImageOnly: true,
        changeMonth: true, 
        changeYear: true,
        dateFormat: 'yymmdd',
        nextText: '다음 달',
        prevText: '이전 달',
       	dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });
	
	$("#endDate").datepicker({
        showOn: "both", 
        buttonImage: "/resources/img/calendar.png", 
        buttonImageOnly: true,
        changeMonth: true, 
        changeYear: true,
        dateFormat: 'yymmdd',
        nextText: '다음 달',
        prevText: '이전 달',
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
    });
	
	alert('<c:out value="${startDate}" />');
	
	$('#startDate').val($.datepicker.formatDate('yymmdd', $.datepicker.parseDate('yymmdd','<c:out value="${startDate}" />')));
	$('#endDate').val($.datepicker.formatDate('yymmdd', $.datepicker.parseDate('yymmdd','<c:out value="${endDate}" />')));
	
});

function searchProcess(){
	
	if($('#startDate').val().length == 0 || $('#startDate').val() == ''){
		alert('검색 시작일을 입력해주세요');
		return false;
	}
	
	if($('#endDate').val().length == 0 || $('#endDate').val() == ''){
		alert('검색 종료일을 입력해주세요');
		return false;
	}
	
	if($('#startDate').val() > $('#endDate').val()){
		alert('검색 시작일은 검색 종료일보다 클 수 없습니다.');
		return false;
	}
	
	$('#frm').attr('action',$('#searchAction').val());
	$('#frm').submit();
}

function searchWeek(week){
	
	var startDate;
	var endDate;
	
	var tempStartDate = new Date();
	var tempEndDate = new Date();
	
	switch (week) {
	
	case 1 : tempStartDate.setDate(tempStartDate.getDate()-7);
		     break;
	case 2 : tempStartDate.setDate(tempStartDate.getDate()-14);
		     tempEndDate.setDate(tempEndDate.getDate()-7);
		     break;
	case 3 : tempStartDate.setDate(tempStartDate.getDate()-21);
    	     tempEndDate.setDate(tempEndDate.getDate()-14);
    		 break;
	default:
		break;
	}
	
	startDate = createStringDate(tempStartDate);
	endDate = createStringDate(tempEndDate);
	
	alert('startDate :' + startDate + ', endDate : ' + endDate);
	
	$('#startDate').val(startDate);
	$('#endDate').val(endDate);
	
	$('#frm').attr('action',$('#searchAction').val());
	$('#frm').submit();
	
}


function createStringDate(date){
	var year = date.getFullYear().toString();
	var month = (date.getMonth()+1).toString();
	var day = date.getDate().toString();
	
	return year + (month[1] ? month : '0'+month[0]) + (day[1] ? day : '0'+day[0]);
	
}

</script>

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
                <div class="right_contents">
                    <p class="title_type1">포인트 구입현황</p>
                    <ul class="navi_map">
                        <li><a>마이페이지 &gt;</a></li>
                        <li><a>포인트 구입현황</a></li>
                    </ul>
                    <div class="inform_wrap">
                        <ul class="inform_list">
                        	<li>무료정보 구입<span>${pointStat.FREE_COUNT}건</span></li>
                            <li>유료정보 구입<span>${pointStat.PAYED_COUNT}건</span></li>
                        </ul>
                        <button class="btn_type5">포인트 환전신청</button>
                    </div>
                    <div class="term_choice">
                        <table class="">
                            <caption>조회기간선택</caption>
                            <colgroup>
                                <col style="width:15%;">
                                <col style="width:85%;">
                            </colgroup>
                            <tbody>
                            	<form id="frm" name="frm" method="post">
                            	<input type="hidden" id="searchAction" name="searchAction" value="${searchAction}">
                            	<tr>
                                    <th rowspan="2">조회기간 선택</th>
                                    <td>
                                        <input type="text" class="input_type6" id="startDate" name="startDate">
                                        <label for="calendar1" class="type6_label"></label> -
                                        <input type="text" class="input_type6" id="endDate" name="endDate">
                                        <label for="calendar2" class="type6_label">
								</form>                                        
                                        <button class="btn_search" type="button" onclick="searchProcess(); return false;">조회</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
	                                    <button class="btn_type6" type="button" onclick="searchWeek(1); return false;">최근 1주</button>
	                                    <button class="btn_type6" type="button" onclick="searchWeek(2); return false;">최근 2주</button>
	                                    <button class="btn_type6" type="button" onclick="searchWeek(3); return false;">최근 3주</button>
                                    </td>
                                </tr>                                
                            </tbody>
                        </table>
                    </div>
                    <div class="table_type1">
                        <table>
                            <caption>포인트 구입현황</caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:52%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>결제일</th>
                                    <th>콘텐츠</th>
                                    <th>사용포인트</th>
                                    <th>충전포인트</th>
                                    <th>보유포인트</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            	<c:when test="${fn:length(pointList) > 0}">
	                            	<c:forEach items="${pointList}" var="pointList">
		                            	<tr class="">
		                                    <td>${pointList.CREATE_DATE}</td>
		                                    <td class="t_l2">
		                                    	<c:choose>
			                                    	<c:when test="${pointList.POINT_TYPE eq 'POINT001'}">
			                                    		포인트 충전
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    		<a>${pointList.CONTENTS}</a>
			                                    	</c:otherwise>
		                                    	</c:choose>
		                                    </td>
		                                    <td><span class="color_type1">${pointList.USE_POINT}P</span></td>
		                                    <td><span class="color_type2">${pointList.CHARGE_POINT}P</span></td>
		                                    <td>${pointList.AVAILABLE_POINT}P</td>
		                                </tr>
	                            	</c:forEach>
                            	</c:when>
                            	<c:otherwise>
                            		<tr>
                            			<td colspan="5">포인트 내역이 없습니다.</td>
                            		</tr>
                            	</c:otherwise>
                            	</c:choose>                            	
                            </tbody>
                        </table>
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