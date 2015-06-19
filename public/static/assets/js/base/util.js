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
  };

  util.secToTime = function(sec){
    var mods = {
      ss:60,
      mm:60,
      h:24,
      d:365
    };
    if(!$.isNumeric(sec)){
      return;
    }
    var obj = {};
    for(var i in mods){
      obj[i] = sec%mods[i];
      sec = Math.floor(sec/mods[i]);
    }
    return obj;
  };

  util.TimeToHTML = function(obj){
    var html = "";
    if(obj.d){
      html+='<span class="d">'+obj.d+'</span>天';
    }
    if(obj.h){
      html+='<span class="d">'+obj.h+'</span>小时';
    }
    if(obj.mm){
      html+='<span class="d">'+obj.mm+'</span>分';
    }
    if(obj.ss){
      html+='<span class="d">'+obj.ss+'</span>秒';
    }
    return html;

  }


})(jQuery);