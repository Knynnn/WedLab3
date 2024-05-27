<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <style>
    /* 重置样式，消除默认边距和填充 */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: Arial, sans-serif;
    }
    /* 顶部导航栏样式 */
    .header {
      background-color: #C91523;
      color: #FFFFFF;
      text-align: center;
      padding: 10px 0;
      width: 100vw; /* Ensure the header spans the full viewport width */
    }
    .nav-container {
      background-color: #e16355;
      width: 100vw; /* Ensure the nav spans the full viewport width */
    }
    .nav {
      display: flex;
      justify-content: space-around;
      padding: 10px 0;
      color: #FFFFFF;
    }
    .nav a {
      color: #FFFFFF;
      text-decoration: none;
      padding: 10px;
    }
    .nav a:hover {
      background-color: #C91523;
      border-radius: 4px;
    }
  </style>
</head>
<body>
<div class="header">
  <h1>广大红色文化长廊</h1>
</div>
<div class="nav-container">
  <div class="nav">
    <a href="index.jsp">首页</a>
    <a href="news.jsp">头条广大</a>
    <a href="#">校园动态</a>
    <a href="#">最美广大</a>
    <a href="#">联系我们</a>
  </div>
</div>
</body>
</html>
