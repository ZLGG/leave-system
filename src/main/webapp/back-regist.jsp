<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>注册页</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>

</head>
<body class="login-bg">

<<%--div >
    <header class="layui-elip" style="width: 85%">注册</header>
    <form class="layui-form">
        <!--输入用户名-->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" name="uname" id="uname" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
            </div>
            <!--判断用户名是否可用的图标 -->
            <div class="layui-inline">
                <i class="layui-icon" hidden id="ri" style="color: green; font-weight: bold"></i>
                <i class="layui-icon" hidden id="le" style="color: red; font-weight: bold">ဆ</i>
            </div>
        </div>
        <!--输入密码-->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" name="uname" id="pwd" required  lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
            </div>

        </div>
        <div class="layui-input-inline login-btn" style="width: 85%">
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn" lay->注册</button>
        </div>
        <br/>
        <p style="width: 85%">
            <a href="pages/login.html" class="fl">已有账号？立即登录</a>
            <a href="javascript:;" class="fr">忘记密码？</a>
        </p>
    </form>
</div>--%>
<div class="login layui-anim layui-anim-up">
    <%--<div class="message">x-admin2.0-管理登录</div>--%>
        <div class="message">注册</div>
    <div id="darkbannerwrap"></div>

    <form class="layui-form" >
        <div class="layui-inline" >
            <!-- 用户名 -->
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" id="user" name="account" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->

            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <hr class="hr15">
        <!-- 密码 -->

        <div class="layui-input-inline">
            <label class="layui-form-label">密码</label>
            <div class="layui-inline" >
                <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <hr class="hr15">
        <!-- 确认密码 -->

        <div class="layui-input-inline">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-inline" >
                <input type="password" id="rpwd" name="repassword" required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <hr class="hr15">


        <div class="layui-input-inline login-btn" >
            <label class="layui-form-label"></label>
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn">注册</button>
        </div>
        <hr style="width: 85%" />
        <p style="width: 85%"><a href="login.html" class="fl">已有账号？立即登录</a><a href="javascript:;" class="fr">忘记密码？</a></p>
    </form>
        <form method="post" class="layui-form" >
            <input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
</div>


<script src="/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','jquery','layer'], function () {
        var form   = layui.form;
        var $      = layui.jquery;
        var layer  = layui.layer;
        //添加表单失焦事件
        //验证表单
        $('#user').blur(function() {
            var user = $(this).val();

            //alert(user);
            $.ajax({
                url:'checkUser.php',
                type:'post',
                dataType:'text',
                data:{user:user},
                //验证用户名是否可用
                success:function(data){
                    if (data == 1) {
                        $('#ri').removeAttr('hidden');
                        $('#wr').attr('hidden','hidden');


                    } else {
                        $('#wr').removeAttr('hidden');
                        $('#ri').attr('hidden','hidden');
                        layer.msg('当前用户名已被占用! ')

                    }

                }
            })

        });

        // you code ...
        // 为密码添加正则验证
        $('#pwd').blur(function() {
            var reg = /^[\w]{6,12}$/;
            if(!($('#pwd').val().match(reg))){
                //layer.msg('请输入合法密码');
                $('#pwr').removeAttr('hidden');
                $('#pri').attr('hidden','hidden');
                layer.msg('请输入合法密码');
            }else {
                $('#pri').removeAttr('hidden');
                $('#pwr').attr('hidden','hidden');
            }
        });

        //验证两次密码是否一致
        $('#rpwd').blur(function() {
            if($('#pwd').val() != $('#rpwd').val()){
                $('#rpwr').removeAttr('hidden');
                $('#rpri').attr('hidden','hidden');
                layer.msg('两次输入密码不一致!');
            }else {
                $('#rpri').removeAttr('hidden');
                $('#rpwr').attr('hidden','hidden');
            };
        });

        //
        //添加表单监听事件,提交注册信息
        form.on('submit(sub)', function() {
            $.ajax({
                url:'reg.php',
                type:'post',
                dataType:'text',
                data:{
                    user:$('#user').val(),
                    pwd:$('#pwd').val(),
                },
                success:function(data){
                    if (data == 1) {
                        layer.msg('注册成功');
                        ///location.href = "login.html";
                    }else {
                        layer.msg('注册失败');
                    }
                }
            })
            //防止页面跳转
            return false;
        });

    });
</script>
</body>
</html>
