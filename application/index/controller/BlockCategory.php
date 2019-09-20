<?php

/* @project : 地产SaaS
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 菜单控制器
 */

namespace app\index\controller;

use app\common\controller\Base;
use app\common\model\BlockCategory as CategoryModel;
use think\Request;

class BlockCategory extends Base
{

    function index(Request $request)
    {

        $where_category = array();
        $category_model = new CategoryModel();
        $category_obj = $category_model->where($where_category)->field('id,pid,name,url,sort,is_del')->order('sort desc')->select();

        $category_tree = list_to_tree($category_obj->toArray());
        $category_arr = tree_to_list($category_tree);

        $this->assign('category_arr', $category_arr);

        return $this->fetch();
    }

    function add()
    {
        return $this->fetch();
    }

    function edit($id)
    {

        $category = $this->_edit($id);

        if ($category['pid'] == 0) {
            $pid_name = '根节点';
        } else {
            $where_pid[] = array('id', 'eq', $category['pid']);
            $pid_name = model('BlockCategory')->where($where_pid)->value('name');
        }

        $this->assign('category', $category);
        $this->assign('pid_name', $pid_name);

        return $this->fetch();
    }

    function select_pid()
    {

        $category_model = new CategoryModel();

        $category_list = $category_model->getList();


        $root['id'] = 0;
        $root['name'] = '根节点';

        if (!$category_list->isEmpty()) {

            $category_tree = list_to_tree($category_list->toArray());
            $root['_child'] = $category_tree;
        }

        $this->assign('category_tree', array($root));

        return $this->fetch();
    }

    function del(Request $request)
    {
        $category_model = new CategoryModel();

        $has_child = $category_model->hasChild($request->id);

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
