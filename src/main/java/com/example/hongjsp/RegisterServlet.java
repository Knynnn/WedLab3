package com.example.hongjsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        int age = Integer.parseInt(request.getParameter("age"));
        String role = "学生";  // 默认角色为“学生”

        UserService userService = new UserService();
        User user = new User();
        user.setId(userID);
        user.setName(name);
        user.setPassword(password);
        user.setAge(age);
        user.setRole(role);

        if (userService.registerUser(user)) {
            String message = URLEncoder.encode("注册成功，请登录", StandardCharsets.UTF_8.toString());
            response.sendRedirect("login.jsp?message=" + message);
        } else {
            request.setAttribute("message", "注册失败，用户ID已存在");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
