package com.example.hongjsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
        } else {
            String userID = (String) session.getAttribute("userID");
            UserService userService = new UserService();
            User user = userService.getUserById(userID);

            request.setAttribute("user", user);
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
        } else {
            String userID = (String) session.getAttribute("userID");
            UserService userService = new UserService();
            User user = userService.getUserById(userID);

            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));

            user.setName(name);
            user.setAge(age);

            if (userService.updateUser(user)) {
                session.setAttribute("name", user.getName());
                session.setAttribute("age", user.getAge());
                // 保持原有的权限不变
                session.setAttribute("role", user.getRole());
                response.sendRedirect("index");  // 跳转到index页面
            } else {
                request.setAttribute("message", "用户信息修改失败");
                request.setAttribute("user", user);
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            }
        }
    }
}
