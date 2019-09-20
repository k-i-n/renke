<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
use page\Page;


// 过滤空字符串 用于 Base 控制器 _search_filter
function filter_search_val($val)
{
    if ($val == '0') {
        return true;
    }
    if (empty($val)) {
        return false;
    }
    return true;
}

// list 转 tree
function list_to_tree($list, $root = 0, $pk = 'id', $pid = 'pid', $child = '_child')
{
    // 创建Tree
    $tree = array();
    if (is_array($list)) {
        // 创建基于主键的数组引用

        $refer = array();
        foreach ($list as $key => $data) {
            $list[$key]['spread'] = 'true';
            $refer[$data[$pk]] = &$list[$key];
        }
        foreach ($list as $key => $data) {
            // 判断是否存在parent
            $parentId = 0;
            if (isset($data[$pid])) {
                $parentId = $data[$pid];
            }
            if ((string)$root == $parentId) {
                $tree[] = &$list[$key];
            } else {
                if (isset($refer[$parentId])) {
                    $parent = &$refer[$parentId];
                    $parent[$child][] = &$list[$key];
                }
            }
        }
    }
    return $tree;
}

// tree 转 list
function tree_to_list($tree, $level = 0, $pk = 'id', $pid = 'pid', $child = '_child')
{
    $list = array();
    if (is_array($tree)) {
        foreach ($tree as $val) {
            $val['level'] = $level;
            if (isset($val['_child'])) {
                $child = $val['_child'];
                if (is_array($child)) {
                    unset($val['_child']);
                    $list[] = $val;
                    $list = array_merge($list, tree_to_list($child, $level + 1));
                }
            } else {
                $list[] = $val;
            }
        }
        return $list;
    }
}

// 树形菜单渲染
function tree_menu($tree, $level = 0)
{
    $level++;
    $html = "";
    if (is_array($tree)) {
        if ($level > 1) {
            $id = $tree[0]['pid'];
            $html .= "<input type=\"checkbox\" id=\"chk_tree_$id\" checked=\"true\">";
            $html .= "<label for=\"chk_tree_$id\"><i class=\"fa fa-plus-square-o\"></i></label><ul>\r\n";
        } else {
            $html = "<ul>\r\n";
        }
        foreach ($tree as $val) {
            if (isset($val["name"])) {
                $title = $val["name"];
                $id = $val["id"];
                if (isset($val['_child'])) {
                    $html = $html . "<li>\r\n<a node=\"$id\" >$title</a>\r\n";
                    $html = $html . tree_menu($val['_child'], $level);
                    $html = $html . "</li>\r\n";
                } else {
                    $html = $html . "<li>\r\n<a node=\"$id\" >$title</a>\r\n</li>\r\n";
                }
            }
        }
        $html = $html . "</ul>\r\n";
    }
    return $html;
}

// 获取系统配置

function get_system_config($name, $data_type = 'custom')
{
    $where[] = array('code', 'eq', $name);
    $where[] = array('data_type', 'eq', $data_type);
    $list = model('SystemConfig')->where($where)->value('val');
    return trim($list);
}

// option 渲染
function fill_option($list, $data = null)
{
    $html = "";
    if (is_array($list)) {
        foreach ($list as $key => $val) {
            if (is_array($val)) {
                $id = $val['id'];
                $name = $val['name'];
                if ($id == $data) {
                    $selected = "selected";
                } else {
                    $selected = "";
                }
                $html = $html . "<option value=\"{$id}\" $selected>{$name}</option>\r\n";
            } else {
                if ($key === $data) {
                    $selected = "selected";
                } else {
                    $selected = "";
                }
                $html = $html . "<option value=\"{$key}\" $selected>{$val}</option>\r\n";
            }
        }
    }
    return $html;
}

//  左侧导航

function left_menu($tree, $level = 0)
{
    $level++;
    $html = "";
    if (is_array($tree)) {
        $item_class = '';
        if ($level == 1) {
            $html = '<ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">' . "\r\n";
            $item_class = 'layui-nav-item';
        }
        foreach ($tree as $val) {
            if (isset($val["name"])) {
                $title = $val["name"];
                if (!empty($val["url"])) {
                    $url = url($val['url']);
                } else {
                    $url = "#";
                }
                if (empty($val["id"])) {
                    $id = $val["name"];
                } else {
                    $id = $val["id"];
                }

                if (isset($val['_child'])) {
                    $html .= '<li class="' . $item_class . '">';
                    $html .= "<a node=\"$id\" lay-href=\"" . "$url\"><i class=\"icon " . $val['icon'] . "\" ></i><cite>$title</cite><i class='count'></i></a>\r\n";
                    $html .= '<dl class="layui-nav-child">';
                    $html .= left_menu($val['_child'], $level);
                    $html = $html . "</dl>\r\n";
                    $html .= '</li>';
                } else {
                    $html .= '<li class="' . $item_class . '">';
                    $html .= "<a node=\"$id\" lay-href=\"" . "$url\"><i class=\"icon " . $val['icon'] . "\" ></i><cite>$title</cite><i class='count'></i></a>\r\n";
                    $html .= '</li>';
                }
            }
        }
        if ($level == 1) {
            $html = $html . "</ul>\r\n";
        }
    }
    return $html;
}

