<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tail.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css"/>
        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    </head>
    <body>
    <script>

        function test(form) {
            if(form.originpassword.value != ${judgment.password}){
                alert("原密码不正确！");
                form.originpassword.focus();
                return false;
            }
            if(form.password.value == '' && form.password.value.length<6){
                alert("密码格式不正确！");
                form.password.focus();
                return false;
            }
            if(form.password.value != form.confirm.value){
                alert("密码不一致！");
                form.confirm.focus();
                return false;
            }
            return true;
        }

    </script>
       <%@include file="top.jsp"%>
       <%@include file="leftmenubar.jsp"%>
    <div class="page-content">
        <div class="content-nav">
            修改密码
        </div>
        <form action="${pageContext.request.contextPath}/changPassword" method="post" onsubmit="return test(this);">
            <div class="fieldContainer">
                <div class="formRow">
                    <div class="label">
                        <label>原密码:</label>
                    </div>
                    <div class="field">
                        <input id="origin" type="password" name="originpassword"/>
                    </div>
                </div>

                <div class="formRow">
                    <div class="label">
                        <label>新密码:</label>
                    </div>
                    <div class="field">
                        <input type="hidden" name="employeeid" value="${judgment.employeeid}" />
                        <input id="new" type="password" name="password"/>
                    </div>
                </div>

                <div class="formRow">
                    <div class="label">
                        <label>确认新密码:</label>
                    </div>
                    <div class="field">
                        <input id="confirm" type="password" name="confirm"/>
                    </div>
                </div>
                <div class="signupButton">
                    <input type="submit" value="修改" class="clickbutton"/>
                    <input type="button" value="返回" class="clickbutton" onclick="window.history.back();"/>
                </div>
            </div>
        </form>
    </div>

    <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>