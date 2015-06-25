

  <div class="header">
    <div class="container head group">
      <div class="logo">
        <a href="/"><img src="__STATIC__/assets/pc/images/logo.png" alt=""></a>
      </div>
      <div class="search">
        <form method="get" action="/index.php" target="_blank" onsubmit="return search_submit(this);">
          <span class="search-area fl">
            <input type="hidden" name="m" value="search">
            <input type="hidden" name="a" value="index">
            <input x-webkit-speech="" name="key" onfocus="if(this.value =='暑假就该洒脱~')this.value='';" onblur="if($.trim(this.value) =='')this.value='暑假就该洒脱~';" value="暑假就该洒脱~" class="text">
          </span>
          <input type="submit" value="" class="smt fl btn">
        </form>
      </div>
      <div class="fr">
        <include file="public:topbar"/>

      </div>
      <div class="sign-area">
        <a href="javascript:" class="signIn_btn signIn"><i class="sign-icon icon"></i>签到领取情报</a>
      </div>
    </div>

    <div class="mainNav group">
      <div class="container">
        <ul class="navigation group">
          <ftx:nav type="lists" style="main">
            <li <if condition="$nav_curr eq 'index'">class="cur"</if> >
              <a href="{:C('ftx_site_url')}">{:L('index_page')}</a>
            </li>
            <volist name="data" id="val">
            <li <if condition="$nav_curr eq $val['alias']">class="cur"</if> ><a href="{$val.link}" <if condition="$val.target eq 1">target="_blank"</if>>{$val.name}</a></li>
            </volist>
          </ftx:nav>
        </ul>
      </div>
    </div>
  </div>