// 获取用户ID
function get_user_id($emp_no = null)
{
    if (!empty($emp_no)) {
        $where_user[] = ['emp_no', 'eq', $emp_no];
        $user_id = model('User')->where($where_user)->value('id');
    } else {
        $user_id = session(config('config.user_auth_key'));
        $user_id = isset($user_id) ? $user_id : 0;
    }
    return $user_id;
}

// 获取用户员工编号
function get_emp_no($user_id = null)
{
    if (!empty($user_id)) {
        $where[] = array('id', 'eq', $user_id);
        $emp_no = model('User')->where($where)->value('emp_no');
    } else {
        $emp_no = session("emp_no");
        $emp_no = isset($emp_no) ? $emp_no : 0;
    }
    return $emp_no;
}

// 获取用户名称
function get_user_name($user_id = null)
{
    if (!empty($user_id)) {
        $where[] = array('id', 'eq', $user_id);
        $user_name = model('User')->where($where)->value('name');
    } else {
        $user_name = session('user_name');
        $user_name = isset($user_name) ? $user_name : 0;
    }
    return $user_name;
}

// 获取返回地址
function get_return_url()
{
    $return_url = explode('$', cookie('return_url'));
    return end($return_url);
}

// hash 加密

function hash_func($value)
{
    return md5(md5($value));
}

//根据指定条件获取区块分类数据
function get_block_category($code){
    $article=\think\Db::name('block_category')
        ->alias("a")
        ->join("block b","a.id=b.category_id")
        ->field('a.name as aname,b.name as bname,a.url as aurl,b.url as burl,a.id as aid,b.id as bid,a.*,b.*')
        ->where('a.code',$code)
        ->where('b.is_del',0)
        ->select();
    return $article;
}

//获取导航分类数据
function get_article_category(){
    //所有文章分类
    $category=Db::name('article_category')->select();

    //文章分类添加层级
    $category=get_menu($category);

    return $category;

}


function get_menu($array,$pid=0,$num=0){
    static $arr=[];
    foreach ($array as $key => $value){
        if($value['pid']==$pid){
            $value['num']=$num;
            $arr[]=$value;
            get_menu($array,$value['id'],$num+1);
        }
    }
    return $arr;
}

//如果是一级导航，就获取它的子，如果是二级导航，就获取它的兄弟
function get_nav($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0){
        //说明是一级导航，获取子
        $nav=Db::name('article_category')->where('pid',$id)->select();
    }else{
        //说明是二级导航，获取兄弟
        $nav=Db::name('article_category')->where('pid',$category['pid'])->select();
    }
    return $nav;
}

//获取文章(文章模板页面)
//如果点一级导航，获取第一个分类下的文章，如果点二级导航，获取自己分类下的文章
function get_article($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明是一级导航，获取第一个分类下的文章
        $nav=Db::name('article_category')->where('pid',$id)->find();
        $article=Db::name('article')->where('category_id',$nav['id'])->find();
    }else{
        //说明是二级导航，获取自己分类下的文章
        $article=Db::name('article')->where('category_id',$id)->find();
    }

    return $article;
}

//获取文章列表(列表模板页面)
//一级点进来，判断有没有二级，如果有二级，获取第一个二级下的文章列表，如果没有二级，获取一级下的文章列表
//二级点进来，获取当级下的文章列表
function get_articlelist($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明是一级点进来
        $category_2=Db::name('article_category')->where('pid',$id)->select();
        if(count($category_2)>0){
            //说明有二级
            $category_2_id=(Db::name('article_category')->where('pid',$id)->find())['id'];//第一个二级分类的id
            $article_list=Db::name('article_category')
                ->alias("a")
                ->join("article b","a.id=b.category_id")
                ->field('a.name as aname,b.name as bname,a.url as aurl,b.url as burl,a.*,b.*')
                ->where('b.category_id',$category_2_id)
                ->paginate(1);
        }else{
            //无二级
            $article_list=Db::name('article_category')
                ->alias("a")
                ->join("article b","a.id=b.category_id")
                ->field('a.name as aname,b.name as bname,a.url as aurl,b.url as burl,a.*,b.*')
                ->where('b.category_id',$id)
                ->paginate(1);
        }
    }else{
        //二级点进来
        $article_list=Db::name('article_category')
            ->alias("a")
            ->join("article b","a.id=b.category_id")
            ->field('a.name as aname,b.name as bname,a.url as aurl,b.url as burl,a.*,b.*')
            ->where('b.category_id',$id)
            ->paginate(1);
    }

    return $article_list;
}

