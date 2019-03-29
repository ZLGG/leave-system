<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2019/3/7
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    
<head>
            <title>首页</title>
            
    <script src="/static/layui/lay/modules/jquery.js"></script>
            
    <link rel="stylesheet" href="/static/layui/css/layui.css">
        
</head>
    
<body class="layui-layout-body">
        
<div class="layui-layout layui-layout-admin">
              <!--1.头部区域-->
              
    <div class="layui-header">            
        <div class="layui-logo">后台管理</div>
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
                <!--2.左侧导航-->
              
    <div class="layui-side layui-bg-black">            
        <div class="layui-side-scroll">
                          <!-- 左侧导航区域（可配合layui已有的垂直导航） -->              
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">                
               <%-- <li class="layui-nav-item leftdaohang" data-url="/test/jiaose" mytitle="角色管理"><a>角色管理</a></li>                
                <li class="layui-nav-item leftdaohang" data-url="/test/zhanghao" mytitle="账号管理"><a>账号管理</a></li>--%>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">商品管理</a>
                    <dl class="layui-nav-child">
                        <dd><li class="layui-nav-item leftdaohang" data-url="/test/zhanghao" mytitle="账号管理"><a>账号管理</a></li></dd>
                        <dd><li class="layui-nav-item leftdaohang" data-url="/test/jiaose" mytitle="角色管理"><a>角色管理</a></li></dd>
                    </dl>
                </li>              
            </ul>           
        </div>          
    </div>
              <!--3.右侧主体内容区-->
              

                      <!--tabs标签-->               
        <div class="layui-tab <%--layui-tab-card--%>" lay-filter="demo" lay-allowclose="true">
                          
            <ul class="layui-tab-title">
                             <!--   <li class="layui-this">角色管理</li>-->              
            </ul>
                          
            <div class="layui-tab-content" <%--style="height: 600px;"--%>>
                                <!--<div class="layui-tab-item layui-show">
                  1. 我个人比较喜欢卡片风格的，所以你发现又是以卡片的风格举例
                  2. 删除功能适用于所有风格
                </div>-->
                      <%--<div class="layui-tab-item">
                    <iframe  style="width: 100%;height: 100%;" scrolling="no" src="jiaose.html" ></iframe>
                </div> --%>         
            </div>            
        </div> 
    <%--<div class="layui-body">          
    </div>--%>

    <!--4.底部固定区域-->        
    <div class="layui-footer">
           © layui.com - 底部固定区域           
    </div>
            
</div>
        
<script src="/static/layui/layui.all.js"></script>
        
<script>
    layui.use(['element','jquery'], function () {
        var $ = layui.jquery
            , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function () {
                //新增一个Tab项
                var htmlurl = $(this).attr('data-url');
                var mytitle = $(this).attr('mytitle');
//                  alert("触发tab增加事件："+mytitle);
                //先判断是否已经有了tab
                var arrayObj = new Array();　//创建一个数组  
                $(".layui-tab-title").find('li').each(function () {
                    var y = $(this).attr("lay-id");
                    arrayObj.push(y);
                });
//                    alert("遍历取到的数组："+arrayObj);
                var have = $.inArray(mytitle, arrayObj);  //返回 3,
                if (have >= 0) {
                    //tab已有标签
//                        alert("遍历的已有标签："+mytitle);
                    element.tabChange('demo', mytitle); //切换到当前点击的页面
                } else {
                    //没有相同tab
//                      alert("遍历的没有相同tab："+mytitle);
                    element.tabAdd('demo', {
                        title: mytitle //用于演示
                        ,
                        content: '<iframe style="width: 100%;height: 100%;" scrolling="no" src=' + htmlurl + ' ></iframe>'
                        ,
                        id: mytitle //实际使用一般是规定好的id，这里以时间戳模拟下
                    })
                    element.tabChange('demo', mytitle); //切换到当前点击的页面
                }
            }

        };
        $(".leftdaohang").click(function () {
            var type = "tabAdd";
            var othis = $(this);
//                var htmlurl=$(this).attr('data-url');
//                var mytitle=$(this).attr('mytitle');
            active[type] ? active[type].call(this, othis) : '';
        });

    });
</script>
        <!--<script>
            var loginurl="http://localhost:8088/user/showUser";
            var mytoken=sessionStorage.getItem("gltoken");
            console.log("缓存的token:"+mytoken);
            netWorking();
            $(".leftdaohang").click(function(){
                var htmlurl=$(this).attr('data-url');
                var mytitle=$(this).attr('mytitle');
                addTab(mytitle);
                document.getElementById("myiframe").src=htmlurl;
            });
            function addTab (tabname) {
                 $(".layui-tab-title li").removeClass("layui-this");
                $('.layui-tab-title').append("<li>"+tabname+"</li>");
                  //触发事件                
            }
            function netWorking () {
                    $.ajax({
                        type:"post",    
                        url:loginurl,    
                        data:{ 
                             token:mytoken
                        }, 
                        success: function(res) {
                           console.log("home请求数据1.："+res);
                              var datas=JSON.parse(res);
                        },
                        error:function() { 
                            alert("失败");
                       } 
                    });        
            }
        </script>-->
    
</body>
</html>
