<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 菜单模型
 */

namespace app\common\model;

use think\Model;

class Base extends Model
{
    protected $insert = ['user_id', 'user_name', 'is_del' => 0];

    function setUserIdAttr()
    {
        return get_user_id();
    }

    function setUserNameAttr()
    {
        return get_user_name();
    }
}
