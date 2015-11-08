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
	$('#info2').addClass("on");	
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
                <jsp:include page="../common/info_menu.jsp" />
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
                    <p class="title_type1">SIX비기</p>
                    <div class="table_top">
                        <p class="table_type1title2"><span>데이터를 이용한 투자 기법을 제공해 드립니다.</span></p>
                        <div class="table_rightarea">
                            <select name="titleandcontent" id="titleandcontent" title="분류">
                                <option value="제목">제목</option>
                                <option value="제목">내용</option>
                            </select>
                            <input type="text">
                            <button>검색</button>
                        </div>
                    </div>
                    <div class="table_type1_view type2">
                        <table>
                            <caption>공지사항</caption>
                            <colgroup>
                                <col style="width:12%;">
                                <col style="width:12%;">
                                <col style="width:52%;">
                                <col style="width:12%;">
                                <col style="width:12%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th colspan="5">증권전용 무료 인증서 발급을 어떻게 받아야 하나요?</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="right_bul tl_c">홍길동</td>
                                    <td class="tl_c">조회수 132</td>
                                    <td></td>
                                    <td class="right_bul type2 tl_c">등록일</td>
                                    <td class="tl_c">2015-09-24</td>
                                </tr>
                                <tr class="">
                                    <td colspan="5" class="td_lh">증권전용 공인인증서 무료 발급 알고 싶습니다.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table_comment type3">
                        <p class="comment_title1">댓글쓰기</p>
                        <textarea class="com_text" name="" id="" cols="30" rows="10" placeholder="댓글을 달아주세요.  최대 100자까지 작성할 수 있습니다. 악플은 제재 및 삭제될 수 있습니다. "></textarea>
                        <button class="com_btn">등록하기</button>
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
                    <ul class="com_list">
                        <li>
                            <div class="com_top">
                                <ul class="com_top1">
                                    <li>SIX 매니저</li>
                                    <li>2015-09-20</li>
                                </ul>
                                <ul class="com_top2">
                                    <li><a href="#">답글</a></li>
                                    <li><a href="#">수정</a></li>
                                    <li><a href="#">취소</a></li>
                                    <li><a href="#">삭제</a></li>
                                </ul>
                            </div>
                            <p class="comment_content">부산서 서울이 4시간 20분밖에 안걸렸어?자동차로? 빠르네.... 기차 무궁화호는 젤빠른게 4시간 50분인데.새마을은 4시간20분KTX도 고작 2시간 25분 </p>
                        </li>
                        <li class="type2">
                            <div class="com_top">
                                <ul class="com_top1">
                                    <li>SIX 매니저</li>
                                    <li>2015-09-20</li>
                                </ul>
                                <ul class="com_top2">
                                    <li><a href="#">답글</a></li>
                                    <li><a href="#">수정</a></li>
                                    <li><a href="#">취소</a></li>
                                    <li><a href="#">삭제</a></li>
                                </ul>
                            </div>
                            <p class="comment_content">부산서 서울이 4시간 20분밖에 안걸렸어?자동차로? 빠르네.... 기차 무궁화호는 젤빠른게 4시간 50분인데.새마을은 4시간20분KTX도 고작 2시간 25분 </p>
                        </li>
                        <li class="type3">
                            <div class="table_comment type2">
                                <p class="comment_title1">댓글쓰기</p>
                                <textarea class="com_text" name="" id="" cols="30" rows="10" placeholder="댓글을 달아주세요.  최대 100자까지 작성할 수 있습니다. 악플은 제재 및 삭제될 수 있습니다. "></textarea>
                                <button class="com_btn">등록하기</button>
                            </div>
                        </li>
                        <li>
                            <div class="com_top">
                                <ul class="com_top1">
                                    <li>SIX 매니저</li>
                                    <li>2015-09-20</li>
                                </ul>
                                <ul class="com_top2">
                                    <li><a href="#">답글</a></li>
                                    <li><a href="#">수정</a></li>
                                    <li><a href="#">취소</a></li>
                                    <li><a href="#">삭제</a></li>
                                </ul>
                            </div>
                            <p class="comment_content">부산서 서울이 4시간 20분밖에 안걸렸어?자동차로? 빠르네.... 기차 무궁화호는 젤빠른게 4시간 50분인데.새마을은 4시간20분KTX도 고작 2시간 25분 </p>
                        </li>
                        <li>
                            <div class="com_top">
                                <ul class="com_top1">
                                    <li>SIX 매니저</li>
                                    <li>2015-09-20</li>
                                </ul>
                                <ul class="com_top2">
                                    <li><a href="#">답글</a></li>
                                    <li><a href="#">수정</a></li>
                                    <li><a href="#">취소</a></li>
                                    <li><a href="#">삭제</a></li>
                                </ul>
                            </div>
                            <p class="comment_content">부산서 서울이 4시간 20분밖에 안걸렸어?자동차로? 빠르네.... 기차 무궁화호는 젤빠른게 4시간 50분인데.새마을은 4시간20분KTX도 고작 2시간 25분 </p>
                        </li>
                    </ul>
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
            
        </div>
	</div>
	<!-- //container -->
	
</div>
</body>
</html>