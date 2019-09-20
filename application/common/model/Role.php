<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 角色模型
 */

namespace app\common\model;

use think\Model;

class Role extends Model {

    function get_menu_list($role_id) {
        $model = model('role_node');
        $where[] = array('role_node.role_id', 'eq', $role_id);
        $list = $model -> where($where) -> get_list();
        return $list;
    }

    function del_menu($role_id, $menu_list) {
        if (empty($menu_list)) {
            return true;
        }

        if (is_array($menu_list)) {
            $menu_list = array_filter($menu_list);
        } else {
            $menu_list = array_filter(explode(",", $menu_list));
        }

        $where[] = array('role_id', 'eq', $role_id);
        $where[] = array('menu_id', 'in', $menu_list);
        $result = model('RoleMenu') -> where($where) -> delete();

        if ($result === false) {
            return false;
        } else {
            return true;
        }
    }

    function set_menu($role_id, $menu_list) {
        if (empty($menu_list)) {
            return true;
        }
        if (is_array($menu_list)) {
            $menu_list = array_filter($menu_list);
        } else {
            $menu_list = array_filter(explode(",", $menu_list));
        }
    
        foreach ($menu_list as $key => $menu_id) {
            $data[$key]['menu_id'] = $menu_id;
            $data[$key]['role_id'] = $role_id;
        }
 
        $result = model('role_menu') -> insertAll($data);
 
        if ($result === false) {
            return false;
        }
        return true;
    }

    function del_role($user_list) {
        if (empty($user_list)) {
            return true;
        }

        if (is_array($user_list)) {
            $user_list = array_filter($user_list);
        } else {
            $user_list = array_filter(explode(",", $user_list));
        }

        $where[] = array('user_id', 'in', $user_list);
        $result = model('RoleUser') -> where($where) -> delete();

        if ($result === false) {
            return false;
        } else {
            return true;
        }
    }

    function set_role($user_list, $role_list) {

        if (empty($user_list)) {
            return true;
        }
        if (empty($role_list)) {
            return true;
        }
        if (is_array($user_list)) {
            $user_list = array_filter($user_list);
        } else {
            $user_list = explode(",", $user_list);
            $user_list = array_filter($user_list);
        }
        $user_list = implode(",", $user_list);

        if (is_array($role_list)) {
            $role_list = array_filter($role_list);
        } else {
            $role_list = explode(",", $role_list);
            $role_list = array_filter($role_list);
        }
        $role_list = implode(",", $role_list);

        $prefix = config('database.prefix');
        $where = 'a.id in (' . $user_list . ') AND b.id in(' . $role_list . ')';
        $sql = 'INSERT INTO ' . $prefix . 'role_user (user_id,role_id) ';
        $sql .= ' SELECT a.id, b.id FROM ' . $prefix . 'user a, ' . $prefix . 'role b WHERE ' . $where;

        $result = $this -> execute($sql);
        if ($result === false) {
            return false;
        } else {
            return true;
        }
    }

}
