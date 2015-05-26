
  <notempty name="subnav">
    <div class="jiu-nav-main jiu-nav-main-2">
      <div class="jiu-nav page007mai  seclevelinner">
        <div class="nav-item  ">
          <div class="item-list">
            <ul>
              <li><a href="{:U('index/cate', array('cid'=>$thiscid))}" <if condition="$broid eq 0"> class="active"</if> >全部</a></li>
              <volist name="subnav" id="bcate"> 
                <li><a <if condition="$broid eq $bcate['id']">class="active"</if> href="{:U('index/cate', array('cid'=>$bcate['id']))}" title="{$bcate.name}">{$bcate.name}</a></i>
              </volist>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </notempty>