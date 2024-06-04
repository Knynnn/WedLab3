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
    <link rel="stylesheet" type="text/css" href="css/editProfile.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">
    <h2>修改用户基本信息</h2>
    <form method="post" action="editProfile">
        <div class="form-group">
            <label for="userID">学号:</label>
            <input type="text" id="userID" name="userID" value="<%= user != null ? user.getId() : "" %>" readonly>
        </div>
        <div class="form-group">
            <label for="name">姓名:</label>
            <input type="text" id="name" name="name" value="<%= user != null ? user.getName() : "" %>" required>
        </div>
        <div class="form-group">
            <label for="age">年龄:</label>
            <input type="text" id="age" name="age" value="<%= user != null ? user.getAge() : "" %>" required>
        </div>
        <div class="form-group">
            <label for="role">权限:</label>
            <input type="text" id="role" name="role" value="<%= user != null ? user.getRole() : "" %>" readonly>
        </div>
        <input type="submit" name="submit" value="修改信息">
    </form>
    <p>
        <%= message != null ? message : "" %>
    </p>
</div>
</body>
</html>
