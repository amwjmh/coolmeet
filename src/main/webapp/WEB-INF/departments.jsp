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
            if (form.departmentname.value==''){
                $("#warning").text("请输入部门名称！");
                form.departmentname.focus();
                return false;
            }
            return true;
        };
        //部门修改删除
        <c:forEach var="department" items="${list}" varStatus="status">
        $(function(){
            var old = $('#depar${status.index}').html();
            //修改
            $('#edit${status.index}').click(function(){
                if($('#edit${status.index}').attr('value')!=='提交'){
                    $('#depar${status.index}').html("<input id='inp${status.index}' type='text' name='editname' value="+old+" >");
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
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
            <div class="page-content">
                <div class="content-nav">
                    人员管理 > 部门管理
                </div>
                <form action="${pageContext.request.contextPath}/admin/increasedepartment" method="post" onsubmit="return text(this);">
                    <fieldset>
                        <legend>添加部门</legend>
                        部门名称:
                        <input type="text" id="departmentname" maxlength="20" name="departmentname"/>

                        <input type="submit" class="clickbutton" value="添加"/>
                        <span id="warning" style="color: red"></span>
                    </fieldset>
                </form>

                <table class="listtable">
                    <caption>所有部门:</caption>
                    <tr class="listheader">
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="department" items="${list}" varStatus="status">
                        <tr>
                            <td>${status.index+1}</td>
                            <td id="depar${status.index}">
                                ${department.departmentname}
                            </td>
                            <td>
                                <input id="edit${status.index}" class="clickbutton" type="button" value="编辑"/>
                                <input id="cancel${status.index}" class="clickbutton" type="hidden" value="取消"/>
                                <a id="del${status.index}" class="clickbutton" href="${pageContext.request.contextPath}/admin/deletedepartment?departmentid=${department.departmentid}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%@include file="tail.jsp"%>
    </body>
</html>