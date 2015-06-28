;(function($){
 $.MAI007.data.getUserinfo().done(function  (data) {
    if(data.s){
      _czc.push(["_setCustomVar","是否登录","已登录",7200]);
    }else{
      _czc.push(["_setCustomVar","是否登录","未登录",7200]);
    }
  });
})(jQuery);
//统计客户端来访
(function($){
  if(location.search.indexOf("f=short_cut")){
    _czc.push(["_setCustomVar","来站类型","客户端",2]);
  }
})(jQuery);
//统计日活留存等信息
(function($){
  var zeroDate = $.MAI007.util.zeroDate;
  var cookie_name = "MAI007_USER_ACTIVE";
  var useractive = $.cookie(cookie_name,function(value){
    try{
      return JSON.parse(value);
    }catch(e){
      return;
    }
  });

  useractive = useractive || {
    time:0,
    days:0,
    totalDays:0,
    continueDays:0,
    first_come_in:new Date().getTime()
  };
  if(useractive.time > zeroDate()){
    //今天已经记录过
    // return ;
  }
  var day_time = 86400000;
  // 今日未记录
  useractive.days+=1; //来访过的天数
  useractive.totalDays = Math.round((zeroDate(1) - zeroDate(useractive.first_come_in) )/day_time); //从来网站到现在的总天数
  if(useractive.days>useractive.totalDays){
    useractive.days=useractive.totalDays;
  }
  if( (zeroDate() - useractive.time) < day_time){
    useractive.continueDays+=1;
  }else{
    useractive.continueDays = 1;
  }
  // 连续来网站天数
  useractive.time = new Date().getTime();
  if(useractive.totalDays == 1){
    var invital = $.MAI007.util.thinkCookie('from_invital');
    if(invital){
      _czc.push(["_setCustomVar","来站类型","受邀用户",1]);
      _czc.push(﻿["_trackEvent","邀请","接受邀请",invital.username]);
      $.removeCookie('from_invital',{path:"/"});
    }
  }
  var fsd = new Date();
  fsd.setTime(useractive.time);
  _czc.push(﻿["_trackEvent","用户情况","留存", useractive.totalDays ,fsd.getHours()]);
  _czc.push(﻿["_trackEvent","用户情况",'连续登陆',useractive.continueDays, fsd.getHours()]);
  _czc.push(﻿["_trackEvent","用户情况",'来访天数',useractive.days, ((useractive.days/useractive.totalDays).toFixed(2)*100) ]);

  if(!JSON){
    $.getScript(CDN_ROOT+"/assets/js/lib/json.js",function(){
      $.cookie(cookie_name,JSON.stringify(useractive),{path:"/",expires:365});
    });
  }
  $.cookie(cookie_name,JSON.stringify(useractive),{path:"/",expires:365});
})(jQuery);