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

    </head>
    <body>
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
        <div class="page-content">
            <div class="content-nav">
                会议预定 >  会议信息
            </div>

            <table class="listtable" cellpadding="0" cellspacing="0">
                <caption>参与员工:</caption>
                <thead>
                <tr class="listheader">
                    <th>姓名</th>
                    <th>联系电话</th>
                    <th>电子邮件</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${participat}" var="item">
                    <tr>
                        <td>${item.employeename}</td>
                        <td>${item.phone}</td>
                        <td>${item.email}</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="signupButt">
                <input type="button" class="click" value="返回" onclick="window.history.back();"/>
            </div>
        </div>
    </div>

        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>