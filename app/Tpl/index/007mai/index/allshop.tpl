<noempty name="seller_arr">
  <div class="container mt20 group">
    <div class="chao-title">
      <div class="chao-title-text">本页店铺</div>
    </div>


    <div class="mt20 group all_shop">
      <ul>
      <volist name="seller_arr" id="seller" mod="7" offset="0" length="14">
          <li <eq name="mod" value="6">class="mr0"</eq>>
          <a data-type="1" rel="nofollow" biz-sellerid="{$seller}" data-tmpl="140x190" data-tmplid="3" data-rd="2" data-style="2" data-border="1" href="#">{$seller}</a>
          </li>
      </volist>
      </ul>
  </div>
  </div>

  
</noemtpy>