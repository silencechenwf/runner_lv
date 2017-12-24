<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/1
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <title>登录测试</title>
</head>
<body>
<form action="/traveller/inputLogin" method="post">
    用户名：<input type="text" name="userName">
    密码：<input type="password" name="password" >
    <input type="submit" value="登录" >
</form>
</body>
</html>
