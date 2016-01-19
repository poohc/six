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
            <div class="board_view"><!-- board_view -->
                <table>
                    <caption>2015년 6월 영업보고서</caption>
                    <colgroup>
                        <col style="width:%">
                        <col style="width:%">
                        <col style="width:35%;">
                        <col style="width:%">
                        <col style="width:%">
                        <col style="width:%">
                        <col style="width:%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" colspan="7">
                            <p class="t_title">2015년 06월 영업 보고서</p>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">작성자</th>
                        <td>최고관리자</td>
                        <td class="cell_hid"></td>
                        <th scope="row">등록일</th>
                        <td>2015-03-23</td>
                        <td class="cell_hid">조회수</td>
                        <td class="cell_hid">60</td>
                    </tr>
                    <tr>
                        <td colspan="7" class="text">
                            <p>
                                <strong>2015년 06월 영업보고서에 대한 내용입니다.</strong><br><br>

                                2015년 06월 영업보고서에 대한 내용입니다. 2015년 06월 영업보고서에 대한 내용입니다. 2015년 06월 영업보고서에 대한 내용입니다. 2015년 06월 영업보고서에 대한

                                ○ 사 업 명 : 사업명에 대한 영역입니다. <br>
                                ○ 사업목적 : 사업목적에 대한 영역입니다.  <br>
                                ○ 사업규모 : 사업규모에 대한 영역입니다. <br>
                                ○ 지원대상 : 지원대상에 대한 영역입니다. <br>
                                ○ 지원형태 : 지원형태에 대한 영역입니다. <br>
                                ○ 내용 타이틀 : 내용 타이틀에 대한 영역입니다. <br>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">첨부파일</th>
                        <td colspan="6" class="add_file">
                            <ul>
                                <li><a href="#" class="file_title">2015년_06월_영업보고서.hwp</a></li>
                                <li><a href="#" class="file_title2">2015년_06월_영업보고서.hwp</a>
                            </li></ul>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_box">
                <div class="left_boxs">
                    <a href="#" class="btn_type2">수 정</a>
                    <a href="#" class="btn_type3">삭제</a>
                </div>
                <div class="right_boxs">
                    <a href="#" class="btn_type1">목 록</a>
                </div>
            </div>
            <div class="board_view bt_1"><!-- board_view -->
                <table>
                    <colgroup>
                        <col style="width:12%">
                        <col style="width:%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="row" class="pre_text"><a href="#">이전글</a></th>
                        <th class="pre_next"><a href="#">2015년 09월 영업보고서.hwp</a></th>
                    </tr>
                    <tr>
                        <th class="next_text"><a href="#">다음글</a></th>
                        <th class="pre_next2"><a href="#">2015년_06월_영업보고서.hwp</a></th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
	</div>
	<!-- //container -->
    <jsp:include page="./common/footer.jsp" />
</body>
</html>