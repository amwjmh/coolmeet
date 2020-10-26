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
                会议预定 > 查看会议室
            </div>

            <table class="listtable" cellpadding="0" cellspacing="0">
                <caption>所有会议室:</caption>

                <thead>
                    <tr class="listheader">
                        <th>门牌编号</th>
                        <th>会议室名称</th>
                        <th>容纳人数</th>
                        <th>当前状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="meetingroom" items="${meetingrooms}">
                    <tr>
                        <td>${meetingroom.roomnum}</td>
                        <td>${meetingroom.roomname}</td>
                        <td>${meetingroom.capacity}</td>
                        <c:if test="${meetingroom.status == 0}">
                        <td>已占用</td>
                        </c:if>
                        <c:if test="${meetingroom.status == 1}">
                            <td>启用</td>
                        </c:if>
                        <td>
                            <a class="clickbutton" href="${pageContext.request.contextPath}/conferenceromm/roomdetails?roomid=${meetingroom.roomid}">修改</a>
                            <a class="clickbutton" href="${pageContext.request.contextPath}/conferenceromm/deletemeetingroom?roomid=${meetingroom.roomid}">删除</a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>