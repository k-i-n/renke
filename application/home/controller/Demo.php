<?php

namespace app\home\controller;

use think\Controller;
use think\Db;
use think\Request;

class Demo extends Controller
{
    public function index(){
        $res=$this->getTree();//
        dump(array_reverse($res));//将结果倒叙
    }

    public function getTree(){
        $id=1;
        static $res = array();//静态变量  每次初始化元数据不会消失
        $info = Db::name('article_category')->field('id,pid,name')->find($id);
        $res[] = $info;
        if($info['pid']>0){//pid大于0  则一定是下级分类
            $this->getTree($info['pid']);//递归
            return $res;
        }
    }
}
