<div class="itemlist mt20 group">
  <ul>
    <?php 
      $__mod = isset($__mod) ? $__mod : 4;
      $__mod_m = $__mod-1;
     ?>
    <volist name="items_list" key='i' id="item" mod="$__mod">
      <li <eq name="mod" value="$__mod_m">class="mr0"</eq>>
        <include file="index:item-item"/>
      </li>
    </volist>
  </ul>
</div>

