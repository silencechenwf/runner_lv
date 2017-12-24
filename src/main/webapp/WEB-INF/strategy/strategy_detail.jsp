<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/31
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/common.jsp" %>
<!DOCTYPE HTML>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>景点攻略 | 驴友网</title>
    <meta name="Keywords" content=""/>
    <meta name="Description" content=""/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
    <link rel="stylesheet" href="${ctx}/static/css/global.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/css/boxy,jquery.fancybox-1.3.4.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/cityguide.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/youhui.css" media="all">
    <script type="text/javascript">
        function needLogin() {
            if(${empty sessionScope.register}){
                alert("请先登录");
            }
        }
    </script>
</head>

<body id="profile-homepage">
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="index.htm" title="驴友网" style="float: left;">驴友网</a>
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
            <li>
                <a href="${ctx}/mem/memory">旅游记忆</a>
            </li>
            <li>
                <a href="${ctx}/traveller/traveller">结伴游</a>
            </li>
            <li class="current">
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
    <div id="mainWrapper" class="cf">

        <div class="sceneInfo">
            <div class="sceneView fn-clear ">
                <div class="scenePic">
                    <ul id="slider" class="slider">
                        <li>
                            <a href="#"><img src="${ctx}/static/images/intro_201301102119_-1.jpg" width="530"
                                             height="325" alt="观澜版画村 画中有话" title="观澜版画村 画中有话"></a>
                            <div class="alpha-txt txt-info">
                                <h2>观澜版画村 画中有话</h2>
                                <p>久负盛名客家小村，都市繁华深处的一块净土，深圳最美丽的乡村。</p>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="sceneIntro">
                    <div class="sceneIntro-head">
                        <h2 class="fn-left">城市印象</h2>
                        <div class="scene_share">
                            <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
                                <span class="bds_more">分享到：</span>
                                <a class="bds_tsina"></a>
                                <a class="bds_tqq"></a>
                                <a class="bds_kaixin001"></a>
                                <a class="bds_renren"></a>
                                <a class="bds_qzone"></a>
                            </div>
                        </div>
                    </div>

                    <p class="txt-desc-p">
                        <span class="fn-clear">深圳，四季温暖，典型的休闲旅游城市。宝安片区，是典型的岭南水乡风情；南山区绿化最好，休憩点多；福田是深圳的CBD，规划和绿化都很好，公园多；罗湖楼宇最密集、商业繁华，多常规景点。盐田有山有海有岛屿，还有东部华侨城等。</span>
                    </p>

                    <div class="scene-subcnt">
                        <ul class="guide-tag">
                            <li><a href="${ctx}/strategy/enjoy?strategyId=${requestScope.vote.strategyId}&enjoy=${requestScope.vote.enjoy}" class="wantGo" data-flag="0" id="enjoy" onclick="return needLogin()"
                                   data-lid="d03f8050ea1ccf438b874a53f5bdf478">想去</a><span id="enjoy1">${requestScope.vote.enjoy}</span></li>
                            <li class="gone"><a href="javascript:void(0);" class="aleadyGo" data-flag="0"
                                                data-lid="d03f8050ea1ccf438b874a53f5bdf478">去过</a><span>${requestScope.vote.gone}</span></li>
                            <li class="tuijian"><a href="${ctx}/user/friend" class="share-city" id="share-city"
                                                   data-cityid="291">推荐给朋友</a></li>
                        </ul>
                    </div>
                    <div class="scoreSec">
                        <a href="javascript:void(0);" onClick="javascript:return needLogin()" class="load-gonglue-btn">下载城市攻略</a>
                        <a href="javascript:void(0);" onClick="javascript:return needLogin()" class="load-map-btn">下载旅游地图</a>
                    </div>

                </div>
            </div>
            <div class="ui-box fn-clear ">
                <!-- 发帖人 -->
                <div class="tag-list menu_select cf">
                    <span class="tag-notes fn-left">景点：</span>
                    <span class="tag-cnt fn-right"><a href="#" data-lyq="0">${requestScope.strategy.title}</a></span>
                </div>
                <!--end 发帖人 -->
                <!-- 发帖人 -->
                <div class="tag-list menu_select cf">
                    <span class="tag-notes fn-left">类型：</span>
                    <span class="tag-cnt fn-right"><a href="#" data-lyq="0">${requestScope.strategy.type}</a></span>
                </div>
                <!--end 发帖人 -->

                <!-- 目的地 -->
                <div class="tag-list menu_select cf">
                    <span class="tag-notes fn-left">适宜人群：</span>
                        <span class="tag-cnt fn-right"><a href="#" class="tag-current"
                                                          data-lyq="0">${requestScope.strategy.people}</a></span>
                </div>
                <!--end 目的地 -->

                <!-- 行程安排 -->
                <div class="tag-list menu_select cf">
                    <span class="tag-notes fn-left">适宜时间：</span>
                    <span class="tag-cnt fn-right"><a href="#" data-lyq="0">${requestScope.strategy.time}</a></span>
                </div>
                <!--end 行程安排 -->

                <!-- 联系方式 -->
                <div class="tag-list menu_select cf">
                    <span class="tag-notes fn-left">必备装备：</span>
                    <span class="tag-cnt fn-right"><a href="#" class="tag-current" data-lyq="0">${requestScope.strategy.equipment}</a></span>
                </div>
                <!--end 联系方式 -->
                <!-- 联系方式 -->
                <div class="tag-list menu_select cf">
                    <span class="tag-notes fn-left">注意事项：</span>
                    <span class="tag-cnt fn-right">${requestScope.strategy.notice}</span>
                </div>
                <!--end 联系方式 -->

                <!-- 帖子详情 -->
                <div class="tag-list menu_select cf">
                    <span class="tag-notes fn-left">详情：</span>
                    <span class="tag-cnt fn-right">${requestScope.strategy.content}</span>
                </div>
                <!--end 帖子详情 -->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" id="bdshare_js" data="type=tools&amp;mini=1&amp;uid=718154"></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
    var bds_config = {
        'bdText': '我正在光临驴友网，精选的线路行程、旅游圈、专题和游记攻略，还有特色景点、住宿、美食、购物和交通服务等，可查看游玩地图，还能下载城市旅游攻略。（分享自路趣网）',
        'bdPic': 'http://www.roadqu.com/images/intro_201301102119_-1.jpg'
    };
    document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>

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
