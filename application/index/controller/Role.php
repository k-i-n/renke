<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 角色控制器
 */

namespace app\index\controller;

use app\common\controller\Base;
use think\Request;

class Role extends Base
{

    function index(Request $request)
    {
        $request->sort = 'sort desc';
        return $this->_index($request);
    }

    function add()
    {
        return $this->fetch();
    }

    function edit($id)
    {
        $vo = $this->_edit($id);

        if ($vo['pid'] == 0) {
            $this->assign('pid_name', '根节点');
        } else {
            $where_pid[] = array('id', 'eq', $vo['pid']);
            $pid_menu = model('Role')->where($where_pid)->find();
            $this->assign('pid_name', $pid_menu['name']);
        }

        return $this->fetch();
    }

    function select_pid()
    {
        $where_menu[] = array('is_del', 'eq', 0);
        $menu_list = model('Role')->field('id,pid,name')->where($where_menu)->order('sort asc')->select();
        $menu_tree = list_to_tree($menu_list->toArray());
        $this->assign('menu_tree', $menu_tree);

        $root['id'] = 0;
        $root['name'] = '根节点';
        $root['_child'] = $menu_tree;

        $this->assign('tree', array($root));

        return $this->fetch();
    }

    function del(Request $request)
    {
        $id = $request->id;

        $where_check[] = array('pid', 'eq', $id);
        $where_check[] = array('is_del', 'eq', 0);

        $check_count = model('Role')->where($where_check)->count();
        if ($check_count > 0) {
            return $this->api_error('有子节点不允许删除');
        } else {
            $result = $this->_del($request);

            if ($result !== false) {
                return $this->api_success('删除成功');
            } else {
                return $this->api_error('删除失败');
            }
        }
    }

    function menu()
    {
        //顶级菜单信息
        $where_top_menu[] = array('pid', 'eq', 0);
        $top_menu_list = model('Menu')->where($where_top_menu)->order('sort desc')->column('name', 'id');
        $this->assign('top_menu_list', $top_menu_list);

        //权限组信息
        $role_list = model('Role')->field('id,name')->order('sort asc')->select();
        $this->assign('role_list', $role_list);

        //菜单信息
        if (!empty($_POST['top_menu'])) {
            $top_menu = $_POST['top_menu'];
        } else {
            $top_menu = "";
        }

        $this->assign('top_menu', $top_menu);

        $where_menu = [];
        $menu_list = model('Menu')->where($where_menu)->field('id,pid,name')->order('sort desc')->select();

        if (!empty($top_menu)) {
            $menu_list = tree_to_list(list_to_tree($menu_list->toArray(), $top_menu));
        } else {
            $menu_list = tree_to_list(list_to_tree($menu_list->toArray()));
        }

        $this->assign('menu_list', $menu_list);

        return $this->fetch();
    }

    function get_menu_list()
    {
        $role_id = request()->param('role_id');

        $where[] = array('role_id', 'eq', $role_id);
        $menu_list = db('RoleMenu')->where($where)->select();

        if ($menu_list !== false) {// 读取成功
            $return['data'] = $menu_list;
            $return['status'] = 1;
            exit(json_encode($return));
        }
    }

    function set_menu()
    {

        //删除之前的节点;
        $role_id = request()->param('role_id');

        $org_menu_list = request()->param('org_menu_list');
        model('Role')->del_menu($role_id, $org_menu_list);

        $menu_list = request()->param('menu_list');

        $request = request()->param();
        if (isset($request['admin'])) {
            $admin_list = $request['admin'];
        }

        if (isset($request['write'])) {
            $write_list = $request['write'];
        }
        if (isset($request['read'])) {
            $read_list = $request['read'];
        }
        $result = model('Role')->set_menu($role_id, $menu_list);

        if (!empty($admin_list)) {
            $where = array();
            $where[] = array('role_id', 'eq', $role_id);
            $where[] = array('menu_id', 'in', $admin_list);
            $data['admin'] = 1;

            model('RoleMenu')->where($where)->data($data)->update();
        }
        if (!empty($write_list)) {
            $where = array();
            $where[] = array('role_id', 'eq', $role_id);
            $where[] = array('menu_id', 'in', $write_list);
            $data['write'] = 1;
            db('RoleMenu')->where($where)->data($data)->update();
        }

        if (!empty($read_list)) {
            $where = array();
            $where[] = array('role_id', 'eq', $role_id);
            $where[] = array('menu_id', 'in', $read_list);
            $data['read'] = 1;
            model('RoleMenu')->where($where)->data($data)->update();
        }

        if ($result === false) {
            $this->error('操作失败！');
        } else {
            $this->assign('jumpUrl', get_return_url());
            $this->success('操作成功！');
        }
    }

    function user()
    {

        $map[] = array('is_del', 'eq', 0);
        $user_list = model('User')->where($map)->select();

        $this->assign("user_list", $user_list);

        $role_list = model('role')->order('sort asc')->select();
        $this->assign("role_list", $role_list);
        return $this->fetch();
    }

    function get_role_list()
    {
        $user_id = request()->param('user_id');

        $where[] = array('user_id', 'eq', $user_id);
        $role_list = db('RoleUser')->where($where)->select();

        if ($role_list !== false) {// 读取成功
            $return['data'] = $role_list;
            $return['status'] = 1;
            exit(json_encode($return));
        }
    }

    function set_role()
    {

        $request = request()->param();

        if (isset($request['user_id'])) {
            $user_list = $request['user_id'];
        }

        if (isset($request['role_id'])) {
            $role_list = $request['role_id'];
        }

        model('Role')->del_role($user_list);

        $result = model('Role')->set_role($user_list, $role_list);
        if ($result === false) {
            $this->error('操作失败！');
        } else {
            $this->assign('jumpUrl', get_return_url());
            $this->success('操作成功！');
        }
    }

}
