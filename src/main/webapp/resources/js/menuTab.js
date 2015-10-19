//메인페이지에 쓰는 JS
// 탭메뉴
(function($){
	$(document).ready(function(){
		document.getElementsByTagName('body')[0].className = 'js';
		$('.tabMenu .tab a').bind('click focusin',function(){
			$('.tabMenu .wrap').removeClass('on');
			$(this).parent().parent().addClass('on');
		});

	});
})(window.jQuery);

// 탭메뉴2
(function($){
	$(document).ready(function(){
		document.getElementsByTagName('body')[0].className = 'js';
		$('.tabMenu2 .tab a').bind('click focusin',function(){
			$('.tabMenu2 .wrap').removeClass('on');
			$(this).parent().parent().addClass('on');
		});

	});
})(window.jQuery);


//메인 탑메뉴 이벤트 처리함수
function showPullDown(btnObj){
	var idx = $(".btnPullDown").index(btnObj);
	$(".pullDown").hide();
	var obj = $(".pullDown").eq(idx);
	var CSS ={

	};

	obj.css(CSS).show(0, function (){
		$("#menuwrap").unbind("mouseover").bind("mouseover", function (){
			return false;
		});

		obj.unbind("mouseover").bind("mouseover", function (){
			return false;
		});

		$("BODY").unbind("mouseover").bind("mouseover", function (){
			obj.hide();
			$("BODY").unbind("mouseover");
			return false;
		});

		obj.find("a").eq(obj.find("a").size()-1).unbind("blur").bind("blur", function (){
			obj.hide();
			obj.find("a").eq(obj.find("a").size()-1).unbind("blur");
			return false;
		});
	});
}

$(document).ready(function (){

	//탑메뉴 히든처리
	$(".pullDown").hide();

	//상단 메뉴들 오버시 이벤트 처리
	$(".btnPullDown").mouseover(function (){
		showPullDown($(this));
	}).focus(function (){
		showPullDown($(this));
	}).css("cursor", "pointer");

});


//<![CDATA[
$(document).ready(function(){
	//$('.linkfamily button').click(function() {
		//$('.linkfamily button').next().hide();
		//$(this).next().show();
	//});

	$('.linkfamily button').click(function() {
		$(this).next().slideToggle(300);
	});// footer family site
});
//]]>


