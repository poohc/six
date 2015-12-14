<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function goFreeInfo(){
		$('#frm').attr('action','/partner/partnerFreeInfo.do');
		$('#category').val('FREE_INFO');
		$('#frm').submit();
	}
	
	function goPaidInfo(){
		$('#frm').attr('action','/partner/partnerPaidInfo.do');
		$('#category').val('PAID_INFO');
		$('#frm').submit();
	}
</script>
<div class="about_six">
    <p class="about_sixtitle">SIX 파트너스</p>
    <ul class="about_sixlist">
        <li id="partner1"><a href="javascript:goFreeInfo()">무료정보<span></span></a></li>
        <li id="partner2"><a href="javascript:goPaidInfo()">유료정보<span></span></a></li>
    </ul>
</div>
<div class="left_ad">
    <img src="/resources/img/side_banner.png" alt="SIX왼쪽배너">
</div>