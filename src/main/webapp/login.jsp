<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <style>
        /* 重置样式，消除默认边距和填充 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/bg.jpeg'); /* 设置背景图片路径 */
            background-size: cover; /* 确保背景图片覆盖整个页面 */
            background-position: center; /* 居中背景图片 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 确保 body 占据整个视窗高度 */
            margin: 0;
        }
        .login-container {
            background: rgba(255, 255, 255, 0.2); /* 半透明背景颜色 */
            backdrop-filter: blur(10px); /* 毛玻璃效果 */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .input-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 10px 0;
        }
        .input-container label {
            flex: 1;
            text-align: right;
            margin-right: 10px;
        }
        .input-container input[type="text"],
        .input-container input[type="password"] {
            flex: 2;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .login-container input[type="submit"] {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .login-container input[type="button"] {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #008CBA;
            color: white;
            cursor: pointer;
        }
        .login-container input[type="button"]:hover {
            background-color: #007bb5;
        }
        .message {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
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
