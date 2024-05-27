<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%
  String userID = (String) request.getAttribute("userID");
  String name = (String) request.getAttribute("name");
  Integer age = (Integer) request.getAttribute("age");  // 使用包装类型
  String role = (String) request.getAttribute("role");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>用户信息</title>
</head>
<body>
<p>学号: <%= userID != null ? userID : "未知" %></p>
<p>姓名: <%= name != null ? name : "未知" %></p>
<p>年龄: <%= age != null ? age : "未知" %></p>
<p>权限: <%= role != null ? role : "未知" %></p>
<a href="logout">注销</a><br>
<a href="changePassword.jsp">修改密码</a><br>
<a href="editProfile.jsp">修改用户基本信息</a>
</body>
</html>
