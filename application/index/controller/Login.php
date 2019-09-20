<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 登录控制器
 */

namespace app\index\controller;

use think\Controller;
use Naixiaoxin\ThinkWechat\Facade;

class Login extends Controller {

    function index() {
 
        return $this -> fetch();
    }

    function check_login() {
        $request = request() -> param();

        if (!empty($request['emp_no'])) {
            $emp_no = $request['emp_no'];
        } else {
            $this -> error('登录名不能为空');
        }

        if (!empty($request['password'])) {
            $password = $request['password'];
        } else {
            $this -> error('密码不能为空');
        }

        $where[] = array('emp_no', 'eq', $emp_no);
        $where[] = array('password', 'eq', hash_func($password));

        $user_info = model('User') -> where($where) -> find();

        if ($user_info !== null) {
            session(config('config.user_auth_key'), $user_info['id']);
            session('emp_no', $user_info['emp_no']);
            session('user_name', $user_info['name']);
            session('avatar', $user_info['avatar']);

            if (empty($user_info['avatar'])) {
                session('avatar', config('avatar_path') . '/default.jpg');
            }

            $this -> success('登录成功');
        } else {
            $this -> error('用户名或密码错误');
        }
    }

    function logout() {
        $auth_id = session(config('config.user_auth_key'));
        if (isset($auth_id)) {
            session(null);
            $this -> redirect('login/index_01');
        } else {
            $this -> redirect('login/index_01');
        }
    }

    function qiniu_async_upload($token) {
        set_time_limit(0);
        $token = json_decode(hex2bin($token), true);

        $Qiniu = new \Qiniu();

        $file_path = $token['file_path'];
        $file_name = $token['file_name'];

        $Qiniu -> upload($file_path, $file_name);
        $Qiniu -> transcoding($file_name);
    }

    function task() {

        $run_time = get_system_config('task_time');
        //预期提醒
        $task_last_run_time = cache('task_last_time');
        if (empty($task_last_run_time)) {
            $task_last_run_time = time();
        }
        $task_last_run_time = time() - 3600 * 48;

        if (strtotime(date('Y-m-d') . ' ' . $run_time) - $task_last_run_time > 3600 * 24 - 4) {
            cache('task_last_time', time());

            $date = date('Y-m-d');
            $where_warn[] = array('end_date', 'eq', $date);
            $where_expire[] = array('is_end', 'eq', 0);
            $where_warn[] = array('result', 'eq', 2);
            $warn_list = model('Flow') -> where($where_warn) -> select();

            //发送预警信息
            foreach ($warn_list as $flow) {
                $notify_data['type'] = 3;
                $notify_data['flow_id'] = $flow['id'];
                $notify_data['user_id'] = $flow['user_id'];
                $notify_data['create_time'] = time();
                send_notify($notify_data);
            }

            $where_expire[] = array('end_date', 'lt', $date);
            $where_expire[] = array('is_end', 'eq', 0);
            $where_expire[] = array('result', 'eq', 2);
            $expire_list = model('Flow') -> where($where_expire) -> select();

            //发送逾期信息
            foreach ($expire_list as $flow) {
                $notify_data['type'] = 4;
                $notify_data['flow_id'] = $flow['id'];
                $notify_data['user_id'] = $flow['user_id'];
                $notify_data['create_time'] = time();
                send_notify($notify_data);
            }
        };
    }

    public function send_sms() {
        $data = input();
        if (empty($data['mobile'])) {
            return json(['code' => 0, 'msg' => '请输入手机号！']);
        }
        if ($data['type'] == 1) {
            $user = db('member') -> where('mobile', $data['mobile']) -> field('id') -> find();
            if ($user) {
                return json(['code' => 0, 'msg' => '手机号已经被注册！']);
            }
        }

        header('content-type:text/html;charset=utf-8');

        $sendUrl = 'http://v.juhe.cn/sms/send';
        //短信接口的URL

        $code = rand(100000, 999999);

        $smsConf = array('key' => 'd9a22ee9a18d78fd5ca5995f3b5b6ca4', //您申请的APPKEY
        'mobile' => $data['mobile'], //接受短信的用户手机号码
        'tpl_id' => '88613', //您申请的短信模板ID，根据实际情况修改
        'tpl_value' => '#code#=' . $code);

        $content = $this -> juhe_curl($sendUrl, $smsConf, 1);
        //请求发送短信

        if ($content) {
            $result = json_decode($content, true);
            $error_code = $result['error_code'];
            if ($error_code == 0) {
                cookie('code', $code, 3000);
                //状态为0，说明短信发送成功
                return json(['code' => 1, 'msg' => '发送成功！']);
                //                echo "短信发送成功,短信ID：" . $result['result']['sid'];
            } else {
                return json(['code' => 0, 'msg' => '发送失败！']);
                //状态非0，说明失败
                //$msg = $result['reason'];
                //return $msg;
            }
        } else {
            //返回内容异常，以下可根据业务逻辑自行修改
            return "请求发送短信失败";
        }
    }

    public function juhe_curl($url, $params = false, $ispost = 0) {
        $httpInfo = array();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22');
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        if ($ispost) {
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
            curl_setopt($ch, CURLOPT_URL, $url);
        } else {
            if ($params) {
                curl_setopt($ch, CURLOPT_URL, $url . '?' . $params);
            } else {
                curl_setopt($ch, CURLOPT_URL, $url);
            }
        }
        $response = curl_exec($ch);
        if ($response === FALSE) {
            //echo "cURL Error: " . curl_error($ch);
            return false;
        }
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $httpInfo = array_merge($httpInfo, curl_getinfo($ch));
        curl_close($ch);
        return $response;
    }

}
