<?php
/**
 * 后台控制器基类
 */
class BackendAction extends TopAction
{
    protected $_name = '';
    protected $menuid = 0;
    public function _initialize() {
        parent::_initialize();
		
        $this->_name = $this->getActionName();
        $this->check_modual();
        $this->menuid = $this->_request('menuid', 'trim', 0);
        if ($this->menuid) {
            $sub_menu = D('menu')->sub_menu($this->menuid, $this->big_menu);
            $selected = '';
            if(is_array($sub_menu)){
                foreach ($sub_menu as $key=>$val) {
                    $sub_menu[$key]['class'] = '';
                    if (MODULE_NAME == $val['module_name'] && ACTION_NAME == $val['action_name'] && strpos(__SELF__, $val['data'])) {
                        $sub_menu[$key]['class'] = $selected = 'on';
                    }
                }
            }
            if (empty($selected)) {
                if(is_array($sub_menu)){
                    foreach ($sub_menu as $key=>$val) {
                        if (MODULE_NAME == $val['module_name'] && ACTION_NAME == $val['action_name']) {
                            $sub_menu[$key]['class'] = 'on';
                            break;
                        }
                    }
                }
            }
            $this->assign('sub_menu', $sub_menu);
        }
        $this->assign('menuid', $this->menuid);
    }

    // 权限检查
    protected function check_modual() {
        // 无需登录的模块 操作
        $no_need_login = array("/index/login",'/index/verify_code');
        if ( (!isset($_SESSION['admin']) || !$_SESSION['admin']) && !in_array(__ACTION__, $no_need_login) ) {
            $this->redirect('index/login');
        }

        //不需权限的模块
        $no_need_right = explode(',', 'attachment,index');
        if (in_array( MODULE_NAME, $no_need_right)) {
            return true;
        }
    
        $r = $this->check_right(MODULE_NAME,ACTION_NAME,__SELF__);
        if (!$r) {
            if(IS_AJAX){
                $this->ajaxReturn(0,"没有权限");
            }else{
                $this->error(L('_VALID_ACCESS_'),U('index/panel'));
            }
            exit();
        }
    }
    /**
     * 检查菜单权限
     * @param  [type] $module_name [模块名] //传入数字则，直接比对是否具有指定menu_id 的菜单权限。
     * @param  [type] $action_name [控制器名]
     * @param  string $data        [检查的参数列表]
     * @return [type]              [true/false]
     */
    protected function check_right($module_name,$action_name = "",$data = ""){
        //超级管理员直接通过验证
        if($_SESSION['admin']['role_id'] == 1) {
            return true;
        }
        $rights = $_SESSION['admin']['rights'];
        //如果传入的是menu_id
        if(is_numeric($module_name)){
            $menu_id = $module_name;
            foreach ($rights as $val) {
                if($val['menu_id'] == $menu_id){
                    return true;
                }
            }
            return false;
        }

        $action_map = array(
            "edit" => "ajax_edit",
            "edit" => "setAll",
            "edit" => "set_time",
            "edit" => "ajax_upload_img",
            "edit" => "ajax_upload_imgs",
            "edit" => "ajax_check_name",
            "edit" => 'set_age',
            "edit" => 'move',
            "edit" => 'ajax_check_email',
            "index"=> "ajax_getchilds",
            "index"=> "ajax_gettags",
            "index"=> "user_thumb",
            "index"=> "get_id",
            "index"=> "getuzlist",
            "index"=> "getUzCateList",
            "add" => "ajaxgetid", //主要是添加商品使用
            "delete"=> "uzhanDelete"
            );
        //传入的3个参数
        foreach ($rights as $val) {
            // 有权限的规则是：模块名一样，控制器名字一样  如果菜单带参数，那要能在参数列表内找到。
            // 通用的
            if( $module_name == $val['module_name']){
                // 等价比较，主要用于通用方法的验证，这种，只要获取了module的权限，就算可以获取相对应的module通用权限
                foreach ($action_map as $act => $map_act) {
                    if($act == $val['action_name'] && $action_name == $map_act){
                        return true;
                    }
                }
                
                if( $val['action_name'] == $action_name && (trim($val['data']) == "" || (strpos( $val['data'] , $data)) ) ){
                    return true;
                }
            }
        }

        return false;
    }

    protected function filter_menu($menus = array()){
        foreach ($menus as $key => $value) {
            if(!$this->check_right($value['id'])){
                unset($menus[$key]);
            }
        }
        return $menus;
    }

    /**
     * 列表页面
     */
    public function index() {
        $map = $this->_search();
        $mod = D($this->_name);
        !empty($mod) && $this->_list($mod, $map);
        $this->display();
    }

