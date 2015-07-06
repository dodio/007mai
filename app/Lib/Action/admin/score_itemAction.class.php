<?php

class score_itemAction extends BackendAction
{

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('score_item');
        $this->_cate_mod =D('score_item_cate');
    }

    public function _before_index() {
        //默认排序
        $this->sort = 'ordid';
        $this->order = 'ASC';

        $res = $this->_cate_mod->field('id,name')->select();
        $cate_list = array();
        foreach ($res as $val) {
            $cate_list[$val['id']] = $val['name'];
        }
        $this->assign('cate_list', $cate_list);
    }

    protected function _search() {
        $map = array();
        ($cate_id = $this->_request('cate_id', 'trim')) && $map['cate_id'] = array('eq', $cate_id);
        ($keyword = $this->_request('keyword', 'trim')) && $map['title'] = array('like', '%'.$keyword.'%');

        ($start_time_min = $this->_request('start_time_min', 'trim')) && $map['start_time'][] = array('egt', strtotime($start_time_min));
        ($start_time_max = $this->_request('start_time_max', 'trim')) && $map['start_time'][] = array('elt', strtotime($start_time_max)+(24*60*60-1));
        ($end_time_min = $this->_request('end_time_min', 'trim')) && $map['end_time'][] = array('egt', strtotime($end_time_min));
        ($end_time_max = $this->_request('end_time_max', 'trim')) && $map['end_time'][] = array('elt', strtotime($end_time_max)+(24*60*60-1));

        $this->assign('search', array(
            'keyword' => $keyword,
            'cate_id' => $cate_id,
            'start_time_min'=>$start_time_min,
            'start_time_max'=>$start_time_max,
            'end_time_min'=>$end_time_min,
            'end_time_max'=>$end_time_max
        ));
        return $map;
    }

	public function add() {
        $mod = D($this->_name);
        if (IS_POST) {
            if (false === $data = $mod->create()) {
                IS_AJAX && $this->ajaxReturn(0, $mod->getError());
                $this->error($mod->getError());
            }
            $data = $this->_before_insert($data);
			$data['start_time']=strtotime($data['start_time']);
			$data['end_time']=strtotime($data['end_time']);
            $data['add_time']=time();
			//exit(print_r($data));
            if( $mod->add($data) ){
                if( method_exists($this, '_after_insert')){
                    $id = $mod->getLastInsID();
                    $this->_after_insert($id);
                }
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'add');
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            $this->assign('open_validator', true);
            if (IS_AJAX) {
                $response = $this->fetch();
                $this->ajaxReturn(1, '', $response);
            } else {
                $this->display();
            }
        }
	}
	    /**
     * 修改
     */
    public function edit()
    {
        $mod = D($this->_name);
        $pk = $mod->getPk();
        if (IS_POST) {
            if (false === $data = $mod->create()) {
                IS_AJAX && $this->ajaxReturn(0, $mod->getError());
                $this->error($mod->getError());
            }
            $data = $this->_before_update($data);
			$data['start_time']=strtotime($data['start_time']);
			$data['end_time']=strtotime($data['end_time']);
            if (false !== $mod->save($data)) {
                if( method_exists($this, '_after_update')){
                    $id = $data['id'];
                    $this->_after_update($id);
                }
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'edit');
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            $id = $this->_get($pk, 'intval');
            $info = $mod->find($id);
            $this->assign('info', $info);
            $this->assign('open_validator', true);
            if (IS_AJAX) {
                $response = $this->fetch();
                $this->ajaxReturn(1, '', $response);
            } else {
                $this->display();
            }
        }
    }

    public function _before_add() {
        $cate_list = $this->_cate_mod->field('id,name')->select();
        $this->assign('cate_list',$cate_list);
    }

    public function _before_edit() {
        $this->_before_add();
    }

    protected function _before_insert($data) {
        //上传图片
        if (!empty($_FILES['img']['name'])) {
            $time_dir = date('ym/d');
            $result = $this->_upload($_FILES['img'], 'score_item/' . $time_dir, array(
                'width' => C('ftx_score_item_img.swidth').','.C('ftx_score_item_img.bwidth'),
                'height' => C('ftx_score_item_img.sheight').','.C('ftx_score_item_img.bheight'),
                'suffix' => '_s,_b',
                'remove_origin' => true
            ));
            if ($result['error']) {
                $this->error($result['info']);
            } else {
                $ext = array_pop(explode('.', $result['info'][0]['savename']));
                $data['img'] = $time_dir .'/'. str_replace('.' . $ext, '_s.' . $ext, $result['info'][0]['savename']);
            }
        }
        return $data;
    }

    protected function _before_update($data) {
        if (!empty($_FILES['img']['name'])) {
            $time_dir = date('ym/d');
            //删除原图
            $old_img = $this->_mod->where(array('id'=>$data['id']))->getField('img');
            $old_img = 'score_item/' . $time_dir . $old_img;
            is_file($old_img) && @unlink($old_img);
            //上传新图
            $result = $this->_upload($_FILES['img'], 'score_item/' . $time_dir, array(
                'width' => C('ftx_score_item_img.swidth').','.C('ftx_score_item_img.bwidth'),
                'height' => C('ftx_score_item_img.sheight').','.C('ftx_score_item_img.bheight'),
                'suffix' => '_s,_b',
                'remove_origin' => true
            ));
            if ($result['error']) {
                $this->error($result['info']);
            } else {
                $ext = array_pop(explode('.', $result['info'][0]['savename']));
                $data['img'] = $time_dir .'/'. str_replace('.' . $ext, '_s.' . $ext, $result['info'][0]['savename']);
            }
        } else {
            unset($data['img']);
        }
        return $data;
    }

    public function set_time(){
        $ids = I("ids","","trim");
        $start_time = I("start_time","","trim");
        $end_time = I("end_time","","trim");
        if($ids == ""){
            $this->ajaxReturn(0,"ID 错误");
        }
        if($start_time == "" && $end_time == ""){
            $this->ajaxReturn(0,"没有时间参数");
        }

        $ids = explode(",", $ids);
        $data = array();
        $data["id"] = array("IN",$ids);
        if($start_time!=""){
            $data['start_time'] = strtotime($start_time);
        }
        if($end_time!=""){
            $data['end_time'] = strtotime($end_time);
        }

        if(false !== $this->_mod->save($data)){
            $this->ajaxReturn(1,"设置成功");
        }else{
            $this->ajaxReturn(0,"没有成功");
        }
    }
}