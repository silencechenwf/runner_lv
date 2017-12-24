<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="false" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<!DOCTYPE HTML>
<html  lang="zh">
<head >
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="css/boxy,jquery.fancybox-1.3.4.css">
    <title>旅游记忆 | 驴友网</title>
    <meta name="Keywords" content="旅游社交，在旅途中享受激情与欢乐" />
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐" />

    <link rel="stylesheet"  href="css/search.css" />
    <script type="text/javascript">
        var userjson = '';
        var c_cityinfo = '';
    </script>
    <script type="text/javascript" src="js/jquery-1.4.4.min,LAB.min.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        $("#first").click(function () {
            alert("哈哈");
            location.href="${ctx}/mem/memory_search/1/${pageSize}?k=${k}"
        })
        $("#last").click(function () {
            alert("哈哈");
            location.href="${ctx}/mem/memory_search/${totalPage}/${pageSize}?k=${k}"
        })
        $("#before").click(function () {
            alert("哈哈");
            if('${pageNum}'>'1'){
                location.href="${ctx}/mem/memory_search/${pageNum-1}/${pageSize}?k=${k}"
            }
            location.href="${ctx}/mem/memory_search/1/${pageSize}?k=${k}"
        })
        $("#next").click(function () {
            alert("哈哈");
            if(${pageNum}<${totalPage}){
                location.href="${ctx}/mem/memory_search/${pageNum+1}/${pageSize}?k=${k}"
            }
            location.href="${ctx}/mem/memory_search/${totalPage}/${pageSize}?k=${k}"
        })
        $("#jump").click(function () {
            var pageNum=$("#jumpNum").val();
            if(pageNum>${totalPage}){
                location.href="${ctx}/mem/memory_search/${totalPage}/${pageSize}?k=${k}"
            }else if(pageNum<'1'){
                alert("哈哈");
                location.href="${ctx}/mem/memory_search/1/${pageSize}?k=${k}"
            }else{
                alert("哈哈");
                location.href="${ctx}/mem/memory_search/"+pageNum+"/${pageSize}?k=${k}"
            }
        })
    })
</script>
<body id="searchG">
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
            <form action="${ctx}/mem/memory_search/1/3" method="get" id="searchForm" target="_blank">
                <input name="k" type="text" class="top-search-input" id="searchKey" value="搜索旅游记忆" maxlength="50"
                       autocomplete="off"/>
                <input name="" type="submit" value="搜索" class="search_btn">
            </form>
            <div id="keyword_tip_content"></div>
        </div>
    </div>
</div>

<div id="container" class='noXtips'>
    <div id="mainWrapper" class="fn-clear">
        <div class="main">
            <div class="searchResult">
                <h2>搜索到相关旅游记忆 ${requestScope.memoryCount}条</h2>
                <ul id="feed_list" maxbid="" class="feed_list " >
                    <c:forEach items="${requestScope.memoryList}" var="memoryList">
                        <li class="cf" bid="367492">
                            <div class="head_pic-warp">
                                <a href="${ctx}/mem/memory_detail?memoryId=${memoryList.memoryId}"><img src="${photoPath}/${memoryList.photo}" width="81" height="80"></a>
                            </div>
                            <div class="feed_content">
                                <p class="feed-head">
                                    <a href="${ctx}/mem/memory_detail?memoryId=${memoryList.memoryId}">${memoryList.title}</a>
                                </p><br />
                                <div class="feed_from">
                                    <div class="fl">
                                        <cite><a href="#">类别：${memoryList.type}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="#">发布者：${memoryList.userName}</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="#">发布时间：${memoryList.time}</a>
                                        </cite>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <!--记忆列表结束-->
                <!--分页-->
                <div class="no-pages">
                    <button id="first">首页</button>
                    <button id="before">上一页</button>
                    <button id="next">下一页</button>
                    <button id="last">尾页</button>
                    <form>
                        <input type="text" style="width: 30px" id="jumpNum" name="jumpNum">页
                        <input type="button" id="jump" value="跳转">
                    </form>
                </div>
                <!--分页-->
                <!--记忆搜索结果end-->
            </div>
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
</div>
</body>
</html>