//根据区块内文章id获取文章信息
function get_blockarticle($id){
    $article=Db::name('block')->where('id',$id)->find();
    return $article;
}

//根据“更多”的一级分类获取二级分类
function get_cat_2($id){
    $cat=Db::name('block_category')
        ->alias("a")
        ->join("block b","a.id=b.category_id")
        ->field('a.name as aname,b.name as bname,a.*,b.*')
        ->where('b.category_id',$id)
        ->paginate(1);
    return $cat;
}

//统计访客
function visitor_count(){
    //count.txt不存在，第1位访客
    if(!file_exists("count.txt")){
        $one_file=fopen("count.txt","w+"); //建立一个统计文本，如果不存在就创建
        $newnum=1;
        fwrite("count.txt","1");  //把数字1写入文本
        fclose("$one_file");
        setcookie("access",1, time()+3600*24*365,'/'); //访问过标记
    }else {
        //存在，检验是否有cookie,有，不累加，没有，累加
        if (isset($_COOKIE['access'])) {
            $newnum = file_get_contents("count.txt");
        } else {
            $num = file_get_contents("count.txt");
            $num++;
            file_put_contents("count.txt", "$num");
            $newnum = file_get_contents("count.txt");
            setcookie("access", 1, time() + 3600*24*365,'/'); //访问过标记
        }
    }

    return $newnum;
}

//导航-搜索-获取文章列表
function search_get_articlelist($id,$content){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明是一级点进来
        $category_2=Db::name('article_category')->where('pid',$id)->select();
        if(count($category_2)>0){
            //说明有二级
            $category_2_id=(Db::name('article_category')->where('pid',$id)->find())['id'];//第一个二级分类的id
            $article_list=Db::name('article_category')
                ->alias("a")
                ->join("article b","a.id=b.category_id")
                ->field('a.name as aname,b.name as bname,a.url as aurl,b.url as burl,a.*,b.*')
                ->where('b.category_id',$category_2_id)
                ->where('b.name','like',"%$content%")
                ->paginate(1);


        }else{
            //无二级
            $article_list=Db::name('article_category')
                ->alias("a")
                ->join("article b","a.id=b.category_id")
                ->field('a.name as aname,b.name as bname,a.url as aurl,b.url as burl,a.*,b.*')
                ->where('b.category_id',$id)
                ->where('b.name','like',"%$content%")
                ->paginate(1);
        }
    }else{
        //二级点进来
        $article_list=Db::name('article_category')
            ->alias("a")
            ->join("article b","a.id=b.category_id")
            ->field('a.name as aname,b.name as bname,a.url as aurl,b.url as burl,a.*,b.*')
            ->where('b.category_id',$id)
            ->where('b.name','like',"%$content%")
            ->paginate(1);
    }

    return $article_list;
}

//更多-搜索-获取文章列表
function search_get_cat_2($id,$content){
    $cat=Db::name('block_category')
        ->alias("a")
        ->join("block b","a.id=b.category_id")
        ->field('a.name as aname,b.name as bname,a.*,b.*')
        ->where('b.category_id',$id)
        ->where('b.name','like',"%$content%")
        ->paginate(1);
    return $cat;
}

//导航-搜索-一级面包屑
function crumbs11($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明是一级点进来
        $mian1=(Db::name('article_category')->where('id',$id)->find())['name'];
    }else{
        //二级点进来
        $pid=(Db::name('article_category')->where('id',$id)->find())['pid'];
        $mian1=(Db::name('article_category')->where('id',$pid)->find())['name'];
    }

    return $mian1;
}

//导航-搜索-二级面包屑
function crumbs12($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明是一级点进来
        $category_2=Db::name('article_category')->where('pid',$id)->select();
        if(count($category_2)>0){
            //说明有二级
           $mian2=(Db::name('article_category')->where('pid',$id)->find())['name'];


        }else{
            $mian2="";
        }
    }else{
        //二级点进来
        $mian2=(Db::name('article_category')->where('id',$id)->find())['name'];
    }

    return $mian2;
}
//更多-搜索-二级面包屑
function crumbs22($id){
    $mian2=(Db::name('block_category')->where('id',$id)->find())['name'];
    return $mian2;
}

