<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/4/29
  Time: 10:08
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
    <title>注册功能</title>
    <base href="<%=basePath%>">

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<%
    String user = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
    String pwd = request.getParameter("password");

    String driverClass = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/dajuan3";
    String username = "root";
    String password = "root";
    Class.forName(driverClass);//加载驱动
    Connection conn = DriverManager.getConnection(url,username,password);//得到连接
    PreparedStatement pStmt = conn.prepareStatement("select * from user where UName = '" + user + "'");
    ResultSet rs = pStmt.executeQuery();
    if(rs.next()){
        out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='register.jsp';</script>");
    }else{
        PreparedStatement tmt = conn.prepareStatement("Insert into user values('" + user + "','" + pwd + "')");
        int rst = tmt.executeUpdate();
        if (rst != 0){
            out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='index.jsp';</script>");
        }else{
            out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='register.jsp';</script>");
        }
    }
%>
</body>
</html>
