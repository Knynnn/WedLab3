<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
<div class="register-container">
    <h2>注册</h2>
    <form method="post" action="register">
        <div class="input-container">
            <label for="userID">学号:</label>
            <input type="text" id="userID" name="userID" required>
        </div>
        <div class="input-container">
            <label for="name">姓名:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="input-container">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="input-container">
            <label for="age">年龄:</label>
            <input type="text" id="age" name="age">
        </div>
        <div class="button-container">
            <input type="submit" value="注册">
        </div>
    </form>
    <p class="message">
        <%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
    </p>
    <p class="error">
        <%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %>
    </p>
</div>
</body>
</html>
