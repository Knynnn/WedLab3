package com.example.hongjsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/play")
public class PlayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Question> questions = new ArrayList<>();
        try {
            Connection connection = DBConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM tb_questions ORDER BY RAND() LIMIT 5");

            while (resultSet.next()) {
                Question question = new Question();
                question.setQuestion(resultSet.getString("question"));
                question.setOption1(resultSet.getString("option1"));
                question.setOption2(resultSet.getString("option2"));
                question.setOption3(resultSet.getString("option3"));
                question.setOption4(resultSet.getString("option4"));
                question.setAnswer(resultSet.getInt("answer"));
                questions.add(question);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("questions", questions);
        request.getRequestDispatcher("play.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = request.getParameter("userId");
        int score = Integer.parseInt(request.getParameter("score"));

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Connection connection = DBConnection.getConnection();
            String sql = "INSERT INTO scores (user_id, score, date) VALUES (?, ?, CURRENT_TIMESTAMP)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userId);
            preparedStatement.setInt(2, score);
            preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            out.println("Score submitted successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error submitting score.");
        }

        out.close();
    }
}
