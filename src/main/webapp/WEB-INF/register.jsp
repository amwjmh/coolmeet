<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="/css/common.css"/>
        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
        </script>
    </head>
    <body>
    <script>
           function registered(form){
               if(form.employeename.value==''){
                   $("#ang").text("姓名不能为空！");
                   form.employeename.focus();
                   return false;
               }
               if(form.username.value=='') {
                   $("#caveatone").text("用户名不能为空！");
                   form.username.focus();
                   return false;
               }

               if(form.password.value==''){
                   $("#caveattwo").text("密码不能为空！");
                   form.password.focus();
                   return false;
               }
               if(form.password.value.length<6){
                   $("#caveattwo").text("密码至少为6位，请重新输入！");
                   form.password.focus();
                   return false;
               }
               if(form.password.value!=form.confirm.value) {
                   $("#caveattwo").text("密码不一致！");
                   form.confirm.focus();
                   return false;
               }

               var fatr = null;
               $.ajax({
                   url:"${pageContext.request.contextPath}/management/determineUsernameExists", // 请求路径
                   type:"POST" , //请求方式
                   async:false,
                   cache:false,
                   dataType:"text",//设置接受到的响应数据的格式
                   data:{
                       username:$("#username").val()
                   },
                   //响应成功后的回调函数
                   success:function (data){
                       if(data == "exist"){
                           alert("用户已存在")
                           $("#caveatone").text("用户已存在");
                           fatr = false
                       }else {
                           alert("注册成功。");
                           fatr = true
                       }
                   },
               });

               return fatr;
           }

    </script>
        <%@include file="top.jsp"%>
    <%@include file="leftmenubar.jsp"%>
            <div class="page-content">
                <div class="content-nav">
                    人员管理 > 员工注册
                </div>
                <form method="post" id="myForm" action="${pageContext.request.contextPath}/employee/addaddEmployee" name="form" onsubmit="return registered(this);" >
                    <fieldset>
                        <legend>员工信息</legend>
                        <table class="formtable" style="width:50%">
                            <tr>
                                <td>姓名：</td>
                                <td>
                                    <input type="text" id="employeename" maxlength="20" name="employeename"/>
                                    <span id="ang"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>账户名：</td>
                                <td>
                                    <input type="text" id="username" maxlength="20" name="username"/>
                                    <span id="caveatone"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>密码：</td>
                                <td>
                                    <input type="password" id="password" maxlength="20" placeholder="请输入6位以上的密码" name="password"/>
                                </td>
                            </tr>
                            <tr>
                                <td>确认密码：</td>
                                <td>
                                    <input type="password" id="confirm" maxlength="20" />
                                    <span id="caveattwo"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>联系电话：</td>
                                <td>
                                    <input type="text" id="phone" maxlength="20" name="phone"/>
                                </td>
                            </tr>
                            <tr>
                                <td>电子邮件：</td>
                                <td>
                                    <input type="text" id="email" maxlength="20" name="email"/>
                                </td>
                            </tr>
							<td>所在部门：</td>
                                <td>
                                    <select id="departmentid" name="departmentid">
                                        <c:forEach var="item" items="${departments}" >
                                            <option value="${item.departmentid}">${item.departmentname}</option>
                                        </c:forEach>
                                     </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="command">
                                    <input type="submit" class="clickbutton" value="注册"/>
                                    <input type="reset" class="clickbutton" value="重置"/>
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