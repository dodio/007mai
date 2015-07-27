<?php

class advertAction extends FirstendAction {

    public function tgo() {
        $id = I('id',0, 'intval');
        $url = M('ad')->where(array('id'=>$id))->getField('url');
        !$url && $this->_404();

        if(false === strpos($url, "http://")){

          if(strpos($url, "javascript:") !== false){
            exit();
          }

          $url = "http://".$_SERVER['HTTP_HOST'].$url;
          redirect_301($url);
          exit();
        }
        if(get_spider()){
          exit();
        }
        $this->jump_no_spider($url);
    }

    public function get(){
      $id = I("id",0,'intval');
      $tracker = I("tracker",'','trim');

      if($id != 0){
        R('advert/index', array($id), 'Widget');
      }
      if($tracker != "" ){
        R('advert/index', array($tracker), 'Widget');
      }
    }
}