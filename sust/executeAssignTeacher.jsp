<%@ page import="java.sql.*" %>
<%
    String department = request.getParameter("department");
    String teacherId = request.getParameter("teacherId");
    String course_id = request.getParameter("course_id");

    String msg = "UPDATE department SET teacher_id = '"+ teacherId +"' WHERE department = '" + department + "' AND course_id = '" + course_id + "';";

    Connection conn = null;
    PreparedStatement stmt = null;
    int rowsUpdated = 0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject", "srhossain", "SR-Hossain7");

        stmt = conn.prepareStatement(msg);
        out.println("starting...."+msg +"\n");
        rowsUpdated = stmt.executeUpdate();
        out.println("hoise\n");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }

    out.println(rowsUpdated + " rows updated");
%>
<script>
    window.location.href = "admin.jsp";
</script>
