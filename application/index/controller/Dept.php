<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 用户控制器
 */

namespace app\index\controller;

use app\common\controller\Base;
use app\common\model\Dept as DeptModel;
use app\common\model\User as UserModel;
use think\Request;


class Dept extends Base
{
    function index(Request $request)
    {
        $dept_model = new DeptModel();

        $dept_tree = $dept_model->getDeptTree();

        $root['id'] = 0;
        $root['name'] = '根节点';

        $menu_tree = $dept_tree;
        $root['_child'] = $menu_tree;

        $this->assign('dept_tree', array($root));

        return $this->fetch();
    }

    function get_dept_info($dept_id)
    {
        $user_model = new UserModel();

        $user_list = $user_model->getUserListByDeptId($dept_id);

        $data['user_list'] = $user_list;

        return $this->api_success('查询成功', $data);
    }

    function add()
    {
        return $this->fetch();
    }

    function add_dept()
    {
        return $this->fetch();
    }

    function add_position($dept_id)
    {
        $this->assign('dept_id', $dept_id);
        return $this->fetch();
    }

    function contract()
    {
        return $this->fetch();
    }

    function del(Request $request)
    {
        $result = $this->_del($request);
        if ($result) {
            return $this->api_success('删除成功');
        } else {
            return $this->api_error('删除失败');
        }
    }

}
