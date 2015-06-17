
;(function($){
  var pluginName = "cursorMask";

  function Plugin(ele,conf){
    this.init(ele,conf);
  }

  Plugin.prototype.init = function(ele,conf) {
    this.ele = ele =  $(ele);
    var offset = this.offset = ele.offset();
    this.width = ele.width();
    this.height = ele.height();
    this.mask = $(".bk-link",ele);

    this.left = offset.left;
    this.top = offset.top;
    this.bottom = offset.top + this.height;
    this.right = offset.left + this.width;

    this.conf = $.extend({
      speed:300
    },conf);
    this.bind();
  };

  
  var normal = {left:0,top:0};

  Plugin.prototype.bind = function() {
    var _self = this;
    this.ele.bind("mouseenter."+ pluginName ,function(e){

      _self.mask.parent().show();
      var dir = direction.call(_self,e);
      var pos = position(_self.width,_self.height,dir);
      _self.mask.css(pos).animate(normal,_self.conf.speed);

    });
    this.ele.bind("mouseleave."+pluginName,function(e){

      var dir = direction.call(_self,e);
      var pos = position(_self.width,_self.height,dir);
      _self.mask.css(normal).animate(pos,_self.conf.speed,function(){
        _self.mask.parent().hide();
      });
    });
  };

  Plugin.prototype.unbind = function() {
    this.ele.unbind("."+pluginName);
  };

  //获取进入方向
  function direction(e){
    var w = this.width;
    var h = this.height;
    var x = (e.pageX - this.left - (w / 2)) * (w > h ? (h / w) : 1);
    var y = (e.pageY - this.top - (h / 2)) * (h > w ? (w / h) : 1);
    var direction = Math.round((((Math.atan2(y, x) * (180 / Math.PI)) + 180) / 90) + 3) % 4;
    return direction;
  }
  
  function position(width,height,dir){
    var position = [
      // 上右下左
      {left:0,top:-height},
      {left:width,top:0},
      {left:0,top:height},
      {left:-width,top:0}
    ]
    return position[dir];
  }

  $.fn[pluginName] = function(conf){
    var objs = this.map(function(){
      var _self = $(this);
      if(_self.data(pluginName+'_obj'))
        return _self.data(pluginName+'_obj');

      var obj = new Plugin(this,conf);
      _self.data(pluginName+'_obj',obj);
      return obj;
    });
    return objs.length == 1 ? objs[0] : this;
  };
})(jQuery);
