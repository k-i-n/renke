<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 用户控制器
 */

namespace app\index\controller;

use app\common\controller\Base;
use think\Request;

class Provider extends Base
{

    function index(Request $request)
    {
        return $this->fetch();
    }

    function add()
    {
        return $this->fetch();
    }

    function contract()
    {
        return $this->fetch();
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

}
