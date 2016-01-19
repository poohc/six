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
                <li><a href="sub5_list.html">공지사항</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>공지사항</h1>
            <div class="selectbox_area">
                <form action="">
                    <div class="left_area">
                        <p class="total_page">Total <span>59</span> 건</p>
                    </div>
                    <div class="right_area">
                        <span class="selectbox">
                            <select id="title" title="제목/내용">
                                <option value="제목/내용" selected="selected">제목/내용</option>
                                <option value="제목">제목</option>
                                <option value="내용">내용</option>
                            </select>
                        </span>
                        <input type="text" title="제목/내용">
                        <button type="submit" class="btn_search" title="검색">검색</button>
                    </div>
                </form>
            </div>
            <div class="board_list"><!-- board_list -->
                <table>
                    <caption>고객소리함</caption>
                    <colgroup>
                        <col style="width:11%">
                        <col style="width:auto%">
                        <col style="width:11%">
                        <col style="width:11%">
                        <col style="width:11%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="cell_hid" scope="col">NO</th>
                            <th scope="col">제목</th>
                            <th class="cell_hid" scope="col">작성자</th>
                            <th scope="col">등록일</th>
                            <th class="cell_hid" scope="col">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="new">
                            <th class="cell_hid" scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내 <img src="../img/newbtn.png" alt="뉴버튼"> <img src="../img/clip.png" alt="첨부파일"></a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr class="new">
                            <th class="cell_hid" scope="row">21</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내 <img src="../img/newbtn.png" alt="뉴버튼"><img src="../img/clip.png" alt="첨부파일"></a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr>
                            <th class="cell_hid" scope="row">20</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내</a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr>
                            <th class="cell_hid" scope="row">20</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내</a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr>
                            <th class="cell_hid" scope="row">18</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내</a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr>
                            <th class="cell_hid" scope="row">17</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내</a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr>
                            <th class="cell_hid" scope="row">16</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내</a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr>
                            <th class="cell_hid" scope="row">15</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내</a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr>
                            <th class="cell_hid" scope="row">14</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내</a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                        <tr>
                            <th class="cell_hid" scope="row">13</th>
                            <td class="left"><a href="sub5_view.html">전라남도해양생물연구개발사업 공고 안내</a></td>
                            <td class="cell_hid">관리자</td>
                            <td>2015-03-23</td>
                            <td class="cell_hid">166</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="paging"><!-- paging -->
                <a href="#" class="first">처음페이지</a>
                <a href="#" class="prev">이전페이지</a>
                <a href="#" class="on">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#">7</a>
                <a href="#">8</a>
                <a href="#">9</a>
                <a href="#">10</a>
                <a href="#" class="next">다음페이지</a>
                <a href="#" class="last">마지막페이지</a>
            </div>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>