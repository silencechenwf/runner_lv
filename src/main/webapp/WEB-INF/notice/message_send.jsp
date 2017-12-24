<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
    <meta charset="utf-8">
    <title>站内信 | 驴友网</title>
    <meta name="Keywords" content="驴友网" />
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
    <link rel="stylesheet" type="text/css" href="css/global.css"  />
    <link rel="stylesheet" type="text/css" href="css/reg.css"  />
    <link rel="stylesheet"  href="css/boxy,jquery.fancybox-1.3.4.css" />
    <script src="js/jquery-1.4.4.min,LAB.min.js"></script>
    <script type="text/javascript">

        var userjson = '';
        var c_cityinfo = '';
    </script>
</head>

<body id="reg" >
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="${ctx}/user/index" title="驴友网" style="float: left;">驴友网</a>
            </h1>
            <h2 class="slogan" title="在旅途中相遇">在旅途中相遇</h2>

            <div class="loginInfo">
                <ul class="not_login">
                    <!-- 未登录
                        <li style="float:right"><a href="../login/register.htm" class="btn_reg">注册</a></li>
                        <li  style="float:right"><a href="../login/login.htm"  id="top-nav-login" class="btn_login">登录</a></li>
                    -->
                    <li style="float:right"><a href="${ctx}/user/logout">注销</a></li>
                    <li style="float:right"><a href="${ctx}/notice/apply">好友申请（0）</a>&nbsp;&nbsp;&nbsp;</li>
                    <li style="float:right"><a href="${ctx}/notice/message">站内信（0）</a>&nbsp;&nbsp;&nbsp;</li>
                    <li style="float:right"><a href="javascript:void(0);">${sessionScope.register.userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </li>
                </ul>
            </div>
        </div>
        <ul class="dropdown">
            <li class="current">
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

<div id="container"  class="noXtips cf">
    <div  class="main">
        <h2>发送站内信</h2>
        <form id="form100" action="" method="post" class="reg-form" >
            <p><label for="title"><em>*</em>标题：</label>
                <input name="title" type="text"  class="input-txt" id="title" autocomplete="off" size="43" />
            </p>
            <p><label for="receiver"><em>*</em>收件人：</label>
                <input name="receiver" type="text"  class="input-txt" id="receiver" autocomplete="off" size="43" />
            </p>
            <p><label for="content"><em>*</em>内容：</label>
                <textarea rows="5" cols="60" id="content"  size="43" ></textarea>
            </p><p></p>
            <a href="javascript:void(0);" class="reg-login" id="send">发送</a>
        </form>
    </div>
</div>
<script>
    $("#send").click(function () {
        var $title=$("#title").val();
        var $receiver=$("#receiver").val();
        var $content=$("#content").val();
        $.ajax({
            type:'POST',
            url:'${ctx}/notice/message_send',
            data:{"title":$title,
                  "receiver":$receiver,
                  "content":$content},
            datatype:'jason',
            success:function (data) {
                if(data.success){
                    alert(data.msg);
                }
            }

        })
    });

</script>
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
