<?php

class shopAction extends FirstendAction {

  public function index() {
  	error_reporting(E_ALL);
		$id = I("id");
		$mod = D("shop");
		$shop = $mod->find($id);
		if(!$shop){
			$this->_404();
		}
		$this->_config_seo(array(
			"title" => $shop['name'],
      "keywords" => $shop['seo_keys'],
			"description" => $shop['seo_desc'],
		));

  
		$this->assign("shop",$shop);

		$this->display();
  }
  private function getTbTop(){
  	$api_config = M('items_site')->where(array('code' => 'taobao'))->getField('config');
    $tbconfig = unserialize($api_config);
    vendor('taobao.TopSdk');
    $top = new TopClient;
    $top->appkey = $tbconfig['app_key'];
    $top->secretKey = $tbconfig['app_secret'];
    $top->format = "json";
    return $top;
  }
}