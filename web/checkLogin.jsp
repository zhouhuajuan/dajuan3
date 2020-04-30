<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: zhj15
  Date: 2020/4/28
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name=new String(request.getParameter("name").getBytes("ISO8859_1"),"GBK");
    String password=new String(request.getParameter("password").getBytes("ISO8859_1"),"GBK");
    try {
        // 加载数据库驱动，注册到驱动管理器
        Class.forName("com.mysql.jdbc.Driver");
        // 数据库连接字符串
        String url = "jdbc:mysql://localhost:3306/dajuan3";
        // 数据库用户名
        String dbName = "root";
        // 数据库密码
        String psw = null;
        // 创建Connection连接
        Connection connection = DriverManager.getConnection(url,dbName,psw);
        // 判断 数据库连接是否为空
        if(connection != null){
            String sql="select * from user where name =? and password=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,password);
            ResultSet rs=preparedStatement.executeQuery(sql);
            if(rs.next()){
                response.sendRedirect("home.jsp");
            }else{
                out.print("用户名或密码错误，请重新输入！");
            }
            // 关闭数据库连接
            connection.close();
        }else{
            // 输出连接信息
            out.println("数据库连接失败！");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
