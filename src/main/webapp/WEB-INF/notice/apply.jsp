<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>好友申请 | 驴友网</title>
    <meta name="Keywords" content="驴友网" />
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />
    <link rel="shortcut icon" href="favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="css/boxy,jquery.fancybox-1.3.4.css">
    <link rel="stylesheet" type="text/css" href="css/huidong.css">
    <script type="text/javascript">
        var userjson = '';
        var c_cityinfo = '';
    </script>
</head>

<body>
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="${ctx}/user/index" title="驴友网" style="float: left;">驴友网</a>
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
    <div class="mainWrap wide-wrap fn-clear">
        <div class="main">
            <!--comments-->
            <div id="comment" class="comment cnt-box fn-clear">
                <h2>好友申请</h2>
                <ul id="comment-list" class="comment-list">
                    <c:forEach var="fri" items="${requestScope.listFriend}">
                    <li class="fn-clear">
                        <div class="comment_headPic fn-left">
                            <a href="${ctx}/user/user_basic?userName=${fri.friend}"><img width="75" height="75" alt="${fri.friend}" src="images/default.jpg"> </a>
                        </div>
                        <div class="comment_info fn-right">
                            <p>
                                <a class="comment_user" href="${ctx}/user/user_basic?userName=${fri.friend}"> ${fri.friend}</a>03月15日 23:54
                                <label style="float:right"><a class="comment_user" href="${ctx}/notice/agree?userName=${fri.userName}&friend=${fri.friend}">同意</a><a class="comment_user" href="${ctx}/notice/deny?userName=${fri.userName}&friend=${fri.friend}">拒绝</a></label>
                            </p>
                            <div class="comment_box">
                                <div class="SA">
                                    <em>◆</em><span>◆</span>
                                </div>
                                <div class="comment_cnt">请求加您为好友。</a>

                                </div>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>

                <!--分页-->
                <div class="no-pages cf">
                    <strong>1</strong> <a href="?page=2&#comment">2</a>  <a href="?page=3&#comment">3</a> <a href="?page=4&#comment">4</a><a href="?page=2&#comment" class="pageBtn">下一页 &gt;&gt;</a>
                </div>

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
