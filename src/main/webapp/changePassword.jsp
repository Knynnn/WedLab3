<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
</head>
<body>
<h2>修改密码</h2>
<form method="post" action="changePassword">
    新密码: <input type="password" name="newPassword" required><br>
    <input type="submit" name="submit" value="修改密码">
</form>
<p style="color:green;">
    <%= message != null ? message : "" %>
</p>
</body>
</html>
