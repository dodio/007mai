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
      var effect_class = [
        ['缩放',"show-hover"],
        ['普通',"show-normal"],
        ['飞旋',"show-flypic"],
        ['普通飞旋',"show-normal show-flypic"],
        ['魔幻',"show-hover show-flypic"]
      ];

      var all = "show-hover show-flypic show-normal";
      
      var cc = $.cookie("item_list_effect");
      var e = $.isNumeric(cc) ? cc : 0;
      var effect = effect_class[e];
      var btn = $('<a href="javascript:" class="toggle_effect"></a>');
      $("#rate-order").append(btn);

      btn.click(function(){
        e = ++e % effect_class.length;
        effect = effect_class[e];
        setEffect(effect);

        $.cookie("item_list_effect",e,{expires:365,path:"/"});
      });

      btn.hover(function(){
        btn.html("换");
      },function(){
        btn.html(effect[0]);
      });

      setEffect(effect);
      function setEffect(effect){
          if(!effect)
            return;
          $("#itemlist .item").removeClass(all);
          $("#itemlist .item").addClass(effect[1]);
          btn.html(effect[0]);
      }
    }
  });
</script>