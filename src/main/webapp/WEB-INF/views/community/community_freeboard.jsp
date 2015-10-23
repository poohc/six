<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$('#community1').addClass("on");	
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
                <jsp:include page="../common/community_menu.jsp" />
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
                <img src="/resources/img/trade1.jpg" alt="" class="top_mainimg">
                <div class="right_contents type2">
                    <p class="title_type1">자유게시판</p>
                    <ul class="navi_map">
                        <li><a href="#">커뮤니티 &gt;</a></li>
                        <li><a href="#">자유게시판</a></li>
                    </ul>
                    <div class="table_top">
                        <p class="table_type1title2">무료종목도 좋은 정보를 제공합니다.</p>
                        <div class="table_rightarea">
                            <select name="titleandcontent" id="titleandcontent" title="분류">
                                <option value="제목">제목</option>
                                <option value="제목">내용</option>
                            </select>
                            <input type="text">
                            <button>검색</button>
                        </div>
                    </div>
                    <div class="table_type1">
                        <table>
                            <caption>공지사항</caption>
                            <colgroup>
                                <col style="width:7%;">
                                <col style="width:62%;">
                                <col style="width:7%;">
                                <col style="width:17%;">
                                <col style="width:7%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="new">
                                    <td>999</td>
                                    <td class="t_l"><a href="#"><span class="notice_bul">공지</span>알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td><img src="/resources/img/master.png" alt="six"></td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="new">
                                    <td>999</td>
                                    <td class="t_l"><a href="#"><span class="notice_bul">공지</span>알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td><img src="/resources/img/master.png" alt="six"></td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                                <tr class="">
                                    <td>999</td>
                                    <td class="t_l"><a href="#">알리바바 한국 진출설…국내 IT업계 "승산 있다"</a></td>
                                    <td>앨리스</td>
                                    <td>2015-09-20</td>
                                    <td>3125</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_bottom">
                        <a href="#" class="go_list">목록으로</a>
                        <ul class="table_option">
                            <li><a href="#">삭제</a></li>
                            <li><a href="#">취소</a></li>
                            <li><a href="#">수정</a></li>
                            <li class="on"><a href="#">글쓰기</a></li>
                        </ul>
                    </div>
                    <div class="paging">
                        <a href="#" class="prev2"><img src="/resources/img/prev2.png" alt="이전"></a>
                        <a href="#" class="prev1"><img src="/resources/img/prev1.png" alt="이전"></a>
                        <ul class="paging_list">
                            <li class="on"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li><a href="#">7</a></li>
                            <li><a href="#">8</a></li>
                            <li><a href="#">9</a></li>
                            <li><a href="#">10</a></li>
                        </ul>
                        <a href="#" class="next1"><img src="/resources/img/next1.png" alt="이전"></a>
                        <a href="#" class="next2"><img src="/resources/img/next2.png" alt="이전"></a>
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