<%--
  Created by IntelliJ IDEA.
  User: Knyn
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="com.example.hongjsp.User" %>
<%@ page import="com.example.hongjsp.UserService" %>
<%
    if (session.getAttribute("userID") == null) {
        response.sendRedirect("index.jsp");
    } else {
        int userID = (Integer) session.getAttribute("userID");
        UserService userService = new UserService();
        User user = userService.getUserById(userID);

        if (request.getParameter("submit") != null) {
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String role = request.getParameter("role");

            user.setName(name);
            user.setAge(age);
            user.setRole(role);

            if (userService.updateUser(user)) {
                session.setAttribute("name", user.getName());
                session.setAttribute("age", user.getAge());
                session.setAttribute("role", user.getRole());
                out.println("用户信息修改成功");
            } else {
                out.println("用户信息修改失败");
            }
        }
%>
<form method="post" action="editProfile.jsp">
    姓名: <input type="text" name="name" value="<%= user.getName() %>" required><br>
    年龄: <input type="text" name="age" value="<%= user.getAge() %>"><br>
    权限: <input type="text" name="role" value="<%= user.getRole() %>"><br>
    <input type="submit" name="submit" value="修改信息">
</form>
<%
    }
%>
