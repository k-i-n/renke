<?php

namespace app\home\controller;

use think\Controller;
use think\Request;
use think\Db;

class Error extends Controller
{
    public function index(Request $request)
    {
        if($request->controller()=="title"){
            $this->redirect("/error/title");
        }

        if($request->controller()=="more"){
            $this->redirect("/error/more");
        }

        if($request->controller()=="page"){
            $this->redirect("/error/page");
        }

        if($request->controller()=="page"){
            $this->redirect("/error/page");
        }

        if($request->controller()=="search"){
            $this->redirect("/error/search");
        }

        if($request->controller()=="search1"){
            $this->redirect("/error/search1");
        }

        $cat_id= $request->param('id');

        $category=Db::name('article_category')
            ->where('id',$cat_id)
            ->find();

        if ($category['column']=='list') {
            $page=$category['list'];
        } elseif ($category['column']=='article') {
            $page=$category['article'];
        } else {
            $url=$category['url'];
            $this->redirect($url);
        }

        return $this->fetch("$page",['id'=>$cat_id]);

    }

    public function title(Request $request){
        //文章id
        $aid=$request->param('aid');

        //获取文章
        $article=Db::name("article")->where('id',$aid)->find();

        //获取所属分类id
        $cat_id=$article['category_id'];

        //获取所属分类
        $category=Db::name("article_category")->where('id',$cat_id)->find();

        //获取对应一级分类id
        $cat_1_id=$category['pid'];
        if($cat_1_id==0){
            $daohang=[];
        }else{
            $daohang=Db::name("article_category")->where('pid',$cat_1_id)->select();
        }

        return view('page/article',['daohang'=>$daohang,'article'=>$article,'aid'=>$aid]);
    }

    public function page(Request $request){
        //文章id
        $aid=$request->param('aid');
        return view('page/page',['aid'=>$aid]);
    }

    public function more(Request $request){
        //分类id
        $cid=$request->param('cid');
        return view('page/list',['cid'=>$cid]);
    }

    public function search(Request $request){
        $content=$request->param('content');
        $id=$request->param('cid');

        return view('page/list',['content'=>$content,'id'=>$id]);

    }

    public function search1(Request $request){
        $content=$request->param('content');
        $cid=$request->param('cid');

        return view('page/list',['content'=>$content,'cid'=>$cid]);

    }

}
