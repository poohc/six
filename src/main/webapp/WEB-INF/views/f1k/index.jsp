<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="./common/common.jsp" />
</head>
<body>
<div class="wrapper main">
	<!-- header -->
	<jsp:include page="./common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
            <div class="rolling">
                    <div class="banner_list_box">
                        <div class="visual">
                            <div class="pic">
                                <ul>
                                    <li>
                                        <a href="#"><img src="/resources/f1k/img/visual1.jpg" alt="건강지킴이"></a>
                                    </li>
                                    <li>
                                        <a href="#"><img src="/resources/f1k/img/visual2.jpg" alt="건강지킴이"></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn"></div>
			<div class="dirWrap">
				<div class="dir">
					<div class="prev"><span><img src="/resources/f1k/img/left.png"></span></div>
					<div class="next"><span><img src="/resources/f1k/img/right.png"></span></div>
					<div class="blurBox">
						냉철한 시스템과<br>
						정확한 판단력으로<br>
						<span>완벽한 분석을 하는</span><br>
						<em>퍼스트원</em>
					</div>
				</div>
			</div>
                        </div>
                    </div>
                </div>
        <div class="mainIconsWrap">
            <ul class="mainIcons">
                <li>
                    <a href="#">
                        <img src="/resources/f1k/img/icon1.png" alt="">
                        <p class="mainIconsTitle">시대의흐름</p>
                        <p class="mainIconsTitle2">시대는 변화합니다<br>끊임없이 변화하고 성장하는 시대의<br>흐름을 정확히 보는 것이 중요합니다.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="/resources/f1k/img/icon2.png" alt="">
                        <p class="mainIconsTitle">기업의본질</p>
                        <p class="mainIconsTitle2">기업의 본질에 집중하며, <br>진정 기업을 판단하려면 보고 듣고 <br> 만져봐야 합니다.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="/resources/f1k/img/icon3.png" alt="">
                        <p class="mainIconsTitle">냉철한분석</p>
                        <p class="mainIconsTitle2">지속적, 안정적으로 이끌어가는 <br>알고리즘 분석 시스템으로 <br>안정적인 성과를 이끌어가고 있습니다.</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="/resources/f1k/img/icon4.png" alt="">
                        <p class="mainIconsTitle">퍼스트원의다짐</p>
                        <p class="mainIconsTitle2">고객에게 믿을 수 있는 기업<br>완벽한 투자 결정이 나기전까지 끊임없이<br> 분석하고 또 분석하겠습니다</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="mainCont">
            <ul>
                <li>
                    <p class="mainContTitle">공지사항</p>
                    <a href="#" class="viewMore">더보기 +</a>
                    <c:choose>
                    <c:when test="${fn:length(list) > 0}">
                    	<c:forEach items="${list}" var="list" varStatus="loop" begin="0" end="2">
                    	<c:choose>
	                    	<c:when test="${loop.index eq 0}">
		                    	<a href="#" class="mainContLink">
			                        <p class="mainContTitle2">${list.TITLE}</p>
			                        <p class="mainContTitle3">${list.CONTENTS}</p>
		                    	</a>
		                    	<p class="mainContTitle4">${list.CREATE_DATE}</p>
	                    	</c:when>
	                    	<c:otherwise>
		                    	<ul class="noticeList">
			                        <li>
			                        	<a href="#">${list.TITLE}</a>
			                        	<span>${list.CREATE_DATE}</span>
			                        </li>	                        
		                    	</ul>
	                    	</c:otherwise>
                    	</c:choose>
                    	</c:forEach>
                    </c:when>
                    <c:otherwise>
                    	<ul class="noticeList">
	                        <li>
	                        	공지사항이 없습니다.
	                        </li>	                        
                    	</ul>
                    </c:otherwise>
                    </c:choose>
                </li>
                <li>
                    <p class="mainContTitle type2">퍼스트원의 시각</p>
                    <a href="#" class="viewMore">더보기 +</a>
                    <a href="#" class="mainContLink2">
                        <p class="mainContTitle5">트레이딩 시스템을 퍼스트원의 시각과 <br>시스템으로 고객에게 여러분께 <br> 알려드립니다.</p>
                    </a>
                </li>
                <li class="investConsult">
                    <p class="mainContTitle">투자상담</p>
                    <a href="#layer2" class="btnType1 btn-example">상담하기</a>
                     <p class="mainContTitle5">퍼스트원의<br>애널리스트 / 펀드매니저가<br>성의있게 도와드립니다.</p>
                </li>
            </ul>
            <div class="dim-layer">
       	    	<div class="dimBg">
       	    	</div>
        		<div class="consultPopup pop-layer" id="layer2">
            <textarea name="" id="" cols="30" rows="10" class="consultTextarea">약관</textarea>
            <ul class="popupCheckList">
                <li>
                    <p class="popupTitle1">1. 주식 투자를 하길 잘했다고 생각하십니까?</p>
                    <ul class="popupRadio">
                       <li>
                            <input type="radio" name="firstli" id="firstli">
                            <label for="firstli">예</label>
                        </li>
                         <li>
                            <input type="radio" name="firstli" id="firstli2">
                            <label for="firstli2">아니오</label>
                        </li>
                        <li>
                            <input type="radio" name="firstli" id="firstli3">
                            <label for="firstli3">잘모르겠다.</label>
                        </li>
                    </ul>
                </li>
                <li>
                    <p class="popupTitle1">2. 주식 투자로 돈을 벌 수 있다고 생각하십니까? 주식시장에 기회가 많다고 생각하십니까?</p>
                    <ul class="popupRadio">
                        <li>
                            <input type="radio" name="firstli" id="firstli">
                            <label for="firstli">예</label>
                        </li>
                         <li>
                            <input type="radio" name="firstli" id="firstli2">
                            <label for="firstli2">아니오</label>
                        </li>
                        <li>
                            <input type="radio" name="firstli" id="firstli3">
                            <label for="firstli3">잘모르겠다.</label>
                        </li>
                    </ul>
                </li>
                <li>
                    <p class="popupTitle1">3. 주식 투자 비중은 얼마나 되십니까?</p>
                    <ul class="popupRadio">
                       <li>
                            <input type="radio" name="firstli3" id="firstli11">
                            <label for="firstli11">여유자금 일부</label>
                        </li>
                         <li>
                            <input type="radio" name="firstli3" id="firstli12">
                            <label for="firstli12">여유자금 전부</label>
                        </li>
                        <li>
                            <input type="radio" name="firstli3" id="firstli13">
                            <label for="firstli13">실패시 타격</label>
                        </li>
                    </ul>
                </li>
                <li>
                    <p class="popupTitle1">4. 자신의 주식실적은 어느정도라고 생각하십니까?</p>
                    <ul class="popupRadio">
                       <li>
                            <input type="radio" name="firstli3" id="firstli11">
                            <label for="firstli11">매우잘함</label>
                        </li>
                         <li>
                            <input type="radio" name="firstli3" id="firstli12">
                            <label for="firstli12">잘함</label>
                        </li>
                        <li>
                            <input type="radio" name="firstli3" id="firstli13">
                            <label for="firstli13">보통</label>
                        </li>
                        <li>
                            <input type="radio" name="firstli3" id="firstli13">
                            <label for="firstli13">못함</label>
                        </li>
                        <li>
                            <input type="radio" name="firstli3" id="firstli13">
                            <label for="firstli13">매우못함</label>
                        </li>
                    </ul>
                </li>
                <li>
                    <p class="popupTitle1">5. 보유종목,계좌비중 및 수익률</p>
                    <textarea name="" id="" cols="30" rows="10" class="consultTextarea2">예)셀트리온 10%  수익률 -5%</textarea>
                </li>
            </ul>
            <div class="customerInfo">
                <p class="popupTitle2">고객정보입력</p>
                <p class="popupTitle3"><span>*</span>  표시 필수항목 입니다.</p>
                <ul class="putCtrInfo">
                    <li>
                        <p class="putCtrTitle"><span>*</span>이름</p>
                        <input type="text">
                    </li>
                    <li>
                        <p class="putCtrTitle"><span>*</span>핸드폰</p>
                        <input type="text">
                    </li>
                    <li>
                        <p class="putCtrTitle"><span>*</span>E-Mail</p>
                        <input type="text">
                    </li>
                    <li>
                        <p class="putCtrTitle"><span>*</span>투자금</p>
                        <input type="text">
                    </li>
                </ul>
            </div>
            <div a href="#layer3" class="btnType2">상담신청하기</div>
            <a href="#" class="btnType2 type2 btn-layerClose">닫기</a>
        	</div>
        </div>
        <div class="consultPopup pop-layer" id="layer3">
        	<p>안녕하세요. 퍼스트원 투자자문 대표이사 박준상입니다.</p>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />	
</body>
</html>