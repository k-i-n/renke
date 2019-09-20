<?php

namespace app\index\controller;

use app\common\controller\Base;
use think\Request;

class Home extends Base
{
    public function console(Request $request)
    {
        $request->name = 'xxxxxxxxxxxxxxxxxxxxxxx';

        return $this->fetch();
    }
}
