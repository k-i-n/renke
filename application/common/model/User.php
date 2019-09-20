<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 用户模型
 */

namespace app\common\model;

use app\common\model\Dept as DeptModel;
use app\common\model\Position as PositionModel;
use think\Model;

class User extends Model
{

    public function getDeptNameAttr($value, $data)
    {
        $dept = db('Dept')->column('name', 'id');
        if (isset($dept[$data['dept_id']])) {
            $dept_name = $dept[$data['dept_id']];
        } else {
            $dept_name = '';
        }
        return $dept_name;
    }


    public function getIsLeaderTextAttr($value, $data)
    {
        if ($data['is_leader'] == 1) {
            return '是';
        } else {
            return '';
        }
    }

    function getUserListByDeptId($dept_id, $is_include_child = false)
    {
        $dept_model = new DeptModel();

        if ($is_include_child) {
            $child_dept_list = $dept_model->getChildDeptList($dept_id, $is_include_child);

            $dept_list = $child_dept_list;
            $dept_list[] = $dept_id;

            $where_user[] = ['dept_id', 'in', $dept_list];

        } else {
            $where_user[] = ['dept_id', 'eq', $dept_id];
        }

        $field = 'name,mobile,position_id';
        $user_list = $this->where($where_user)->field($field)->select();

        return $user_list;
    }
}
