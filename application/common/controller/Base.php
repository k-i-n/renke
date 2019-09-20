<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 基础控制器类
 */

namespace app\common\controller;

use app\common\model;
use app\common\model\Menu as MenuModel;
use think\Controller;
use think\Request;
use think\facade\Env;

class Base extends Controller
{
    const API_SUCCESS = 1;
    const API_ERROR = 0;

    public function _empty(Request $request)
    {
        return $this->fetch();
    }

    function api_success($msg, $data = [])
    {
        $return['msg'] = $msg;
        $return['data'] = $data;
        $return['code'] = SELF::API_SUCCESS;

        return json($return);
    }

    function api_error($msg, $data = [])
    {
        $return['msg'] = $msg;
        $return['data'] = $data;
        $return['code'] = SELF::API_ERROR;

        return json($return);
    }

    // 初始化
    function initialize()
    {
        parent::initialize();

        $auth_id = session(config('config.user_auth_key'));
        if (!isset($auth_id)) {
            //跳转到认证网关
            $this->redirect(config('config.user_auth_gateway'));
            //die ;
        }
        $this->assign_menu();
    }

    // 分配菜单
    protected function assign_menu()
    {
        $menu_model = new MenuModel();
        $menu_arr = $menu_model->getAccessList();

        $menu_tree = list_to_tree($menu_arr);

        $this->assign('menu_tree', $menu_tree);
    }


    // 列表页面
    function index(Request $request)
    {
        return $this->_index($request);
    }

    // 列表页面
    protected function _index($request)
    {
        $controller = $request->controller();

        $model = model($controller);

        $this->_search_filter($map);

        $map[] = ['is_del', 'eq', 0];

        if (!empty($model)) {
            $result = $this->_list($model, $map);
        }

        if ($request->isAjax()) {
            return $result;
        } else {
            return $this->fetch();
        }
    }

    // 搜索条件过滤
    protected function _search_filter(&$map)
    {
        $request = array_filter(request()->param(), 'filter_search_val');

        $search_field_list = array_keys($request);

        foreach ($search_field_list as $search_field) {
            $prefix = substr($search_field, 0, 3);

            $prefix_list = array('li_', 'eq_', 'gt_', 'lt_');

            if (in_array($prefix, $prefix_list)) {
                $field = substr($search_field, 3);

                if ($prefix == "li_") {
                    $map[] = array($field, 'like', '%' . trim($request[$search_field]) . '%');
                }
                if ($prefix == "eq_") {
                    $map[] = array($field, 'eq', trim($request[$search_field]));
                }
                if ($prefix == "gt_") {
                    $map[] = array($field, 'egt', trim($request[$search_field]));
                }
                if ($prefix == "lt_") {
                    $map[] = array($field, 'elt', trim($request[$search_field]));
                }
                $this->assign($search_field, $request[$search_field]);
            }

            $suffix = substr($search_field, -6);
            if ($suffix == '_range') {
                $field = substr($search_field, 0, -6);

                list($start_date, $end_date) = explode("~", trim($request[$search_field]));

                $type = substr($search_field, -10, -6);

                $start_date = substr(trim($start_date), 0, 10);
                $end_date = substr(trim($end_date), 0, 10);

                if (strpos($field, 'time') !== false) {
                    $map[] = array($field, '>=', strtotime($start_date));
                    $map[] = array($field, '<=', strtotime($end_date) + 86400);
                }

                if (strpos($field, 'date') !== false) {
                    $map[] = array($field, '>=', $start_date);
                    $map[] = array($field, '<=', $end_date);
                }
                $this->assign($search_field, $request[$search_field]);
            }
        }
    }

    // 分页处理
    protected function _list($model, $map, $sort = null)
    {
        $request = request()->param();

        if (isset($request['page'])) {
            $page = $request['page'];
        } else {
            $page = 1;
        }

        $this->assign('page', $page);

        if (isset($request['limit'])) {
            $limit = $request['limit'];
        } else {
            $limit = 10;
        }

        $this->assign('limit', $limit);

        // 统计总数
        $count_model = clone($model);
        $count = $count_model->where($map)->count();

        $this->assign('count', $count);

        if (empty($sort)) {
            $sort = 'id desc';
        }

        $vo_list = $model->where($map)->page($page, $limit)->order($sort)->select();
        $this->assign('vo_list', $vo_list);

        $return['count'] = $count;
        $return['limit'] = $limit;
        $return['page'] = $page;
        $return['data'] = $vo_list;
        $return['code'] = SELF::API_SUCCESS;

        return $return;
    }

    /**查看页面 **/
    function read($id)
    {
        $vo = $this->_edit($id);
        return $this->fetch();
    }

    /**编辑页面 **/
    function edit($id)
    {
        // $this->_edit($id);
        return $this->fetch();
    }

    /**编辑页面 **/
    protected function _edit($id, $controller = null)
    {
        if (empty($controller)) {
            $controller = request()->controller();
        }

        $vo = model($controller)->find($id);
        $this->assign('vo', $vo);
        return $vo;
    }

    /** 保存操作  **/
    function save(Request $request)
    {
        return $this->_save($request);
    }

