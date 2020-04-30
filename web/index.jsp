<%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/4/28
  Time: 15:29
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
    <title>测试标题</title>
    <base href="<%=basePath%>">

    <title>My JSP</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
  </head>
  <body>
  <center>
    <font face = "宋体" size = "6" color = "#000">英雄联盟 LPL</font><hr>
    <div>
      <img alt="" width = "600" height = "400" src="D:\Images.jpg">
    </div>
    <table width = "200" border ="1" bordercolor = "#00F">
      <tr>
        <td><input type = "button" value = "登      陆" onclick = "window.open('login1.jsp')"></td>
        <td><input type = "button" value = "注      册" onclick = "window.open('register.jsp')"></td>
      </tr>
    </table>
  </center>
  </body>
</html>
