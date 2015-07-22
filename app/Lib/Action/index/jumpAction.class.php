<?php
class jumpAction extends FirstendAction {
    public function _initialize() {
        parent::_initialize();
		$this->_mod = D('items');
    }

    /**
     * 淘宝跳转
     */
    public function index() {
		$id = I('id','', 'trim');
		$iid = I('iid','','number_int');
		$date = I('date');
		$dt = '1';
		if($date){
			$dt = '2';
		}
		$tpl = 'index';
		if($id){
			if(!intval($id)){exit('input error');}
			if(strlen($id)>9){
					$item = $this->_mod->where(array('num_iid' => $id))->find();
			}else{
				$item = $this->_mod->where(array('id' => $id))->find();
			}
			if(!$item){
				$item['num_iid'] = $id;	
			}
		}
		if($iid){
			if(!intval($iid)){exit('input error');}
			$this->_mod  = M('items');
			$item = $this->_mod ->where(array('num_iid' => $iid))->find();
			if(!$item){
				$item['num_iid'] = $iid;	
			}
		}
		if(C('ftx_click_ai')){
			
			$tpl = 'taobao';
			if(!is_mobile()){

			
			if( $item['click_url'] && 0 < strpos( $item['click_url'], "s.click" ) ){
				$this->jump_hidden_referer( $item['click_url'] );
			}else if ( 0 < strpos( $item['click_url'], "redirect.simba.taobao.com" ) ){
				$this->jump_hidden_referer( $item['click_url'] );
			}

			}
		}

		if($item['shop_type'] == "D"){
			$this->jump_hidden_referer( $item['click_url'] );
		}
    
    $pid = get_refer_pid();

		$this->assign('pid', $pid);
		$this->assign('date', $dt);
		$this->assign('item', $item);
        $this->display($tpl);
    }

}