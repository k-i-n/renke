<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 菜单模型
 */

namespace app\common\model;

use think\Model;

class BlockCategory extends Model
{

    function getList()
    {
        $where[] = ['is_del', 'eq', 0];
        $list = $this->where($where)->select();

        return $list;
    }

    function getCategoryTree()
    {
        $where[] = ['is_del', 'eq', 0];

        $list = $this->where($where)->select()->toArray();

        $tree = list_to_tree($list);

        return $tree;
    }

    function hasChild($id)
    {
        $where[] = ['pid', 'eq', $id];

        return $this->where($where)->count();
    }

}
