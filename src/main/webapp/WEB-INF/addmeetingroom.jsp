<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <%@include file="/WEB-INF/ico.jsp"%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tail.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css"/>
        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    </head>
    <body>
    <script>
        function text(form) {
            if (form.roomnum.value==''){
                $("#warningone").text("请输入门牌号！");
                form.roomnum.focus();
                return false;
            }
            if (form.roomname.value==''){
                $("#warningtwo").text("请输入会议室名！");
                form.roomname.focus();
                return false;
            }
            return true;
        }
    </script>
        <%--头部--%>
        <%@include file="top.jsp"%>
        <%--左边菜单栏--%>
        <%@include file="leftmenubar.jsp"%>
            <div class="page-content">

                    <div class="content-nav">
                        会议预定 > 添加会议室
                    </div>
                    <form method="post" action="${pageContext.request.contextPath}/Increase/increaseConferenceRoom"  name="form" onsubmit="return text(this);">

                        <div class="fieldContainer">
                            <div class="formRow">
                                <div class="label">
                                    <label for="roomnum">门牌号:</label>
                                </div>
                                <div class="field">
                                    <input id="roomnum" type="text" required="required" placeholder="例如：201" maxlength="10" name="roomnum"/>
                                </div>
                            </div>

                            <div class="formRow">
                                <div class="label">
                                    <label for="roomname">会议室名称:</label>
                                </div>
                                <div class="field">
                                    <input id="roomname" type="text" required="required" placeholder="例如：第一会议室" maxlength="20" name="roomname"/>
                                </div>
                            </div>

                            <div class="formRow">
                                <div class="label">
                                    <label for="capacity">最多容纳人数:</label>
                                </div>
                                <div class="field">
                                    <input id="capacity" type="text" required="required" placeholder="填写一个正整数" name="capacity"/>
                                </div>
                            </div>

                            <div class="formRow">
                                <div class="label">
                                    <label for="status">当前状态:</label>
                                </div>
                                <div class="field">
                                    <input type="radio" id="status" name="status" checked="checked" value="1"/><label for="status">启用</label>
                                    <input type="radio"  name="status" value="0"/><label for="status" >停用</label>
                                </div>
                            </div>

                            <div class="formRow">
                                <div class="label">
                                    <label for="description">备注:</label>
                                </div>
                                <div class="field">
                                    <textarea id="description" maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述" name="description"></textarea>
                                </div>
                            </div>

                            <div class="signupButton">
                                <input type="submit" value="添加" class="clickbutton"/>
                                <input type="reset" value="重置" class="clickbutton"/>
                            </div>
                        </div>
                    </form>
                </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>