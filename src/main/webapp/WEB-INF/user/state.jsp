<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>个人中心 | 驴友网</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="css/boxy,jquery.fancybox-1.3.4.css">
    <link href="css/aboutus.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="css/reg.css"/>
    <link rel="stylesheet" type="text/css" href="css/huidong.css">


    <script type="text/javascript">
        var userjson = '';
        var c_cityinfo = '';
    </script>
    <script src="js/jquery-1.4.4.min,LAB.min.js"></script>
    <script>//comment_box send
    $(document).ready(


    );
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

            <div class="loginInfo">
                <ul class="not_login">
                    <!-- 未登录
                        <li style="float:right"><a href="../login/register.htm" class="btn_reg">注册</a></li>
                        <li  style="float:right"><a href="../login/login.htm"  id="top-nav-login" class="btn_login">登录</a></li>
                    -->
                    <li style="float:right"><a href="${ctx}/user/logout">注销</a></li>
                    <li style="float:right"><a href="${ctx}/notice/apply">好友申请（0）</a>&nbsp;&nbsp;&nbsp;</li>
                    <li style="float:right"><a href="${ctx}/notice/message">站内信（0）</a>&nbsp;&nbsp;&nbsp;</li>
                    <li style="float:right"><a href="${ctx}/user/acccount_detail">${sessionScope.register.userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;
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

<div id="container" class="fn-clear">
    <div class="bottom">
        <div class="bottom_t"></div>
        <div class="bottom_c h650">
            <div class="bottom_c_l">
                <div class="title01"> 动态</div>
                <div class="list01 bk">
                    <ul>
                        <li>
                            <a href="${ctx}/user/state">
                                <div class="icon_bot"><img src="images/help13.png"></div>
                                我的动态</a>
                        </li>
                        <li>
                            <a href="${ctx}/user/state_friend">
                                <div class="icon_bot"><img src="images/help13.png"></div>
                                好友动态</a>
                        </li>
                    </ul>
                </div>
                <div class="title01"> 我的记忆</div>
                <div class="list01 bk">
                    <ul>
                        <li>
                            <a href="${ctx}/user/memeroy_add">
                                <div class="icon_bot"><img src="images/help12.png"></div>
                                发布新记忆</a>
                        </li>
                        <li>
                            <a href="${ctx}/user/memeroy_list/1/4">
                                <div class="icon_bot"><img src="images/help14.png"></div>
                                全部记忆</a>
                        </li>
                    </ul>
                </div>
                <div class="title01"> 相约驴友</div>
                <div class="list01 bk">
                    <ul>
                        <li>
                            <a href="${ctx}/user/travel_add">
                                <div class="icon_bot"><img src="images/help12.png"></div>
                                发起旅游</a>
                        </li>
                        <li>
                            <a href="${ctx}/user/travel_list">
                                <div class="icon_bot"><img src="images/help13.png"></div>
                                我发起的旅游</a>
                        </li>
                    </ul>
                </div>
                <div class="title01"> 我的好友</div>
                <div class="list01 bk">
                    <ul>
                        <li>
                            <a href="${ctx}/user/friend/1/4">
                                <div class="icon_bot"><img src="images/help12.png"></div>
                                好友列表</a>
                        </li>
                    </ul>
                </div>
                <div class="title01">账号管理</div>
                <div class="list01 bk">
                    <ul>
                        <li class="un">
                            <a href="${ctx}/user/acccount_detail">
                                <div class="icon_bot"><img src="images/help12.png"></div>
                                基本信息</a>
                        </li>
                        <li>
                            <a href="${ctx}/user/img_change">
                                <div class="icon_bot"><img src="images/help13.png"></div>
                                修改头像</a>
                        </li>
                        <li>
                            <a href="${ctx}/user/password_change">
                                <div class="icon_bot"><img src="images/help14.png"></div>
                                修改密码</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="bottom_c_r">
                <h2 style="width:680px; height:40px; line-height:41px; background:#83bb4a url(../images/reg-title-bg.png) repeat-x;
						color:#fefefe; text-indent:25px; font-size:20px; font-family:\9ED1\4F53; font-weight:400;">
                    我的动态</h2>
                <ul id="comment-list" class="comment-list">
                    <li class="fn-clear">
                        <div class="cont fn-clear">
                            <form action="${ctx}/user/state_send" method="post">
                                <textarea name="content" class="talkBox" id="comment_box" style="float:left"></textarea>
                                <input type="submit" class="sendBtn" id="send" value="发表动态">
                            </form>
                        </div>
                        <div>&nbsp;</div>
                    </li>
                    <c:forEach var="dynamic" items="${requestScope.dynamicList}">
                        <li class="fn-clear">
                            <div>
                                <p>
                                    <a class="comment_user" href="javascript:void(0);">发布时间:${dynamic.time}</a>
                                    <label style="float:right">
                                        <a class="comment_user" id="${dynamic.dynamicId}" href="javascript:void(0);" onclick="delDynamic('${dynamic.dynamicId}')">删除</a>
                                    </label>
                                </p>
                                <div class="comment_box">
                                    <div class="comment_cnt">${dynamic.content}</div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <script type="text/javascript">
                    function delDynamic(data) {
                        window.location.href="${ctx}/user/deleteState?dynamicId="+data;
                        $(this).parents().remove();
                    }
                </script>
                <!--分页-->
                <%--<div class="no-pages cf">--%>
                <%--<strong>1</strong> <a href="?page=2&#comment">2</a> <a href="?page=3&#comment">3</a> <a--%>
                <%--href="?page=4&#comment">4</a><a href="?page=2&#comment" class="pageBtn">下一页 &gt;&gt;</a>--%>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>
<!-- 底部footer 开始-->

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
            <p><span>版权所有软件1001班
			<a href="#">陈文平</a><a href="#"> 胡剑彬</a><a href="#">林清华</a><a href="#">汤怡青</a><a href="#">袁泽</a><a href="#">周晓丽</a>
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