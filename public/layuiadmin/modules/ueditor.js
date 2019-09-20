layui.define(['setter'], function (exports) {
    let $ = layui.jquery;
    let setter = layui.setter;

    window.editor = {};
    console.log(layui);

    load_js(setter.base + 'plugins/ueditor/ueditor.config.js', function () {
        load_js(setter.base +'plugins/ueditor/ueditor.all.js', function () {
            load_js(setter.base+'plugins/ueditor/lang/zh-cn/zh-cn.js', function () {
                $(".ueditor").each(function () {
                    $id = $(this).attr('data');
                    editor[$id] = UE.getEditor($id);
                });
            });
        });
    });

    exports('modules/ueditor', {});
});
