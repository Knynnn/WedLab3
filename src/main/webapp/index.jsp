<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  if (session.getAttribute("userID") == null) {
    response.sendRedirect("login.jsp");
  } else {
    int userID = (Integer) session.getAttribute("userID");
    String name = (String) session.getAttribute("name");
    int age = (Integer) session.getAttribute("age");
    String role = (String) session.getAttribute("role");
    out.println("用户ID: " + userID + "<br>");
    out.println("姓名: " + name + "<br>");
    out.println("年龄: " + age + "<br>");
    out.println("权限: " + role + "<br>");
  }
%>
<a href="logout.jsp">注销</a><br>
<a href="changePassword.jsp">修改密码</a><br>
<a href="editProfile.jsp">修改用户基本信息</a>
