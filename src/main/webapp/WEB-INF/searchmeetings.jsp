<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
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
                会议预定 > 搜索会议
            </div>

            <form action="${pageContext.request.contextPath}/admin/jumpsearchemployees">
                <div class="fieldContainer">
                    <div class="searchformRow">
                        <div class="label">
                            <label for="meetingname">会议名称:</label>
                        </div>
                        <div class="field">
                            <input type="text" id="meetingname" maxlength="20"/>
                        </div>
                    </div>
                    <div class="searchformRow">
                        <div class="label">
                            <label for="roomname">会议室:</label>
                        </div>
                        <div class="field">
                            <input type="text" id="roomname" maxlength="20"/>
                        </div>
                    </div>
                    <div class="searchformRow">
                        <div class="label">
                            <label for="reservername">预定者:</label>
                        </div>
                        <div class="field">
                            <input type="text" id="reservername" maxlength="20"/>
                        </div>
                    </div>
                    <div class="searchformRow">
                        <div class="label">
                            <label for="reservername">预定日期:</label>
                        </div>
                        <div class="field">
                            <input type="date" id="reservefromdate" placeholder="例如：2013-10-20"/>
                            到&nbsp;<input type="date" id="reservetodate" placeholder="例如：2013-10-22"/>
                        </div>
                    </div>
                    <div class="searchformRow">
                        <div class="label">
                            <label for="reservername">会议日期:</label>
                        </div>
                        <div class="field">
                            <input type="date" id="meetingfromdate" placeholder="例如：2013-10-20"/>
                            到&nbsp;<input type="date" id="meetingtodate" placeholder="例如：2013-10-22"/>
                        </div>
                    </div>
                    <div class="meetingButton">
                        <input type="button" class="clickbutton" value="查询"/>
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
                    <th>会议预定时间</th>
                    <th>预定者</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="" items="">
                <tr>
                    <td>业务洽谈会</td>
                    <td>第一会议室</td>
                    <td>2013-10-12 8:00</td>
                    <td>2013-10-12 12:00</td>
                    <td>2013-10-10 16:00</td>
                    <td>Jerry</td>
                    <td>
                        <a class="clickbutton" href="meetingdetails.html">查看详情</a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>


            <div class="result">
                <div class="pager-header">
                    <div class="header-info">
                        共<span class="info-number"><strong><i>9</i></strong></span>条结果，
                        分成<span class="info-number"><strong><i>2</i></strong></span>页显示，
                        当前第<span class="info-number"><strong><i>3</i></strong></span>页
                    </div>


                    <div class="header-nav">
                        <a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=1" class="clickbutton">首页</a>
                        <a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=${pagebean.currentPage-1}" class="clickbutton">上页</a>
                        <a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=${pagebean.currentPage+1}" class="clickbutton">下页</a>
                        <a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=${pagebean.totalPage}" class="clickbutton">末页</a>
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