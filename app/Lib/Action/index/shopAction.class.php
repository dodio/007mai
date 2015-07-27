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
			"keywords" => $shop['name']
		));

		// $top = $this->getTbTop();
		// $req = new TbkShopsDetailGetRequest();
  //   $req->setFields('sid,cid,title,nick,desc');
		// $req->setSellerNicks( '韩都衣舍旗舰店' );
		// $resp = $top->execute($req);
		// // p($resp);
  //   if($resp->msg){
  //     $this->redirect("/","出现网络故障，没有为您成功取回情报.",3);
  //   }
  //   $shop_list = object_to_array($resp->tbk_shops);
  //   $shop_info = $shop_list[0];
  //   p($shop_list);
  
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