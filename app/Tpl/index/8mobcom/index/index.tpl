<!doctype html>
<html>
<head>
<include file="public:head" />
<script type="text/javascript" src="__STATIC__/8mobcomjuanpi/js/index.js"></script>
</head>
<body>
<include file="public:header" />

<div class="big_banner group">
  {:R('advert/index', array(1), 'Widget')}
  <div class="top_wrap  {:C('ftx_site_wc')}">
    <div class="top_box">
      <div class="banner_l">
        <dl>
          <dd>
            <a href="{:U('jiu/index')}"  target="_blank"><img src="/static/8mobcom/images/global/top_right_jiu.png">
            <div class="txt"><span class="title">9.9包邮</span> <span>今日上新<em>{$today_jiu_count}</em>款</span></div></a>
          </dd>
                                  <dd>
            <a href="{:U('shijiu/index')}"  target="_blank"><img src="/static/8mobcom/images/global/top_right_shi.png">
            <div class="txt"><span class="title">19.9包邮</span> <span>今日上新<em>{$today_shi_count}</em>款</span></div></a>
          </dd>
        </dl>
      </div>
      <div class="round">
          <div class="adType"></div>
      </div>
      <div style="display:none;" class="banner_arrow" data-banner="arrow">
          <a href="javascript:;" class="arrow_prev" data-arrow="prev"><i></i></a>
          <a href="javascript:;" class="arrow_next" data-arrow="next"><i></i></a>
      </div>
      </div>
  </div>
</div>


<div class="main w1100 group">
  {:R('advert/index', array(4), 'Widget')}
</div>

<div class="main w1100 group">
  <include file="pailist" />
</div>

<include file="public:list" />

<include file="public:footer" />
</body>
</html>