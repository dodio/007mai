  <div class="mt20 container">
    <div class="chao-title">
      <div class="chao-title-text">购物大全</div>
    </div>
  </div>
  
<div class="mt20 container">
    <div id="shopping-index" class="shopping-index group">
      <div class="spi-top group">
        <a href="javascript:" class="spi-cate cur">推荐商家</a>
        <a href="javascript:" class="spi-cate">综合商家</a>
        <a href="javascript:" class="spi-cate">服装鞋包</a>
        <a href="javascript:" class="spi-cate">食品酒水</a>
        <a href="javascript:" class="spi-cate blue">团购商家</a>
        <a href="javascript:" class="spi-cate">数码书籍</a>
        <a href="javascript:" class="spi-cate">百用日货</a>
        <a href="javascript:" class="spi-cate">母婴玩具</a>
        <a href="javascript:" class="spi-cate">美妆个护</a>
        <a href="javascript:" class="spi-cate blue">旅行票务</a>
        <a href="javascript:" class="spi-cate">海外商家</a>
        <a href="javascript:" class="spi-cate">其他商家</a>
      </div>
      <div class="mai007-w100x240" data-ajax-ad="tracker" data-ad-tracker="shopping_index" data-auto="1"></div>
      <div class="spi-content">
        <div class="carousel">
            <div class="wrap group">
                <div class="carousel-item" style="display: block;" data-ajax-ad="tracker" data-ad-tracker="shopping_index_tjsj" data-auto="1">
                </div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_zhsj"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_yfxb"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_spjs"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_tgsj"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_smsj"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_byrh"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_mywj"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_mzgh"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_lxpw"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_hwsj"></div>
                <div class="carousel-item" data-ajax-ad="tracker" data-ad-tracker="shopping_index_qtsj"></div>
            </div>
        </div>
      </div>
    </div>
  </div>
<script>
  $(function(){
    var shop_index = $("#shopping-index .carousel").carousel({
      auto:false
    });
    var index_items = $("#shopping-index .carousel-item");
    shop_index.stopAuto();
    var spi_cates = $("a.spi-cate");
    spi_cates.each(function(i){
      $(this).mouseover(function(){
        index_items.eq(i).mai007ad();
        shop_index.setTo(i);
        spi_cates.removeClass("cur");
        $(this).addClass("cur");
      })
    })
  });
</script>