package com.example.hongjsp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/index")
public class index extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("userID", session.getAttribute("userID"));
            request.setAttribute("name", session.getAttribute("name"));
            request.setAttribute("age", session.getAttribute("age"));
            request.setAttribute("role", session.getAttribute("role"));
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
        }
    }
}
