<notempty name="ad_list">
 <div id="banner_board_{$board_info.id}" class="carousel">
    <div class="wrap group">
        <volist name="ad_list" id="ad" key="i">
          <div class="carousel-item" <if condition="$i eq 1">style="display: block;" </if> >
            <div class="banner_item" style="background: url({:attach($ad['content'],'images')}) 50% 50% no-repeat;">
              <a href="{$ad.url}" target="_blank" title="{$ad.desc}" class="bannerlink"></a>
            </div>
          </div>
        </volist>
    </div>
    <div class="carousel-control">
      <div class="carousel-btns">
        <volist name="ad_list" id="ad" key="i">
          <div class="carousel-btn <if condition="$i eq 1"> cur</if>" ></div>
        </volist>
      </div>
    </div>
  </div>
  <script>
    $(function(){
      $("#banner_board_{$board_info.id}").carousel();
    });
  </script>
</notempty>