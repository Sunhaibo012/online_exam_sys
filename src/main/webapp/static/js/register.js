layui.use(['layer', 'form'], function () {
    var layer = layui.layer,
        $ = layui.jquery,
        form = layui.form;



    form.on('submit(register)', function (data) {
        var loadIndex = layer.load(2, {
            shade: [0.3, '#333']
        });
        $.post(data.form.action, data.field, function (res) {
            layer.close(loadIndex);
            if (res.success) {
                alert("注册成功,请前往登录");
                window.location.href = "/login";
            } else {
                layer.msg(res.msg);
            }
        });
        return false;
    });
});