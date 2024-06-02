package com.example.hongjsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/leaderboard")
public class LeaderboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Score> scores = new ArrayList<>();
        try {
            Connection connection = DBConnection.getConnection();
            String sql = "SELECT u.name, MAX(s.score) as score FROM scores s " +
                    "JOIN tb_user u ON s.user_id = u.id " +
                    "GROUP BY u.name " +
                    "ORDER BY score DESC";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Score score = new Score();
                score.setName(resultSet.getString("name"));
                score.setScore(resultSet.getInt("score"));
                scores.add(score);
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("scores", scores);
        request.getRequestDispatcher("leaderboard.jsp").forward(request, response);
    }
}
