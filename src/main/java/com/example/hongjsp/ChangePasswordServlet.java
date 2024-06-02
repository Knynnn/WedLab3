package com.example.hongjsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
        } else {
            String userID = (String) session.getAttribute("userID");
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            UserService userService = new UserService();

            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("message", "新密码和确认密码不匹配");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }

            if (!userService.verifyOldPassword(userID, currentPassword)) {
                request.setAttribute("message", "旧密码错误");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }

            if (userService.changePassword(userID, newPassword)) {
                // 使当前会话无效
                session.invalidate();

                // 编码消息并重定向到登录页面
                String message = URLEncoder.encode("密码修改成功，请重新登录", StandardCharsets.UTF_8.toString());
                response.sendRedirect("login.jsp?message=" + message);
            } else {
                request.setAttribute("message", "密码修改失败");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            }
        }
    }
}
