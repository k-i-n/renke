/**

 @Name：layuiAdmin 公共业务
 @Author：贤心
 @Site：http://www.layui.com/admin/
 @License：LPPL

 */

layui.define(['layer', 'laydate', 'upload'], function (exports) {
    let $ = layui.$;
    let layer = layui.layer;
    let laytpl = layui.laytpl;
    let setter = layui.setter;
    let view = layui.view;
    let admin = layui.admin;
    let laydate = layui.laydate;
    let upload = layui.upload;

    //公共业务的逻辑处理可以写在此处，切换任何页面都会执行
    //……

    var fn = {
        popup_open: function (url, w, h) {
            var index = layer.open({
                type: 2,
                title: '1',
                area: [w + 'px', h + 'px'],
                shade: 0.6,
                closeBtn: 1,
                shadeClose: true,
                scrollbar: false,
                content: [url, 'no']
            });
            if (is_mobile()) {
                layer.full(index);
            }
        },
        popup_full: function (url) {
            let w = 100;
            let h = 100;
            var index = layer.open({
                type: 2,
                title: '1',
                area: [w + 'px', h + 'px'],
                shade: 0.6,
                closeBtn: 1,
                shadeClose: true,
                scrollbar: false,
                content: [url, 'no']
            });
            layer.full(index);
        },
        send_form: function (from_id, post_url, return_url, callback) {
            check_form(from_id, function (res) {
                if (res.status) {
                    var vars = $("#" + from_id).serialize();
                    $.ajax({
                        type: "POST",
                        url: post_url,
                        data: vars,
                        dataType: "json",
                        success: function (data) {
                            if (typeof (callback) == 'function') {
                                callback(data);
                            } else {
                                if (data.status) {
                                    layer.msg(data.msg, {
                                        time: 1200
                                    }, function () {
                                        if (return_url) {
                                            location.href = return_url;
                                        } else {
                                            location.reload(true);
                                        }
                                    });
                                } else {
                                    layer.msg(data.msg);
                                    return false;
                                }
                                ;
                            }
                        }
                    });
                } else {
                    layer.msg(res.msg);
                    res.dom.focus();
                    return false;
                }
            });
        },
        serialize_form: function (form_id) {
            var obj = {};
            var a = $(form_id).serializeArray();
            $.each(a, function () {
                if (obj[this.name] !== undefined) {
                    if (!obj[this.name].push) {
                        obj[this.name] = [obj[this.name]];
                    }
                    obj[this.name].push(this.value || '');
                } else {
                    obj[this.name] = this.value || '';
                }
            });
            return obj;
        },
        toggle_adv_search: function () {
            if ($("#adv_search").attr("class").indexOf("hidden") < 0) {
                $("#adv_search").addClass("hidden");
                $("#toggle_adv_search_icon").addClass("fa-chevron-down");
                $("#toggle_adv_search_icon").removeClass("fa-chevron-up");
            } else {
                $("#adv_search").removeClass("hidden");
                $("#toggle_adv_search_icon").addClass("fa-chevron-up");
                $("#toggle_adv_search_icon").removeClass("fa-chevron-down");
            }
        }
    }

    win_exp(fn);

    $('.input-date-time').on('click', function () {

        let lay_key = $(this).attr('lay-key');

        if (lay_key == undefined) {
            laydate.render({
                elem: this,
                type: 'datetime',
                format: 'yyyy-MM-dd HH:mm',
                show: true //直接显示
            });
        }
    });

    $('.input-date').on('click', function () {
        let lay_key = $(this).attr('lay-key');

        if (lay_key == undefined) {
            laydate.render({
                elem: this,
                show: true //直接显示
            });
        }
    });

    $('.input-month').on('click', function () {
        let lay_key = $(this).attr('lay-key');

        if (lay_key == undefined) {
            laydate.render({
                elem: this,
                show: true,
                type: 'month'
            });
        }
    });

    $('.input-date-range').on('click', function () {
        let lay_key = $(this).attr('lay-key');
        if (lay_key == undefined) {
            laydate.render({
                elem: this,
                range: '~',
                format: 'yyyy-MM-dd',
                show: true //直接显示
            });
        }
    });

    //同时绑定多个元素，并将属性设定在元素上
    upload.render({
        elem: '.image-upload-btn',
        choose: function (obj) {
            //将每次选择的文件追加到文件队列
            var files = obj.pushFile();

            var item = this.item;

            //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
            obj.preview(function (index, file, result) {
                console.log(index); //得到文件索引
                console.log(file); //得到文件对象
                console.log(result); //得到文件base64编码，比如图片

                $(item).parent().append('<span><a class="del"><i class="fa fa-times" aria-hidden="true"></i></a><img src="' + result + '"></span>');

                //obj.resetFile(index, file, '123.jpg'); //重命名文件名，layui 2.3.0 开始新增
                //这里还可以做一些 append 文件列表 DOM 的操作

                //obj.upload(index, file); //对上传失败的单个文件重新上传，一般在某个事件中使用
                //delete files[index]; //删除列表中对应的文件，一般在某个事件中使用
            });
        }
        , before: function () {
            //layer.tips('接口地址：' + this.url, this.item, {tips: 1});
        }
        , done: function (res, index, upload) {
            var item = this.item;
            console.log(item); //获取当前触发上传的元素，layui 2.1.0 新增
        }
    })

    $('#toggle_adv_search').on('click', function () {
        toggle_adv_search();
    });

    $('#close_adv_search').on('click', function () {
        toggle_adv_search();
    });

    $('#submit_adv_search').on('click', function () {
        $('#form_adv_search').submit();
    });

    //  小徽章
    var badge_count_url = '';
    $.ajax(badge_count_url, function (ret) {
        for (s in ret) {
            var badge_tpl = '<span class="layui-badge">{count}</span>';
            var vars = {};
            vars.count = ret[s];
            html = tpl_parse(badge_tpl, vars);
            $("a[node=" + s + "] .count").html(html);
            //alert(ret[s]);
        }
    });

    //退出
    admin.events.logout = function () {
        //执行退出接口
        admin.req({
            url: layui.setter.base + 'json/user/logout.js'
            , type: 'get'
            , data: {}
            , done: function (res) { //这里要说明一下：done 是只有 response 的 code 正常才会执行。而 succese 则是只要 http 为 200 就会执行

                //清空本地记录的 token，并跳转到登入页
                admin.exit(function () {
                    location.href = '/index/login/logout.html';
                });
            }
        });
    };

    $('.layui-side a').on('click touchstart', function () {
        console.log('yy');
        var $this = $(this);
        var url = $this.attr("lay-href");
        if (url.length > 0 && (url != "#")) {
            node = $this.attr("node");
            set_cookie("current_node", node);
        }
    });

    current_node = get_cookie("current_node");
    $current_node = $(".layui-side a[node='" + current_node + "']");
    $current_node.parent().addClass("layui-this");
    $current_node.parents("li").each(function () {
        $(this).addClass("layui-nav-itemed");
    });

    //对外暴露的接口
    exports('common', {});
});