    protected function _save($request, $controller = null)
    {
        if (empty($controller)) {
            $controller = $request->controller;
        }

        switch ($request->opmode) {
            case "add" :
                $result = $this->_insert($request, $controller);
                $msg = '新增成功';

                break;

            case "edit" :
                $result = $this->_update($request, $controller);
                $msg = '编辑成功';
                break;

            default :
                $msg = '非法操作';
                $result = false;
        }

        if ($request->isAjax()) {
            if ($result != false) {
                return $this->api_success($msg, $result);
            } else {
                return $this->api_error($msg, $result);
            }
        }

        return $this->fetch();
    }

    /** 插入新新数据  **/
    protected function _insert(Request $request, $controller = null)
    {

        if (empty($controller)) {
            $controller = $request->controller();
        }

        $data = $request->param();

        $result = model($controller)->create($data, true);

        return $result;
    }

    /* 更新数据  */
    protected function _update(Request $request, $controller = null)
    {
        if (empty($controller)) {
            $controller = $request->controller();
        }

        $data = $request->param();

        $result = model($controller)->data($data, true)->allowField(true)->force()->isUpdate(true)->save();

        return $result;
    }

    /** 启用  **/
    protected function _set_valid($request, $controller = null)
    {
        if (empty($controller)) {
            $controller = $request->controller();
        }

        $model = model($controller);

        if (!empty($model)) {

            $where[] = ['id', 'eq', $request->id];
            $result = $model->where($where)->setField("is_valid", 1);

            if ($result !== false) {
                $this->assign('jumpUrl', get_return_url());
                $this->success("成功启用!");
            } else {
                $this->error('启用失败!');
            }

        } else {
            $this->error('没有找到数据!');
        }
    }

    /** 禁用  **/
    protected function _set_invalid(Request $request, $controller = null)
    {
        if (empty($controller)) {
            $controller = $request->controller();
        }

        $model = model($controller);

        if (!empty($model)) {

            $where[] = array('id', 'eq', $request->id);

            $result = $model->where($where)->setField("is_valid", 0);

            if ($result !== false) {
                $this->assign('jumpUrl', get_return_url());
                $this->success("成功禁用{$result}条!");
            } else {
                $this->error('禁用失败!');
            }
        } else {
            $this->error('没有找到数据!');
        }
    }

    /** 删除标记  **/
    protected function _del(Request $request, $controller = null)
    {
        if (empty($controller)) {
            $controller = $request->controller();
        }

        $model = model($controller);

        $where[] = array('id', 'eq', $request->id);

        $result = $model->where($where)->setField("is_del", 1);

        return $result;
    }

    /** 永久删除数据  **/
    protected function _destory(Request $request, $controller = null)
    {
        if (empty($controller)) {
            $controller = $request->controller();
        }

        $model = model($controller);

        $id = $request->id;

        if (is_array($id)) {
            $where[] = array('id', "in", array_filter($id));
        } else {
            $where[] = array('id', 'eq', $id);
        }

        $result = $model->where($where)->delete();

        return $result;
    }

    protected
    function _sort_up(Request $request)
    {

        $controller = $request->controller();

        $id = $request->id;

        $vo = model($controller)->find($id);

        $where_sort = array();

        if (isset($vo['pid'])) {
            $where_sort[] = array('pid', 'eq', $vo['pid']);
        }

        $sort = model($controller)->where($where_sort)->order('sort desc')->column('id,sort');

        $keys = array_keys($sort);

        $next_key = array_search($id, $keys);

        if ($next_key > 0) {
            $sort[$id] = $sort[$keys[$next_key - 1]] + 1;
        }

        asort($sort);

        $num = 10;
        foreach ($sort as $key => $val) {
            $data[] = array('id' => $key, 'sort' => $num);
            $num += 10;
        }

        model($controller)->saveAll($data);

        return $this->api_success('操作成功');
    }

    protected
    function _sort_down(Request $request)
    {
        $controller = request()->controller();

        $id = $request->id;

        $vo = model($controller)->find($id);

        $where_sort = array();

        if (isset($vo['pid'])) {
            $where_sort[] = array('pid', 'eq', $vo['pid']);
        }

        $sort = model($controller)->where($where_sort)->order('sort desc')->column('id,sort');

        $keys = array_keys($sort);

        $next_key = array_search($id, $keys);

        if ($next_key != count($keys) - 1) {
            $sort[$id] = $sort[$keys[$next_key + 1]] - 1;
        }

        asort($sort);
        $num = 10;
        foreach ($sort as $key => $val) {
            $data[] = array('id' => $key, 'sort' => $num);
            $num += 10;
        }
        model($controller)->saveAll($data);

        return $this->api_success('操作成功');
    }

