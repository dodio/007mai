
<script>
  $(function(){



    $(".time_count").each(function(){
      var _self = $(this);
      var time = _self.attr("data-time");
      var left = time - Math.floor(Date.now()/1000);
      
      setTime();

      setInterval(function(){
         setTime();
        },1000);

      function setTime(){
        var obj = $.MAI007.util.secToTime(--left);
        _self.html($.MAI007.util.TimeToHTML(obj));
      }
    });
  });

</script>