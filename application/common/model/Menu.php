<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 菜单模型
 */

namespace app\common\model;

use think\Model;

class Menu extends Model
{

    function getAccessList($user_id = null)
    {

        if (empty($user_id)) {
            $user_id = get_user_id();
        }

        $menu = db('menu');
        $menu->alias('menu');
        $menu->field("menu.icon,menu.badge,menu.sort, menu.id, menu.pid, menu.name, menu.url,sum(role_menu.admin) as 'admin',sum(role_menu.write) as 'write',sum(role_menu.read) as 'read'");
        $menu->join('role_menu', 'menu.id=role_menu.menu_id');
        $menu->join('role_user', 'role_user.role_id=role_menu.role_id');

       // $where[] = array('role_user.user_id', 'eq', $user_id);
        $where[] = array('menu.is_del', 'eq', 0);

        //$module = request()->module();
        //$where[] = array('menu.module', 'eq', $module);

        $access_list = $menu->where($where)->group('menu.id')->order('menu.sort desc')->select();

        return $access_list;
    }

    //------------------------------------------------


    public function getModuleNameAttr($value, $data)
    {
        $module_arr = config('module_arr');

        if (isset($module_arr[$data['module']])) {
            $module_name = $module_arr[$data['module']];
        } else {
            $module_name = '';
        }
        return $module_name;
    }

    function getMenuList()
    {
        $module = request()->module();

        //$where_role_user[] = array('user_id', 'eq', $user_id);
        $where_role_user = [];
        $role_id_list = model('RoleUser')->where($where_role_user)->column('role_id');

        if (empty($role_id_list)) {
            return [];
        }

        $role_menu = model('RoleMenu');
        $where_role_menu[] = array('role_id', 'in', $role_id_list);

        $menu_id_list = $role_menu->where($where_role_menu)->column('menu_id');

        if (empty($menu_id_list)) {
            return [];
        }

        $menu = model('Menu');

        $where_menu[] = array('module', 'eq', $module);
        $where_menu[] = array('is_del', 'eq', 0);
        //$where_menu[] = array('id', 'in', $menu_id_list);


        $list = $menu->where($where_menu)->order('sort desc')->select()->toArray();

        return $list;
    }


    function member_menu_list()
    {
        $where_role[] = array('name', 'eq', '企业端');
        $role_id = db('Role')->where($where_role)->value('id');

        $menu = db('menu');
        $menu->alias('menu');
        $menu->field("menu.icon,menu.badge,menu.sort, menu.id, menu.pid, menu.name, menu.url,sum(role_menu.admin) as 'admin',sum(role_menu.write) as 'write',sum(role_menu.read) as 'read'");
        $menu->join('role_menu', 'menu.id=role_menu.menu_id');
        $where[] = array('role_menu.role_id', 'eq', $role_id);
        $where[] = array('menu.is_del', 'eq', 0);

        $menu->where($where);
        $menu->group('menu.id');
        $menu->order('menu.sort desc');

        $list = $menu->select();

        return $list;
    }

    function getAuth($url, $user_id = null)
    {
        if (empty($user_id)) {
            $user_id = get_user_id();
        }

        $menu = db('menu');
        $menu->alias('menu');
        $menu->field("sum(role_menu.admin) as 'admin',sum(role_menu.write) as 'write',sum(role_menu.read) as 'read'");
        $menu->join('role_menu', 'menu.id=role_menu.menu_id');
        $menu->join('role_user', 'role_user.role_id=role_menu.role_id');
        $where[] = array('role_user.user_id', 'eq', $user_id);
        $where[] = array('menu.is_del', 'eq', 0);
        $where[] = array('menu.url', 'eq', $url);

        $menu->where($where);
        $menu->group('menu.id');
        $menu->order('menu.sort desc');

        return $menu->find();
    }

    function hasChild($id)
    {
        $where[] = ['pid', 'eq', $id];

        return $this->where($where)->count();
    }

}
