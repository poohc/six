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
                <li><a href="sub6_list.html">상담게시판</a></li>
            </ul>
        </div>
        <div class="contents">
            <h1>상담게시판</h1>
            <div class="selectbox_area">
                <form action="">
                    <div class="left_area">
                        <p class="total_page">Total <span>754</span> (2/42page)</p>
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
                        <col style="width:11%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">답변여부</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">김준호 님의 질문입니다. </a></td>
                            <td><span class="completeBox">완료</span></td>
                            <td>모선우</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html"><img src="../img/enter.png" alt="" class="enter">답변</a></td>
                            <td></td>
                            <td>관리자</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">김준호 님의 질문입니다. </a></td>
                            <td><span class="completeBox type2">대기</span></td>
                            <td>모선우</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html"><img src="../img/enter.png" alt="" class="enter">답변</a></td>
                            <td></td>
                            <td>관리자</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">김준호 님의 질문입니다. </a></td>
                            <td><span class="completeBox type2">대기</span></td>
                            <td>모선우</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">김준호 님의 질문입니다. </a></td>
                            <td><span class="completeBox type2">대기</span></td>
                            <td>모선우</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">김준호 님의 질문입니다. </a></td>
                            <td><span class="completeBox type2">대기</span></td>
                            <td>모선우</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">김준호 님의 질문입니다. </a></td>
                            <td><span class="completeBox type2">대기</span></td>
                            <td>모선우</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">김준호 님의 질문입니다. </a></td>
                            <td><span class="completeBox type2">대기</span></td>
                            <td>모선우</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                        <tr>
                            <th scope="row">22</th>
                            <td class="left"><a href="sub5_view.html">김준호 님의 질문입니다. </a></td>
                            <td><span class="completeBox">완료</span></td>
                            <td>모선우</td>
                            <td>2015-03-23</td>
                            <td>166</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="pagingWrap">
                <div class="paging"><!-- paging -->
                    <a class="first">처음페이지</a>
                    <a class="prev">이전페이지</a>
                    <a class="on">1</a>
                    <a>2</a>
                    <a>3</a>
                    <a>4</a>
                    <a>5</a>
                    <a>6</a>
                    <a>7</a>
                    <a>8</a>
                    <a>9</a>
                    <a>10</a>
                    <a class="next">다음페이지</a>
                    <a class="last">마지막페이지</a>
                </div>
                <button class="pagingRight">글쓰기</button>
            </div>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>