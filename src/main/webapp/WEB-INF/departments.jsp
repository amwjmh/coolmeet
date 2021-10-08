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
        <%@include file="top.jsp"%>
        <script>
            //部门修改删除
            <c:forEach var="department" items="${list}" varStatus="status">
            $(function(){
                var old = $('#depar${status.index}').html();
                //修改
                $('#edit${status.index}').click(function(){
                    if($('#edit${status.index}').attr('value')!=='提交'){
                        $('#depar${status.index}').html("<input id='inp${status.index}' required='required' type='text' name='editname' value="+old+" >");
                        $('#cancel${status.index}').attr('type','button');
                        $('#edit${status.index}').attr('value','提交');
                    }else{
                        //提交
                        $.ajax({
                            url:"${pageContext.request.contextPath}/admin/updatedepartment",
                            type:"POST" , //请求方式
                            dataType:"text",//设置接受到的响应数据的格式
                            data:{
                                departmentid:${department.departmentid},
                                departmentname:$("#inp${status.index}").val()
                            },
                            //响应成功后的回调函数
                            success:function (data){
                                window.location.href="${pageContext.request.contextPath}/admin/jumpdepartment";
                            },

                        });
                    }
                });
                //取消
                $("#cancel${status.index}").click(function(){
                    $('#edit${status.index}').attr('value','编辑');
                    $('#depar${status.index}').html(old);
                    $('#cancel${status.index}').attr('type','hidden');
                });
            });
            </c:forEach>
        </script>
        <%@include file="leftmenubar.jsp"%>
    <div class="page-content">
        <div class="content-nav">
            人员管理 > 部门管理
        </div>
        <form action="${pageContext.request.contextPath}/admin/increasedepartment" method="post">
            <div class="fieldContainer">
                <div class="formRow">
                    <div class="label">
                        <label>部门名称:</label>
                    </div>
                    <div class="field">
                        <input type="text" required="required" title="请输入部门名称！" id="departmentname" maxlength="20" name="departmentname"/>
                    </div>

                    <div class="signupButton">
                        <input type="submit" class="clickbutton" value="添加"/>
                    </div>
                </div>

            </div>
            <span id="warning" style="color: red"></span>

        </form>

        <table class="listtable" cellpadding="0" cellspacing="0">
            <caption>所有部门:</caption>

            <thead>
             <tr class="listheader">
                <th style="width: 5%">部门编号</th>
                <th style="width: 20%">部门名称</th>
                <th style="width: 12%">操作</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="department" items="${list}" varStatus="status">
                <tr>

                    <td style="width: 5%">${status.index+1}</td>
                    <td style="width: 20%" id="depar${status.index}">
                            ${department.departmentname}
                    </td>
                    <td style="width: 12%" class="td">
                        <input id="edit${status.index}" class="clickbutton" type="button" value="编辑"/>
                        <input id="cancel${status.index}" class="clickbutton" type="hidden" value="取消"/>
                        <a id="del${status.index}" class="clickbutton" href="${pageContext.request.contextPath}/admin/deletedepartment?departmentid=${department.departmentid}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>