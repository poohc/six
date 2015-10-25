<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
$(document).ready(function(){
	$('#intro2').addClass("on");
	
	 $.ajax({
         url : "/resources/daumEditor/daumEditor.html",
         success : function(data){
             $("#editor_frame").html(data);
             // 에디터UI load
             var config = {
                 /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
                 txHost: '', 
                 /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
                 txPath: '', 
                 /* 수정필요없음. */
                 txService: 'sample', 
                 /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
                 txProject: 'sample',
                 /* 대부분의 경우에 빈문자열 */
                 initializedId: "", 
                 /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
                 wrapper: "tx_trex_container",
                 /* 등록하기 위한 Form 이름 */
                 form: "tx_editor_form", 
                 /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
                 txIconPath: "/resouces/daumEditor/images/icon/editor/", 
                 /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
                 txDecoPath: "/resouces/daumEditor/images/deco/contents/", 
                 canvas: {
                     styles: {
                         /* 기본 글자색 */
                         color: "#123456", 
                         /* 기본 글자체 */
                         fontFamily: "굴림", 
                         /* 기본 글자크기 */
                         fontSize: "10pt", 
                         /*기본 배경색 */
                         backgroundColor: "#fff", 
                         /*기본 줄간격 */
                         lineHeight: "1.5", 
                         /* 위지윅 영역의 여백 */
                         padding: "8px"
                     },
                     showGuideArea: false
                 },
                 events: {
                     preventUnload: false
                 },
                 sidebar: {
                     attachbox: {
                         show: true,
                         confirmForDeleteAll: true
                     }
                 },
                 size: {
                     /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
                     contentWidth: 700 
                 }
             };
              
             //에디터내에 환경설정 적용하기
             new Editor(config);
         }
     });
      
     //form submit 버튼 클릭
     $("#save_button").click(function(){
         //다음에디터가 포함된 form submit
         Editor.save();
     })	
});

//Editor.save() 호출 한 다음에 validation 검증을 위한 함수 
//validation 체크해줄 입력폼들을 이 함수에 추가 지정해줍니다.
function validForm(editor) {
    var validator = new Trex.Validator();
    var content = editor.getContent();
    if (!validator.exists(content)) {
        alert('내용을 입력하세요');
        return false;
    }
    return true;
}
  
//validForm 함수까지 true값을 받으면 이어서 form submit을 시켜주는  setForm함수
function setForm(editor) {
    var content = editor.getContent();
    $("#daumeditor").val(content);
    return true;
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
                <img src="/resources/img/trade1.jpg" alt="" class="top_mainimg">
                <div class="right_contents type2">
                    <p class="title_type1">공지사항</p>
                    <ul class="navi_map">
                        <li><a href="#">SIX 소개 &gt;</a></li>
                        <li><a href="#">공지사항</a></li>
                    </ul>
                    <div class="table_top">
                    </div>
                    <div class="table_type1_write">
                        <table>
                            <caption>종목토론방</caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:90%;">
                            </colgroup>
                            <form name="tx_editor_form" id="tx_editor_form" method="post" accept-charset="utf-8" action="/main/introNoticeWriteProcess.do">
                            <tbody>
                                <tr>
                                    <th class="bb_line1">제목</td>
                                    <td class="bb_line1"><input type="text" id="title" name="title"></td>
                                </tr>
                                <tr class="">
                                    <th>내용</td>
                                    <td>
                                    	<div id="editor_frame"></div>
                                    	<textarea name="daumeditor" id="daumeditor" rows="10" cols="100" style="width:766px; height:412px;display: none;"></textarea>
                                    </td>
                                </tr>
                            </tbody>
                            </form>
                        </table>
                    </div>
                    <div class="table_bottom">
                        <a href="#" class="go_list">목록으로</a>
                        <ul class="table_option">
                            <li><a href="#">삭제</a></li>
                            <li><a href="#">취소</a></li>
                            <li><a href="#">수정</a></li>
                            <li><a href="#" id="save_button">글쓰기</a></li>
                        </ul>
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