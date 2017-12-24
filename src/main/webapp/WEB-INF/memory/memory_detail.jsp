<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="false" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>旅游记忆 | 驴友网</title>
    <meta name="keywords" content="旅游社交，在旅途中享受激情与欢乐" />
    <meta name="description" content="旅游社交，在旅途中享受激情与欢乐"/>
    <link rel="shortcut icon" href="../favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="css/boxy,jquery.fancybox-1.3.4.css">
    <link rel="stylesheet" type="text/css" href="css/huidong.css">
    <script type="text/javascript" src="js/jquery-1.4.4.min,LAB.min.js"></script>
    <%--<script type="text/javascript">--%>
        <%--var userjson = '';--%>
        <%--var c_cityinfo = '';--%>
    <%--</script>--%>
</head>
<script type="text/javascript">
    $(function () {
        $("#talk").click(function (){
            var memoryId=$("#memoryId").val();
            var commented=$("#commented").val();
            var content=$("#content").val();
            $.post('${ctx}/comment/addComment',
            {   memoryId:memoryId,
                commented:commented,
                content:content
            },
             function (data) {
                 if(data.success==false){
                     alert(data.msg);
                 }
                 if (data.success) {
                     alert("评论成功!");
                 }
                 $('#comment-list').empty();
                 for (var i in data.result) {
                     var html = '<li class="fn-clear">';
                     html += '<div class="comment_headPic fn-left">';
                     html += '<a href="#"><img width="75" height="75" alt="i闲逛" src="images/default.jpg"></a>';
                     html += '</div>';
                     html += '<div class="comment_info fn-right">';
                     html += '<p>';
                     html += '<a class="comment_user" href="#">'+data.result[i].commentator+'</a>'+data.result[i].time;
                     html += '</p>';
                     html += '<div class="comment_box">';
                     html += '<div class="SA">';
                     html += '<em>◆</em><span>◆</span>';
                     html += '</div>';
                     html += '<div class="comment_cnt">'+data.result[i].content;
                     html += '</div>';
                     html += '</div>';
                     html += '</div>';
                     html += '</li>';
                     $('#comment-list').prepend(html);
                 }
        })
       })
    })
</script>
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

<div id="container">
    <div class="ui-box fn-clear">
        <p><img src="${photoPath}/${requestScope.memory.photo}"  style="height:200px; width:300px; float:left; padding-right:5px;">
            <input type="hidden" id="memoryId" name="memoryId" value="${requestScope.memory.memoryId}">
            <input type="hidden" id="commented" name="commented" value="${requestScope.memory.userName}">
            &nbsp;&nbsp;&nbsp;&nbsp;标题：${requestScope.memory.title}<br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;类别：${requestScope.memory.type}&nbsp;&nbsp;&nbsp;&nbsp;发布者：${requestScope.memory.userName}&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${requestScope.memory.time}<br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;内容：${requestScope.memory.content}</p>
    </div>

    <div class="ui-box fn-clear">
        <div id="comment" class="comment cnt-box fn-clear">
            <h2>发表评论</h2>
            <div class="comment_headPic fn-left">
                <a href="#"><img width="75" height="75" alt="i闲逛" src="images/default.jpg">	</a>
            </div>
            <div class="comment_info fn-right">
                <div class="cont fn-clear">
                    <textarea class="talkBox" name="content" id="content" style="float:left"></textarea>
                    <input type="submit" class="sendBtn" value="评论" id="talk">
                </div>
            </div>
        </div>
    </div>

    <div class="mainWrap wide-wrap fn-clear">
        <div class="main">
            <!--comments-->
            <div id="comment" class="comment cnt-box fn-clear">
                <h2>所有评论</h2>

                <ul id="comment-list" class="comment-list">
                    <c:forEach var="commentList" items="${requestScope.commentList}">
                    <li class="fn-clear">
                        <div class="comment_headPic fn-left">
                            <a href="#"><img width="75" height="75" alt="i闲逛" src="images/default.jpg"> </a>
                        </div>
                        <div class="comment_info fn-right">
                            <p>
                                <a class="comment_user" href="#">${commentList.commentator}</a>${commentList.time}
                            </p>
                            <div class="comment_box">
                                <div class="SA">
                                    <em>◆</em><span>◆</span>
                                </div>
                                <div class="comment_cnt">
                                   ${commentList.content}
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