    /**
     * 添加
     */
    public function add() {
        $mod = D($this->_name);
        if (IS_POST) {
            if (false === $data = $mod->create()) {
                IS_AJAX && $this->ajaxReturn(0, $mod->getError());
                $this->error($mod->getError());
            }
            if (method_exists($this, '_before_insert')) {
                $data = $this->_before_insert($data);
            }
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
            if(method_exists($this, "_before_add_show")){
                $this->_before_add_show();
            }
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
            if (method_exists($this, '_before_update')) {
                $data = $this->_before_update($data);
            }
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
            if(method_exists($this,"_before_edit_show")){
                $info = $this->_before_edit_show($info);
            }
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

    /**
     * ajax修改单个字段值
     */
    public function ajax_edit()
    {
        //AJAX修改数据
        $mod = D($this->_name);
        $pk = $mod->getPk();
        $id = $this->_get($pk, 'intval');
        $field = $this->_get('field', 'trim');
        $val = $this->_get('val', 'trim');
        //允许异步修改的字段列表  放模型里面去 TODO
        $mod->where(array($pk=>$id))->setField($field, $val);
        $this->ajaxReturn(1);
    }

    /**
     * 删除
     */
    public function delete()
    {
        $mod = D($this->_name);
        $pk = $mod->getPk();
        $ids = trim($this->_request($pk), ',');
        if ($ids) {
            if (false !== $mod->delete($ids)) {
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'));
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            IS_AJAX && $this->ajaxReturn(0, L('illegal_parameters'));
            $this->error(L('illegal_parameters'));
        }
    }

    /**
     * 获取请求参数生成条件数组
     */
    protected function _search() {
        //生成查询条件
        $mod = D($this->_name);
        $map = array();
        foreach ($mod->getDbFields() as $key => $val) {
            if (substr($key, 0, 1) == '_') {
                continue;
            }
            if ($this->_request($val)) {
                $map[$val] = $this->_request($val);
            }
        }
        return $map;
    }

    /**
     * 列表处理
     *
     * @param obj $model  实例化后的模型
     * @param array $map  条件数据
     * @param string $sort_by  排序字段
     * @param string $order_by  排序方法
     * @param string $field_list 显示字段
     * @param intval $pagesize 每页数据行数
     */
    protected function _list($model, $map = array(), $sort_by='', $order_by='', $field_list='*', $pagesize=72)
    {
        //排序
        $mod_pk = $model->getPk();
        if ($this->_request("sort", 'trim')) {
            $sort = $this->_request("sort", 'trim');
        } else if (!empty($sort_by)) {
            $sort = $sort_by;
        } else if ($this->sort) {
            $sort = $this->sort;
        } else {
            $sort = $mod_pk;
        }
        if ($this->_request("order", 'trim')) {
            $order = $this->_request("order", 'trim');
        } else if (!empty($order_by)) {
            $order = $order_by;
        } else if ($this->order) {
            $order = $this->order;
        } else {
            $order = 'DESC';
        }

        if ($pagesize) {
            $count = $model->where($map)->count($mod_pk);
            $pager = new Page($count, $pagesize);
        }
        $select = $model->field($field_list)->where($map)->order($sort . ' ' . $order);
        $this->list_relation && $select->relation(true);
        if ($pagesize) {
            $select->limit($pager->firstRow.','.$pager->listRows);
            $page = $pager->show();
            $this->assign("page", $page);
        }
        $list = $select->select();
        $this->assign('list', $list);
        $this->assign('list_table', true);
    }

    protected function update_config($new_config, $config_file = '') {
        !is_file($config_file) && $config_file = CONF_PATH . 'index/config.php';
        if (is_writable($config_file)) {
            $config = require $config_file;
            $config = array_merge($config, $new_config);
            file_put_contents($config_file, "<?php \nreturn " . stripslashes(var_export($config, true)) . ";", LOCK_EX);
            @unlink(RUNTIME_FILE);
            return true;
        } else {
            return false;
        }
    }

    // 批量设置数据
    public function setAll(){
        $mod = D($this->_name);
        $pk = $mod->getPk();
        $ids = trim($this->_request($pk), ',');
        if ($ids) {
            $data = $this->_get();
            unset($data[$pk]);
            $data = $mod->create($data);
            $data['id'] = array("IN",$ids);
            if (method_exists($this, '_before_update')) {
                $data = $this->_before_update($data);
            }
            if (false !== $mod->save($data)) {
                if( method_exists($this, '_after_update')){
                    $this->_after_update($ids);
                }
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'edit');
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                // $this->error(L('operation_failure'));
            }
        }else{
            IS_AJAX && $this->ajaxReturn(0, L('illegal_parameters'));
            $this->error(L('illegal_parameters'));
        }
    }
}
?>