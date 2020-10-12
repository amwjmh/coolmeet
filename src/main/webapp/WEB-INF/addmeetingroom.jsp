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
                <form method="post" action="${pageContext.request.contextPath}/admin/increaseConferenceRoom"  name="form" onsubmit="return text(this);">
                    <fieldset>
                        <legend>会议室信息</legend>
                        <table class="formtable">
                            <tr>
                                <td>门牌号:</td>
                                <td>
                                    <input id="roomnum" type="text" placeholder="例如：201" maxlength="10" name="roomnum"/>
                                    <span id="warningone"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>会议室名称:</td>
                                <td>
                                    <input id="roomname" type="text" placeholder="例如：第一会议室" maxlength="20" name="roomname"/>
                                    <span id="warningtwo"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>最多容纳人数：</td>
                                <td>
                                    <input id="capacity" type="text" placeholder="填写一个正整数" name="capacity"/>

                                </td>
                            </tr>
                            <tr>
                                <td>当前状态：</td>
                                <td>
                                    <input type="radio" id="status" name="status" checked="checked" value="1"/><label for="status">启用</label>
                                    <input type="radio"  name="status"/><label for="status" value="0">停用</label>
                                    <input type="radio"  name="status"/><label for="status" value="-1">删除</label>
                                </td>
                            </tr>
                            <tr>
                                <td>备注：</td>
                                <td>
                                    <textarea id="description" maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述" name="description"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="command">
                                    <input type="submit" value="添加" class="clickbutton"/>
                                    <input type="reset" value="重置" class="clickbutton"/>
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