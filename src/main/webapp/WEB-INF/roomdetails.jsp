<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tail.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css"/>
    </head>
    <body>
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
        <div class="page-content">

            <div class="content-nav">
                会议预定 > 修改会议室
            </div>
            <form method="post" action="${pageContext.request.contextPath}/conferenceromm/updateroom"  name="form" onsubmit="return text(this);">

                <div class="fieldContainer">
                    <div class="formRow">
                        <div class="label">
                            <label for="roomnum">门牌号:</label>
                        </div>
                        <div class="field">
                            <input id="roomnum" type="text" placeholder="例如：201" maxlength="10" name="roomnum" value="${roomdetails.roomnum}"/>
                        </div>
                    </div>

                    <div class="formRow">
                        <div class="label">
                            <label for="roomname">会议室名称:</label>
                        </div>
                        <div class="field">
                            <input id="roomname" type="text" placeholder="例如：第一会议室" maxlength="20" name="roomname" value="${roomdetails.roomname}"/>
                        </div>
                    </div>

                    <div class="formRow">
                        <div class="label">
                            <label for="capacity">最多容纳人数:</label>
                        </div>
                        <div class="field">
                            <input id="capacity" type="text" placeholder="填写一个正整数" name="capacity" value="${roomdetails.capacity}"/>
                        </div>
                    </div>

                    <div class="formRow">
                        <div class="label">
                            <label for="status">当前状态:</label>
                        </div>
                        <div class="field">
                            <c:if test="${roomdetails.status == 1}">
                            <input type="radio" id="status" name="status" checked="checked" value="1"/><label for="status">启用</label>
                            <input type="radio"  name="status" value="0"/><label for="status" >停用</label>
                            <input type="radio"  name="status" value="-1"/><label for="status">删除</label>
                            </c:if>

                            <c:if test="${roomdetails.status == 0}">
                                <input type="radio" id="status" name="status" value="1"/><label for="status">启用</label>
                                <input type="radio"  name="status" value="0" checked="checked"/><label for="status" >停用</label>

                            </c:if>
                        </div>
                    </div>

                    <div class="formRow">
                        <div class="label">
                            <label for="description">备注:</label>
                        </div>
                        <div class="field">
                            <textarea id="description" maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述" name="description">${roomdetails.description}</textarea>
                        </div>
                    </div>
                </br>
                    <div class="signupButton">
                        <input type="hidden" name="roomid" value="${roomdetails.roomid}">
                        <input type="submit" value="修改" class="clickbutton"/>
                        <input type="reset" value="重置" class="clickbutton"/>
                    </div>
                </div>
            </form>
        </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>