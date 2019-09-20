<?php

/* @project : 地产SaaS
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 菜单控制器
 */

namespace app\index\controller;

use app\common\controller\Base;
use app\common\model\menu as MenuModel;
use think\Request;

class Menu extends Base
{

    function index(Request $request)
    {

        $where_menu = array();

        $menu_obj = model('Menu')->where($where_menu)->field('id,pid,name,url,sort,is_del,module,icon')->order('sort desc')->select();

        $menu_tree = list_to_tree($menu_obj->toArray());
        $menu_arr = tree_to_list($menu_tree);

        $this->assign('menu_arr', $menu_arr);

        return $this->fetch();
    }

    function add()
    {
        $module_arr = config('module_arr');
        $this->assign('module_arr', $module_arr);

        $module = input('module');
        $this->assign('module', $module);

        return $this->fetch();
    }

    function edit($id)
    {
        $module_arr = config('module_arr');
        $this->assign('module_arr', $module_arr);

        $menu = $this->_edit($id);
        $this->assign('module', $menu['module']);

        if ($menu['pid'] == 0) {
            $pid_name = '根节点';
        } else {
            $where_pid[] = array('id', 'eq', $menu['pid']);
            $pid_name = model('Menu')->where($where_pid)->value('name');
        }

        $this->assign('menu', $menu);
        $this->assign('pid_name', $pid_name);

        return $this->fetch();
    }

    function select_pid()
    {

        $where_menu[] = array('is_del', 'eq', 0);
        $menu_list = model('Menu')->field('id,pid,name,sort')->where($where_menu)->order('sort desc')->select();

        $root['id'] = 0;
        $root['name'] = '根节点';

        if (!$menu_list->isEmpty()) {
            $menu_tree = list_to_tree($menu_list->toArray());
            $root['_child'] = $menu_tree;
        }

        $this->assign('menu_tree', array($root));

        return $this->fetch();
    }

    function del(Request $request)
    {
        $id = $request->id;

        $has_child = model('Menu')->hasChild($id);

        if ($has_child) {
            return $this->api_error('有子节点不允许删除');
        } else {
            $result = $this->_destory($request);
            if ($result) {
                return $this->api_success('删除成功');
            } else {
                return $this->api_error('删除失败');
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
}
