<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>layout 后台大布局 - Layui</title>
    <%--<link rel="stylesheet" type="text/css" href="/static/css/main.css">--%>
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css">
    <script type="text/javascript" src="/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="getItem()">商品</a></dd>
                        <dd><a href="javascript:;" onclick="">类目</a></dd>
                        <dd><a href="javascript:;" onclick="">添加商品</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">全部订单</a></dd>
                        <dd><a href="javascript:;">待付款</a></dd>
                        <dd><a href="javascript:;">已付款</a></dd>
                        <dd><a href="javascript:;">待退款</a></dd>
                        <dd><a href="javascript:;">已退款</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <%--<li class="layui-nav-item">
                    <a href="javascript:;">发布商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>--%>
                <%--<li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><li class="layui-nav-item leftdaohang" data-url="/test/zhanghao" mytitle="账号管理"><a>账号管理</a></li></dd>
                <dd><li class="layui-nav-item leftdaohang" data-url="/test/jiaose" mytitle="角色管理"><a>角色管理</a></li></dd>
                </dl>
                </li> --%>
            </ul>
        </div>
    </div>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <table class="layui-hide" id="demo" lay-filter="test"></table>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © zlg.com - 电商后台
    </div>
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
    function getItem() {
        layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
            var laydate = layui.laydate //日期
                ,laypage = layui.laypage //分页
                ,layer = layui.layer //弹层
                ,table = layui.table //表格
                ,carousel = layui.carousel //轮播
                ,upload = layui.upload //上传
                ,element = layui.element //元素操作
                ,slider = layui.slider //滑块


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
                    layer.msg('查看操作'+data);
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


            slider.render({
                elem: '#sliderDemo'
                ,input: true //输入框
            });

            //底部信息
            var footerTpl = lay('#footer')[0].innerHTML;
            lay('#footer').html(layui.laytpl(footerTpl).render({}))
                .removeClass('layui-hide');
        });
    }

    function addItem() {
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
    }
    /*layui.use('element', function(){
        var element = layui.element;

    });*/

</script>
</body>
</html>