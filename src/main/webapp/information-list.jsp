<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/3/18
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css">
    <script type="text/javascript" src="/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>
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
<!-- 内容主体区域 -->
<div style="padding: 15px;">
    <table class="layui-hide" id="demo" lay-filter="test"></table>

</div>
<script src="/static/layui/layui.js"></script>
<script>
    /*layui.config({
        base:'/static/js/util'
    }).use(['jquery','form'],

    function(){
        var $ = layui.$, form = layui.form;

    });*/
    //JavaScript代码区域

    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','jquery'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider //滑块
            ,$ = layui.jquery;


        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 420
            ,url: '/getBlackGetInformation' //数据接口
            ,title: '资讯列表'
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                // ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
                ,{field: 'text', title:'讯息',width: 100}
                ,{field: 'infoCont',title:'内容',width:480}
                //,{field: 'img', title:'图片',width: 80}
                ,{field: 'data', title: '时间', width:120}
                /*,{field: 'score', title: '评分', width: 80, sort: true, totalRow: true}
                ,{field: 'city', title: '城市', width:150}
                ,{field: 'sign', title: '签名', width: 200}
                ,{field: 'classify', title: '职业', width: 100}
                ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}
                ,{field: 'color', title:'颜色',width: 80}
                ,{field: 'ciurPic', title:'价格',width: 80}
                ,{field: 'img', title:'图片',width: 80}
                ,{field: 'discount', title:'折扣',width: 80}*/
                ,{field: 'right', width: 160, align:'center', toolbar: '#barDemo'}
            ]]
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
                        title: "添加资讯",
                        content: '/test/information-add',
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
                            $.ajax(
                                {
                                    type:'get',
                                    url:'/deleteInformation',
                                    datatype:"json",
                                    data:{id:obj.data.id},
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
                            );
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
                            url:'/deleteInformation',
                            datatype:"json",
                            data:{id:obj.data.id},
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

        //分页
        laypage.render({
            elem: 'pageDemo' //分页容器的id
            ,count: 100 //总页数
            ,skin: '#ad7dff' //自定义选中色值
            //,skip: true //开启跳页
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第'+ obj.curr +'页', {offset: 'b'});
                }
            }
        });


        slider.render({
            elem: '#sliderDemo'
            ,input: true //输入框
        });

        //底部信息
        var footerTpl = lay('#footer')[0].innerHTML;
        lay('#footer').html(layui.laytpl(footerTpl).render({}))
            .removeClass('layui-hide');
    });


    function addItem() {
        layer.open({
            type: 2,
            area: [($(window).width() * 0.9) + 'px', ($(window).height() - 50) + 'px'],
            fix: false, //不固定
            maxmin: true,
            shadeClose: true,
            shade: 0.4,
            title: "编辑",
            content: '/test/index',
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
    }
    /*layui.use('element', function(){
        var element = layui.element;

    });*/
    function x_admin_show(title,url,w,h){
        if (title == null || title == '') {
            title=false;
        };
        if (url == null || url == '') {
            url="404.html";
        };
        if (w == null || w == '') {
            w=($(window).width()*0.9);
        };
        if (h == null || h == '') {
            h=($(window).height() - 50);
        };
        layer.open({
            type: 2,
            area: [w+'px', h +'px'],
            fix: false, //不固定
            maxmin: true,
            shadeClose: true,
            shade:0.4,
            title: title,
            content: url,
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
        });
    }

    function testShow(){
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
        layer.open({
            type: 2,
            area: [($(window).width() * 0.9) + 'px', ($(window).height() - 50) + 'px'],
            fix: false, //不固定
            maxmin: true,
            shadeClose: true,
            shade: 0.4,
            title: "编辑",
            content: '/test/index',
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
    }



</script>
</body>
</html>
