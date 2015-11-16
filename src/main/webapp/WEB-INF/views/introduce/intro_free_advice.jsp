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
                        <div>아이앤티컴즈(주) 의인터넷 서비스(이하 ^서비스^라 합니다)를 이용함에 있어 회원님이 식스에 제공하신 개인정보가 엄격하게 보호받을 수 있도록 최선을 다하고 있으며 이를 위한 시책으로 개인정보 정책을 제정하여 시행하고 있습니다. 또한 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신 서비스 제공자가 준수하여야 할 관련 법규상의 개인정보보호 규정 및 정보통신부가 제정한 개인정보보호지침을 준수하고 있습니다. 아이앤티컴즈(주), 식스 개인정보보호정책은 정부의 법률 및 지침의 변경과 아이앤티컴즈(주), 식스의 정책 변화에 따라 변경될 수 있습니다. 회원님께서는 청아이앤티컴즈(주), 식스 사이트 방문 시에 수시로 확인하시기 바랍니다. 아이앤티컴즈(주), 식스의 개인정보 보호정책은 다음과 같은 내용을 담고 있습니다.</div><div>&nbsp;</div><div>1.수집하는 개인정보의 항목 및 수집방법</div><div>&nbsp;</div><div>2.개인정보의 수집 및 이용목적</div><div>&nbsp;</div><div>3.개인정보 제공 및 공유</div><div>&nbsp;</div><div>4.수집한 개인정보의 취급위탁</div><div>&nbsp;</div><div>5.개인정보의 보유 및 이용기간</div><div>&nbsp;</div><div>6.개인정보 파기절차 및 방법</div><div>&nbsp;</div><div>7.이용자 및 법정대리인의 권리와 그 행사방법</div><div>&nbsp;</div><div>8.개인정보 자동 수집 장치의 설치,운영 및 그거부에 관한사항</div><div>&nbsp;</div><div>9.개인정보에 대한 민원처리 및 분쟁해결</div><div>&nbsp;</div><div>10.개인정보관리책임자&nbsp;</div><div>&nbsp;</div><div>1. 수집하는 개인정보의 항목 및 수집방법&nbsp;</div><div>&nbsp;</div><div>1) 수집하는 개인정보 항목</div><div>&nbsp;아이앤티컴즈(주), 식스는 회원 식별 및 서비스 제공을 위하여 아래와 같은 개인정보를 수집하고 있습니다.</div><div>-이름,이메일주소,휴대폰번호,투자금,로그인 ID(필명),비밀번호</div><div>또한 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.</div><div>-서비스 이용기록,접속로그,쿠키,접속IP정보등&nbsp;</div><div>&nbsp;</div><div>2) 수집방법&nbsp;</div><div>-홈페이지를 통한 회원가입,이벤트 응모</div><div>-생성정보 수집 툴을 통한 수집&nbsp;</div><div>&nbsp;</div><div>2. 개인정보의 수집 및 이용목적&nbsp;</div><div>1) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</div><div>&nbsp;</div><div>-콘텐츠제공,물품배송 또는 청구서 등 발송,금융거래 본인 인증 및 금융서비스,구매 및 요금 결제&nbsp;</div><div>2) 회원관리&nbsp;</div><div>-회원제 서비스 이용에 따른 본인확인,개인 식별,불량회원의 부정 이용 방지와 비인가 사용방지,가입의사확인 불만처리 등 민원처리,고지사항 전달&nbsp;</div><div>3) 마케팅 및 광고에 활용&nbsp;</div><div>-신규 서비스 개발 및 특화, 이벤트 등 광고성 정보 전달,인구통계학적 특성에 따른 서비스 제공 및 광고게재, 접속 빈도 파악,회원의 서비스 이용에 대한 통계&nbsp;</div><div>&nbsp;</div><div>3. 개인정보 제공 및 공유&nbsp;</div><div>아이앤티컴즈(주), 식스는 회원님의 개인정보를 "2. 개인 정보의 수집 및 이용목적"에서 고지한 범위 내에서 사용하며, 회원님의 사전 동의 없이는 동 범위를 초과하여 이용하거나 회원님의 개인정보를 외부에 공개하지 않습니다.</div><div>단, 아래의 경우에는 예외로 합니다.</div><div>1) 회원님께서 사전에 동의한 경우</div><div>2) 법령의 규정에 의하거나 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우&nbsp;</div><div>&nbsp;</div><div>4. 수집한 개인정보의 취급위탁&nbsp;</div><div>아이앤티컴즈(주), 식스는 회원님의 동의 없이 회원님의 개인정보 취급을 외부 업체에 위탁하지 않습니다.</div><div>향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.&nbsp;</div><div>&nbsp;</div><div>5. 개인정보의 보유 및 이용기간&nbsp;</div><div>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.&nbsp;</div><div>단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.</div><div>&nbsp;</div><div>1) 회원 탈퇴시 보존 개인 정보&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div><div>- 보존 항목 : 필명, 탈퇴일, 이름, 회원번호,이메일 탈퇴사유</div><div>- 보존 근거 : 불량이용자의 재가입 방지, 명예훼손 등 권리침해 분쟁 및 수사 협조</div><div>- 보존 기간 : 회원탈퇴 후 1개월&nbsp;</div><div>2) 대금결제 관련 보존 개인 정보&nbsp;</div><div>- 보존 항목 : 대금결제 이력</div><div>- 보존 근거 : 전자상거래등에서의 소비자 보호에 관한 법률</div><div>- 보존 기간 : 회원탈퇴 후 5년&nbsp;</div><div>&nbsp;</div><div>6. 개인정보 파기절차 및 방법&nbsp;</div><div>회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.&nbsp;</div><div>파기절차 및 방법은 다음과 같습니다.</div><div>&nbsp;</div><div>1) 파기절차&nbsp;</div><div>&nbsp;</div><div>회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 회원정보 DB에서내부 방침 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.&nbsp;</div><div>동 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</div><div>&nbsp;</div><div>2) 파기방법&nbsp;</div><div>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.&nbsp;</div><div>&nbsp;</div><div>7. 이용자 및 법정대리인의 권리와 그 행사방법&nbsp;</div><div>이용자 및 법정대리인은 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입 해지를 요청할 수도 있습니다. 이용자의 개인정보 조회•수정을 위해서는 "회원정보변경"을, 가입 해지시에는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.&nbsp;</div><div>혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다.&nbsp;</div><div>귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.</div><div>회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.&nbsp;</div><div>&nbsp;</div><div>8. 개인정보 자동 수집 장치의 설치,운영 및 그거부에 관한사항&nbsp;</div><div>회사는 회원님에게 특화된 맞춤 서비스를 제공하기 위해서 회원님의 정보를 저장하고 수시로 불러오는 ^쿠키(cookie)^를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다.&nbsp;</div><div>1) 쿠키의 사용 목적&nbsp;</div><div>&nbsp;</div><div>회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스를 제공하기 위하여 사용됩니다.&nbsp;</div><div>2) 쿠키의 설치 및 거부 방법&nbsp;</div><div>귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다.</div><div>따라서, 귀하는 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수 있습니다.&nbsp;</div><div>설정방법 예) 인터넷 익스플로어의 경우&nbsp;</div><div>웹 브라우저 상단의 [도구 &gt; 인터넷 옵션 &gt; 개인정보]</div><div>단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div><div>9. 개인정보에 대한 민원처리 및 분쟁해결&nbsp;</div><div>아이앤티컴즈(주), 식스는 개인정보보호와 관련하여 회원님들의 의견 수렴과 불만처리를 위하여 모든 절차와 방법을 마련하고 있습니다.</div><div>회원님들은 하단에 명시한 ^개인정보관리책임자^를 참고하여 전화나 메일을 통하여 불만사항을 신고할 수 있고, 온라인 고객센터를 이용하여 보다 편리하게 민원을 접수하실 수 있습니다. 아이앤티컴즈(주), 식스는 이용자들의 신고사항에 대하여 신속하고 충분한 답변을 드리기 위해 최선을 다하고 있습니다.&nbsp;</div><div>민원처리부서</div><div>- 식스 고객센터 (http://www.six.or.kr)</div><div><br></div><div>필요하신 경우 정부에서 설치하여 운영중인 아래의 기관에 불만처리를 신청할 수 있습니다.&nbsp;</div><div>분쟁조정기관</div><div>- 개인정보 침해신고센터 (http://www.cyberprivacy.or.kr, 전화 1336)&nbsp;</div><div>- 개인정보 분쟁조정위원회 (http://www.kopico.or.kr, 전화 1336)&nbsp;</div><div>- 정보보호마크 인증위원회 (http://www.privacymark.or.kr, 전화 02-580-0533)</div><div>- 경찰청 (http://www.police.go.kr)&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div><div>10. 개인정보관리책임자&nbsp;</div><div>아이앤티컴즈(주), 식스는 회원님들께서 좋은 정보를 안전하게 이용하실 수 있도록 최선을 다하고 있습니다. 만일 개인정보를 보호하는데 있어 회원님께 고지한 사항들에 반하는 사고가 발생할 경우 개인정보관리책임자가 책임을 집니다. 단 이용자 개인정보와 관련한 필명의 비밀번호에 대한 보안유지책임은 해당 이용자 자신에게 있으므로 ^개인정보보호를 위한 기술적-관리적 대책^ 항에서 명시한 것과 같이 공공장소에서 온라인상에서 접속해 있을 경우에는 각별히 유의하셔야 합니다. 회사는 개인정보에 대한 의견수렴 및 불만처리를 담당하는 개인정보 관리책임자 및 담당자의 연락처는 아래와 같습니다.</div><div>&nbsp;</div><div>개인정보관리책임자&nbsp;</div><div>이 름: 박준상</div><div>직 위: 대표</div><div><br></div><div>개인정보관리담당자</div><div>이 름: 민병철</div><div>직 위: 대리</div><div>전화번호 : 02-6112-6853</div><div>팩스 : 02-6112-6859</div><div>&nbsp;</div><div>개인정보보호정책 버전번호 : 1.0</div><div>개인정보보호정책 시행일자 : 2015년 10월 23일</div><div><br></div>
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
                                <input type="radio" name="first_term3" id="mount" class="ml_0">
                                <label for="mount">500만원 내외</label>
                                <input type="radio" name="first_term3" id="mount2">
                                <label for="mount2">1,000만원 내외</label>
                                <input type="radio" name="first_term3" id="mount3">
                                <label for="mount3">5,000만원 내외</label>
                                <input type="radio" name="first_term3" id="mount4">
                                <label for="mount4">1억원 내외</label>
                                <input type="radio" name="first_term3" id="mount5">
                                <label for="mount5">5억원 내외</label>
                                <input type="radio" name="first_term3" id="mount6">
                                <label for="mount6">10억원 내외</label>
                            </div>
                        </li>
                        <li>
                            <p class="advice_title">2</p>
                            <div class="advice_select">
                                <p class="question_title">귀하의 투자 <span>스타일</span>은?</p>
                                <input type="radio" name="first_term4" id="style1" class="ml_0">
                                <label for="style1">단기투자</label>
                                <input type="radio" name="first_term4" id="style2">
                                <label for="style2">중기투자</label>
                                <input type="radio" name="first_term4" id="style3">
                                <label for="style3">장기투자</label>
                            </div>
                        </li>
                        <li>
                            <p class="advice_title">3</p>
                            <div class="advice_select">
                                <p class="question_title">귀하의 <span>현재</span>재투자 실적은?</p>
                                <input type="radio" name="first_term5" id="style4" class="ml_0">
                                <label for="style4">수익중</label>
                                <input type="radio" name="first_term5" id="style5">
                                <label for="style5">손실중</label>
                                <input type="radio" name="first_term5" id="style6">
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
                                    </th><td class="bb_line1"><input type="text" class="input_type1"></td>
                                </tr>
                                <tr>
                                    <th class=""><span class="essential">휴대폰</span></th>
                                    <td class="">
                                        <select name="" id="">
                                            <option value="">010</option>
                                            <option value="">011</option>
                                            <option value="">016</option>
                                            <option value="">017</option>
                                            <option value="">018</option>
                                            <option value="">019</option>
                                        </select>
                                         -
                                        <input type="text" class="input_type1 type4"> - <input type="text" class="input_type1 type4">
                                    </td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">이메일</span>
                                    </th><td class="bb_line1"><input type="text" class="input_type1 type2">@<input type="text" class="input_type1 type3"><button class="btn_type1">중복확인</button></td>
                                </tr>
                                <tr>
                                    <th class="bb_line1"><span class="essential">상담신청내용</span>
                                    </th><td class="bb_line1"><textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:412px;">
                                    	${boardInfo.CONTENTS}
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