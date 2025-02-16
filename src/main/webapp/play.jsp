<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.hongjsp.Question" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>党建红色长廊知识竞答</title>
    <link rel="stylesheet" href="css/play.css">
</head>

<body>
<div class="container">
    <div class="red-block"><img src="images/pic1.jpeg" class="image active"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>

    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>

    <div class="red-block"></div>
    <div class="content">
        <div class="intro">
            <h1>党建红色长廊知识竞答</h1>
            <p>每次五题，按空格键开始答题......</p>
        </div>
        <div class="question-container">
            <%
                List<Question> questions = (List<Question>) request.getAttribute("questions");
                for (Question question : questions) {
            %>
            <div class="question" data-answer="<%= question.getAnswer() %>">
                <%= question.getQuestion() %>
            </div>
            <div class="options" data-answer="<%= question.getAnswer() %>">
                <div class="option"><%= question.getOption1() %></div>
                <div class="option"><%= question.getOption2() %></div>
                <div class="option"><%= question.getOption3() %></div>
                <div class="option"><%= question.getOption4() %></div>
            </div>
            <%
                }
            %>
        </div>
        <div class="score-container">
            <h1 class="score"></h1>
            <div class="button-container">
                <button id="retry-button" style="display: none;">重新答题</button>
                <button id="leaderboard-button" style="display: none;" onclick="window.location.href='leaderboard'">查看排行榜</button>
            </div>
        </div>
    </div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
    <div class="red-block"></div>
</div>

<form id="score-form" action="play" method="post">
    <input type="hidden" name="userId" id="userId" value="<%= session.getAttribute("userID") %>">
    <input type="hidden" name="score" id="score" value="">
</form>


<%
    String role = (String) session.getAttribute("role");
    if (role != null && role.equals("管理员")) {
%>
<div class="admin-controls">
    <a href="manage.jsp">编辑题目</a>
</div>
<%
    }
%>

</body>
<script src="js/play.js"></script>
</html>
