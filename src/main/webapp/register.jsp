<%--
  Created by IntelliJ IDEA.
  User: Knyn
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.hongjsp.User, com.example.hongjsp.UserService" %>
<%
    if (request.getParameter("submit") != null) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        int age = Integer.parseInt(request.getParameter("age"));
        String role = request.getParameter("role");

        User user = new User();
        user.setName(name);
        user.setPassword(password);
        user.setAge(age);
        user.setRole(role);

        UserService userService = new UserService();
        if (userService.registerUser(user)) {
            out.println("注册成功");
        } else {
            out.println("注册失败");
        }
    }
%>

<form method="post" action="register.jsp">
    姓名: <input type="text" name="name" required><br>
    密码: <input type="password" name="password" required><br>
    年龄: <input type="text" name="age"><br>
    权限: <input type="text" name="role"><br>
    <input type="submit" name="submit" value="注册">
</form>

