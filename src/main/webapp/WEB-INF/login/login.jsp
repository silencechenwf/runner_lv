<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
    <meta charset="utf-8">
    <title>登录 | 驴友网</title>
    <meta name="Keywords" content="驴友网" />
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
    <link rel="stylesheet" type="text/css" href="css/global.css"  />
    <link rel="stylesheet" type="text/css" href="css/reg.css"  />
    <link rel="stylesheet"  href="css/boxy,jquery.fancybox-1.3.4.css" />
    <script type="text/javascript" src="js/jquery-1.4.4.min,LAB.min.js"></script>
    <script type="text/javascript">
        var userjson = '';
        var c_cityinfo = '';
    </script>
</head>

<body id="reg" >
<!--top-->
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="${ctx}/user/index" title="驴友网" style="float: left;" >驴友网</a>
            </h1>
            <h2 class="slogan" title="在旅途中相遇">在旅途中相遇</h2>

            <div class="loginInfo">
                <ul class="not_login">
                    <li style="float:right"><a href="${ctx}/login/register" class="btn_reg">注册</a></li>
                    <li  style="float:right"><a href="${ctx}/login/login"  id="top-nav-login" class="btn_login">登录</a></li>
                </ul>
            </div>
        </div>

        <ul class="dropdown">
            <li>
                <a href="${ctx}/user/index" >首页</a>
            </li>
            <li>
                <a href="${ctx}/memory/memory">旅游记忆</a>
            </li>
            <li>
                <a href="${ctx}/traveller/traveller">结伴游</a>
            </li>
            <li>
                <a href="${ctx}/strategy/strategy">景点攻略</a>
            </li>
        </ul>

        <div class="navSearch">
            <form action="${ctx}/men/memory_search" method="get" id="searchForm" target="_blank">
                <input name="k" type="text" class="top-search-input" id="searchKey" value="搜索旅游记忆" maxlength="50" autocomplete="off"/>
                <input name="" type="submit" value="搜索" class="search_btn">
            </form>
            <div id="keyword_tip_content"></div>
        </div>
    </div>
</div>
<!--top end-->

<div id="container"  class="noXtips cf">
    <div  class="main">
        <h2>欢迎登录驴友网</h2>
        <form id="form100" action="${ctx}/login/login" method="post" class="reg-form" >
            <p><em>${requestScope.msg}</em></p>
            <p><label for="username"><em>*</em>用户名：</label>
                <input name="userName" type="text"  class="input-txt" id="username" autocomplete="off" size="43" />
            </p>
            <p><label for="password"><em>*</em>密码：</label>
                <input name="userPass" type="password"  class="input-txt" id="password" autocomplete="off" size="43" />
            </p>
            <p class="checkcode" hidden="hidden"><label for="checkcode"><em>*</em>验证码：</label>
                <input name="checkcode" type="text" class="input-txt" id="checkcode" autocomplete="off" ><img height="26" align="absmiddle" width="105"  onclick="this.src=this.src+'?'" title="看不清？点击更换"  src="" id="checkcodeimg" ><span  onclick="changeCheckCodeImg();" class="refresh">换一换</span>
            </p>
            <input type="submit" class="reg-login" value="登录"/>
            <%--<a href="${ctx}/login/index" class="reg-login">登录</a>--%>
        </form>
        <script>
            $("#username").change(function () {
                var $username=$("#username").val();
                if($username==null||$username==""){
                    alert("用户名不能为空");
                }
            });
            $("#password").change(function () {
                var $password=$("#password").val();
                if($password==null||$password==""){
                    alert("密码不能为空");
                }
            });

        </script>

        <div class="reg-notes">
            <p>如果你还没有账户，请点击注册</p>
            <a href="${ctx}/login/register" class="reg-login">注册</a>
        </div>
    </div>
</div>

<div class="footer " >
    <div class="footerWrap fn-clear">
        <ul class="about_roadqu ">
            <li><a href="#">关于驴友</a>|</li>
            <li><a href="#">联系我们</a>|</li>
            <li><a href="#">用户公约</a>|</li>
            <li><a href="#">意见反馈</a>|</li>
            <li><a href="#">帮助中心</a>|</li>
            <li><a href="#">友情链接</a></li>
        </ul>
        <div class="foot">
            <p><span>版权所有软件1705班
			<a href="#">李治龙</a><a href="#"> 陈伟峰</a><a href="#">张梦</a><a href="#">邢飞</a>
			</span></p>
            <div class="sns">
                <span>关注我们： </span><a href="#" class="login_sina">新浪微博 </a><a href="#" class="login_qq">腾讯微博</a>
                <%--<a href="#" title="360绿色网站"><img src="http://trust.360.cn/img.php?sn=5229&id=5" border="0" /></a>--%>
                <!-- WPA Button Begin -->
                <!-- WPA Button END -->
            </div>
        </div>
    </div>
</div>
<!-- footer end -->
</body>
</html>
