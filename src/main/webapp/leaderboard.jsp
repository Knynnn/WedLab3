<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.hongjsp.Score" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>排行榜</title>
    <link rel="stylesheet" href="css/leaderboard.css">
</head>
<body>
<div class="container">
    <h1>排行榜</h1>
    <table>
        <thead>
        <tr>
            <th>名字</th>
            <th>成绩</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Score> scores = (List<Score>) request.getAttribute("scores");
            if (scores != null) {
                for (Score score : scores) {
        %>
        <tr>
            <td><%= score.getName() %></td>
            <td><%= score.getScore() %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
