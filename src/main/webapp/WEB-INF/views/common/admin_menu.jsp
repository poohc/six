<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<header id="header">
		<hgroup>
			<h1 class="site_title"><a href="/admin/adminMain.do">SIX Admin</a></h1>
			<h2 class="section_title">SIX 관리자 페이지</h2>
		</hgroup>
	</header> <!-- end of header bar -->
	
	<section id="secondary_bar">
		<div class="user">
			<p>${sessionScope.userInfo.name} 님</p>
			<!-- <a class="logout_user" href="#" title="Logout">Logout</a> -->
		</div>
		<div class="breadcrumbs_container">
			<article class="breadcrumbs">
				<a href="/admin/adminMain.do">SIX Admin</a> 
				<div class="breadcrumb_divider"></div> 
				<a class="current">Dashboard</a>
			</article>
		</div>
	</section><!-- end of secondary bar -->
	
	<aside id="sidebar" class="column">
		<form class="quick_search">
			<input type="text" value="Quick Search" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
		</form>
		<hr/>
		<h3>CONTENT 관리</h3>
		<ul class="toggle">
			<li class="icn_new_article"><a href="/admin/commonCode.do">공통 코드 관리</a></li>
			<li class="icn_edit_article"><a href="/admin/terms.do">약관 관리</a></li>
			<li class="icn_categories"><a href="/admin/partner.do">파트너 관리</a></li>
			<li class="icn_point"><a href="/admin/point.do">포인트 관리</a></li>
			<li class="icn_counseling"><a href="/admin/counseling.do">SIX_상담신청 관리</a></li>
			<li class="icn_counseling"><a href="/admin/f1kCounseling.do">F1K_상담신청 관리</a></li>
			<li class="icn_alert_info"><a href="/admin/f1kNoticeBoard.do">F1K_공지사항 관리</a></li>
		</ul>
		<h3>회원 관리</h3>
		<ul class="toggle">
			<li class="icn_add_user"><a>회원 생성</a></li>
			<li class="icn_view_users"><a>회원 보기</a></li>
<!-- 			<li class="icn_profile"><a>Your Profile</a></li> -->
		</ul>
<!-- 		<h3>Media</h3> -->
<!-- 		<ul class="toggle"> -->
<!-- 			<li class="icn_folder"><a>File Manager</a></li> -->
<!-- 			<li class="icn_photo"><a>Gallery</a></li> -->
<!-- 			<li class="icn_audio"><a>Audio</a></li> -->
<!-- 			<li class="icn_video"><a>Video</a></li> -->
<!-- 		</ul> -->
<!-- 		<h3>Admin</h3> -->
<!-- 		<ul class="toggle"> -->
<!-- 			<li class="icn_settings"><a>Options</a></li> -->
<!-- 			<li class="icn_security"><a>Security</a></li> -->
<!-- 			<li class="icn_jump_back"><a>Logout</a></li> -->
<!-- 		</ul> -->
		
		<footer>
			<hr />
			<p><strong>Copyright &copy; 2011 Website Admin</strong></p>
			<p>Theme by <a href="http://www.medialoot.com">MediaLoot</a></p>
		</footer>
	</aside>    