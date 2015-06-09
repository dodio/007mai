<?php
class brandAction extends FirstendAction {
	public function _initialize() {
        parent::_initialize();
        $api_config = M('items_site')->where(array('code' => 'ftxia'))->getField('config');
        $this->_tbconfig = unserialize($api_config);
    }
	 
	public function index(){
		$p		= I('p',1, 'intval');
		$per	= 10;
		$top = $this->_get_top();
    $req = $top->load_api('FtxiaBrandListsGetRequest');
    $req->setFields('title,name');
		$req->setTime(date("y-m-d-H",time()));
		$resp = $top->execute($req);
    if($resp->msg){
      $this->redirect("/","出现网络故障，没有为您成功取回情报.",3);
    }
    $brandlist = object_to_array($resp->brandlist);
		$totals = count($brandlist['list']);
		$alllist = $brandlist['list'];
		$start=($p-1)*$per;
		$lists=array();  
		$lists=array_slice($alllist,$start,$per);

    foreach ($brandlist['brand'] as $key => $value) {
      if($value["shop_name"] =="" || $value["shop_icon"] == ""){
        unset($brandlist['brand'][$key]);
      }
    }

		$this->assign('brands',$brandlist['brand']);
		$this->assign('lists',$lists);

		$pager = $this->_pager($totals, $per);
        $this->assign('page', $pager->kshow());
        $this->assign('nav_curr', 'brand');
        $this->_config_seo(array(
			'title' => ' 【品牌折扣】 —' ,
		));
		$this->display('index');
	}

	public function dlist(){ 
		$uid = I('uid');
		$top = $this->_get_top();
    $req = $top->load_api('FtxiaBrandListsGetRequest');
    $req->setFields('title,name');
		$req->setUid($uid);
		$req->setTime(date("y-m-d",time()));
		$resp = $top->execute($req);

    if($resp->msg){
      $this->redirect("/","出现网络故障，没有为您成功取回情报.",3);
    }
    
    $brandlist = object_to_array($resp->brandlist);

    foreach ($brandlist['brand'] as $key => $value) {
      if($value["shop_name"] =="" || $value["shop_icon"] == ""){
        unset($brandlist['brand'][$key]);
      }
    }

		$this->assign('brands',$brandlist['brand']);
		$this->assign('lists',$brandlist['list']);
        $this->assign('nav_curr', 'brand');
        $this->_config_seo(array(
			'title' => ' 【品牌折扣】' ,
		));
		$this->display('dlist');
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
}