<?php

class advertAction extends FirstendAction {

    public function tgo() {
        $id = I('id',0, 'intval');
        $url = M('ad')->where(array('id'=>$id))->getField('url');
        !$url && $this->_404();
        redirect($url);
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