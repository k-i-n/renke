<?php

namespace app\index\controller;

use app\common\controller\Base;
use think\Request;

class Index extends Base
{
    public function index(Request $request)
    {

        return $this->fetch();
    }

    public function hello($name = 'ThinkPHP5')
    {
        return 'hello,' . $name;
    }
}
