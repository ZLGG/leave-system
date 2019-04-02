<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>课程列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/static/layui/css/layui.css">
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

<body class="">
<script type="text/html" id="barDemo">
    <%--<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail"><i class="layui-icon">&#xe60a;</i></a>--%>
    <%-- <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>--%>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">取消</i></a>
</script>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <%--  <div class="layui-row">
        <label class="layui-form-label">选课设置时间</label>
        <form class="layui-form layui-col-md12 x-so">
          <input class="layui-input"  autocomplete="off"  name="beginTime" id="start" required="" lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss" type="text">
          <input class="layui-input"  autocomplete="off"  name="endTime" id="end" required="" lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss" type="text">
          <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">设置</i></button>
        </form>
      </div>--%>
    <table class="layui-table" lay-data="{url:'/getProject',page:true,id:'test',toolbar: 'default'}" lay-filter="test">
        <thead>
        <tr>
            <th lay-data="{type:'checkbox'}">ID</th>
            <th lay-data="{field:'id', width:80, sort: true}">ID</th>
            <th lay-data="{field:'beginTime', minWidth: 160, width:220, sort: true, edit: 'text'}">开始时间</th>
            <th lay-data="{field:'endTime', minWidth: 160, width:220  edit: 'text'}">结束时间</th>
            <th lay-data="{field:'reason', width:180 , edit: 'text'}" >原因</th>
            <th lay-data="{field:'status', width:80 }">状态</th>
            <th lay-data="{field:'createTime',  minWidth: 160,width:180}">创建时间</th>
            <th lay-data="{ toolbar: '#barDemo'}">操作</th>
        </tr>
        </thead>
    </table>

</div>
<%--<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>--%>

<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        var myDate =  new Date();
        var year = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
        var month = myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
        var day = myDate.getDate(); //获取当前日(1-31)
        //执行一个laydate实例
        ins22 = laydate.render({
            elem: '#start' //指定元素
            ,min: year+'-'+month+'-'+day
            ,type: 'datetime'
            ,ready: function(){
                ins22.hint('日期可选值设定在 <br>'+year+'-'+month+'-'+day+' 之后');
            }
        });

        //执行一个laydate实例
        ins23 = laydate.render({
            elem: '#end' //指定元素
            ,type: 'datetime'
            ,min: $("#start").val()
        });


    });
