<?php 
class mallAction extends FirstendAction {
  public function _initialize() {
        parent::_initialize();
  }

  public function index(){
    $this->assign("nav_curr","mall");
    $this->_config_seo(array(
      "title" => "特卖商城，品牌团",
      "keywords" => "品牌团,特卖商城,全网活动,聚划算",
      "description" => "007买为您收集全网最优惠的活动，满满的都是爱"
      ));
    $this->display();
  }

}
 ?>