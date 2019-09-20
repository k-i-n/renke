<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 用户模型
 */

namespace app\common\model;

class Position extends Base
{
    function getPositionList()
    {
        $where[] = ['is_del', 'eq', 0];

        $list = $this->where($where)->select()->toArray();

        return $list;
    }

    function getPositionListByDeptId($dept_id)
    {
        $where[] = ['is_del', 'eq', 0];
        $where[] = ['dept_id', 'eq', $dept_id];

        $list = $this->where($where)->select()->toArray();

        return $list;
    }
}
