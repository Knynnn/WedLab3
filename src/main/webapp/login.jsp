<%--
  Created by IntelliJ IDEA.
  User: Knyn
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.hongjsp.User, com.example.hongjsp.UserService" %>
<%@ page import="com.example.hongjsp.User, com.example.hongjsp.UserService" %>
<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        UserService userService = new UserService();
        User user = userService.loginUser(name, password);

        if (user != null) {
            session.setAttribute("userID", user.getId());
            session.setAttribute("name", user.getName());
            session.setAttribute("age", user.getAge());
            session.setAttribute("role", user.getRole());
            response.sendRedirect("index.jsp");
        } else {
            out.println("登录失败");
        }
    }
%>

<form method="post" action="login.jsp">
    姓名: <input type="text" name="name" required><br>
    密码: <input type="password" name="password" required><br>
    <input type="submit" name="submit" value="登录">
</form>

