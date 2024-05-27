<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="com.example.hongjsp.User" %>
<%
    User user = (User) request.getAttribute("user");
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改用户基本信息</title>
</head>
<body>
<h2>修改用户基本信息</h2>
<form method="post" action="editProfile">
    姓名: <input type="text" name="name" value="<%= user != null ? user.getName() : "" %>" required><br>
    年龄: <input type="text" name="age" value="<%= user != null ? user.getAge() : "" %>"><br>
    <input type="submit" name="submit" value="修改信息">
</form>
<p style="color:green;">
    <%= message != null ? message : "" %>
</p>
</body>
</html>