//更多-搜索-二级面包屑
function crumbs32($id){
    $mian2=(Db::name('block_category')->where('id',$id)->find())['name'];
    return $mian2;
}


//文章模板页面
//导航-一级面包屑
function article_crumbs11($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明点的是一级导航
        $mian1=(Db::name('article_category')->where('id',$id)->find())['name'];

    }else{
        //说明点的是二级导航
        $pid=(Db::name('article_category')->where('id',$id)->find())['pid'];
        $mian1=(Db::name('article_category')->where('id',$pid)->find())['name'];
    }

    return $mian1;
}

//文章模板页面
//导航-二级面包屑
function article_crumbs12($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明点的是一级导航
        $mian2=(Db::name('article_category')->where('pid',$id)->find())['name'];

    }else{
        //说明点的是二级导航
        $mian2=(Db::name('article_category')->where('id',$id)->find())['name'];
    }

    return $mian2;
}

//文章模板页面
//文章标题-一级面包屑
function article_crumbs21($id){
    $category_id=(Db::name('article')->where('id',$id)->find())['category_id'];
    $pid=(Db::name('article_category')->where('id',$category_id)->find())['pid'];
    if($pid==0){
        //父为一级
        $mian1=(Db::name('article_category')->where('id',$category_id)->find())['name'];
    }else{
        //父为二级
        $mian1=(Db::name('article_category')->where('id',$pid)->find())['name'];
    }
    return $mian1;

}

//文章模板页面
//文章标题-二级面包屑
function article_crumbs22($id){
    $category_id=(Db::name('article')->where('id',$id)->find())['category_id'];
    $pid=(Db::name('article_category')->where('id',$category_id)->find())['pid'];
    if($pid==0){
        //父为一级
        $mian2="";
    }else{
        //父为二级
        $mian2=(Db::name('article_category')->where('id',$category_id)->find())['name'];
    }
    return $mian2;

}

//文章详情页面二级面包屑
function detail_crumbs($id){
    $category_id=(Db::name('block')->where('id',$id)->find())['category_id'];
    $mian2=(Db::name('block_category')->where('id',$category_id)->find())['name'];
    return $mian2;
}

//导航-搜索-一级面包屑-一级id
function crumbs11_1id($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明是一级点进来
        $id;
    }else{
        //二级点进来
        $id=(Db::name('article_category')->where('id',$id)->find())['pid'];
    }

    return $id;
}

//导航-搜索-二级面包屑-二级id
function crumbs11_2id($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明是一级点进来
        $id=(Db::name('article_category')->where('pid',$id)->find())['id'];
    }else{
        //二级点进来
        $id;
    }

    return $id;
}

//文章模板页面
//导航-一级面包屑-一级id
function article_crumbs11_1id($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明点的是一级导航
       $id;

    }else{
        //说明点的是二级导航
        $pid=(Db::name('article_category')->where('id',$id)->find())['pid'];
        $id=(Db::name('article_category')->where('id',$pid)->find())['id'];
    }

    return $id;
}

//文章模板页面
//导航-二级面包屑-二级导航
function article_crumbs12_2id($id){
    $category=Db::name('article_category')->where('id',$id)->find();
    if($category['pid']==0) {
        //说明点的是一级导航
        $id=(Db::name('article_category')->where('pid',$id)->find())['id'];

    }else{
        //说明点的是二级导航
        $id;
    }

    return $id;
}

//文章模板页面
//文章标题-一级面包屑-一级id
function article_crumbs21_1id($id){
    $category_id=(Db::name('article')->where('id',$id)->find())['category_id'];
    $pid=(Db::name('article_category')->where('id',$category_id)->find())['pid'];
    if($pid==0){
        //父为一级
        $id=(Db::name('article_category')->where('id',$category_id)->find())['id'];
    }else{
        //父为二级
        $id=(Db::name('article_category')->where('id',$pid)->find())['id'];
    }
    return $id;

}

//文章模板页面
//文章标题-二级面包屑-二级id
function article_crumbs21_2id($id){
    $category_id=(Db::name('article')->where('id',$id)->find())['category_id'];
    $pid=(Db::name('article_category')->where('id',$category_id)->find())['pid'];
    if($pid==0){
        //父为一级
        $id=1;//随便写一个，反正也没有二级面包屑
    }else{
        //父为二级
        $id=(Db::name('article')->where('id',$id)->find())['category_id'];
    }
    return $id;

}


//点区块文章标题到详情页，二级面包屑
function detail_crumbs2($id){
    $id=(Db::name('block')->where('id',$id)->find())['category_id'];
    return $id;
}
