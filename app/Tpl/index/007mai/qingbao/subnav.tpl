<notempty name="subnav">
<style>
  .sidenav.affix{
    top: 37px;
  }
</style>
<div id="root_cates" class="root_cates">
  <div class="rc_wrap">
    <div class="container mod_mid group">
      <ul class="mod_mid_wrap">
        <volist name="subnav" id="bcate">
            <li class="mod_mid_item"><a <if condition="($rootid eq $bcate['id'])">class="cur"</if> href="{:U(__ACTION__)}#q_{$bcate.id}" title="{$bcate.name}">{$bcate.name}</a></li> 
          </volist>
      </ul>
    </div>
  </div>
</div>
<script>
  $(function(){
    var w = $("#root_cates").find('.rc_wrap');
    var top = w.offset().top;
    setTimeout(function(){
      $.scrollManager.add({
        height:top,
        down:function(){
          w.addClass("affix");
        }
      },"hide_root_cate");
    },2000);
  });
</script>
</notempty>