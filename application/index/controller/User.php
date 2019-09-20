<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 用户控制器
 */

namespace app\index\controller;

use app\common\controller\Base;
use think\Request;
use app\common\model\Dept as DeptModel;

class User extends Base
{

    function index(Request $request)
    {
        $dept_model = new DeptModel();
        $dept_list = $dept_model->getDeptList();
        $this->assign('dept_list', $dept_list);

        $this->_search_filter($where_user);

        $model = model('User');
        $user_obj = $this->_list($model, $where_user, 'sort desc');
        $this->assign('user_obj', $user_obj);

        if ($request->isAjax()) {
            return $user_obj;
        } else {
            return $this->fetch();
        }
    }

    function add()
    {
        $dept_model = new DeptModel();
        $dept_list = $dept_model->getDeptList();
        $this->assign('dept_list', $dept_list);

        return $this->fetch();
    }

    function save(Request $request)
    {
        if ($request->opmode == 'add') {
            $request->password = hash_func(substr($request->mobile, 6));
        }

        return $this->_save($request);
    }

    function edit($id)
    {
        $dept_model = new DeptModel();
        $dept_list = $dept_model->getDeptList();
        $this->assign('dept_list', $dept_list);

        $vo = $this->_edit($id);
        return $this->fetch();
    }

    function del(Request $request)
    {
        $where_check[] = array('pid', 'eq', $request->id);
        $where_check[] = array('is_del', 'eq', 0);

        $check_count = model('Menu')->where($where_check)->count();
        if ($check_count > 0) {
            return $this->api_error('有子节点不允许删除');
        } else {
            $result = $this->_del($request);
            if ($result != false) {
                return $this->api_success('成功冻结');
            } else {
                return $this->api_error('冻结失败');
            }
        }
    }

    function sort_up(Request $request)
    {
        return $this->_sort_up($request);
    }

    function sort_down(Request $request)
    {
        return $this->_sort_down($request);
    }

    function set_valid(Request $request)
    {
        $this->_set_valid($request);
    }

    function set_invalid(Request $request)
    {
        $this->_set_invalid($request);
    }
}
