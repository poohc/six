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
	$('#partner1').addClass("on");	
});

function goPartner(id,seq){
	$('#id').val(id);
	$('#seq').val(seq);
	$('#frm').attr('action',$('#listPage').val());
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
        <div class="partner_slide">
            <div class="banner_list_box type2">
                <div class="visual type2">
                    <div class="pic">
                        <ul>
                            <li>
                                <a href="#"><img src="/resources/img/p_slide1.png" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/partner1_2.jpg" alt="건강지킴이"></a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/partner1_1.jpg" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/p_slide2.png" alt="건강지킴이"></a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/p_slide1.png" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/partner1_2.jpg" alt="건강지킴이"></a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/partner1_1.jpg" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/p_slide2.png" alt="건강지킴이"></a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/p_slide1.png" alt="건강지킴이"></a>
                                <a href="#"><img src="/resources/img/p_slide2.png" alt="건강지킴이"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="btn type2"></div>
                    <div class="dir">
                        <div class="prev"><span>이전</span></div>
                        <div class="next"><span>다음</span></div>
                    </div>
                </div>
            </div>
        </div>
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
            <form id="frm" name="frm" method="post">
            	<input type="hidden" id="id" name="id">
            	<input type="hidden" id="listPage" name="listPage" value="${listPage}">
            	<input type="hidden" id="seq" name="seq">            	
            </form>
            <div class="wrap_right">
                <p class="title_type1 type2 type4">SIX 파트너스</p>
                <ul class="name_card type2">
                	<c:choose>
                		<c:when test="${fn:length(partnerList1) > 0}">
	                		<c:forEach items="${partnerList1}" var="partnerList1">
		                		<li>
			                        <a href="javascript:goPartner('${partnerList1.ID}','${partnerList1.SEQ}')" class="name_block">
			                            <div class="name_top">
			                                <span class="name_title new">${partnerList1.NAME}</span>
			                                <span class="name_title2">${partnerList1.POST}</span>
			                            </div>
			                            <div class="name_bottom">
			                                <c:out value="${partnerList1.IMAGE}" escapeXml="false" />
			                                <p class="name_text type1">${partnerList1.INTRODUCE}</p>
			                                <p class="name_text">${partnerList1.SLOGAN}</p>
			                            </div>
			                        </a>
			                        <a href="javascript:goPartner('${partnerList1.ID}','${partnerList1.SEQ}')" class="watch_movie">파트너 페이지 이동하기</a>
			                    </li>
	                		</c:forEach>                		
                		</c:when>
                		<c:otherwise>
                		<li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">최성관</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile5.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
	                    <li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">홍길동</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile2.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
	                    <li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">홍길동</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile3.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
	                    <li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">홍길동</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile4.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
	                    <li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">홍길동</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile1.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
	                    <li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">홍길동</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile2.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
	                    <li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">홍길동</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile3.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
	                    <li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">홍길동</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile4.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
	                    <li>
	                        <a href="/partner/partnerView.do" class="name_block">
	                            <div class="name_top">
	                                <span class="name_title new">홍길동</span>
	                                <span class="name_title2">SIX하나대투</span>
	                            </div>
	                            <div class="name_bottom">
	                                <img src="/resources/img/profile1.png" alt="">
	                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
	                                <p class="name_text">우리투자증권 투자상담사</p>
	                            </div>
	                        </a>
	                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
	                    </li>
                		</c:otherwise>
                	</c:choose>
                </ul>
                <p class="title_type1 type2 type3">제도권</p>
                <ul class="name_card type2">
                <c:choose>
               		<c:when test="${fn:length(partnerList2) > 0}">
                		<c:forEach items="${partnerList2}" var="partnerList2">
	                		<li>
		                        <a href="javascript:goPartner('${partnerList2.ID}','${partnerList2.SEQ}')" class="name_block">
		                            <div class="name_top">
		                                <span class="name_title new">${partnerList2.NAME}</span>
		                                <span class="name_title2">${partnerList2.POST}</span>
		                            </div>
		                            <div class="name_bottom">
		                                <c:out value="${partnerList2.IMAGE}" escapeXml="false" />
		                                <p class="name_text type1">${partnerList2.INTRODUCE}</p>
		                                <p class="name_text">${partnerList2.SLOGAN}</p>
		                            </div>
		                        </a>
		                        <a href="javascript:goPartner('${partnerList2.ID}','${partnerList2.SEQ}')" class="watch_movie">파트너 페이지 이동하기</a>
		                    </li>
                		</c:forEach>                		
               		</c:when>
               		<c:otherwise>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile2.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile3.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile4.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile1.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile2.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile3.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile4.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile1.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    <li>
                        <a href="/partner/partnerView.do" class="name_block">
                            <div class="name_top">
                                <span class="name_title new">홍길동</span>
                                <span class="name_title2">SIX하나대투</span>
                            </div>
                            <div class="name_bottom">
                                <img src="/resources/img/profile2.png" alt="">
                                <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                                <p class="name_text">우리투자증권 투자상담사</p>
                            </div>
                        </a>
                        <a href="#" class="watch_movie">파트너 페이지 이동하기</a>
                    </li>
                    </c:otherwise>
                </c:choose>
                </ul>                
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