<?php

namespace app\index\controller;

use app\common\controller\Base;
use think\Request;

class Error extends Base
{
    public function _empty(Request $request)
    {
        $controller = parse_name($request->controller());
        $action = $request->action();

        return $this->fetch("$controller/$action");
    }

    public function index(Request $request)
    {
        return $this->fetch();
    }
}
