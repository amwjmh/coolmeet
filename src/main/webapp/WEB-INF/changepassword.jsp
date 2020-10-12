<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/css/common.css"/>
        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    </head>
    <body>
    <script>

        function test(form) {
            if(form.originpassword.value != ${judgment.password}){
                $("#caveat").text("原密码不正确！");
                form.originpassword.focus();
                return false;
            }
            if(form.password.value == '' && form.password.value.length<6){
                $("#caveat").text("密码格式不正确！");
                form.password.focus();
                return false;
            }
            if(form.password.value != form.confirm.value){
                $("#caveat").text("密码不一致！");
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
                    <fieldset>
                        <legend>修改密码信息</legend>
                        <table class="formtable" style="width:50%">
                            <tr>
                                <td>原密码:</td>
                                <td>
                                    <input id="origin" type="password" name="originpassword" />
                                </td>
                            </tr>
                            <tr>
                                <td>新密码:</td>
                                <td>
                                    <input type="hidden" name="employeeid" value="${judgment.employeeid}" />
                                    <input id="new" type="password" name="password"/>
                                </td>
                            </tr>
                            <tr>
                                <td>确认新密码：</td>
                                <td>
                                    <input id="confirm" type="password"/>
                                    <span id="caveat"></span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="submit" value="确认修改" class="clickbutton"/>
                                    <input type="button" value="返回" class="clickbutton" onclick="window.history.back();"/>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
        </div>
       <%@include file="tail.jsp"%>
    </body>
</html>