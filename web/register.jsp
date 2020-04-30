<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/4/29
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>注册</title>
    <base href="<%=basePath%>">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <script>
        function addCheck(){
            var username=document.getElementById("username").value;
            var password=document.getElementById("password").value;
            var newPass=document.getElementById("newPass").value;
            if(username==""){
                alert("用户名不能为空!");
                document.getElementById("username").focus();
                return false;
            }
            if(password==""){
                alert("密码不能为空!");
                document.getElementById("password").focus();
                return false;
            }
            if(password != newPass){
                alert("两次输入密码不相同!");
                document.getElementById("newPass").focus();
                return false;
            }
        }
        function validate(){
            var flag = addCheck();
            if(flag == false)
                return false;
            return true;
        }
    </script>
</head>
<body>
<center>
    <font face="楷体" size="6" color="#000">注册界面</font>
    <form action = "checkRegister.jsp" method = "post" onsubmit = "return validate()">
        <table width="300" height = "180" border="5" bordercolor="#A0A0A0">
            <tr>
                <th>用户名：</th>
                <td><input type="text" name="username" value="输入16个字符以内" maxlength = "16" onfocus = "if(this.value == '输入16个字符以内') this.value =''"></td>
            </tr>
            <tr>
                <th>输入密码：</th>
                <td><input type="text" name="password" value="输入20个字符以内" maxlength = "20" onfocus = "if(this.value == '输入20个字符以内') this.value =''"></td>
            </tr>
            <tr>
                <th>确认密码：</th>
                <td><input type="text" name="newword" value="重新输入密码" maxlength = "20" onfocus = "if(this.value == '重新输入密码') this.value =''"></td>
            </tr>
            <tr>
                <td colspan = "2" align = "center">
                    <input type="submit" value="注  册">
                    <input type="reset" value="重  置">
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
