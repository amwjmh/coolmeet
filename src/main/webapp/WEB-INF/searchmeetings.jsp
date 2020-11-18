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
        <style type="text/css">
            
        </style>
    </head>
    <body>
    <script>
        <%--跳转页--%>
        $(document).ready(function(){
            $("#jump").click(function () {
                window.location.href = "${pageContext.request.contextPath}/searchmeetings/jumpsearchmeetings?currentPage="+$("#pagenum").val();
            });
        });
    </script>
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
        <div class="page-content">
            <div class="content-nav">
                会议预定 > 搜索会议
            </div>

            <form action="${pageContext.request.contextPath}/searchmeetings/jumpsearchmeetings">
                <div class="fieldContainer">
                    <div class="searchformRow">
                        <div class="label">
                            <label for="meetingname">会议名称:</label>
                        </div>
                        <div class="field">
                            <input type="text" id="meetingname" name="meetingname" value="<c:if test="${feedback_mee.meetingname != null}">${feedback_mee.meetingname}</c:if>" maxlength="20"/>
                        </div>
                    </div>
                    <div class="meetingButton">
                        <input type="submit" class="clickbutton" value="查询"/>
                        <input type="reset" class="clickbutton" value="重置"/>
                    </div>

                </div>
            </form>
            <table class="listtable" cellpadding="0" cellspacing="0">
                <caption>所有部门:</caption>

                <thead>
                <tr class="listheader">
                    <th>会议名称</th>
                    <th>会议室名称</th>
                    <th>会议开始时间</th>
                    <th>会议结束时间</th>
                    <th>预定者</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${pagebean_mee.list}">
                <tr>
                    <td>${item.meetingname}</td>
                    <td>${item.meetingroom.roomname}</td>
                    <td>${item.starttime}</td>
                    <td>${item.endtime}</td>
                    <td>${item.employee.employeename}</td>
                    <td>
                        <a class="clickbutton" href="${pageContext.request.contextPath}/searchmeetings/participatingemployees?meetingid=${item.meetingid}">参与员工</a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>


            <div class="result">
                <div class="pager-header">
                    <div class="header-info">
                        共<span class="info-number"><strong><i>${pagebean_mee.totalCount}</i></strong></span>条结果，
                        分成<span class="info-number"><strong><i>${pagebean_mee.totalPage}</i></strong></span>页显示，
                        当前第<span class="info-number"><strong><i>${pagebean_mee.currentPage}</i></strong></span>页
                    </div>


                    <div class="header-nav">
                        <a href="${pageContext.request.contextPath}/searchmeetings/jumpsearchmeetings?currentPage=1" class="clickbutton">首页</a>
                        <a href="${pageContext.request.contextPath}/searchmeetings/jumpsearchmeetings?currentPage=${pagebean_mee.currentPage-1}" class="clickbutton">上页</a>
                        <a href="${pageContext.request.contextPath}/searchmeetings/jumpsearchmeetings?currentPage=${pagebean_mee.currentPage+1}" class="clickbutton">下页</a>
                        <a href="${pageContext.request.contextPath}/searchmeetings/jumpsearchmeetings?currentPage=${pagebean_mee.totalPage}" class="clickbutton">末页</a>
                        跳到第<input type="text" id="pagenum"  onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" class="nav-number"/>页
                        <input id="jump" type="button" class="clickbutton" value="跳转"/>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>