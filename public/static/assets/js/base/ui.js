(function($){
  var MAI007 = $.MAI007 = $.MAI007 || {};
  var ui = MAI007.ui = MAI007.ui || {};


  // 宝贝展示项的ui效果
  (function(){
    var itemEffect = ui.itemEffect = {};

    var effects = {
      "缩放":"show-hover",
      '普通':"show-normal"
    };
    var cookie_name = "item_list_effect";
    itemEffect.getEffectNames = function(){
      var arr = [];
      for(var i in effects){
        if(effects.hasOwnProperty(i)){
          arr.push(i);
        }
      }
      return arr;
    };

    itemEffect.getEffectClasses = function(){
      var arr = [];
      for(var i in effects){
        if(effects.hasOwnProperty(i)){
          arr.push(effects[i]);
        }
      }
      return arr;
    };
    itemEffect.setEffect = function(name,items){
      if(effects.hasOwnProperty(name)){

        if(items && items.prototype === $){
          // items 是jquery 对象
          return items.removeClass(itemEffect.getEffectClasses().join(" ")).addClass(effects[name]);
        }else{
          return $('.item').removeClass(itemEffect.getEffectClasses().join(" ")).addClass(effects[name]);
        }
      }
    }

    itemEffect.cookieEffect = function(next){
      var tmp = $.cookie("item_list_effect");
      var e = $.isNumeric(tmp) ? tmp : 0 ;

      var effnames = itemEffect.getEffectNames();

      if(next === true){
        e+=1;
        $.cookie("item_list_effect",e,{expires:365,path:"/"});
      }
      var ename = effnames[ e % effnames.length ] ;

      //next 可能是自定义的items 对象集合
      itemEffect.setEffect(ename,next);

      return ename;
    }

})();


})(jQuery);
