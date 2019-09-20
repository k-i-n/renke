<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 用户模型
 */

namespace app\common\model;

class Dept extends Base
{
    function getDeptList()
    {
        $where[] = ['is_del', 'eq', 0];

        $list = $this->where($where)->select()->toArray();

        return $list;
    }

    function getDeptTree()
    {
        $where[] = ['is_del', 'eq', 0];

        $list = $this->where($where)->select()->toArray();

        $tree = list_to_tree($list);

        return $tree;
    }

    function getChildDeptList($dept_id, $is_include_child = false)
    {
        if ($is_include_child) {
            $where_dept[] = ['is_del', 'eq', 0];
            $dept_list = $this->where($where_dept)->select();
            $dept_tree = list_to_tree($dept_list, $dept_id);
            $child_dept_list = tree_to_list($dept_tree);

            return $child_dept_list;
        } else {
            $where_dept[] = ['is_del', 'eq', 0];
            $where_dept[] = ['pid', 'eq', $dept_id];

            $child_dept_list = $this->where($where_dept)->select();
        }

        return $child_dept_list->toArray();
    }
}
