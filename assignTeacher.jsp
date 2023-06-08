<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: black;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            color: white;
        }
        .table-container {
            width: 100%;
            overflow: auto;
            border-collapse: collapse;
        }

        .table-container table {
            width: 100%;
            border: 1px solid #ccc;
        }

        .table-container th,
        .table-container td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .table-container th {
            font-weight: bold;
            background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
            color: #fff;
        }

        .table-container tbody tr:nth-child(even) {
            background-color: #706b6b;
        }

        .table-container tbody tr:hover {
            background-color: green;
        }
    </style>
    <script>
        function downloadCredentials(content) {
            // Prepare the text content

            // Create a temporary element for downloading the file
            var element = document.createElement('a');
            element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(content));
            element.setAttribute('download', 'teacher_credentials.txt');
            element.style.display = 'none';
            document.body.appendChild(element);

            // Trigger the download
            element.click();

            // Clean up
            document.body.removeChild(element);
        }
    </script>
</head>
<body>
    <%
        // Retrieve the department from the request parameters
        String department = request.getParameter("department");
        String semester = request.getParameter("semester");
        String course_id = request.getParameter("courseId");
        String tid = request.getParameter("teacherId");
        String course_dept = request.getParameter("course_dept");

        out.println("In course: "+course_id+" these teachers are available...<br>Select one to assign this course to the teacher you want to select... Currently is "+tid);

        // Construct the SQL query
        String query = "SELECT teacher_id, teacher_name FROM teacher WHERE teacher_department='" + course_dept + "'";

        // Declare variables for database connection and result set
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Establish a database connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject", "srhossain", "SR-Hossain7");

            // Create a statement and execute the query
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            // Process the result set and generate the desired HTML output

                // Generate the HTML table


                out.println("<table class=\"table-container\">");
                out.println("<thead><tr><th>Teacher ID</th><th>Teacher Name</th></tr></thead>");
                out.println("<tbody>");
                while (rs.next()) {
                    String teacherId = rs.getString("teacher_id");
                    String teacherName = rs.getString("teacher_name");

                    // Generate the table row
                    out.println("<tr onclick=\"redirectToAssignTeacher('" + department + "', '" + semester + "', '" + course_id + "', '" + teacherId + "')\">");

                    out.println("<td>" + teacherId + "</td><td>" + teacherName + "</td></tr>");
                }
                out.println("</tbody>");
                out.println("</table>");
                // out.println("\"redirectToAssignTeacher('" + department + ", " + semester + ", " + course_id + ", " + teacherId + "')\"");

                out.println("<script>");
                out.println("function redirectToAssignTeacher(department, semester, course_id, teacher_id) {");
                out.println("    window.location.href = 'executeAssignTeacher.jsp?department=' + department + '&teacherId=' + teacher_id + '&semester=' + semester + '&course_id=' + course_id;");
                out.println("}");
                out.println("</script>");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    %>



    <script>
        // window.location.href = "<%= request.getParameter("prevLink")%>";
    </script>
</body>
</html>






