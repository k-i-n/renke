<?php

/* @project : SafariGo
 * @auther  : 青云
 * @date    : 2018/1/10
 * @desc    : 系统配置控制器
 */

namespace app\index\controller;

use app\common\controller\Base;
use think\Request;

class SystemConfig extends Base
{

    function index(Request $request)
    {

        $where_system[] = array('data_type', 'eq', 'system');
        $system_data = model('SystemConfig')->where($where_system)->column('val', 'code');
        $this->assign('system_data', $system_data);

        return $this->fetch();
    }

    function email(Request $request)
    {

        $where_system[] = array('data_type', 'eq', 'system');
        $system_data = model('SystemConfig')->where($where_system)->column('val', 'code');
        $this->assign('system_data', $system_data);

        return $this->fetch();
    }

    function qiniu(Request $request)
    {

        $where_system[] = array('data_type', 'eq', 'system');
        $system_data = model('SystemConfig')->where($where_system)->column('val', 'code');
        $this->assign('system_data', $system_data);

        return $this->fetch();
    }

    function wechat(Request $request)
    {

        $where_system[] = array('data_type', 'eq', 'system');
        $system_data = model('SystemConfig')->where($where_system)->column('val', 'code');
        $this->assign('system_data', $system_data);

        return $this->fetch();
    }


    function save(Request $request)
    {
        //data_type 划分：
        $request = request()->param();
        $data_type = $request['data_type'];

        if ($data_type == 'system') {

            $data = $request;
            unset($data['data_type']);

            foreach ($data as $key => $val) {
                $this->set_val($key, 'system');
            }

            $this->success('保存成功');
            die;
        }

        if ($data_type == 'timer') {
            $this->set_val('timer_switch', 'timer');
            $this->set_val('task_time', 'timer');

            file_put_contents('timer_switch.html', get_system_config('timer_switch'));
            $this->success('保存成功');
            die;
        }

        if ($data_type == 'home') {

            $data = $request;
            unset($data['data_type']);

            foreach ($data as $key => $val) {
                $this->set_val($key, 'home');
            }

            $this->success('保存成功');
            die;
        }
    }

    protected function set_val($key, $type)
    {
        $request = request()->param();
        if (empty($request['timer_switch'])) {
            $request['timer_switch'] = 0;
        }
        if (isset($request[$key])) {
            $data['val'] = $request[$key];
            $data['data_type'] = $type;
            $where_system[] = array('code', 'eq', $key);
            $vo = model('SystemConfig')->where($where_system)->find();

            if ($vo) {
                $data['id'] = $vo['id'];
                $list = $vo->data($data)->save();
            } else {
                $data['code'] = $key;
                $list = db('SystemConfig')->insert($data);
            }
        }
    }

}
