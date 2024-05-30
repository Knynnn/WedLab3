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
                if (questions == null) {
                    out.println("<p>无法加载问题，请通过正确的入口访问此页面。</p>");
                } else {
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
                }
            %>
        </div>
        <div class="score-container">
            <h1 class="score"></h1>
            <div class="button-container">
                <button id="retry-button" style="display: none;">重新答题</button>
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

</body>
<script src="js/play.js"></script>
</html>
