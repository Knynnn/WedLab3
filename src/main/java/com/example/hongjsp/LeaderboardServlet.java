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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/leaderboard")
public class LeaderboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ScoreRecord> scores = new ArrayList<>();

        try {
            Connection connection = DBConnection.getConnection();
            String sql = "SELECT user_id, score, date FROM scores ORDER BY score DESC, date DESC";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                ScoreRecord score = new ScoreRecord();
                score.setUserId(resultSet.getString("user_id"));
                score.setScore(resultSet.getInt("score"));
                score.setDate(resultSet.getTimestamp("date"));
                scores.add(score);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("scores", scores);
        request.getRequestDispatcher("leaderboard.jsp").forward(request, response);
    }
}
