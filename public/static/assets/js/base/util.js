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

  };
  
  util.delay = function(call,time){
    $(function(){
      setTimeout(function(){
        $.isFunction(call) && call();
      },time);
    });
  };
  util.zeroDate = function(days,utc){
    if(days instanceof Date){
      var t = days;
    }else{
      var t = new Date();
      if(typeof days == "number"){
        t.setTime(+t + days * 864e+5);
      }
    }
    if(!utc){
      t.setHours(0);
      t.setMinutes(0);
      t.setSeconds(0);
      t.setMilliseconds(0);
    }else{
      t.setUTCHours(0);
      t.setUTCMinutes(0);
      t.setUTCSeconds(0);
      t.setUTCMilliseconds(0);
    }
    return t;
  }
})(jQuery);