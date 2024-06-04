<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<div class="login-container">
    <h2>登录</h2>
    <form method="post" action="login">
        <div class="input-container">
            <label for="userID">学号:</label>
            <input type="text" id="userID" name="userID" required>
        </div>
        <div class="input-container">
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="button-container">
            <input type="submit" name="submit" value="登录">
            <input type="button" value="注册" onclick="window.location.href='register.jsp'">
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
