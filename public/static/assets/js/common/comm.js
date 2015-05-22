/**
 * comm.js
 */
$(function() {

  /**
   * 签到按钮的划出框
   * @type {[type]}
   */
	$(".btn_jfsc,#top-side-box").bind({
        mouseover:function(){
            $("#top-side-box").show();
        },
        mouseout:function(){
            $("#top-side-box").hide();
        }
    });

  /**
   * 登录后的用户菜单
   */
	$(".logined-show").live({
        mouseover:function(){
            $(this).addClass("hover");
        },
        mouseout:function(){
            $(this).removeClass("hover");
        }
    });

  //右侧窗口侧边栏会员中心按钮,检测是否登录
	$('.mark').bind('click', function(){
		if(!$.ftxia.dialog.islogin()) return !1;
	});

});