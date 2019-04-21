<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
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
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i></a>
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

    <table class="layui-table" lay-data="{url:'/getInstructorList',page:true,toolbar: 'default',id:'test'}" lay-filter="test">
        <thead>
        <tr>
            <th lay-data="{type:'checkbox'}">ID</th>
            <th lay-data="{field:'id', width:80, sort: true}">ID</th>
            <th lay-data="{field:'number', width:120, sort: true}">工号</th>
            <th lay-data="{field:'userName', width:120, sort: true, edit: 'text'}">用户名</th>
            <th lay-data="{field:'college', minWidth: 80, width:120}">学院</th>
           <%-- <th lay-data="{field:'class', width:120, sort: true, edit: 'text'}">班级</th>--%>
            <th lay-data="{field:'grade', width:80, sort: true, edit: 'text'}">年级</th>
            <th lay-data="{field:'phone', width:120, sort: true, edit: 'text'}">联系方式</th>
            <%--<th lay-data="{field:'sex', width:80,templet: '#switchTpl'}">性别</th>--%>
            <th lay-data="{field:'createTime',  minWidth: 160,width:180}">创建时间</th>
            <%--<th lay-data="{field:'experience', sort: true, edit: 'text'}">积分</th>--%>
            <th lay-data="{width:80,toolbar:'#barDemo'}">操作</th>
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
<%--<script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="sex" value="{{d.id}}" lay-skin="switch" lay-text="女|男" lay-filter="sexDemo" {{ d.id == 10003 ? 'checked' : '' }}>
</script>--%>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //监听单元格编辑
        table.on('edit(test)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
            //调用ajax修改
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
                        title: "添加用户",
                        content: '/test/adminInstructor-add',
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
                            var checkedArr=[];
                            data = checkStatus.data;
                            if (checkStatus.isAll){
                                for (var i=0; i<data.length ; i++){
                                    checkedArr[i]=data[i].id;
                                }
                            }


                            //向服务端发送删除指令
                            $.ajax(
                                {
                                    contentType: "application/json",
                                    type:'post',
                                    url:'/deleteUserList',
                                    datatype:"json",
                                    data:{id:checkedArr},
                                    success: function (result) {
                                        if (result.code==0) {
                                            //obj.del(); //删除对应行（tr）的DOM结构
                                            layer.close(index);
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
                    }
                    break;
            };
        });
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
                layer.confirm('确认删除？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax(
                        {
                            type:'get',
                            url:'/deleteUser',
                            datatype:"json",
                            data:{id:obj.data.id},
                            success: function (result) {
                                if (result.code==0) {
                                    layer.msg("成功删除");
                                }
                                else {
                                    layer.msg("操作有误");
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