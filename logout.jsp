<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Clear the session
    session.invalidate();

    // Redirect to the login page or any other desired page
    response.sendRedirect("login.jsp");
%>
