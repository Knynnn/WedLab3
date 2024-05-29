<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.hongjsp.DBConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理题目</title>
    <link rel="stylesheet" href="css/manage.css">
</head>
<body>
<h1>管理题目</h1>
<form action="manage.jsp" method="post">
    <input type="hidden" name="id" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>">
    <label>问题：</label>
    <textarea name="question" required><%= request.getParameter("question") != null ? request.getParameter("question") : "" %></textarea><br>
    <label>选项1：</label>
    <input type="text" name="option1" value="<%= request.getParameter("option1") != null ? request.getParameter("option1") : "" %>" required><br>
    <label>选项2：</label>
    <input type="text" name="option2" value="<%= request.getParameter("option2") != null ? request.getParameter("option2") : "" %>" required><br>
    <label>选项3：</label>
    <input type="text" name="option3" value="<%= request.getParameter("option3") != null ? request.getParameter("option3") : "" %>" required><br>
    <label>选项4：</label>
    <input type="text" name="option4" value="<%= request.getParameter("option4") != null ? request.getParameter("option4") : "" %>" required><br>
    <label>答案（0-3）：</label>
    <input type="number" name="answer" value="<%= request.getParameter("answer") != null ? request.getParameter("answer") : "" %>" required><br>
    <button type="submit">提交</button>
</form>

<h2>现有题目</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>问题</th>
        <th>选项1</th>
        <th>选项2</th>
        <th>选项3</th>
        <th>选项4</th>
        <th>答案</th>
        <th>操作</th>
    </tr>
    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String id = request.getParameter("id");
            String question = request.getParameter("question");
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String option4 = request.getParameter("option4");
            int answer = Integer.parseInt(request.getParameter("answer"));

            try {
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement;
                if (id == null || id.isEmpty()) {
                    statement = connection.prepareStatement("INSERT INTO tb_questions (question, option1, option2, option3, option4, answer) VALUES (?, ?, ?, ?, ?, ?)");
                } else {
                    statement = connection.prepareStatement("UPDATE tb_questions SET question = ?, option1 = ?, option2 = ?, option3 = ?, option4 = ?, answer = ? WHERE id = ?");
                    statement.setInt(7, Integer.parseInt(id));
                }
                statement.setString(1, question);
                statement.setString(2, option1);
                statement.setString(3, option2);
                statement.setString(4, option3);
                statement.setString(5, option4);
                statement.setInt(6, answer);
                statement.executeUpdate();
                statement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (request.getParameter("delete") != null) {
            int id = Integer.parseInt(request.getParameter("delete"));
            try {
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement("DELETE FROM tb_questions WHERE id = ?");
                statement.setInt(1, id);
                statement.executeUpdate();
                statement.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        try {
            Connection connection = DBConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM tb_questions");

            while (resultSet.next()) {
    %>
    <tr>
        <td><%= resultSet.getInt("id") %></td>
        <td><%= resultSet.getString("question") %></td>
        <td><%= resultSet.getString("option1") %></td>
        <td><%= resultSet.getString("option2") %></td>
        <td><%= resultSet.getString("option3") %></td>
        <td><%= resultSet.getString("option4") %></td>
        <td><%= resultSet.getInt("answer") %></td>
        <td>
            <a href="manage.jsp?id=<%= resultSet.getInt("id") %>&question=<%= resultSet.getString("question") %>&option1=<%= resultSet.getString("option1") %>&option2=<%= resultSet.getString("option2") %>&option3=<%= resultSet.getString("option3") %>&option4=<%= resultSet.getString("option4") %>&answer=<%= resultSet.getInt("answer") %>">编辑</a>
            <a href="manage.jsp?delete=<%= resultSet.getInt("id") %>">删除</a>
        </td>
    </tr>
    <%
            }
            resultSet.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
