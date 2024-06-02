<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.hongjsp.ScoreRecord" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>排行榜</title>
    <link rel="stylesheet" href="css/play.css">
</head>
<body>
<div class="container">
    <h1>排行榜</h1>
    <table>
        <thead>
        <tr>
            <th>用户 ID</th>
            <th>分数</th>
            <th>日期</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<ScoreRecord> scores = (List<ScoreRecord>) request.getAttribute("scores");
            for (ScoreRecord score : scores) {
        %>
        <tr>
            <td><%= score.getUserId() %></td>
            <td><%= score.getScore() %></td>
            <td><%= score.getDate() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
