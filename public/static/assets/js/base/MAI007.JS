(function($){
  var MAI007 = $.MAI007 = $.MAI007 || {};

  var data = MAI007.data = MAI007.data || {};

/**
 * 获取用户信息并缓存
 * @param  {[type]} ){                 var userinfo [description]
 * @return {[type]}     [description]
 */
  data.getUserinfo = dataApiFactory(function() {
    return $.ajax({
          url: u('ajax','userinfo'),
          dataType:'jsonp',
          jsonp:"callback"
        });
  });

data.getCloseScoreItem = dataApiFactory(function() {
    return $.ajax({
          url: u('ajax','get_min_scoreItem')
        });
  });



  /**
   * 根据接口生成数据
   * @param  {[type]} api [description]
   * @return {[type]}     [description]
   */
  function dataApiFactory(api){
    if(typeof api !== "function"){
      return;
    }

    var getDefer = function (){
      return api();
    }

    var defer;
    return function(refresh){
      if(refresh || !defer){
        defer = getDefer();
      }
      return defer;
    }
  }
})(jQuery);
