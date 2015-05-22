$(function(){
	//新手引导
	var isHomeTip = getCookie("home_guide");
	if(!isHomeTip){
		var hei = $("body").height();
		$("#hover_bg").height(hei);
		setCookie("home_guide",1,7); //默认7天执行一次
		showTip(1);
	}
	function showTip(a){
		if(a==0){
			$("#hover_bg").hide();
			$("#hover_two").hide();
			//setCookie("home_tip",1,9999999);
			
		}else if(a==1){
			$("#hover_bg").show();
			$("#hover_one").show();
			$(".search_box").css('z-index','10002');
		
		}else if(a==2){
			$(".search_box").css('z-index','1');
			$("#hover_one").hide();
			$("#hover_bg").show();
			$("#hover_two").show();
			$("#zhe_body").css('z-index','10002');
		}
	}
})
