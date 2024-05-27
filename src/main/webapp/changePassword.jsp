<%--
  Created by IntelliJ IDEA.
  User: Knyn
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="com.example.hongjsp.UserService" %>
<%
    if (session.getAttribute("userID") == null) {
        response.sendRedirect("index.jsp");
    } else {
        if (request.getParameter("submit") != null) {
            int userID = (Integer) session.getAttribute("userID");
            String newPassword = request.getParameter("newPassword");

            UserService userService = new UserService();
            if (userService.changePassword(userID, newPassword)) {
                out.println("密码修改成功");
            } else {
                out.println("密码修改失败");
            }
        }
    }
%>
<form method="post" action="changePassword.jsp">
    新密码: <input type="password" name="newPassword" required><br>
    <input type="submit" name="submit" value="修改密码">
</form>


