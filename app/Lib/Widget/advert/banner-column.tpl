<notempty name="ad_list">
 <div id="banner_board_{$board_info.id}" class="carousel">
    <div class="wrap group">
        <volist name="ad_list" id="ad" key="i">
          <div class="carousel-item" style="{:background($ad['extval'],'images',false)} <if condition="$i eq 1">display: block; </if>">
            <div class="banner_item" style="{:background($ad['content'],'images',false)} background-position: center center;">
              <a href="/advert/tgo/id/{$ad.id}" target="_blank" title="{$ad.desc}" class="bannerlink"></a>
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