<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/3/7
  Time: 17:14
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
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail"><i class="layui-icon">&#xe60a;</i></a>
    <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>
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
<div class="layui-row">
    <form class="layui-form layui-col-md12 x-so">
        <input class="layui-input" placeholder="开始日" name="start" id="start">
        <input class="layui-input" placeholder="截止日" name="end" id="end">
        <div class="layui-input-inline">
            <select name="contrller">
                <option>支付状态</option>
                <option>已支付</option>
                <option>未支付</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <select name="contrller">
                <option>支付方式</option>
                <option>支付宝</option>
                <option>微信</option>
                <option>货到付款</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <select name="contrller">
                <option value="">订单状态</option>
                <option value="0">待确认</option>
                <option value="1">已确认</option>
                <option value="2">已收货</option>
                <option value="3">已取消</option>
                <option value="4">已完成</option>
                <option value="5">已作废</option>
            </select>
        </div>
        <input type="text" name="username"  placeholder="请输入订单号" autocomplete="off" class="layui-input">
        <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
    </form>
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
                ,$ = layui.jquery


            //执行一个 table 实例
            table.render({
                elem: '#demo'
                ,height: 420
                ,url: '/getItemList' //数据接口
                ,title: '商品表'
                ,page: true //开启分页
                ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                ,totalRow: true //开启合计行
                ,cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    // ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
                    /*,{field: 'username', title: '用户名', width:80}
                    ,{field: 'experience', title: '积分', width: 90, sort: true, totalRow: true}
                    ,{field: 'sex', title: '性别', width:80, sort: true}
                    ,{field: 'score', title: '评分', width: 80, sort: true, totalRow: true}
                    ,{field: 'city', title: '城市', width:150}
                    ,{field: 'sign', title: '签名', width: 200}
                    ,{field: 'classify', title: '职业', width: 100}
                    ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}*/
                    ,{field: 'color', title:'颜色',width: 80}
                    ,{field: 'ciurPic', title:'价格',width: 80}
                    ,{field: 'img', title:'图片',width: 80}
                    ,{field: 'discount', title:'折扣',width: 80}
                    ,{field: 'right', width: 165, align:'center', toolbar: '#barDemo'}
                ]]
            });

            //监听头工具栏事件
            table.on('toolbar(test)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id)
                    ,data = checkStatus.data; //获取选中的数据
                switch(obj.event){
                    case 'add':
                        layer.msg('添加');
                        addItem();
                        break;
                    case 'update':
                        if(data.length === 0){
                            layer.msg('请选择一行');
                        } else if(data.length > 1){
                            layer.msg('只能同时编辑一个');
                        } else {
                            layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                        }
                        break;
                    case 'delete':
                        if(data.length === 0){
                            layer.msg('请选择一行');
                        } else {
                            layer.msg('删除');
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
                    layer.open({
                        type: 2,
                        area: [($(window).width()*0.9)+'px', ($(window).height() - 50) +'px'],
                        fix: false, //不固定
                        maxmin: true,
                        shadeClose: true,
                        shade:0.4,
                        title: "编辑",
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
                    });
                 // x_admin_show('商城首页','/test/index');
                    testShow()
                } else if(layEvent === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        obj.del(); //删除对应行（tr）的DOM结构
                        layer.close(index);
                        //向服务端发送删除指令
                    });
                } else if(layEvent === 'edit'){
                    layer.msg('编辑操作');
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

            form.on('submit(search)',function (data) {
                table.render({
                    elem: '#order'
                    ,height: 420
                    ,url: '/getItemList' //数据接口
                    ,title: '商品表'
                    ,page: true //开启分页
                    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                    ,totalRow: true //开启合计行
                    ,cols: [[ //表头
                        {type: 'checkbox', fixed: 'left'}
                        // ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
                        ,{field: 'title', title: '商品', width:80}
                        ,{field: 'catalog', title: '分类', width:80, sort: true}
                        ,{field: 'ciurPic', title: '现价', width: 90, sort: true }
                        ,{field: 'OriPic', title: '原价', width:80, sort: true}
                        ,{field: 'discount', title:'折扣',width: 100}
                        /*,{field: 'score', title: '评分', width: 80, sort: true, totalRow: true}
                        ,{field: 'city', title: '城市', width:150}
                        ,{field: 'sign', title: '签名', width: 200}
                        ,{field: 'classify', title: '职业', width: 100}
                        ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}
                        ,{field: 'color', title:'颜色',width: 80}
                        ,{field: 'ciurPic', title:'价格',width: 80}
                        ,{field: 'img', title:'图片',width: 80}
                        ,{field: 'discount', title:'折扣',width: 80}*/
                        ,{field: 'right', width: 80, align:'center', toolbar: '#barDemo'}
                    ]]
                });
            })
            slider.render({
                elem: '#sliderDemo'
                ,input: true //输入框
            });

            //底部信息
            var footerTpl = lay('#footer')[0].innerHTML;
            lay('#footer').html(layui.laytpl(footerTpl).render({}))
                .removeClass('layui-hide');
        });


   /* function addItem() {
        layer.open({
            id:1,
            type: 1,
            title:'添加商品',
            skin:'layui-layer-rim',
            area:['450px', 'auto'],

            content: ' <div class="row" style="width: 420px;  margin-left:7px; margin-top:10px;">'
                +'<div class="col-sm-12">'
                +'<div class="input-group">'
                +'<span class="input-group-addon"> 新 密 码   :</span>'
                +'<input id="firstpwd" type="password" class="form-control" placeholder="请输入密码">'
                +'</div>'
                +'</div>'
                +'<div class="col-sm-12" style="margin-top: 10px">'
                +'<div class="input-group">'
                +'<span class="input-group-addon">确认密码:</span>'
                +'<input id="secondpwd" type="password" class="form-control" placeholder="请再输入一次密码">' +
                '<div class="layui-inline">\n' +
                '            <label class="layui-form-label">是否允许退货</label>\n' +
                '            <div class="layui-input-block">\n' +
                '                <input type="radio" name="returnItem" value="是" title="是" checked placeholder="是">\n' +
                '                <input type="radio" name="returnItem" value="否" title="否" placeholder="否">\n' +
                '            </div>\n' +
                '        </div>'
                +'</div>'
                +'</div>'
                +'</div>'
            ,
            btn:['保存','取消'],
            btn1: function (index,layero) {
            },
            btn2:function (index,layero) {
                layer.close(index);
            }

        });
    }*/
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
