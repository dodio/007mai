<?php 
class mallAction extends FirstendAction {
  public function _initialize() {
        parent::_initialize();
        $this->visited_page();//访问页面任务
  }

  public function index(){
    $this->assign("nav_curr","mall");
    $this->_config_seo(array(
      "title" => "特卖商城",
      "keywords" => "品牌团,特卖商城,全网活动,聚划算",
      "description" => "007买为您收集全网最优惠的活动，满满的都是爱"
      ));
    $this->display();
  }

  public function haitao(){
    $this->assign("nav_curr","haitao");
    $this->_config_seo(array(
      "title" => "环球外贸",
      "keywords" => "海淘,外贸,全球海淘,环球海淘,环球外贸",
      "description" => "007买为您收集全网最优惠的活动，满满的都是爱"
      ));
    $this->display();
  }
}
 ?>