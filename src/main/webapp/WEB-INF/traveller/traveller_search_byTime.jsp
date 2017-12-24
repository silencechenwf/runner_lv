<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML>
<html  lang="zh">
<!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>结伴游 | 驴友网</title>
    <meta name="Keywords" content="旅游社交，在旅途中享受激情与欢乐" />
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
    <link rel="shortcut icon"  href="favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="css/boxy,jquery.fancybox-1.3.4.css">
    <link rel="stylesheet" type="text/css" href="css/journey.css" >
    <link rel="stylesheet"  href="css/search.css" />
    <script type="text/javascript">
        var userjson = '';
        var c_cityinfo = '';
    </script>
</head>

<body id="gongluo">
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

<div id="container">
    <div class="mainWrap cf">
        <div class="search-box">
            <div class="search-body">
                <ul class="search-tab">
                    <li class="select" >
                        <a href="javascript:void(0);" id="dest" >目的地</a>
                    </li>
                    <li  >
                        <a href="javascript:void(0);" id="time" >时间</a>
                    </li>
                </ul>
                <form method="post"  action="${ctx}/traveller/searchTraByTime" id="f1" class="search-form" >
                    <input type="text" id="k2" name="time"  class=" input-search" value="" autocomplete="off">
                    <input  id="submit" type="submit" class="search-btn" value="搜索">
                </form>
            </div>
        </div>

        <div class="ui-box cf">
            ${requestScope.msg}
            <div class="ui-title">
                <h2 class="ui-title-cnt fn-left"><em>最新发布</em> (3858篇帖子)</h2>
            </div>
            <ul class=" travel-log-list gonglue-list">
                <c:forEach var="trav" items="${requestScope.travel_partnerList}">
                    <li>
                        <a target="_blank" href="#" class="gonglue_img fn-left">
                            <img src="${photoPath}/${trav.photo}" alt="【${trav.startTime}-${trav.returnTime}】${trav.place}行" width="130" height="130" />
                        </a>
                        <div class="gonglue_info fn-left">
                            <h3> <a target="_blank" href="${ctx}/traveller/traveller_detail?travelPartnerId=${trav.travelPartnerId}"  title="${trav.title}">【${trav.startTime}-${trav.returnTime}】${trav.place}行</a></h3>
                            <p>&nbsp;&nbsp;目的地：${trav.place}</p>
                            <p>&nbsp;&nbsp;行程：${trav.startTime} 至 ${trav.returnTime}</p>
                            <p>&nbsp;&nbsp;发布者: <a target="_blank" href="#">${trav.userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${trav.time}</p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="ui-title-subcnt fn-right">
                <a target="_blank" href="#" >+查看更多</a>
            </div>
        </div>
    </div>
</div>

<!-- 底部footer 开始-->
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
<script type="text/javascript">
    <%--&lt;%&ndash;$(function () {&ndash;%&gt;--%>
    <%--&lt;%&ndash;$('submit').click(function () {&ndash;%&gt;--%>
    <%--&lt;%&ndash;location.href="${ctx}/traveller/traveller_search?";&ndash;%&gt;--%>
    <%--&lt;%&ndash;})&ndash;%&gt;--%>
    <%--&lt;%&ndash;})&ndash;%&gt;--%>
    <%--function searchTra(data) {--%>
    <%--location.href="${ctx}/traveller/traveller_search?data1=data";--%>
    <%--}--%>
</script>
</html>
