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
<div class="wrapper">
	<!-- header -->
	<jsp:include page="./common/header.jsp" />
	<!-- header End -->
	<!-- contain -->
	<div id="wrap_container">
        <div class="naviArea">
            <ul class="navi">
                <li class="home"><a href="index.html"></a></li>
                <li><a href="sub3.html">투자결정과정</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>투자 결정 과정</h1>
            <ul class="tab type2" id="tab">
                <li class="on"><a href="#div1">투자프로세서</a></li>
                <li><a href="#div2">시장상황분석</a></li>
                <li><a href="#div3">수급구조분석</a></li>
                <li><a href="#div4">리스크관리</a></li>
            </ul>
            <div id="div1" class="tab_contents" style="display:block">
                <div class="investBox">
                    <div class="investList">
                        <img src="/resources/f1k/img/invest1.jpg" alt="">
                        <div class="investText">
                            자체 HTS  내 감 종목감별
                            <span>종목 검별 시스템작동</span>
                        </div>
                    </div>
                    <div class="investList type2">
                        <img src="/resources/f1k/img/invest2.jpg" alt="">
                        <div class="investText">
                            시장상황, 수급구조 파악
                            <span>IR미팅,재무분석,가치분석</span>
                        </div>
                    </div>
                    <div class="investList type3">
                        <img src="/resources/f1k/img/invest3.jpg" alt="">
                        <div class="investText">
                            퍼스트원  투자결정 회의
                            <span>투자결정</span>
                        </div>
                    </div>
                    <div class="investList type4">
                        <img src="/resources/f1k/img/invest4.jpg" alt="">
                        <div class="investText type2">
                            최선호 종목군 시스템 추출
                            <span>최선호 알고리즘 작동</span>
                        </div>
                    </div>
                    <div class="investList type5">
                        <img src="/resources/f1k/img/invest5.jpg" alt="">
                        <div class="investText type2">
                            자체  시스템 분석
                            <span class="type2">세력개입, 상승조건 분석<br>다각도 기술분석</span>
                        </div>
                    </div>
                    <div class="investList type6">
                        <img src="/resources/f1k/img/invest6.jpg" alt="">
                        <div class="investText type2">
                            리스크관리팀 위험판단
                            <span>상시 모니터링</span>
                        </div>
                    </div>
                    <ul class="investCenter">
                        <li>유망센터선정</li>
                        <li>기업선정</li>
                        <li>기업가치분석</li>
                        <li>시스템분석</li>
                        <li>투자결정</li>
                        <li>최종투자</li>
                        <li>리스크관리</li>
                    </ul>
                </div>

            </div>
            <div id="div2" class="tab_contents">
                <div class="story type2 type3">
                    <div class="storyTitle type2">퍼스트원투자자문 운용역/애널리스트</div>
                    <div class="storyTitle2 type2">“퍼스트원은  대한민국 최고의 엘리트 전문가들의 집단입니다.”</div>
                    <div class="storyTitle4 type2">퍼스트원의 엘리트 증권인재들은  시장상황 분석, 수급파악 , 리스크 관리를 철두철미하게니다.
                    특히 투자에 있어서 중요한 것은  타당한 논리와 판단입니다.  그 각각의 논리를   분야별
                    엘리트전문가들이 분석을 하기 때문에,  성공확률이 높습니다.   <br>
                    퍼스트원은 각 단계별 엄격한 프로세스를 거쳐 최고의 기업을 선별합니다.
                    </div>
                    <img src="/resources/f1k/img/story3.png" alt="">
                </div>
                <div class="boxType1">
                    <p class="radiusBox">시장상황분석</p>
                    <p class="textType1">글로벌 메크로 한축인  금리, 환율, 유가  3대 변수를 고려한  정확한 마켓 타이밍  선정 <br>
                    전일 유럽/미국시장 주요섹터(산업)의  분석을 통해  당일 한국시장 방향성 파악!!    <br>
                    트렌드  생성 Relative Strenth Index 를 활용한  시장  과매도, 과매수  의사결정 <br>
                    </p>
                </div>
                <div class="treeBox">
                    <p class="treeTop">글로벌 매크로 및 시장</p>
                    <p class="treebtm"><span>Trading</span>Streategy</p>
                    <p class="treebtm type2"><span>Globle</span> Fundamenta</p>
                    <p class="treebtm type3"><span>Macro</span> sensitivity</p>
                </div>
                <div class="treeBox">
                    <p class="treeTop">산업 메가트렌드</p>
                    <p class="treebtm"><span>Industry</span> valuation</p>
                    <p class="treebtm type2"><span>Trands</span> analysis</p>
                    <p class="treebtm type3"><span>Stock</span> estimate</p>
                </div>
                <div class="proceedBox">
                    <p class="proceedTitle">시장상황 판단 의사결정 과정</p>
                    <ul>
                        <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed1.png" alt="">
                                <span>Macro 분석</span>
                            </div>
                        </li>
                         <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed2.png" alt="">
                                <span>자금유출입 분석</span>
                            </div>
                        </li>
                         <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed3.png" alt="">
                                <span>시장 위험도 평가</span>
                            </div>
                        </li>
                         <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed4.png" alt="">
                                <span>투자 판단</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="div3" class="tab_contents">
                <div class="boxType1">
                    <p class="radiusBox">수급전문가</p>
                    <p class="textType1">1.글로벌 자금유입의 데이터를 통해  외국인 순매매 섹터,  순매도 섹터 분석<br>
                    2.종목별 메이저 기관계 자금(금융투자, 투자신탁, 연기금)과  유럽계, 미국계  자금 유입 판단   <br>
                    3.퍼스트원 HTS 로  당일 수급흐름  모니터링,  주포의 자금유입 흔적 파악 <br>
                    </p>
                </div>
                <div class="treeBox">
                    <p class="treeTop">메이저 자금 유입 판단</p>
                    <p class="treebtm"><span>Market share’s</span> blance</p>
                    <p class="treebtm type2"><span>Supply</span> and demand</p>
                    <p class="treebtm type3"><span>Judge</span> mayjor’s S/D</p>
                </div>
                <div class="treeBox">
                    <p class="treeTop">세력 주포 포착</p>
                    <p class="treebtm"><span>Search force’s</span> share</p>
                    <p class="treebtm type2"><span>Stock’s</span> counter analysis</p>
                    <p class="treebtm type3"><span>Monitor</span> maket sweep</p>
                </div>
                <div class="proceedBox">
                    <p class="proceedTitle">수급판단 세부 프로세서</p>
                    <ul>
                        <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed5.png" alt="">
                                <span>증시 자금 추이 파악</span>
                            </div>
                        </li>
                         <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed6.png" alt="">
                                <span>유망업종별 분포확인</span>
                            </div>
                        </li>
                         <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed7.png" alt="">
                                <span>주포 매집흔적, 단가파악</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="div4" class="tab_contents">
                <div class="liskBox">
                    <dl>
                        <dt>
                            <div class="dtbox">01<em>/</em><span>첫째</span></div>
                        </dt>
                        <dd>투자종목에 대한 실시간 가격변동 모니터링</dd>
                        <dt>
                            <div class="dtbox">02<em>/</em><span>둘째</span></div>
                        </dt>
                        <dd>대주주 및 주포의 유동성 상시 확인</dd>
                        <dt>
                            <div class="dtbox">03<em>/</em><span>셋째</span></div>
                        </dt>
                        <dd>투자종목의 신용등급과 재무상황 변동 등 확인</dd>
                        <dt>
                            <div class="dtbox">04<em>/</em><span>넷째</span></div>
                        </dt>
                        <dd>급변상황 발생시 투자자들에게 핫 라인을 연결(시장위험/개별위험)</dd>
                    </dl>
                </div>
                <div class="proceedBox">
                    <p class="proceedTitle">리스크 관리 판단 세부 프로세서</p>
                    <ul>
                        <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed8.png" alt="">
                                <span>위험판단</span>
                            </div>
                        </li>
                        <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed9.png" alt="">
                                <span>모니터링</span>
                            </div>
                        </li>
                        <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed10.png" alt="">
                                <span>투자금지</span>
                            </div>
                        </li>
                        <li>
                            <div class="proWrap">
                                <img src="/resources/f1k/img/proceed11.png" alt="">
                                <span>상황보고</span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>