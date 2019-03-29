<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Document</title>
  <link rel="stylesheet" type="text/css" href="/static/css/main.css">
  <link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
  <script type="text/javascript" src="/layui/layui.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

  <div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="#">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a href="login.html">登录</a></div>
        <div class="sp-cart"><a href="shopcart.html">购物车</a><span>2</span></div>
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="母婴商城">
            <img src="/static/img/logo.png">
          </a>
        </h1>
        <div class="mallSearch">
          <form action="" class="layui-form" novalidate>
            <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" lay-submit lay-filter="formDemo">
                <i class="layui-icon layui-icon-search"></i>
            </button>
            <input type="hidden" name="" value="">
          </form>
        </div>
      </div>
    </div>
  </div>


  <div class="content content-nav-base  login-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="commodity.html" class="active">所有商品</a>
            <a href="buytoday.html">今日团购</a>
            <a href="information.html">母婴资讯</a>
            <a href="about.html">关于我们</a>
          </div>
        </div>
      </div>
    </div>
    <div class="login-bg">
      <div class="login-cont w1200">
        <div class="form-box">
          <form class="layui-form" action="">
            <legend>邮箱登录</legend>
            <div class="layui-form-item">
              <div class="layui-inline iphone">
                <div class="layui-input-inline">
                  <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                  <input type="email" name="email" id="email" lay-verify="required|email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline veri-code">
                <div class="layui-input-inline">
                  <input id="pnum" type="text" name="pnum" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                  <input type="button" class="layui-btn" id="find"  value="验证码" /> 
                </div>
              </div>
            </div>
            <div class="layui-form-item login-btn">
              <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1" <%--onclick="return false"--%>>登录</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">母婴资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
    </div>
  </div>
  <script type="text/javascript">

   layui.config({
      base: '/static/js/util' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['jquery','form'],
       function(){
          var $ = layui.$,form = layui.form;
          form.verify(
              { email: [/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, '邮箱格式不对']   }
          );
       /* $.ajax(
          {
              type: "get",
              url: "/ajaxtest",
              datatype: "json",
              success:function (data) {
                  if (data.result=='SUCCESS') {
                      setTimeout(function () {
                          window.location.href = "/index.jsp";
                      },1000)
                  }
                  else {
                      lay.msg(data.errorMsg,{time: 1000});
                  }
              },
              error:function () {
                  layer.msg("yichang");
              }

          }
      );*/

        $("#find").click(function() {
            if(!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($("#email").val())){
              layer.msg("请输入正确的邮箱"+email+"asfa"+1+$("#email").val());
              return false;
            }
            var obj=this;
            $.ajax({
                type: "get",
                url: "/verifyCode",
                contentType: 'application/json;charset=utf-8',

                dataType: "json",//返回的
                data:{email:$("#email").val()},
                success:function(data) {
                    if(data.result){
                        $("#find").addClass(" layui-btn-disabled");
                        $('#find').attr('disabled',"true");
                        settime(obj);
                        $("#msg").text(data.msg);
                    }else{
                        layer.msg(data.msg);
                    }
                },
                error:function(msg) {
                    console.log(msg);
                }
            }); 
        })
        var countdown=60; 
        function settime(obj) { 
        if (countdown == 0) { 
            obj.removeAttribute("disabled"); 
            obj.classList.remove("layui-btn-disabled")
            obj.value="获取验证码"; 
            countdown = 60; 
            return;
        } else { 
            
            obj.value="重新发送(" + countdown + ")"; 
            countdown--; 
        } 
        setTimeout(function() { 
            settime(obj) }
            ,1000) 
        }
        form.on('submit(demo1)',function (data) {
            $.ajax({
                url:"/login",
                data:data.field,
                dataType:"json",
                type:'post',
                success:function (result) {
                    if (result.result=='SUCCESS'){
                        //layer.msg(data1.data, 1000);
                        setTimeout(function () {
                            window.location.href = "/index.jsp";
                        },1000)
                    }
                    else {
                        layer.msg(result.errorMsg,{time:1000});
                    }
                    },
                error:function () {
                    layer.msg("异常");
                }
            });
            return false;
        });
    });
  </script>

</body>
</html>