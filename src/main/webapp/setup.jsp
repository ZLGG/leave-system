<%--
  Created by IntelliJ IDEA.
  User: zheng
  Date: 2019/3/30
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<div class="layui-form">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">限定选课开始日期</label>
            <div class="layui-input-inline">
                <input class="layui-input" id="test-limit1" type="text" placeholder="yyyy-MM-dd">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">限定选课截至日期</label>
            <div class="layui-input-inline">
                <input class="layui-input" id="test-limit2" type="text" placeholder="yyyy-MM-dd">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label <%--for="L_repass"--%> class="layui-form-label">
        </label>
        <button  class="layui-btn" lay-filter="add" lay-submit="">
            确定
        </button>
    </div>
</div>

<script>
    layui.use(['form','layer','laydate'], function(){
        $ = layui.jquery;
        var form = layui.form
            , laydate = layui.laydate
            , layer = layui.layer;

        //自定义验证规则
        /*   form.verify({
               nikename: function(value){
                   if(value.length < 11){
                       return '学号/工号至少得11个字符啊';
                   }
               }
               ,pass: [/(.+){6,12}$/, '密码必须6到12位']
               ,repass: function(value){
                   if($('#L_pass').val()!=$('#L_repass').val()){
                       return '两次密码不一致';
                   }
               }
           });*/

        //监听提交
        form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
                // 可以对父窗口进行刷新
                x_admin_father_reload();
            });
            return false;
        });
       var myDate =  new Date();
        var year = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
        var month = myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
        var day = myDate.getDate(); //获取当前日(1-31)
        var ins22 = laydate.render({
            elem: '#test-limit1'
            ,min: year+'-'+month+'-'+day
            ,max: '2080-10-14'
            ,ready: function(){
                ins22.hint('日期可选值设定在 <br>'+year+'-'+month+'-'+day+' 之后');
            }
        });
        var ins23 = laydate.render({
            elem: '#test-limit2'
            ,min: year+'-'+month+'-'+day
            ,max: '2080-10-14'

        });
    });
</script>
</body>
</html>
