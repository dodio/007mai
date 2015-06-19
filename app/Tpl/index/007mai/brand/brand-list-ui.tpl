
<div class="bmain container group">
    <div class="slide-logos group">
    <span class="prev-btn" style="display: inline;"></span>
    <span class="next-btn" style="display: inline;"></span>
    <div class="logos-box">
      <ul>
      <li>
      <volist name="brands" id="val" mod="20">
        <a href="{:U('brand/dlist',array('uid'=>$val['uid']))}" target="_blank">
          <img alt="{$val.shop-name}" src="{$val.shop_icon}">
          <div class="masking"></div>
          <span>{$val.discount}</span>
        </a>                                 
        <eq name="mod" value="19"></li><li></eq>
      </volist>
      </li>
      </ul>
    </div>
  </div>
 
</div>


   
 <script>
        //初始化
        $(".slide-logos .next-btn").click(function(){
            $(".logos-box ul").stop(true,true).animate({marginLeft:-1*$(".logos-box li:eq(0)").width()},100,function(){
                $(".logos-box ul").append($(".logos-box li:eq(0)").clone());
                $(".logos-box li:eq(0)").remove();
                $(".logos-box ul").css("margin-left",0);
            })
        });
        $(".slide-logos .prev-btn").click(function(){
            $(".logos-box ul").prepend($(".logos-box li:last").clone());
            $(".logos-box li:last").remove();
            $(".logos-box ul").css("margin-left",-1*$(".logos-box li:eq(0)").width());
            $(".logos-box ul").stop(true,true).animate({marginLeft:0},100)
        });

        var F_selected = function(){
            var brand_id = location.href.split("#")[1];
            $("#" + brand_id).addClass("selected-active");
            $("li.selected-active").on("mouseover",function(){
                $(this).removeClass("selected-active")
            })
        }
        F_selected();
    </script> 