package com.example.hongjsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet("/play")
public class PlayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Question> questions = new ArrayList<>();
        try {
            Connection connection = DBConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM tb_questions");

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

            // 随机打乱题目顺序
            Collections.shuffle(questions);

            // 仅获取前5道题目
            if (questions.size() > 5) {
                questions = questions.subList(0, 5);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("questions", questions);
        request.getRequestDispatcher("play.jsp").forward(request, response);
    }
}
