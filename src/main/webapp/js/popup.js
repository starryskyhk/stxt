/**
 * 啧啧封装的一些方法
 */
var popup = function () {
};


/**
 *  关闭layer
 * @param{String} data 返回的的数据
 * @param{String} tableId 刷新的表格id字符串
 */
popup.layermsg = function (data, tableId) {
    layer.msg(data,{icon:1,time:1000},function () {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
        parent.$('#' + tableId).bootstrapTable('refresh');//表格刷新
    });
}



/**
 *
 * @param title 标题
 * @param url 请求的地址
 * @param width 宽度
 * @param height
 */
popup.open_add = function (title, url, width, height,) {
    if (popup.isMobile()) {
        width = 'auto';
        height = 'auto';
    }
    if (popup.isEmpty(width)) {
        width = 800;
    }
    if (popup.isEmpty(height)) {
        height = ($(window).height() - 50);
    }
    layer.open({
        id: 'LAY_layuipro', //设定一个id，防止重复弹出
        type: 2,
        title: title,
        maxmin: false,  //是否显示最大最下
        resize: false, //是否可以手动托大
        shadeClose: true, //点击遮罩关闭层
        area: [width + 'px', height + 'px'],
        content: url,
        btn: ['确定', '关闭'],
        yes: function (index, layero) {
            var body = layer.getChildFrame('body', index); //得到iframe页面层的BODY
            var iframeBtn = body.find('#save');//得到iframe页面层的提交按钮
            iframeBtn.click();//模拟iframe页面层的提交按钮点击

        },
    });

}

// 判断移动端
popup.isMobile = function () {
    return navigator.userAgent.match(/(Android|iPhone|SymbianOS|Windows Phone|iPad|iPod)/i);
}
// 判断字符串是否为空
popup.isEmpty = function (value) {
    if (value == null || popup.trim(value) == '') {
        return true;
    }
    return false;
}
// 空格截取
popup.trim = function (value) {
    if (value == null) {
        return "";
    }
    return value.toString().replace(/(^\s*)|(\s*$)|\r|\n/g, "");
}