<script>
  (function(){
    var width = $(window).width();
    if( width >=1880){
      $("html").addClass("wide_screen");
      $(function(){
        $(".itemlist li").removeClass("mr0").each(function(i){
        });
      });
    }else if(width>1570){
      $("html").addClass("middle_screen");
    }
  })();
</script>