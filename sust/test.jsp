<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%

    // Perform database operations using JDBC
    Connection conn = null;
    Statement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject", "srhossain", "SR-Hossain7");
        stmt = conn.createStatement();

        // Execute the SQL command
        String sql = "insert into course_reg select department.course_id, student.student_id, 0, 1 from department, student where department.semester=student.semester and department.department=student.department and student.student_id="+"2019331054 and department.semester="+"5";
        stmt.executeUpdate(sql);

        // Close resources
        stmt.close();
        conn.close();

        // Return a response message if needed
        response.getWriter().write("Registration successful!");
    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().write("Registration failed: " + e.getMessage());
    }
%>
