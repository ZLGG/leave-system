<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>请假</title>
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


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">请假开始日期</label>
                <div class="layui-input-inline">
                    <input class="layui-input" id="beginTime" name="beginTime" type="text" placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">请假截至日期</label>
                <div class="layui-input-inline">
                    <input class="layui-input" id="endTime" name="endTime" type="text" placeholder="yyyy-MM-dd HH:mm:ss">
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">原因</label>
            <div class="layui-input-block">
                <textarea name="reason" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button class="layui-btn" lay-filter="add" lay-submit="">
                增加
            </button>
        </div>

    </form>
</div>
<script>
    layui.use(['form', 'layer','laydate'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;
        var laydate = layui.laydate;

        var myDate =  new Date();
        var year = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
        var month = myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
        var day = myDate.getDate(); //获取当前日(1-31)
        var ins22 = laydate.render({
            elem: '#beginTime'
            ,min: year+'-'+month+'-'+day
            ,type: 'datetime'
            ,max: '2080-10-14'
            ,ready: function(){
                ins22.hint('日期可选值设定在 <br>'+year+'-'+month+'-'+day+' 之后');
            }
        });
        var ins23 = laydate.render({
            elem: '#endTime'
            ,type: 'datetime'
            ,min: year+'-'+month+'-'+day
            //,max: '2080-10-14'

        });


        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            $.ajax(
                {
                    type: 'get',
                    url: '/addRecord',
                    datatype: "json",
                    data: data.field,
                    success: function (result) {
                        if (result.code == 0) {
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
                            layer.msg('时间不匹配');
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            // 可以对父窗口进行刷新
                            x_admin_father_reload();
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