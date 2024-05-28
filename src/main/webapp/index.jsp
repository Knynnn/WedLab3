<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>首页</title>
  <style>
    /* 重置样式，消除默认边距和填充 */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding-bottom: 50px; /* 为底部预留空间 */
    }
    .header {
      background-color: #C91523;
      color: #FFFFFF;
      text-align: center;
      padding: 10px 0;
    }
    .nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #e16355;
      padding: 10px 20px;
      color: #FFFFFF;
    }
    .nav a {
      color: #FFFFFF;
      text-decoration: none;
      padding: 10px;
    }
    .nav .right {
      display: flex;
      align-items: center;
      gap: 10px;
    }
    .nav .right button {
      margin-left: 5px;
      padding: 5px 10px;
    }
    .nav .right button a {
      color: black;
      text-decoration: none;
    }
    .footer {
      background-color: #C91523;
      color: #FFFFFF;
      text-align: center;
      padding: 10px 0;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
  </style>
</head>
<body>
<div class="header">
  <h1>广大红色文化长廊</h1>
</div>
<div class="nav">
  <a href="index.jsp">首页</a>
  <a href="news.jsp">头条广大</a>
  <a href="#">校园动态</a>
  <a href="#">最美广大</a>
  <div class="right">
    <%
      if (session.getAttribute("userID") == null) {
    %>
    <span>当前未登录</span>
    <button><a href="login.jsp">登录</a></button>
    <%
    } else {
      String userID = (String) session.getAttribute("userID");
      String name = (String) session.getAttribute("name");
    %>
    <span><%= name %>（<%= userID %>）</span>
    <a href="changePassword.jsp">修改密码</a>
    <a href="editProfile.jsp">修改个人信息</a>
    <a href="logout.jsp">注销</a>
    <%
      }
    %>
  </div>
</div>

<div class="content">
  <!-- 其他内容 -->
</div>

<div class="footer">
  <p>版权所有 &copy; 2024 广大红色文化长廊</p>
</div>
</body>
</html>
