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
        String content="";
        String courseIDs = request.getParameter("message");

        // Perform database operations using JDBC
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject", "srhossain", "SR-Hossain7");
            stmt = conn.createStatement();

            // Execute the SQL command
            String sql = courseIDs;
            String[] statementsArray = sql.split(";");

            for (int i = 0; i < statementsArray.length; i++) {
                String statement = statementsArray[i].trim();
                stmt.executeUpdate(statement);
                // Perform further processing with each SQL statement
                // out.println(statement);
                // ...
            }

            // Retrieve the maximum teacher_id and corresponding password
            if (courseIDs.startsWith("insert into teacher")) {
                String getMaxTeacherIdQuery = "SELECT * FROM teacher WHERE teacher_main_id = (SELECT MAX(teacher_main_id) FROM teacher);";
                ResultSet resultSet = stmt.executeQuery(getMaxTeacherIdQuery);

                String teacherId = "";
                String teacherPass = "";
                String teacherName = "";
                String teacherEmail = "";
                String teacherDept = "";
                if (resultSet.next()) {
                    teacherId = resultSet.getString("teacher_id");
                    teacherPass = resultSet.getString("teacher_pass");
                    teacherName = resultSet.getString("teacher_name");
                    teacherEmail = resultSet.getString("teacher_email");
                    teacherDept = resultSet.getString("teacher_department");
                }
                content = "Teacher ID: " + teacherId + "\\nTeacher Name: "+teacherName+"\\nEmail:"+teacherEmail + "\\nDepartment: "+teacherDept+ "\\nPassword: " + teacherPass;

                resultSet.close();

                // Call the JavaScript function to download the credentials
                out.println("<script>downloadCredentials('" + content + "');</script>");
            } else if (courseIDs.startsWith("insert into studentsd")) {
                String getMaxTeacherIdQuery = "SELECT * FROM student WHERE teacher_id = (SELECT MAX(teacher_id) FROM teacher);";
                ResultSet resultSet = stmt.executeQuery(getMaxTeacherIdQuery);

                String teacherId = "";
                String teacherPass = "";
                String teacherName = "";
                String teacherEmail = "";
                if (resultSet.next()) {
                    teacherId = resultSet.getString("teacher_id");
                    teacherPass = resultSet.getString("teacher_pass");
                    teacherName = resultSet.getString("teacher_name");
                    teacherEmail = resultSet.getString("teacher_email");
                }
                content = "Teacher ID: " + teacherId + "\\nTeacher Name: "+teacherName+"\\nEmail:"+teacherEmail + "\\nPassword: " + teacherPass;

                resultSet.close();

                // Call the JavaScript function to download the credentials
                out.println("<script>downloadCredentials('" + content + "');</script>");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Registration failed: " + e.getMessage());
        }
    %>
</body>
</html>
<script>
    window.location.href = "<%= request.getParameter("prevLink")%>";
</script>
