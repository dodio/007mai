<div class="slide-logos mt10 group">
      <div class="logos-box">
        <ul>
          <li>
          <volist name="brands" id="brand" offset="0" length="20">
            <a href="{:U('brand/dlist',array('uid'=>$brand['uid']) )}" target="_blank"><img alt="" src="{$brand.shop_icon}" _hover-ignore="1"><div class="masking"></div><span>{$brand.discount}</span></a>
          </volist>
          </li>
        </ul>
  </div>
</div>