<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="css/changePassword.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">
    <h2>修改密码</h2>
    <form method="post" action="changePassword">
        <div class="form-group">
            <label for="currentPassword">旧密码:</label>
            <input type="password" id="currentPassword" name="currentPassword" required>
        </div>
        <div class="form-group">
            <label for="newPassword">新密码:</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">确认新密码:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <input type="submit" name="submit" value="修改密码">
    </form>
    <p style="color:green;">
        <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </p>
</div>
</body>
</html>
