<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
    <meta charset="utf-8">
    <title>用户 | 驴友网</title>
    <meta name="Keywords" content="驴友网" />
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
    <link rel="stylesheet" type="text/css" href="css/global.css"  />
    <link rel="stylesheet" type="text/css" href="css/reg.css"  />
    <link rel="stylesheet"  href="css/boxy,jquery.fancybox-1.3.4.css" />
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
            <c:if test="${empty sessionScope.register}">
                <div class="loginInfo">
                    <ul class="not_login">
                        <li style="float:right"><a href="${ctx}/login/register" class="btn_reg">注册</a></li>
                        <li style="float:right"><a href="${ctx}/login/login" id="top-nav-login" class="btn_login">登录</a>
                        </li>
                    </ul>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.register}">
                <div class="loginInfo">
                    <ul class="login">
                        <li style="float:right"><a href="${ctx}/user/logout">注销</a></li>
                        <li style="float:right"><a href="${ctx}/notice/apply">好友申请（0）</a>&nbsp;&nbsp;&nbsp;</li>
                        <li style="float:right"><a href="${ctx}/notice/message">站内信（0）</a>&nbsp;&nbsp;&nbsp;</li>
                        <li style="float:right"><a href="${ctx}/user/acccount_detail">${sessionScope.register.userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </ul>
                </div>
            </c:if>
        </div>

        <ul class="dropdown">
            <li>
                <a href="${ctx}/user/index">首页</a>
            </li>
            <li class="current">
                <a href="${ctx}/user/user_basic">Ta基本资料</a>
            </li>
            <li>
                <a href="${ctx}/user/user_memory">Ta的旅游记忆</a>
            </li>
            <li>
                <a href="${ctx}/user/user_partner">Ta的结伴游</a>
            </li>
        </ul>

        <div class="navSearch">
            <form action="${ctx}/mem/memory_search" method="get" id="searchForm" target="_blank">
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
        <h2>基本资料</h2>
        <form id="form100" action="#" method="post" class="reg-form" >
            <p><label for="sex"><em>*</em>性别：</label>
                <c:if test="${requestScope.userInfo.sex eq 'man'}">
                    <c:set var="sex" value="男"></c:set>
                </c:if>
                <c:if test="${requestScope.userInfo.sex eq 'woman'}">
                    <c:set var="sex" value="女"></c:set>
                </c:if>
                <label id="sex">${sex}</label>
            </p>
            <p><label for="birthday"><em>*</em>生日：</label>
                <label id="birthday">${requestScope.userInfo.birthday}</label>
            </p>
            <p><label for="place"><em>*</em>所在地：</label>
                <label id="place">${requestScope.userInfo.place}</label>
            </p>
            <p><label for="qq"><em>*</em>QQ：</label>
                <label id="qq">${requestScope.userInfo.qq}</label>
            </p>
            <p><label for="phone"><em>*</em>手机：</label>
                <label id="phone">${requestScope.userInfo.phone}</label>
            </p>
            <p><label for="hobby"><em>*</em>爱好：</label>
                <label id="hobby">${requestScope.userInfo.hobby}</label>
            </p>
            <p><label for="introduction"><em>*</em>个人简介：</label>
                <label id="introduction">${requestScope.userInfo.introduction}</label>
            </p>
        </form>

        <%--<div class="reg-notes">
            <dl class="login-option">
                <dt>用户：${requestScope.userInfo.userName}</dt>
                <dd ><img src="images/duface.jpg" width="100" height="100" /></dd>
            </dl>
            <dl class="login-option">
                <dt>&nbsp;</dt>
                <dd>&nbsp;</dd>
                <a href="#" class="reg-login">加为好友</a>
            </dl>
        </div>--%>

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
