<?php
class juAction extends FirstendAction {
	public function _initialize() {
        parent::_initialize();

		$api_config = M('items_site')->where(array('code' => 'ftxia'))->getField('config');
        $this->_tbconfig = unserialize($api_config);
    }

    public function index() {
		$p		= I('p',1, 'intval');
		$cid	= I('cid','', 'intval');

		$top = $this->_get_top();
        $req = $top->load_api('FtxiaJuCatsGetRequest');
        $req->setFields('cid,name');
		$resp = $top->execute($req);
        $cats = object_to_array($resp->cats);
		$this->assign('cats',$cats);
		if($cid){
			$seo_title = $cats[$cid]['name'].'频道 -  汇聚最划算的团购商品 - ';
		}else{
			$seo_title = '全部商品 -  汇聚最划算的团购商品 - ';
		}


		$ltop = $this->_get_top();
		$req = $ltop->load_api('FtxiaJuListsGetRequest');
        $req->setPage($p);
		$req->setCid($cid);
		$req->setTime(date("y-m-d-H",time()));
		$resp = $ltop->execute($req);
		
        $jus = object_to_array($resp->lists);
		$count = $jus['totalPage'];
		$html= Newiconv("GBK","UTF-8",urldecode($jus['html']));
		$html = str_replace("data-ks-lazyload","src",$html);
		$html = str_replace("&amp;id=","&tm=",$html);
		$html = str_replace("//detail.ju.taobao.com/home.htm?id=","/index.php?m=jump&a=index&juid=",$html);
		$html = str_replace("item_id=","id=",$html);
		$html = str_replace("&id=","&from=open.ftxia.com&jusid=",$html);
		
		$pager = $this->_pager($count, '1');
        $this->assign('page', $pager->kshow());
		$this->assign('html',$html);
		$this->assign('cid',$cid);
        $this->assign('nav_curr', 'ju');
        $this->_config_seo(array(
			'title' => $seo_title ,
		));
        $this->display();
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