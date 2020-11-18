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
        <style type="text/css">
            
        </style>
    </head>
    <body>
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>

        <div class="page-content">
            <div class="content-nav">
                人员管理 > 注册审批
            </div>
            <table class="listtable">
                <caption>所有待审批注册信息：</caption>
                <thead>
                <tr class="listheader">
                    <th>姓名</th>
                    <th>账号名</th>
                    <th>联系电话</th>
                    <th>电子邮件</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="emp" items="${emps}">
                    <tr>
                        <td>${emp.employeename}</td>
                        <td>${emp.username}</td>
                        <td>${emp.phone}</td>
                        <td>${emp.email}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/admin/adopt" method="post">
                                <input type="hidden" name="employeeid" value="${emp.employeeid}" />
                                <input type="submit" class="clickbutton" value="通过"/>
                                <a class="clickbutton" href="${pageContext.request.contextPath}/admin/failed?employeeid=${emp.employeeid}">删除</a>
                            </form>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>