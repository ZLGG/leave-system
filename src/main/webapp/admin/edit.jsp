<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-WeAdmin Frame型后台管理系统-WeAdmin 1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/static/css/font.css">
		<link rel="stylesheet" href="/static/css/weadmin.css">
      <link rel="stylesheet" href="/static/layui/css/layui.css">
      <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <div class="weadmin-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label  class="layui-form-label">
                  <span class="we-red">*</span>学号
              </label>
              <div class="layui-form-mid layui-word-aux">
                  <span class="we-red">${sessionScope.user.number}</span>
              </div>
              <div class="layui-form-mid layui-word-aux">
                  <span class="we-red">*</span>您唯一的登入号
              </div>
          </div>

          <div class="layui-form-item" aria-autocomplete="both">
              <label class="layui-form-label"><span class="we-red">*</span>角色</label>
              <div class="layui-form-mid layui-word-aux">
                  <span class="we-red">
                      <c:if test="${sessionScope.user.role=0}">学生</c:if>
                      <c:if test="${sessionScope.user.role=1}">任课教师</c:if>
                      <c:if test="${sessionScope.user.role=1}">辅导员</c:if>
                      <c:if test="${sessionScope.user.role=1}">领导</c:if>
                      <c:if test="${sessionScope.user.role=2}">管理员</c:if>
                  </span>
              </div>
          </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>手机
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>
          <div class="layui-form-item" style="margin-top: 10px">
              <label for="L_pass" class="layui-form-label">
                  <span class="we-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_pass" name="password" required="" lay-verify="pass"
                  autocomplete="off" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">
                  6到16个字符
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
                  <span class="we-red">*</span>确认密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  确定
              </button>
          </div>
      </form>
    </div>
		<script src="/static/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript">
    	layui.extend({
				admin: '{/}/static/js/admin'
			});
	    layui.use(['form','layer','admin'], function(){
	      var form = layui.form,
	      	admin = layui.admin,
	      	layer = layui.layer;

          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
              $.ajax(
                  {
                      type:'get',
                      url:'/addProject',
                      datatype:"json",
                      data:data.field,
                      success: function (result) {
                          if (result.code==200) {
                              layer.alert("修改成功", {icon: 6},function () {
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
                      error:function () {
                          layer.msg('异常');
                      }
                  }
              );

              return false;
          });

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