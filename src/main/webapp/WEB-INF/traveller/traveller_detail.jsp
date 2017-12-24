<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <title>结伴游 | 驴友网</title>
    <meta charset="utf-8">
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
    <link rel="shortcut icon"  href="favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="css/boxy,jquery.fancybox-1.3.4.css">
    <link rel="stylesheet" type="text/css" href="css/youhui.css" media="all">
    <script type="text/javascript">
        var userjson = '';
        var c_cityinfo = '';
    </script>
</head>

<body>
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
                    <!-- 未登录
                        <li style="float:right"><a href="../login/register.htm" class="btn_reg">注册</a></li>
                        <li  style="float:right"><a href="../login/login.htm"  id="top-nav-login" class="btn_login">登录</a></li>
                    -->
                    <li style="float:right"><a href="${ctx}/user/logout">注销</a></li>
                    <li style="float:right"><a href="${ctx}/user/apply">好友申请（0）</a>&nbsp;&nbsp;&nbsp;</li>
                    <li style="float:right"><a href="${ctx}/user/message">站内信（0）</a>&nbsp;&nbsp;&nbsp;</li>
                    <li style="float:right"><a href="javascript:void(0);">${sessionScope.register.userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </li>
                </ul>
            </div>
        </div>
        <ul class="dropdown">
            <li class="current">
                <a href="${ctx}/user/index">首页</a>
            </li>
            <li class="current">
                <a href="${ctx}/mem/memory">旅游记忆</a>
            </li>
            <li class="current">
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

<!--main body-->
<div id="container">

    <div class="ui-box fn-clear ">
        <div class="city-guide">
            <div class="fn-left">
                <a href="javascript:void(0);">【${requestScope.traveller.startTime}-${requestScope.traveller.returnTime}】${requestScope.traveller.place}行</a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发帖时间：${requestScope.traveller.time}
            </div>
        </div>

        <!-- 发帖人 -->
        <div class="tag-list menu_select cf">
            <span class="tag-notes fn-left">发帖人：</span>
            <span class="tag-cnt fn-right" id="lyq"><a title="${requestScope.traveller.userName}" href="javascript:void(0);" data-lyq="0">${requestScope.traveller.userName}</a></span>
        </div>
        <!--end 发帖人 -->

        <!-- 目的地 -->
        <div class="tag-list menu_select cf">
            <span class="tag-notes fn-left">目的地：</span>
            <span class="tag-cnt fn-right" id="lyq"><a title="${requestScope.traveller.place}" href="javascript:void(0);" class="tag-current" data-lyq="0">${requestScope.traveller.place}</a></span>
        </div>
        <!--end 目的地 -->

        <!-- 行程安排 -->
        <div class="tag-list menu_select cf">
            <span class="tag-notes fn-left">行程安排：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="javascript:void(0);" data-lyq="0">${requestScope.traveller.startTime}</a> <a href="javascript:void(0);">至</a> <a href="javascript:void(0);" data-lyq="0">${requestScope.traveller.returnTime}</a></span>
        </div>
        <!--end 行程安排 -->

        <!-- 联系方式 -->
        <div class="tag-list menu_select cf">
            <span class="tag-notes fn-left">联系方式：</span>
            <span class="tag-cnt fn-right" id="lyq"><a href="javascript:void(0);" class="tag-current" data-lyq="0">${requestScope.traveller.contact}</a></span>
        </div>
        <!--end 联系方式 -->

        <!-- 帖子详情 -->
        <div class="tag-list menu_select cf">
            <span class="tag-notes fn-left">详情：</span>
            <span class="tag-cnt fn-right" id="lyq">${requestScope.traveller.content}</span>
        </div>
        <!--end 帖子详情 -->
    </div>


</div>
</div>

<!--main body end-->

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
            <p><span>版权所有软件group05组
			<a href="#" >陈伟峰</a><a href="#" > 张梦</a><a href="#" >邢飞</a><a href="#" >李志龙</a>
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
