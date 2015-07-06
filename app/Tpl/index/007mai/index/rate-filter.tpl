<div id="rate-order" class="rate-order mt10 group">
  <a href="{:U(__ACTION__,array('cid'=>$cid,'price'=>$list_info['price']))}#root_cates"  class="rate <if condition="$list_info['sort'] eq 'default'"> cur </if> ">默认</a>
  <a href="{:U(__ACTION__,array('cid'=>$cid,'sort'=>'new','price'=>$list_info['price']))}#root_cates" class="rate <if condition="$list_info['sort'] eq 'new'"> cur </if> ">最新<i class="rate-icon icon"></i></a>
  <a href="{:U(__ACTION__,array('cid'=>$cid,'sort'=>'hot','price'=>$list_info['price']))}#root_cates" class="rate <if condition="$list_info['sort'] eq 'hot'"> cur </if> ">销量<i class="rate-icon icon"></i></a>
  <a href="{:U(__ACTION__,array('cid'=>$cid,'sort'=>'rate','price'=>$list_info['price']))}#root_cates" class="rate <if condition="$list_info['sort'] eq 'rate'"> cur </if> ">折扣<i class="rate-icon icon"></i></a>
  <a href="{:U(__ACTION__,array('cid'=>$cid,'sort'=>'price','price'=>$list_info['price']))}#root_cates" class="rate <if condition="$list_info['sort'] eq 'price'"> cur </if> ">价格<i class="rate-icon icon"></i></a>
</div>
<script>
  $(function(){
    if($.browser.webkit){
      var pre = $.MAI007.ui.itemEffect.cookieEffect();
      var btn = $('<a href="javascript:" class="toggle_effect">'+ pre +'</a>');
      $("#rate-order").append(btn);
      btn.click(function(){
        pre = $.MAI007.ui.itemEffect.cookieEffect(true);
      });
      btn.hover(function(){
        btn.html("换");
      },function(){
        btn.html(pre);
      });
    }else{
      $.MAI007.ui.itemEffect.setEffect("普通");
    }
  });
</script>