<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>CoolMeeting会议管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
</head>
<body>
<div class="page-header">
    <div class="header-banner">
        <img src="${pageContext.request.contextPath}/images/header.png" alt="CoolMeeting"/>
    </div>
    <div class="header-title">
        <h1>欢迎访问Cool-Meeting会议管理系统</h1>
    </div>
</div>

<div id="lonig" class="fieldset">
    <div class="formtable">
        <form action="${pageContext.request.contextPath}/employee/login" method="post">
            <input id="accountname" placeholder="账号名:" type="text" name="username"/>
            </br>
            <input id="new" placeholder="密码:" type="password" name="password" />

            <div class="command">
                <input type="submit" value="登录" />

                <input type="button" value="返回"  onclick="window.history.back();"/>
            </div>
        </form>
        <div style="color: red;size: A4" id="caveat">${tips}${warning}</div>
    </div>
</div>

</body>
</html>
