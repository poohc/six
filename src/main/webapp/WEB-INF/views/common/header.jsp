<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<div class="skipMenu">
		<a href="#navigation">주메뉴 바로가기</a>
		<a href="#wrap_container">본문 바로가기</a>
	</div>
	<!-- header -->
	<header>
	<div id="header">
        <div class="top_banner">
            <div class="top_banner2">
                <p class="popup_title">투자 성공의 나침반 <span>SIX 주식정보거래소에서</span> <br><em>편리한 <span>무료상담을</span> 받아보세요.</em></p>
                <a href="#" class="banner_close" id="close_top_notice" onclick="javascript:document.getElementById('top_notice').style.display = 'none'; return false;"><span>닫기</span><img src="/resources/img/close.png" alt="닫기"></a>
                <a href="/main/freeAdvice.do"><p class="popup_title2">무료상담신청으로 이동</p></a>
            </div>
        </div>
        <div class="top_header">
            <div class="top_header2">
                <ul class="top_header3">
                    <c:choose>
                	<c:when test="${not empty sessionScope.userInfo}">
                		<li><a href="/login/logout.do">로그아웃</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="/login/login.do">로그인</a></li>
                	</c:otherwise>
                	</c:choose>
                    <li><a href="/member/memberJoin.do">회원가입</a></li>
                </ul>
            </div>
        </div>
        <div class="middle_header">
            <div class="middle_header2">
                <a href="/main/main.do"><img src="/resources/img/logo.png" alt="six 주식정보거래소"></a>
                <div class="realtime">
                    <p class="realtime1"><img src="/resources/img/pang.png" alt=""> <span>실시간 증시일정</span></p>
                    <div id="newsticker2" class="newsticker">
                    	<ul>
                   			<c:forEach items="${realStockInfo}" var="realStockInfo" end="4" varStatus="loop">
                    			<li><a href="javascript:goRealStockView('${realStockInfo.SEQ}')">${loop.count} ${realStockInfo.TITLE}</a></li>
                    		</c:forEach>
                    	</ul>
                	</div>
           		 </div>
           	</div>
        </div>
		<div id="menuwrap">
			<div id="navigation_pc">
				<ul id="navigation">
					<li><a href="/main/introSix.do" class="btnPullDown">SIX 소개</a>
						<!-- 2뎁스 시작 -->
						<div class="navigation_s1 pullDown">
							<span class="arrow_s1"></span>
							<ul>
								<li>
									<ul>
										<li><a href="/main/introSix.do">SIX 란?</a></li>
										<li><a href="/main/introNotice.do">공지사항</a></li>
										<li><a href="/main/introHowToPay.do">결제방법</a></li>
										<li><a href="/main/introQna.do">고객문의</a></li>
										<li><a href="/main/freeAdvice.do">무료상담신청</a></li>
									</ul>
								</li>
								<li>
									<ul>
                                        <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터</a></li>
                                        <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략</a></li>
                                        <li><a href="/academy/academySearchNote.do">SIX 탐방노트</a></li>
                                        <li><a href="/academy/academyNecessarySubscribe.do">필수구독자료</a></li>
									</ul>
								</li>
								<li>
                                    <ul>
                                        <li><a href="/info/infoFreeRec.do">일급무료종목추천</a></li>
                                        <li><a href="/info/infoSecTech.do">식스비기</a></li>
                                        <li><a href="/info/infoTheme.do">테마정보</a></li>
                                        <li><a href="/info/infoRealStock.do">실시간 증시일정</a></li>
                                        <li><a href="/info/infoStockBriefing.do">증시브리핑</a></li>
                                        <li><a href="/info/infoGInterview.do">고수들의 인터뷰</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/partner/partnerMain.do">SIX 파트너</a></li>
                                        <li><a href="/partner/partnerJoin.do">SIX 파트너 신청</a></li>                                                                                
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/market/marketFree.do">무료종목</a></li>
										<li><a href="/market/marketIstrategy.do">투자전략</a></li>
										<li><a href="/market/marketAnalysis.do">시장분석</a></li>
										<li><a href="/market/marketPay.do">유료종목</a></li>
										<li><a href="/market/marketBargain.do">매매기법</a></li>
										<li><a href="/market/marketAdv.do">고급시황</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/news/newsStock.do">증권가정보</a></li>
                                        <li><a href="/news/newsEtc.do">기타정보</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/community/communityFreeboard.do">자유게시판</a></li>
                                        <li><a href="/community/communityDiscussion.do">종목토론방</a></li>
                                        <li><a href="/community/communityReview.do">SIX 이용후기</a></li>
                                        <li><a href="/community/communitySpeical.do">특강 세미나 교육</a></li>
                                    </ul>
                                </li>                                
							</ul>
						</div>
						<!-- 2뎁스 끝 -->
					</li>
					<li><a href="/academy/academyMain.do" class="btnPullDown">SIX 아카데미</a>
                        <!-- 2뎁스 시작 -->
                        <div class="navigation_s2 pullDown">
                            <span class="arrow_s2"></span>
                            <ul>
                                <li>
                                    <ul>
                                        <li><a href="/main/introSix.do">SIX 란?</a></li>
										<li><a href="/main/introNotice.do">공지사항</a></li>
										<li><a href="/main/introHowToPay.do">결제방법</a></li>
										<li><a href="/main/introQna.do">고객문의</a></li>
										<li><a href="/main/freeAdvice.do">무료상담신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터</a></li>
                                        <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략</a></li>
                                        <li><a href="/academy/academySearchNote.do">SIX 탐방노트</a></li>
                                        <li><a href="/academy/academyNecessarySubscribe.do">필수구독자료</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/info/infoFreeRec.do">일급무료종목추천</a></li>
                                        <li><a href="/info/infoSecTech.do">식스비기</a></li>
                                        <li><a href="/info/infoTheme.do">테마정보</a></li>
                                        <li><a href="/info/infoRealStock.do">실시간 증시일정</a></li>
                                        <li><a href="/info/infoStockBriefing.do">증시브리핑</a></li>
                                        <li><a href="/info/infoGInterview.do">고수들의 인터뷰</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/partner/partnerMain.do">SIX 파트너</a></li>
                                        <li><a href="/partner/partnerJoin.do">SIX 파트너 신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/market/marketFree.do">무료종목</a></li>
										<li><a href="/market/marketIstrategy.do">투자전략</a></li>
										<li><a href="/market/marketAnalysis.do">시장분석</a></li>
										<li><a href="/market/marketPay.do">유료종목</a></li>
										<li><a href="/market/marketBargain.do">매매기법</a></li>
										<li><a href="/market/marketAdv.do">고급시황</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/news/newsStock.do">증권가정보</a></li>
                                        <li><a href="/news/newsEtc.do">기타정보</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/community/communityFreeboard.do">자유게시판</a></li>
                                        <li><a href="/community/communityDiscussion.do">종목토론방</a></li>
                                        <li><a href="/community/communityReview.do">SIX 이용후기</a></li>
                                        <li><a href="/community/communitySpeical.do">특강 세미나 교육</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- 2뎁스 끝 -->
                    </li>
					<li><a href="/info/infoMain.do" class="btnPullDown">SIX 일급정보</a>
                        <!-- 2뎁스 시작 -->
                        <div class="navigation_s3 pullDown">
                            <span class="arrow_s3"></span>
                            <ul>
                                <li>
                                    <ul>
                                        <li><a href="/main/introSix.do">SIX 란?</a></li>
										<li><a href="/main/introNotice.do">공지사항</a></li>
										<li><a href="/main/introHowToPay.do">결제방법</a></li>
										<li><a href="/main/introQna.do">고객문의</a></li>
										<li><a href="/main/freeAdvice.do">무료상담신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터</a></li>
                                        <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략</a></li>
                                        <li><a href="/academy/academySearchNote.do">SIX 탐방노트</a></li>
                                        <li><a href="/academy/academyNecessarySubscribe.do">필수구독자료</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/info/infoFreeRec.do">일급무료종목추천</a></li>
                                        <li><a href="/info/infoSecTech.do">식스비기</a></li>
                                        <li><a href="/info/infoTheme.do">테마정보</a></li>
                                        <li><a href="/info/infoRealStock.do">실시간 증시일정</a></li>
                                        <li><a href="/info/infoStockBriefing.do">증시브리핑</a></li>
                                        <li><a href="/info/infoGInterview.do">고수들의 인터뷰</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/partner/partnerMain.do">SIX 파트너</a></li>
                                        <li><a href="/partner/partnerJoin.do">SIX 파트너 신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/market/marketFree.do">무료종목</a></li>
										<li><a href="/market/marketIstrategy.do">투자전략</a></li>
										<li><a href="/market/marketAnalysis.do">시장분석</a></li>
										<li><a href="/market/marketPay.do">유료종목</a></li>
										<li><a href="/market/marketBargain.do">매매기법</a></li>
										<li><a href="/market/marketAdv.do">고급시황</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/news/newsStock.do">증권가정보</a></li>
                                        <li><a href="/news/newsEtc.do">기타정보</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/community/communityFreeboard.do">자유게시판</a></li>
                                        <li><a href="/community/communityDiscussion.do">종목토론방</a></li>
                                        <li><a href="/community/communityReview.do">SIX 이용후기</a></li>
                                        <li><a href="/community/communitySpeical.do">특강 세미나 교육</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- 2뎁스 끝 -->
                    </li>
					<li><a href="/partner/partnerMain.do" class="btnPullDown">SIX 파트너</a>
                        <!-- 2뎁스 시작 -->
                        <div class="navigation_s4 pullDown">
                            <span class="arrow_s4"></span>
                            <ul>
                                <li>
                                    <ul>
                                        <li><a href="/main/introSix.do">SIX 란?</a></li>
										<li><a href="/main/introNotice.do">공지사항</a></li>
										<li><a href="/main/introHowToPay.do">결제방법</a></li>
										<li><a href="/main/introQna.do">고객문의</a></li>
										<li><a href="/main/freeAdvice.do">무료상담신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터</a></li>
                                        <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략</a></li>
                                        <li><a href="/academy/academySearchNote.do">SIX 탐방노트</a></li>
                                        <li><a href="/academy/academyNecessarySubscribe.do">필수구독자료</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/info/infoFreeRec.do">일급무료종목추천</a></li>
                                        <li><a href="/info/infoSecTech.do">식스비기</a></li>
                                        <li><a href="/info/infoTheme.do">테마정보</a></li>
                                        <li><a href="/info/infoRealStock.do">실시간 증시일정</a></li>
                                        <li><a href="/info/infoStockBriefing.do">증시브리핑</a></li>
                                        <li><a href="/info/infoGInterview.do">고수들의 인터뷰</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/partner/partnerMain.do">SIX 파트너</a></li>
                                        <li><a href="/partner/partnerJoin.do">SIX 파트너 신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/market/marketFree.do">무료종목</a></li>
										<li><a href="/market/marketIstrategy.do">투자전략</a></li>
										<li><a href="/market/marketAnalysis.do">시장분석</a></li>
										<li><a href="/market/marketPay.do">유료종목</a></li>
										<li><a href="/market/marketBargain.do">매매기법</a></li>
										<li><a href="/market/marketAdv.do">고급시황</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/news/newsStock.do">증권가정보</a></li>
                                        <li><a href="/news/newsEtc.do">기타정보</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/community/communityFreeboard.do">자유게시판</a></li>
                                        <li><a href="/community/communityDiscussion.do">종목토론방</a></li>
                                        <li><a href="/community/communityReview.do">SIX 이용후기</a></li>
                                        <li><a href="/community/communitySpeical.do">특강 세미나 교육</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- 2뎁스 끝 -->
                    </li>
					<li><a href="/market/marketMain.do" class="btnPullDown">정보거래소</a>
                        <!-- 2뎁스 시작 -->
                        <div class="navigation_s5 pullDown">
                            <span class="arrow_s5"></span>
                            <ul>
                                <li>
                                    <ul>
                                        <li><a href="/main/introSix.do">SIX 란?</a></li>
										<li><a href="/main/introNotice.do">공지사항</a></li>
										<li><a href="/main/introHowToPay.do">결제방법</a></li>
										<li><a href="/main/introQna.do">고객문의</a></li>
										<li><a href="/main/freeAdvice.do">무료상담신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터</a></li>
                                        <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략</a></li>
                                        <li><a href="/academy/academySearchNote.do">SIX 탐방노트</a></li>
                                        <li><a href="/academy/academyNecessarySubscribe.do">필수구독자료</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/info/infoFreeRec.do">일급무료종목추천</a></li>
                                        <li><a href="/info/infoSecTech.do">식스비기</a></li>
                                        <li><a href="/info/infoTheme.do">테마정보</a></li>
                                        <li><a href="/info/infoRealStock.do">실시간 증시일정</a></li>
                                        <li><a href="/info/infoStockBriefing.do">증시브리핑</a></li>
                                        <li><a href="/info/infoGInterview.do">고수들의 인터뷰</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/partner/partnerMain.do">SIX 파트너</a></li>
                                        <li><a href="/partner/partnerJoin.do">SIX 파트너 신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                    	<li><a href="/market/marketFree.do">무료종목</a></li>
										<li><a href="/market/marketIstrategy.do">투자전략</a></li>
										<li><a href="/market/marketAnalysis.do">시장분석</a></li>
										<li><a href="/market/marketPay.do">유료종목</a></li>
										<li><a href="/market/marketBargain.do">매매기법</a></li>
										<li><a href="/market/marketAdv.do">고급시황</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/news/newsStock.do">증권가정보</a></li>
                                        <li><a href="/news/newsEtc.do">기타정보</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/community/communityFreeboard.do">자유게시판</a></li>
                                        <li><a href="/community/communityDiscussion.do">종목토론방</a></li>
                                        <li><a href="/community/communityReview.do">SIX 이용후기</a></li>
                                        <li><a href="/community/communitySpeical.do">특강 세미나 교육</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- 2뎁스 끝 -->
                    </li>
                    <li><a href="/news/newsStock.do" class="btnPullDown">증권가소식</a>
                        <!-- 2뎁스 시작 -->
                        <div class="navigation_s6 pullDown">
                            <span class="arrow_s6"></span>
                            <ul>
                                <li>
                                    <ul>
                                        <li><a href="/main/introSix.do">SIX 란?</a></li>
										<li><a href="/main/introNotice.do">공지사항</a></li>
										<li><a href="/main/introHowToPay.do">결제방법</a></li>
										<li><a href="/main/introQna.do">고객문의</a></li>
										<li><a href="/main/freeAdvice.do">무료상담신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터</a></li>
                                        <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략</a></li>
                                        <li><a href="/academy/academySearchNote.do">SIX 탐방노트</a></li>
                                        <li><a href="/academy/academyNecessarySubscribe.do">필수구독자료</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/info/infoFreeRec.do">일급무료종목추천</a></li>
                                        <li><a href="/info/infoSecTech.do">식스비기</a></li>
                                        <li><a href="/info/infoTheme.do">테마정보</a></li>
                                        <li><a href="/info/infoRealStock.do">실시간 증시일정</a></li>
                                        <li><a href="/info/infoStockBriefing.do">증시브리핑</a></li>
                                        <li><a href="/info/infoGInterview.do">고수들의 인터뷰</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/partner/partnerMain.do">SIX 파트너</a></li>
                                        <li><a href="/partner/partnerJoin.do">SIX 파트너 신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/market/marketFree.do">무료종목</a></li>
										<li><a href="/market/marketIstrategy.do">투자전략</a></li>
										<li><a href="/market/marketAnalysis.do">시장분석</a></li>
										<li><a href="/market/marketPay.do">유료종목</a></li>
										<li><a href="/market/marketBargain.do">매매기법</a></li>
										<li><a href="/market/marketAdv.do">고급시황</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/news/newsStock.do">증권가정보</a></li>
                                        <li><a href="/news/newsEtc.do">기타정보</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/community/communityFreeboard.do">자유게시판</a></li>
                                        <li><a href="/community/communityDiscussion.do">종목토론방</a></li>
                                        <li><a href="/community/communityReview.do">SIX 이용후기</a></li>
                                        <li><a href="/community/communitySpeical.do">특강 세미나 교육</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- 2뎁스 끝 -->
                    </li>
                    <li><a href="/community/communityFreeboard.do" class="btnPullDown">커뮤니티</a>
                        <!-- 2뎁스 시작 -->
                        <div class="navigation_s7 pullDown">
                            <span class="arrow_s7"></span>
                            <ul>
                                <li>
                                    <ul>
                                        <li><a href="/main/introSix.do">SIX 란?</a></li>
										<li><a href="/main/introNotice.do">공지사항</a></li>
										<li><a href="/main/introHowToPay.do">결제방법</a></li>
										<li><a href="/main/introQna.do">고객문의</a></li>
										<li><a href="/main/freeAdvice.do">무료상담신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/academy/academyLearningCenter.do">SIX 주식배움터</a></li>
                                        <li><a href="/academy/academyInvestStrategy.do">SIX 투자전략</a></li>
                                        <li><a href="/academy/academySearchNote.do">SIX 탐방노트</a></li>
                                        <li><a href="/academy/academyNecessarySubscribe.do">필수구독자료</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/info/infoFreeRec.do">일급무료종목추천</a></li>
                                        <li><a href="/info/infoSecTech.do">식스비기</a></li>
                                        <li><a href="/info/infoTheme.do">테마정보</a></li>
                                        <li><a href="/info/infoRealStock.do">실시간 증시일정</a></li>
                                        <li><a href="/info/infoStockBriefing.do">증시브리핑</a></li>
                                        <li><a href="/info/infoGInterview.do">고수들의 인터뷰</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/partner/partnerMain.do">SIX 파트너</a></li>
                                        <li><a href="/partner/partnerJoin.do">SIX 파트너 신청</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/market/marketFree.do">무료종목</a></li>
										<li><a href="/market/marketIstrategy.do">투자전략</a></li>
										<li><a href="/market/marketAnalysis.do">시장분석</a></li>
										<li><a href="/market/marketPay.do">유료종목</a></li>
										<li><a href="/market/marketBargain.do">매매기법</a></li>
										<li><a href="/market/marketAdv.do">고급시황</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/news/newsStock.do">증권가정보</a></li>
                                        <li><a href="/news/newsEtc.do">기타정보</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <ul>
                                        <li><a href="/community/communityFreeboard.do">자유게시판</a></li>
                                        <li><a href="/community/communityDiscussion.do">종목토론방</a></li>
                                        <li><a href="/community/communityReview.do">SIX 이용후기</a></li>
                                        <li><a href="/community/communitySpeical.do">특강 세미나 교육</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- 2뎁스 끝 -->
                    </li>
				</ul>
			</div>
		</div>
	</div>
</header>		