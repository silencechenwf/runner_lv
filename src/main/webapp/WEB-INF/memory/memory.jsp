<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="false" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <title>旅游记忆 | 驴友网</title>
    <meta name="Keywords" content="驴友网"/>
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐"/>
    <meta name="baidu-site-verification" content="fGdITGCHHMB5crjs" />
    <link rel="shortcut icon" href="favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <link rel="stylesheet" href="css/global.css" media="all"/>
    <link rel="stylesheet" href="css/boxy,jquery.fancybox-1.3.4.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css" media="all">
    <script type="text/javascript">
        var userjson = '';
        var c_cityinfo = '';
    </script>
    <!-- 合并jquery and $LAB -->

</head>

<body>
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="${ctx}/user/index" title="驴友网" style="float: left;">驴友网</a>
            </h1>
            <h2 class="slogan" title="在旅途中相遇">在旅途中相遇</h2>

            <div class="loginInfo">
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
        </div>
        <ul class="dropdown">
            <li>
                <a href="${ctx}/user/index">首页</a>
            </li>
            <li class="current">
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
            <form action="${ctx}/mem/memory_search/1/3" method="get" id="searchForm" target="_blank">
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
    <!--展示旅游记忆-->
    <c:forEach items="${requestScope.memoryMap}" var="memoryMap">
    <div class="ui-box fn-clear">
     <!--遍历旅游类别-->
        <div class="ui-title">
            <h2 class="ui-title-cnt fn-left"><em>${memoryMap.key}</em></h2>
            <div class="ui-title-subcnt fn-right"><a target="_blank" href="${ctx}/mem/memory_list/1/3?type=${memoryMap.key}">+更多</a></div>
        </div>
        <ul class="poi_hot" id="poi_hot">
            <!--遍历该类别下的记忆-->
            <c:forEach items="${memoryMap.value}" var="memeroy">
            <li>
                <a target="_blank" title="${memeroy.title}" href="${ctx}/mem/memory_detail?memoryId=${memeroy.memoryId}">
                    <img src="${photoPath}/${memeroy.photo}" alt="${memeroy.title}" width="221" height="300">
                </a>
                <p class="alpha-txt alpha-txt-green"><a target="_blank" title="${memeroy.title}" href="javascript:void(0);">${memeroy.title}</a></p>
            </li>
            </c:forEach>
        </ul>
        </div>
    </c:forEach>
</div>
    <!--面朝大海- end-->
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
            <p><span>版权所有软件1705班
			<a href="#">李治龙</a><a href="#"> 陈伟峰</a><a href="#">张梦</a><a href="#">邢飞</a>
			</span></p>
            <div class="sns">
                <span>关注我们： </span><a href="#" class="login_sina">新浪微博 </a><a href="#" class="login_qq">腾讯微博</a>
                <a href="#" title="360绿色网站"><img src="http://trust.360.cn/img.php?sn=5229&id=5" border="0" /></a>
                <!-- WPA Button Begin -->
                <!-- WPA Button END -->
            </div>
        </div>
    </div>
</div>
<!-- footer end -->
</body>
</html>

