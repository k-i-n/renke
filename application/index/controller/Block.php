<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 用户控制器
 */

namespace app\index\controller;

use app\common\controller\Base;
use app\common\model\BlockCategory as CategoryModel;
use think\Db;
use think\Request;

class Block extends Base
{

    function add()
    {
        return $this->fetch();
    }

    function index(Request $request)
    {

        $category_model = new CategoryModel();
        $category_tree = $category_model->getCategoryTree();
        $this->assign('category_tree', $category_tree);

        return $this->_index($request);

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

    function select_category()
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

    function edit($id)
    {
        $block=$this->_edit($id);
        $category_id=Db::name('block')
            ->alias('a')
            ->field('a.category_id')
            ->where('a.id',$id)
            ->find();
        $category_id=$category_id['category_id'];  //获取所属分类id

        $category = CategoryModel::find($category_id);

        if ($category_id == 0) {
            $pid_name = '根节点';
        } else {
            $where_id[] = array('id', 'eq', $category_id);
            $category_name = model('BlockCategory')->where($where_id)->value('name');
        }

        $this->assign('category', $category);
        $this->assign('category_name', $category_name);

        $this->assign('block', $block);

        return $this->fetch();
    }
}
