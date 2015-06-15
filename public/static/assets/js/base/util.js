(function($){
  var MAI007 = $.MAI007 = $.MAI007 || {};
  var util = MAI007.util = MAI007.util || {};

  util.thinkCookie = function(name){
    if(!name){
      return;
    }
    var str = $.cookie(name);
    if(!str){
      return;
    }
    str = decodeURIComponent(str.replace("think:",""));
    try{
      var obj = $.parseJSON(str);
      return obj;
    }catch(e){
      return ;
    }
  }
})(jQuery);