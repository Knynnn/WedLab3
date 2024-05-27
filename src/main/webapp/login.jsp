<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
</head>
<body>
<h2>登录</h2>
<form method="post" action="login">
    学号: <input type="text" name="userID" required><br>
    密码: <input type="password" name="password" required><br>
    <input type="submit" name="submit" value="登录">
</form>
<p style="color:green;">
    <%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
</p>
<p style="color:red;">
    <%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %>
</p>
</body>
</html>
