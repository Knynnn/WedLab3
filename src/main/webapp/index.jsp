<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>首页</title>
  <link rel="stylesheet" href="css/index.css">
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
  <!-- 主内容区域 -->
  <div class="main">
    <div class="content">
      <div class="image-news">
        <img src="images/slide1.jpeg" alt="红色长廊">
        <p>
          12月3日，广州大学举行党建红色文化长廊教育宣传启动仪式，标志着该校党建红色文化长廊正式启用。
          长廊绵延千米，以时间为线索，通过科技互动、文化体验等多元化表现手段，生动讲述中国共产党走过的峥嵘岁月，
          着重凸显中国共产党人的精神谱系，将打造成沉浸式、立体化的党史学习教育新阵地。
        </p>
      </div><!-- 新闻列表部分 -->
      <div class="news-list">
        <div class="news-header">
          <h2>头条广大</h2>
        </div>
        <ul>
          <li>
            <span class="date">2024-05-16</span>
            <a href="news.html">广州高校首场 《中华民族共同体概论》导读分享会在广州...</a>
          </li>
          <li>
            <span class="date">2024-05-15</span>
            <a href="news.html">校党委常委会传达学习习近平总书记五四青年节对全国广大...</a>
          </li>
          <li>
            <span class="date">2024-05-15</span>
            <a href="news.html">2024年保密委员会第一次全体会议暨全校保密工作会议召开</a>
          </li>
          <li>
            <span class="date">2024-05-14</span>
            <a href="news.html">广州大学2024年全面从严治党工作会议暨党纪学习教育读书...</a>
          </li>
          <li>
            <span class="date">2024-05-13</span>
            <a href="news.html">你们辛苦了，广大的白衣天使 ——校领导护士节暖心...</a>
          </li>
          <li>
            <span class="date">2024-05-13</span>
            <a href="news.html">我校物流管理专业在第四届国际供应链建模设计大赛中获得...</a>
          </li>
          <li>
            <span class="date">2024-05-13</span>
            <a href="news.html">我校接受建筑学专业本科教育及建筑学硕士学位研究生教育...</a>
          </li>
          <li>
            <span class="date">2024-05-13</span>
            <a href="news.html">我校学子勇夺第九届国际大学生智能农业装备创新大赛特等奖</a>
          </li>　
        </ul>
      </div>
    </div>
  </div>
</div>

<div class="footer">
  <p>版权所有 &copy; 2024 广大红色文化长廊</p>
</div>
</body>
</html>
