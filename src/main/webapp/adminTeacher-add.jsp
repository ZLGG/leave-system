<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <%-- <meta name="renderer" content="webkit">
     <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
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
        <%-- <div class="layui-form-item">
             <label class="layui-form-label"><span class="x-red">*</span>角色</label>
             <div class="layui-input-block" aria-required="true">
                 <input type="radio" name="role" lay-skin="primary" value="0" title="学生" checked="" required="" lay-verify="role" lay-filter="updatRole">
                 <input type="radio" name="role" lay-skin="primary" value="1" title="任课教师" lay-filter="updatRole">
                 <input type="radio" name="role" lay-skin="primary" value="2" title="辅导员" lay-filter="updatRole">
                 <input type="radio" name="role" lay-skin="primary" value="3" title="领导" lay-filter="updatRole">
                 <input type="radio" name="role" lay-skin="primary" value="4" title="管理员" lay-filter="updatRole">
             </div>
         </div>--%>
        <div class="layui-form-item">
            <label for="number" class="layui-form-label">
                <span class="x-red">*</span>学号/工号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="number" name="number" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为您唯一的登入名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="userName" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="userName" name="userName" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span><%--将会成为您唯一的登入名--%>
            </div>
        </div>
        <%--<div class="layui-form-item" id="college1">
            <label for="college" class="layui-form-label">
                <span class="x-red">*</span>学院
            </label>
            <div class="layui-input-inline">
                <input type="text" id="college" name="college" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>&lt;%&ndash;将会成为您唯一的登入名&ndash;%&gt;
            </div>
        </div>
        <div class="layui-form-item" id="grade1">
            <label for="grade" class="layui-form-label">
                <span class="x-red">*</span>年级
            </label>
            <div class="layui-input-inline">
                <input type="text" id="grade" name="grade" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>&lt;%&ndash;将会成为您唯一的登入名&ndash;%&gt;
            </div>
        </div>--%>
        <%-- <div class="layui-form-item" id="class1">
            <label for="class" class="layui-form-label">
                <span class="x-red">*</span>班级
            </label>
            <div class="layui-input-inline">
                <input type="text" id="class" name="class" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>&lt;%&ndash;将会成为您唯一的登入名&ndash;%&gt;
            </div>
        </div>
        <div class="layui-form-item" id="major1">
            <label for="major" class="layui-form-label">
                <span class="x-red">*</span>专业
            </label>
            <div class="layui-input-inline">
                <input type="text" id="major" name="major" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>&lt;%&ndash;将会成为您唯一的登入名&ndash;%&gt;
            </div>
        </div>--%>


        <%--
      <div class="layui-form-item">
          <label for="L_email" class="layui-form-label">
              <span class="x-red">*</span>邮箱
          </label>
          <div class="layui-input-inline">
              <input type="text" id="L_email" name="email" required="" lay-verify="email"
              autocomplete="off" class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">
              <span class="x-red">*</span>
          </div>
      </div>
--%>
        <div class="layui-form-item">
            <label for="L_pass" class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input type="passWord" id="L_pass" name="passWord" required="" lay-verify="pass"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                6到16个字符
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
                <span class="x-red">*</span>确认密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="L_repass" name="passWord" required="" lay-verify="repass"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">
                增加
            </button>
        </div>

    </form>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function (value) {
                if (value.length < 11) {
                    return '学号/工号至少得11个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , repass: function (value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            $.ajax(
                {
                    type: 'get',
                    url: '/addUser',
                    datatype: "json",
                    data: data.field,
                    success: function (result) {
                        if (result.code == 200) {
                            layer.alert("增加成功", {icon: 6}, function () {
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                                // 可以对父窗口进行刷新
                                x_admin_father_reload();
                            });
                        }
                        else {
                            layer.msg('异常');
                        }

                    },
                    error: function () {
                        layer.msg('异常');
                    }
                }
            );
            return false;
        });




    });
</script>
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>