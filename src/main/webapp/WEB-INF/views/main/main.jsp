<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#loginBtn').click(function(){
			if($('#j_username').val() == ''){
				alert('ID를 입력해주세요');
				return false;
			}
			if($('#j_password').val() == ''){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			
			$('#loginForm').submit();			
		});
		
		$('#logoutBtn').click(function(){
			$('#loginForm').attr('action','/login/logout.do');
			$('#loginForm').submit();			
		});
		
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
            <div class="top_area">
                <div class="kospi">
                    <p class="kospi_title">KOSPI</p>
                    <p class="kospi_title2">1,915.53 <span>7.09 (1.75%)</span></p>
                    <p class="kospi_title">KOSPI</p>
                    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
                    <p class="kospi_title">KOSPI</p>
                    <p class="kospi_title2 type2">1,915.53 <span>7.09 (1.75%)</span></p>
                </div>
                <div class="rolling">
                    <div class="banner_list_box">
                        <div class="visual">
                            <div class="pic">
                                <ul>
                                    <li>
                                        <a href="#"><img src="/resources/img/rolling1.jpg" alt="건강지킴이"></a>
                                    </li>
                                    <li>
                                        <a href="#"><img src="/resources/img/rolling1.jpg" alt="건강지킴이"></a>
                                    </li>
                                    <li>
                                        <a href="#"><img src="/resources/img/rolling1.jpg" alt="건강지킴이"></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn"></div>
                            <div class="dir">
                                <div class="prev"><span>이전</span></div>
                                <div class="next"><span>다음</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="visual_movie">
            	<form id="loginForm" method="post" action="j_spring_security_check">
            	<c:choose>
            		<c:when test="${not empty sessionScope.userInfo}">
            			<div class="login_box">
            				${sessionScope.userInfo.nickName} 님 환영합니다.
            				<button type="button" id="logoutBtn">로그아웃</button>
            			</div>
            		</c:when>            		
            		<c:otherwise>
		                <div class="login_box">
		                    <input type="text" class="id_input" placeholder="아이디"  id="j_username" name="j_username">
		                    <input type="password" class="password_input" placeholder="비밀번호" id="j_password" name="j_password">
		                    <button class="login_btn" id="loginBtn">로그인</button>
		                    <a href="/login/login.do" class="id_search">아이디/비밀번호찾기</a>
		                    <a href="/member/memberNotice.do" class="join">회원가입</a>
		                </div>	                	
            		</c:otherwise>
            	</c:choose>
            	</form>
                <div class="rolling_movie">
                    <div class="rolling2">
                        <div class="banner_list_box">
                            <div class="visuals">
                                <div class="pic">
                                    <ul>
                                        <li>
                                            <a href="#"><img src="/resources/img/rolling2.jpg" alt="건강지킴이"></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="/resources/img/rolling2.jpg" alt="건강지킴이"></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="/resources/img/rolling2.jpg" alt="건강지킴이"></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="btn"></div>
                                <div class="dir">
                                    <div class="prev"><span>이전</span></div>
                                    <div class="next"><span>다음</span></div>
                                </div>
                            </div>
                    </div>
                    </div>
                    <div class="movie"><a href="#"><img src="/resources/img/movie.jpg" alt=""></a></div>
                </div>
            </div>
            <ul class="name_card">
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
                <li>
                    <a href="#" class="name_block">
                        <div class="name_top">
                            <span class="name_title new">홍길동</span>
                            <span class="name_title2">SIX하나대투</span>
                        </div>
                        <div class="name_bottom">
                            <img src="/resources/img/name_img2.png" alt="">
                            <p class="name_text type1">증권가의정보를 확실하게 드립니다.</p>
                            <p class="name_text">우리투자증권 투자상담사</p>
                        </div>
                    </a>
                    <a href="#" class="watch_movie">동영상 보기</a>
                </li>
            </ul>
            <div class="free_area">
                <p class="free_title">SIX 주식정보거래소의 정보제공자와 만나보세요. 무료정보도 많습니다.</p>
                <a href="#" class="free_more">더보기 +</a>
            </div>
            <ul class="look_ahead">
                <li>
                    <p class="look_title"><span>무료</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>투자</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>시장</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>유료</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>매매</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>고급</span>종목</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
            </ul>
            <ul class="mainbanner_list">
                <li><a href="#"><p>SIX <br>아카데미</p><img src="/resources/img/mainbanner1.png" alt=""></a></li>
                <li><a href="#"><p>SIX <br>일급정보</p><img src="/resources/img/mainbanner2.png" alt=""></a></li>
                <li><a href="#"><p>특강 <br>세미나</p><img src="/resources/img/mainbanner3.png" alt=""></a></li>
            </ul>
            <ul class="look_ahead2">
                <li>
                    <p class="look_title"><span>SIX</span>주식 배움터</p>
                    <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <div class="ahead_top">
                        <img src="/resources/img/ahead2.gif" alt="">
                        <a href="#" class="ahead_text">
                            <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                            <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                            <p class="aheadtext_title3">2015.09.03</p>
                        </a>
                    </div>
                    <ul class="look_list2">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>SIX</span>주식 배움터</p>
                    <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <div class="ahead_top">
                        <img src="/resources/img/ahead2.gif" alt="">
                        <a href="#" class="ahead_text">
                            <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                            <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                            <p class="aheadtext_title3">2015.09.03</p>
                        </a>
                    </div>
                    <ul class="look_list2">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title"><span>SIX</span>주식 배움터</p>
                    <a href="#" class="look_more2"><img src="/resources/img/view_more2.png" alt="더보기"></a>
                    <div class="ahead_top">
                        <img src="/resources/img/ahead2.gif" alt="">
                        <a href="#" class="ahead_text">
                            <p class="aheadtext_title">각종 정보의 게시글의 제목을 보여줍니다.</p>
                            <p class="aheadtext_title2">각종정보에 대한 내용의 영역입니다.내용이 채워지는 영역입니다..</p>
                            <p class="aheadtext_title3">2015.09.03</p>
                        </a>
                    </div>
                    <ul class="look_list2">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
            </ul>

            <ul class="look_ahead">
                <li>
                    <p class="look_title">식스비기</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title">증시브리핑</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title">고수들의인터뷰</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title">나침반추천주</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title">핵심정보</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
                <li>
                    <p class="look_title">정보원토론실</p>
                    <a href="#" class="look_more">더보기 +</a>
                    <ul class="look_list">
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                        <li><a href="#">각종 정보의 게시글의 제목을 확인합니다.</a><span>2015.09.03</span></li>
                    </ul>
                </li>
            </ul>
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