<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>CoolMeeting会议管理系统</title>
    <%@include file="/WEB-INF/ico.jsp"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>

<script>
    $(document).ready(function(){
        $(".verification").click(
            function () {
                $(".verification").attr("src","${pageContext.request.contextPath}/employee/captcha");
                $.ajax({
                    url: "${pageContext.request.contextPath}/employee/captcha",
                    type: "POST",
                    dataType: 'text',
                    success: function(data, statusText, xmlHttpRequest){

                        console.log(data);

                        $(".verification").attr("src","${pageContext.request.contextPath}/employee/captcha");
                        //此处刷新图片src
                    },
                    error: function(xmlHttpRequest, statusText, errorThrown){
                        //
                    }
                });
            }
        );
    });
    function test(form) {
        if(form.username.value == '' || form.password.value == '' ){
            alert("请输入账户和密码！");

            return false;
        }

        if(form.verCode.value == ''){
            alert("请输入验证吗！");
            return false;
        }
        return true;
    }
</script>
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
        <form action="${pageContext.request.contextPath}/employee/login" method="post" onsubmit="return test(this);">
            <input id="accountname" placeholder="账号名:" type="text" name="username"/>
            </br>
            <input id="new" placeholder="密码:" type="password" name="password" />

            <input id="code" placeholder="验证码:" type="text" name="verCode" />

            <img class="verification" src="${pageContext.request.contextPath}/employee/captcha" width="100px" height="45px" />

            <div class="command">
                <input type="submit" value="登录" />

                <input type="button" value="返回"  onclick="window.history.back();"/>
            </div>
        </form>
        <div class="error" id="caveat">${tips}${warning}${vercode}</div>
    </div>
</div>

</body>
</html>
