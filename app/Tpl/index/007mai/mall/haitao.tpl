<extend name="index"/>

<block name="ad">
  <style>
    #side_nav_fix_pos{
      position: absolute;
      top: 544px;
      width: 100%;
    }
  </style>
<include file="public:sidenav"/>
{:R('advert/index', array(7), 'Widget')}
</block>