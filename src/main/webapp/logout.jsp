<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp?message=" + java.net.URLEncoder.encode("已成功注销，请重新登录", "UTF-8"));
%>