</script>
<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;
        $.ajax(
            {
                type:'get',
                url:'/getTeacher',
                datatype:"json",
                //data:data.field,
                success: function (result) {
                    if (result.code==200) {

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
        //监听提交
        form.on('submit(search)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            $.ajax(
                {
                    type:'get',
                    url:'/setDate',
                    datatype:"json",
                    data:data.field,
                    success: function (result) {
                        if (result.code==200) {
                            layer.alert("设置成功", {icon: 6}
                            );
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

        //监听单元格编辑
        table.on('edit(test)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
            //调用ajax修改
            $.ajax(
                {
                    type:'get',
                    url:'/updateRecord',
                    datatype:"json",
                    data:data.field,
                    success: function (result) {
                        if (result.code=200) {

                        }
                        else {

                        }

                    },
                    error:function () {
                        layer.msg('异常');
                    }
                }
            );
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    //addItem();
                    layer.open({
                        type: 2,
                        area: [($(window).width() * 0.9) + 'px', ($(window).height() - 50) + 'px'],
                        fix: false, //不固定
                        maxmin: true,
                        shadeClose: true,
                        shade: 0.4,
                        title: "申请假条",
                        content: '/test/record-add',
                        success: function () {
                            //窗口加载成功刷新frame
                            // location.replace(location.href);
                        },
                        cancel: function () {
                            //关闭窗口之后刷新frame
                            // location.replace(location.href);
                        },
                        end: function () {
                            //窗口销毁之后刷新frame
                            // location.replace(location.href);
                        }
                    });
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        //layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                        //根据id请求接口获取数据，弹出窗口回显
                        /* $.ajax(
                             {
                                 type: "get",
                                 url: "/getItem",
                                 datatype: "json",
                                 data:{id:checkStatus.data[0].id},
                                 success: function (data) {
                                     if (data.result == 'SUCCESS') {
                                         /!*setTimeout(function () {
                                             window.location.href = "/index.jsp";
                                         },1000)*!/
                                     }
                                     else {
                                         lay.msg(data.errorMsg, {time: 1000});
                                     }
                                 },
                                 error: function () {
                                     layer.msg("异常");
                                 }

                             }
                         );
                         layer.open({
                             type: 2,
                             area: [($(window).width() * 0.9) + 'px', ($(window).height() - 50) + 'px'],
                             fix: false, //不固定
                             maxmin: true,
                             shadeClose: true,
                             shade: 0.4,
                             title: "编辑",
                             content: '/test/item-edit',
                             success: function () {
                                 //窗口加载成功刷新frame
                                 // location.replace(location.href);
                             },
                             cancel: function () {
                                 //关闭窗口之后刷新frame
                                 // location.replace(location.href);
                             },
                             end: function () {
                                 //窗口销毁之后刷新frame
                                 // location.replace(location.href);
                             }
                         });*/
                        layer.msg('删除重新添加',{time:1000});
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        //layer.msg('删除');
                        layer.confirm('真的删除行么', function(index){
                            obj.del(); //删除对应行（tr）的DOM结构
                            layer.close(index);
                            //向服务端发送删除指令
                            /*$.ajax(
                                {
                                    type:'get',
                                    url:'/deleteInformation',
                                    datatype:"json",
                                    data:{id:checkStatus.data},
                                    success: function (result) {
                                        if (result.result=="SUCCESS") {

                                        }
                                        else {

                                        }

                                    },
                                    error:function () {
                                        layer.msg('异常');
                                    }
                                }
                            );*/
                        });
                    }
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){

                //layer.msg('查看操作'+obj.data.ciurPic);
                /*$.ajax(
                    {
                        type: "post",
                        url: "/ajaxtest",
                        datatype: "json",
                        data:obj.data.field,
                        success:function (data1) {
                            if (data1.result=='SUCCESS') {
                                setTimeout(function () {
                                    window.location.href = "/index.jsp";
                                },1000)
                            }
                            else {
                                lay.msg(data1.errorMsg,{time: 1000});
                            }
                        },
                        error:function () {
                            layer.msg("yichang");
                        }

                    }
                );*/
                /* layer.open({
                     type: 2,
                     area: [($(window).width()*0.9)+'px', ($(window).height() - 50) +'px'],
                     fix: false, //不固定
                     maxmin: true,
                     shadeClose: true,
                     shade:0.4,
                     title: "查看",
                     content: '/test/admin-add',
                     success: function(){
                         //窗口加载成功刷新frame
                         // location.replace(location.href);
                     },
                     cancel:function(){
                         //关闭窗口之后刷新frame
                         // location.replace(location.href);
                     },
                     end:function(){
                         //窗口销毁之后刷新frame
                         // location.replace(location.href);
                     }
                 });*/
                // x_admin_show('商城首页','/test/index');
                testShow()
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax(
                        {
                            type:'get',
                            url:'/cancelRecord',
                            datatype:"json",
                            data:{id:obj.data.id},
                            success: function (result) {
                                if (result.code=200) {

                                }
                                else {

                                }

                            },
                            error:function () {
                                layer.msg('异常');
                            }
                        }
                    );

                });
            } else if(layEvent === 'edit'){
                layer.msg('删除重新添加',{time:1000});
                /* layer.msg('编辑操作');
                 layer.open({
                     type: 2,
                     area: [($(window).width() * 0.9) + 'px', ($(window).height() - 50) + 'px'],
                     fix: false, //不固定
                     maxmin: true,
                     shadeClose: true,
                     shade: 0.4,
                     title: "编辑",
                     content: '/test/item-edit',
                     success: function () {
                         //窗口加载成功刷新frame
                         // location.replace(location.href);
                     },
                     cancel: function () {
                         //关闭窗口之后刷新frame
                         // location.replace(location.href);
                     },
                     end: function () {
                         //窗口销毁之后刷新frame
                         // location.replace(location.href);
                     }
                 });*/
            }
        });


    });
</script>

<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
<script src="/static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
</body>

</html>