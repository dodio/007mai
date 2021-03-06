<?php
class adboardAction extends BackendAction {
    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('adboard');
        $this->assign('tpl_list', $this->_mod->get_tpl_list());
    }

    public function _before_index() {
        $big_menu = array(
            'title' => L('adboard_add'),
            'iframe' => U('adboard/add'),
            'id' => 'add',
            'width' => '500',
            'height' => '280'
        );
        $this->assign('big_menu', $big_menu);
    }

    protected function _search(){
        $map = array();
        ($keyword = I("keyword","","trim")) && $map['name'] = array('like',"%" .$keyword."%");
        ($board_type = I("board_type","","trim")) && $map['tpl'] = $board_type;
        $this->assign("search",array(
            "keyword"=>$keyword,
            "board_type"=>$board_type,
            ));
        return $map;
    }

    protected function _before_insert($data) {
        if ($this->_mod->name_exists($data['name'])) {
            $this->ajaxReturn(0, L('adboard_already_exists'));
        }
    }

    protected function _before_edit() {
        $tpl_list = $this->_mod->get_tpl_list();
        $this->assign('tpl_list', $tpl_list);
    }
    protected function _before_update($data) {
        if ($this->_mod->name_exists($data['name'], $data['id'])) {
            $this->ajaxReturn(0, L('adboard_already_exists'));
        }
    }

    public function ajax_check_name() {
        $name = $this->_get('name', 'trim');
        $id = $this->_get('id', 'intval');
        if ($this->_mod->name_exists($name, $id)) {
            $this->ajaxReturn(0, L('adboard_already_exists'));
        } else {
            $this->ajaxReturn();
        }
    }
}