    protected
    function _upload()
    {

        ini_set('memory_limit', '-1');

        header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");

        /*
         // Support CORS
         header("Access-Control-Allow-Origin: *");
         // other CORS headers if any...
         if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
         exit; // finish preflight CORS requests here
         }
         */

        // 5 minutes execution time
        @set_time_limit(5 * 60);

        // Uncomment this one to fake upload time
        //sleep(1);

        // Settings
        $target_dir = ini_get("upload_tmp_dir") . DIRECTORY_SEPARATOR . "plupload";

        //$target_dir = 'uploads';
        $cleanup_target_dir = true;

        // Remove old files
        $max_file_age = 5 * 3600;

        // Temp file age in seconds
        // Create target dir
        if (!file_exists($target_dir)) {
            @mkdir($target_dir);
        }

        // Get a file name
        if (isset($_REQUEST["name"])) {
            $file_name = $_REQUEST["name"];
        } elseif (!empty($_FILES)) {
            $file_name = $_FILES["file"]["name"];
        } else {
            $file_name = uniqid("file_");
        }

        $file_path = $target_dir . DIRECTORY_SEPARATOR . bin2hex($file_name);

        // Chunking might be enabled
        $chunk = isset($_REQUEST["chunk"]) ? intval($_REQUEST["chunk"]) : 0;
        $chunks = isset($_REQUEST["chunks"]) ? intval($_REQUEST["chunks"]) : 0;

        // Remove old temp files
        if ($cleanup_target_dir) {
            if (!is_dir($target_dir) || !$dir = opendir($target_dir)) {
                $return['status'] = 0;
                $return['error'] = '100 Failed to open temp directory';
                return $return;
            }

            while (($file = readdir($dir)) !== false) {
                $tmpfile_path = $target_dir . DIRECTORY_SEPARATOR . $file;

                // If temp file is current file proceed to the next
                if ($tmpfile_path == "{$file_path}.part") {
                    continue;
                }

                // Remove temp file if it is older than the max age and is not the current file
                if (preg_match('/\.part$/', $file) && (filemtime($tmpfile_path) < time() - $max_file_age)) {
                    // @unlink($tmpfile_path);
                }
            }
            closedir($dir);
        }

        if (!$out = @fopen("{$file_path}.part", $chunks ? "ab" : "wb")) {
            $return['status'] = 0;
            $return['error'] = '101 Failed to open output stream';
            return $return;
        }

        if (!empty($_FILES)) {
            if ($_FILES["file"]["error"] || !is_uploaded_file($_FILES["file"]["tmp_name"])) {
                $return['status'] = 0;
                $return['error'] = '102 Failed to move uploaded file';
                return $return;
            }

            // Read binary input stream and append it to temp file
            if (!$in = @fopen($_FILES["file"]["tmp_name"], "rb")) {
                $return['status'] = 0;
                $return['error'] = '103 Failed to open input stream';
                return $return;
            }
        } else {
            if (!$in = @fopen("php://input", "rb")) {
                $return['status'] = 0;
                $return['error'] = '104 Failed to open input stream';
                return $return;
            }
        }

        while ($buff = fread($in, 4096)) {
            fwrite($out, $buff);
        }

        @fclose($out);
        @fclose($in);

        // Check if file has been uploaded
        if (!$chunks || $chunk == $chunks - 1) {
            // Strip the temp .part suffix off
            rename("{$file_path}.part", $file_path);
        } else {
            die;
        }

        $upload_path = config('upload_path');
        @mkdir($upload_path . date('Ymd'));

        $ext_name = get_file_ext_name($file_name);

        $save_path = date('Ymd') . '/' . bin2hex(time() . $file_name) . '.' . $ext_name;
        rename($file_path, $upload_path . $save_path);

        $data['name'] = $file_name;
        $data['type'] = $_FILES['file']['type'];
        $data['size'] = filesize($upload_path . $save_path);
        $data['save_path'] = $save_path;
        $data['ext'] = $ext_name;
        $data['md5'] = md5_file($upload_path . $save_path);
        $data['create_time'] = time();

        $file_id = db('file')->insertGetId($data);

        // Return Success JSON-RPC response
        $return['status'] = 1;
        $return['sid'] = think_encrypt($file_id);
        $return['url'] = $_SERVER['HTTP_ORIGIN'] . $upload_path . $save_path;

        return $return;
    }

    protected function _down($attach_id)
    {
        $file_id = think_decrypt($attach_id);

        $file = model('File')->find($file_id);

        if ($file['is_cloud']) {
            $cloud_domain = get_system_config('qiniu_domain', 'system');
            $this->redirect($cloud_domain . $file['name'], '302');
        }

        $upload_path = config('upload_path');
        $file_path = $upload_path . $file['save_path'];

        if (!file_exists($file_path)) {
            $this->error = '文件已被删除！';
        }

        header("Content-Type: application/force-download;");
        header("Content-Description: File Transfer");
        header('Content-type: ' . $file['type']);
        header('Content-Length:' . $file['size']);
        $ua = $_SERVER['HTTP_USER_AGENT'];
        if (preg_match('/MSIE/', $ua) || preg_match("/Trident\/7.0/", $ua)) {
            header('Content-Disposition: attachment; filename="' . rawurlencode($file['name']) . '"');
        } else {
            header('Content-Disposition: attachment; filename="' . $file['name'] . '"');
        }
        readfile($file_path);
        exit;
    }

    function export_excel()
    {
        $this->redirect('/tpl/excel_data.xlsx');
    }
}
