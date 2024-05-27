package com.example.hongjsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // 检查用户是否已登录
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
        } else {
            // 获取会话中的属性，如果为null则使用默认值
            request.setAttribute("userID", session.getAttribute("userID"));
            request.setAttribute("name", session.getAttribute("name"));
            request.setAttribute("age", session.getAttribute("age") != null ? session.getAttribute("age") : 0);
            request.setAttribute("role", session.getAttribute("role"));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
