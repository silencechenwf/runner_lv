<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>注册 | 驴友网</title>
    <meta name="Keywords" content="驴友网"/>
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐"/>
    <link rel="stylesheet" type="text/css" href="css/global.css"/>
    <link rel="stylesheet" type="text/css" href="css/reg.css"/>
    <link rel="stylesheet" href="css/boxy,jquery.fancybox-1.3.4.css"/>
    <script type="text/javascript" src="js/jquery-1.4.4.min,LAB.min.js"></script>
    <script src="jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

    <script type="text/javascript">
        var userjson = '';
        var c_cityinfo = '';
    </script>
    <style type="text/css">
        label.error {
            background: url("./demo/images/unchecked.gif") no-repeat 0px 0px;

            padding-left: 16px;

            padding-bottom: 2px;

            font-weight: bold;

            color: #ea300f;
        }

    </style>
</head>

<body id="reg">
<!--top-->
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="${ctx}/user/index" title="驴友网" style="float: left;">驴友网</a>
            </h1>
            <h2 class="slogan" title="在旅途中相遇">在旅途中相遇</h2>

            <div class="loginInfo">
                <ul class="not_login">
                    <li style="float:right"><a href="${ctx}/login/register" class="btn_reg">注册</a></li>
                    <li style="float:right"><a href="${ctx}/login/login" id="top-nav-login" class="btn_login">登录</a>
                    </li>
                </ul>
            </div>
        </div>

        <ul class="dropdown">
            <li>
                <a href="${ctx}/user/index">首页</a>
            </li>
            <li>
                <a href="${ctx}/mem/memory">旅游记忆</a>
            </li>
            <li>
                <a href="${ctx}/traveller/traveller">结伴游</a>
            </li>
            <li>
                <a href="${ctx}/strategy/strategy">景点攻略</a>
            </li>
        </ul>

        <div class="navSearch">
            <form action="${ctx}/mem/memory_search" method="get" id="searchForm" target="_blank">
                <input name="k" type="text" class="top-search-input" id="searchKey" value="搜索旅游记忆" maxlength="50"
                       autocomplete="off"/>
                <input name="" type="submit" value="搜索" class="search_btn">
            </form>
            <div id="keyword_tip_content"></div>
        </div>
    </div>
</div>
<!--top end-->

<div id="container" class="noXtips cf">
    <div class="main">
        <h2>欢迎注册驴友网</h2>
        <form id="form100" action="${ctx}/login/register" method="post" class="reg-form">
            <p><label for="username"><em>*</em>用户名：</label>
                <input name="userName" type="text" class="input-txt" id="username" autocomplete="off" size="43"/>
            </p>
            <p><label for="password"><em>*</em>密码：</label>
                <input name="userPass" type="password" class="input-txt" id="password" autocomplete="off" size="43"/>
            </p>
            <p><label for="password"><em>*</em>确认密码：</label>
                <input name="repassword" type="password" class="input-txt" id="repassword" autocomplete="off"
                       size="43"/>
            </p>
            <p><label for="email"><em>*</em>邮箱：</label>
                <input name="email" type="text" class="input-txt" id="email" size="43">
            </p>
            <%--<p class="checkcode"><label for="checkcode"><em>*</em>验证码：</label>--%>
            <%--<input name="checkcode" type="text" class="input-txt" id="checkcode" autocomplete="off" ><img height="26" align="absmiddle" width="105"  onclick="this.src=this.src+'?'" title="看不清？点击更换"  src="" id="checkcodeimg" ><span  onclick="changeCheckCodeImg();" class="refresh">换一换</span>--%>
            <%--</p>--%>
            <p class="chcek-rule"><label for="agree"><em>*</em></label><input name="agree" type="checkbox" id="agree" value="1"/>
                <span class="fl">我同意</span><a href="#" target="_blank">《驴友网服务公约》</a>
            </p>
            <a class="regbtn" id="submit" href="javascript:void(0);" hidefocus="true">立即注册</a>
        </form>

        <script>
            $("#username").blur(function () {
                var $username = $("#username").val();
                if ($username != "") {
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/login/checkUserName",
                        data: {data: $username},
                        datatype: "jason",
                        success: function (data) {
                            if (data.success) {
                                var msn = data.msg;
                                console.log(msn);
                                alert(msn);

                            }
                            if (!data.success) {
                                var msn = data.msg;
                                console.log(msn);
                                alert(msn);
                                $("#username").val("").focus();

                            }
                        }
                    });
                }
            });
            $("#email").change(function () {
                var $email = $("#email").val();
                if ($email != "") {
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/login/checkEmail",
                        data: {data: $email},
                        datatype: "jason",
                        success: function (data) {
                            if (data.success) {
                                var msn = data.msg;
                                console.log(msn);
                                alert(msn);
                            }
                            if(!data.success){
                                var msn = data.msg;
                                console.log(msn);
                                alert(msn);
                                $("#email").val("").focus();
                            }
                        }
                    });
                }
            });
            //            $("#password").change(function () {
            //                $("#password").attr("")
            //                var $password=$("#password").val();
            //                if($password.length==0){
            //                    alert("密码不能为空");
            //                }
            //            });
            //            $("#repassword").change(function () {
            //                var $repassword=$("#repassword").val();
            //                var $password=$("#password").val();
            //                if($password=!$repassword){
            //                    alert("两次密码不一致");
            //                }
            //                if($repassword==null||$repassword==""){
            //                    alert("确认密码不能为空");
            //                }
            //            });
            //            $("#email").change(function () {
            //                var $email=$("#email").val();
            //                if($email==null||$email==""){
            //                    alert("邮箱不能为空");
            //                }
            //            });
            $().ready(function () {
// 在键盘按下并释放及提交后验证提交表单
                $("#form100").validate({
                    rules: {
                        username: "required",
                        password: "required",
                        repassword: {
                            required: true,
                            equalTo: "#password"
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        agree: "required"
                    },
                    messages: {
                        username: "请输入用户名",
                        password: "请输入密码",
                        repassword: {
                            required: "请输入确认密码",
                            equalTo: "两次密码输入不一致"
                        },
                        email: "请输入一个正确的邮箱",
                        agree: "请接受我们的声明"
                    }
                });
            });
            $("#submit").click(function () {
                var $username = $("#username").val();
                var $password = $("#password").val();
                var $repassword = $("#repassword").val();
                var $email = $("#email").val();
                var $agree = $("#agree:checked").val();
                console.log($agree);
                if ($username != "" && $password != "" && $email != "" && $repassword != "" && $repassword == $password) {
                    if ($agree!=1) {
                        alert("请接受协议");
                        return;
                    }
                    alert('确认注册');
                    $("#form100")[0].submit();
                } else {
                    alert('请输出完整数据');
                }
            });
        </script>

        <div class="reg-notes">
            <p>如果你已注册，请直接登录</p>
            <a href="${ctx}/login/login" class="reg-login">登录</a>
            <dl class="login-option">
                <dt>你也可以用以下方式登录</dt>
                <dd class="sina-ico"><a href="#">新浪微博</a></dd>
                <dd><a href="#">腾讯微博</a></dd>
            </dl>
        </div>
    </div>
</div>

<div class="footer ">
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
