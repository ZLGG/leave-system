<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <%-- <meta name="renderer" content="webkit">
     <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="text" class="layui-form-label">
                <span class="x-red">*</span>讯息
            </label>
            <div class="layui-input-inline">
                <input type="text" id="text" name="text" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span><%--将会成为您唯一的登入名--%>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="infoCont" class="layui-form-label">
                <span class="x-red">*</span>内容
            </label>
            <div class="layui-input-inline">
                <input type="text" id="infoCont" name="infoCont" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span><%--将会成为您唯一的登入名--%>
            </div>
        </div>

        <%--<div class="layui-form-item" hidden>
            <label for="img" class="layui-form-label">
                <span class="x-red">*</span>图片url
            </label>
            <div class="layui-input-inline">
                <input type="text" id="img" name="img" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" >
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>

        <div class="layui-upload">
            <label  class="layui-form-label">
            </label>
            <button type="button" class="layui-btn" id="test1">
                <i class="layui-icon">&#xe67c;</i>上传图片
            </button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
                <p id="demoText"></p>
            </div>
        </div>--%>


        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                增加
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer','upload','jquery'], function(){
        $ = layui.jquery;
        var form = layui.form
            , upload = layui.upload
            , $ = layui.jquery
            , layer = layui.layer;


        //监听提交
        form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            $.ajax(
                {
                    type: "get",
                    url: "/addInformation",
                    datatype: "json",
                    data:data.field,
                    success:function (data1) {
                        if (data1.result=='SUCCESS') {
                            /* setTimeout(function () {
                                 window.location.href = "/index.jsp";
                             },1000)*/
                            //layer.msg(data1);
                            /* layer.alert("增加成功", {icon: 6},function () {
                                 // 获得frame索引
                                 var index = parent.layer.getFrameIndex(window.name);
                                 //关闭当前frame

                                 //layer.closeAll('iframe'); //关闭所有的iframe层
                                 parent.layer.close(index);
                                 // 可以对父窗口进行刷新
                                 x_admin_father_reload();
                             });*/
                        }
                        else {
                            lay.msg(data.errorMsg,{time: 1000});
                        }
                    },
                    error:function () {
                        layer.msg("提交失败");
                    }

                }
            );
            layer.alert("增加成功", {icon: 6}, function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame

                //layer.closeAll('iframe'); //关闭所有的iframe层
                parent.layer.close(index);
                // 可以对父窗口进行刷新
                x_admin_father_reload();
            });
            return false;
        });

       /* var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/upload/'
            // ,auto: false //选择文件后不自动上传
            // ,bindAction: '#add' //指向一个按钮触发上传
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.result=='ERROR'){
                    layer.msg('上传失败');
                    return layer.msg('上传失败');
                }
                //上传成功
                $('#imgUrl').attr('value', res.data);
            }
            ,error: function(){
                $('#imgUrl').attr('value','zlg');
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });*/

    });
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>