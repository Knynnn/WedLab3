package com.example.hongjsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String password = request.getParameter("password");

        UserService userService = new UserService();
        User user = userService.loginUser(userID, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userID", user.getId());
            session.setAttribute("name", user.getName());
            session.setAttribute("age", user.getAge());
            session.setAttribute("role", user.getRole());
            response.sendRedirect("index");
        } else {
            request.setAttribute("msg", "登录失败");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
