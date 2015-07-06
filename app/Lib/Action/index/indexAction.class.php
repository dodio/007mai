<?php
class indexAction extends ItemlistAction {
	public function _initialize(){
		parent::_initialize();
    $api_config = M('items_site')->where(array('code' => 'ftxia'))->getField('config');
    $this->_tbconfig = unserialize($api_config);
	}
	public function _empty(){
    	$this->index();
    }
    /**
	 ** 首页（全部）
	 **/
    public function index() {

		// 首页展示分类top one
		if(C('ftx_index_cids')){
			$index_cates = C('ftx_index_cids');
		}else{
			$index_cates =array();
		}
		$cate_items = array();
		foreach ($index_cates as $cid) {
			$cate_items[$cid] = $this->subcate_topOne($cid);
		}

		$this->assign("cate_items",$cate_items);

		//情报精选
		$jingxuan_id = 25;
    $jinfo = $this->_cate_mod->cate_info($jingxuan_id);
    $jmap = array();
    mapCinfo($jinfo,$jmap);
		$this->assign('jingxuan_list', $this->cate_item($jingxuan_id,10,$jmap));
    
 		$shops = $this->cate_shop($jingxuan_id,12);
 		$this->assign("shops",$shops);

 		$where = array('status'=>'1');
        // 已结束商品不显示
    $where['end_time'] = array("egt",time());
    $where['cate_id'] = 2;//定义首页商品分类
    $score_item = M('score_item');
    $scoreitems = $score_item->where($where)->order("ordid ASC , id desc")->limit(5)->select();
    $this->assign('scoreitems',$scoreitems);

  	$this->assign('nav_curr', 'index');

  	$this->_config_seo(C('ftx_seo_config.index'));
		$this->display();

  }

	public function shortcut(){
		$Shortcut = "[InternetShortcut] 
		URL=".C('ftx_site_url')." 
		IDList= 
		[{000214A0-0000-0000-C000-000000000046}] 
		Prop3=19,2 
		"; 
		Header("Content-type: application/octet-stream"); 
		header("Content-Disposition: attachment; filename=".C('ftx_site_name').".url;");
		if ($this->visitor->is_login) {
			$user = $this->visitor->info;
			$arg = array(
				"uid" => $user['id'],
				"uname" => $user['username'],
				"action" => "download_shortcut"
				);
			tag("download_shortcut",$arg);
    }
		echo $Shortcut; 
	}

  /**
	  * 分类
	  */
	public function cate(){
		$cid	=	I('cid','', 'intval');
		$sort	=	I('sort', 'default', 'trim'); //排序
		$order	=	'ordid asc ';
		if(!$cid){
			// 可以通过分类名字进入分类
			$name = I("cname","","trim");
			$cinfo = $this->_cate_mod->cate_info_byname($name);
			if($cinfo){
				$cid = $cinfo['id'];
			}
		}

		if(!$cid) redirect(U('index/index'));

 		$total = $this->_common($cid);
 		$this->assign("nav_curr","cate");
 		//一行4个宝贝，尽量让店铺高度与宝贝列表高度一致
 		$shop_amount = ceil( $total/4 );
		$shops = $this->cate_shop($cid,$shop_amount);
		$this->assign("shops",$shops);
    $this->assign("nav_curr","mai");
		$this->display();
	}

	public function subcates(){
		$cid = I("cid",'','intval');
		$cate_list = $this->_cate_mod->cate_cache(true);
		if(isset($cate_list['s'][$cid])){
			$cate = $cate_list['s'][$cid];

			foreach ($cate as $value) {
				echo "<li><a href=\"/index/cate/cid/{$value['id']}\" target=\"_blank\">{$value['name']}</a></li>\n";
			}
		}
		
	}
	private function _get_top() {
      vendor('Ftxia.TopClient');
      vendor('Ftxia.RequestCheckUtil');
      vendor('Ftxia.Logger');
      $top = new TopClient;
      $top->appkey = $this->_tbconfig['app_key'];
      $top->secretKey = $this->_tbconfig['app_secret'];
      return $top;
  }


  private function subcate_topOne($cid){
    $order = "ordid asc ";
    if(C('ftx_site_cache')){
      $md_id = $cid;
      $file = 'subcate_topOne_'.$md_id;
      if(false === $items = S($file)){

        $where = array();
        $cinfo = $this->_cate_mod->cate_info($cid);
        $order .= getSort("default", $cinfo['sort'] );
        mapCinfo($cinfo,$where);
        $where['cate_id'] = array("IN",$this->_cate_mod->get_child_ids($cid));

        $subSql = $this->_mod->where($where)->order($order)->select(false);
        $items_list = $this->_mod->table( $subSql . " as a")->group("cate_id")->select();

        $items = $this->_deal_item_list($items_list);
        S($file,$items);
      }
    }else{

      $where = array();
      $cinfo = $this->_cate_mod->cate_info($cid);
      $order .= getSort("default", $cinfo['sort'] );
      mapCinfo($cinfo,$where);
      $where['cate_id'] = array("IN",$this->_cate_mod->get_child_ids($cid));
      
      $subSql = $this->_mod->where($where)->order($order)->select(false);
      $items_list = $this->_mod->table( $subSql . " as a")->group("cate_id")->select();

      $items = $this->_deal_item_list($items_list);
    }
    return $items;
  }
}