<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/4/28
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登陆</title>
</head>
<body >
<center>
<form id="form1" name="form1" method="post" action="checkLogin.jsp">
    <table>
        <tr>
            <td>用户名：</td>
            <td><input type="text" id="name" name="name"/></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" id="password" name="password" /></td>
        </tr>
        <tr>
            <td>记住密码：</td>
            <td><input type="checkbox" id="remember" name="remember" value="remember-me"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="登陆" /></td>
            <td><input type="reset" value="重置"/></td>
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
