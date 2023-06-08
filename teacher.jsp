<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery UI library -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>

    <title>Dynamic JSP Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Courier new', monospace; /* Set the font family to Arial */
            background-image: url("res/background.jpg"); /* Set the background image path */
            background-repeat: repeat !important;
            background-size: cover;
        }
        /* Add custom animation */
        @keyframes fadeInRow {
            0% {
                opacity: 0;
                transform: translateX(100%);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Apply background styling */
        .fade-in {
            position: relative;
            background-color: rgba(0, 128, 0, 0.2);
            animation: fadeInRow 0.5s ease forwards;
        }

        /* Styling for the header */
        .header {
            background-color: #333;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Styling for the dropdown */
        .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            display: none;
            float: left;
            min-width: 10rem;
            padding: 0.5rem 0;
            margin: 0.125rem 0 0;
            font-size: 1rem;
            color: #212529;
            text-align: left;
            list-style: none;
            background-color: #f8f9fa;
            background-clip: padding-box;
            border: 1px solid rgba(0, 0, 0, 0.15);
            border-radius: 0.25rem;
            right: auto; /* Remove the 'right' property */

            background-image: linear-gradient(to right, grey, #2b5876, #4e4376);
            box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);
        }
        .dropdown-menu:hover{
            background-position: 100% 0;
            moz-transition: all .4s ease-in-out;
            -o-transition: all .4s ease-in-out;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }
        .dropdown-menu :focus{
            outline: none;
        }



        .dropdown-menu.show {
            display: block;
            max-height: calc(100vh - 110px); /* Adjust the value according to your needs */
            overflow-y: auto;
            left: auto;
            right: 0;
        }


        .dropdown-item {
            display: block;
            width: 100%;
            padding: 0.25rem 1.5rem;
            clear: both;
            font-weight: 400;
/*             color: #212529; */
            text-align: inherit;
            white-space: nowrap;
            background-color: transparent;
            border: 0;
        }

        /* Animation */
        .fade-in {
            animation: fadeInAnimation ease-in 1s;
            animation-fill-mode: forwards;
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

        .hide {
        display: none;
        }

        .show {
        display: table;
        }





        @keyframes fadeInAnimation {
            0% {
                opacity: 0;
                transform: translateX(100%);
            }
            100% {
                opacity: 1;
                transform: translateX(0%);
            }
        }
    </style>
    <script>
        // Add animation to table rows
        const tableRows = document.querySelectorAll('.fade-in');
        tableRows.forEach((row, index) => {
            row.style.animationDelay = `${index * 0.2}s`;
        });

        // Toggle dropdown menu
        function toggleDropdown() {
            const dropdownMenu = document.getElementById('dropdown-menu');
            dropdownMenu.classList.toggle('show');

            // Adjust dropdown position if it goes beyond the screen width
            const dropdownButton = document.getElementById('dropdownMenuButton');
            const dropdownMenuRect = dropdownMenu.getBoundingClientRect();
            const dropdownButtonRect = dropdownButton.getBoundingClientRect();

            const rightEdge = dropdownButtonRect.left + dropdownMenuRect.width;
            if (rightEdge > window.innerWidth) {
                dropdownMenu.style.right = '0';
                dropdownMenu.style.left = 'auto';
            } else {
                dropdownMenu.style.right = 'auto';
                dropdownMenu.style.left = '0';
            }
        }






        // Close dropdown menu when clicking outside
        window.onclick = function (event) {
            if (!event.target.matches('.dropdown-toggle')) {
                const dropdownMenu = document.getElementById('dropdown-menu');
                if (dropdownMenu.classList.contains('show')) {
                    dropdownMenu.classList.remove('show');
                }
            }
        }

        // Function to logout the user
                function logout() {
            window.location.href = "logout.jsp";
        }
    </script>
</head>
<body>
    <%
        String teacherId = (String) session.getAttribute("username");

        if(!teacherId.startsWith("t")){
            // jump to error page
            response.sendRedirect("error.jsp");
            return;
        }
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject", "srhossain", "SR-Hossain7");
            stmt = conn.createStatement();
            String query = "SELECT * FROM teacher WHERE teacher_id='" + teacherId + "'";
            rs = stmt.executeQuery(query);

            String username = teacherId;
            String teacherDept = "error";
            if (rs.next()) {
                username = rs.getString("teacher_name");
                teacherDept = rs.getString("teacher_department");
            }
    %>

    <div class="header">
        <h1>Teacher Dashboard</h1>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="toggleDropdown()">
                <%= username %>
            </button>
            <div class="dropdown-menu" id="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">Teacher ID: <%= teacherId %></a>
                <a class="dropdown-item" href="#">Department: <%= teacherDept %></a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" onclick="logout()">Logout</a>
            </div>
        </div>
    </div>
    <div class="container table-container">
        <table class="table">
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Credit</th>
                    <th>Department</th>
                    <th>Course Semester</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String courseQuery = "select * from department where teacher_id='" + teacherId + "'";
                    ResultSet courseRs = stmt.executeQuery(courseQuery);

                    int rowCounter = 1;
                    while (courseRs.next()) {
                        String courseId = courseRs.getString("course_id");
                        String courseName = courseRs.getString("course_name");
                        String courseCredit = courseRs.getString("course_credit");
                        String dept = courseRs.getString("department");
                        String courseSemester = courseRs.getString("semester");

                        String rowClass = "fade-in";
                        if (rowCounter % 2 == 0) {
                            rowClass += " even-row";
                        }
                %>
                        <tr class="<%= rowClass %>" onclick="showStudents('<%= courseId %>', '<%= courseSemester %>', '<%= teacherId %>', event)">
                            <td><%= courseId %></td>
                            <td><%= courseName %></td>
                            <td><%= courseCredit %></td>
                            <td><%= dept %></td>
                            <td><%= courseSemester %></td>
                        </tr>
                <%
                        rowCounter++;
                    }

                    courseRs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
    </div>
    <script>
    var $j = jQuery.noConflict();
function showStudents(course_id, semester, teacher_id, event) {
    let clickedRow = event.target.parentNode;
    let nextSibling = clickedRow.nextElementSibling;

    // Check if the next sibling exists and has the class "student-table"
    if (nextSibling && nextSibling.classList.contains("student-table")) {
        // Table is already visible, so hide it
        clickedRow.parentNode.removeChild(nextSibling);
    } else {
        // Table is not visible, so insert it after the clicked row

        // Construct the SQL query
        const query = "SELECT distinct course_reg.student_id, student.student_name " +
                    "FROM course_reg, department, student " +
                    "WHERE course_reg.student_course_registration_done = 1 " +
                    "AND course_reg.course_id = '" + course_id + "' " +
                    "AND student.student_id = course_reg.student_id " +
                    "AND student.semester = department.semester " +
                    "AND student.semester = " + semester + " order by course_reg.student_id";

        // Create a new table row to hold the student data



        // Execute the query and fetch the student data
        // Replace this with your actual code to execute the query and fetch the data from the database
        // ...

        $j.ajax({
            url: "fetchData.jsp", // the JSP file that fetches data from MySQL
            method: "GET",
            data: {
            command:
                query,
            },
            success: function(response) {
                let tableRow = document.createElement("tr");
                let tableCol = document.createElement("td");
                tableCol.setAttribute("colspan", "5");
                tableRow.appendChild(tableCol);
                tableRow.classList.add("student-table");
                let tableTable = document.createElement("table");
                tableCol.appendChild(tableTable);
                // let tableHTML = '<table>';

                // Create the table body rows
                // tableHTML += '<tbody>';
                response.forEach(function(row) {
                    let trow = document.createElement("tr");
                    let cellStudentId = document.createElement("td");
                    cellStudentId.setAttribute("colspan", "2");
                    let cellStudentName = document.createElement("td");
                    cellStudentName.setAttribute("colspan", "2");
                    // cellStudentId.appendChild(document.createTextNode(student.student_id));
                    // cellStudentName.appendChild(document.createTextNode(student.student_name));
                    // trow.appendChild(cellStudentId);
                    // trow.appendChild(cellStudentName);
                    // tableTable.appendChild(trow);*/
                    var ind = 1;
                    for (const key in row) {
                        if (ind==2){
                            cellStudentId.appendChild(document.createTextNode(row[key]));
                        }
                        else{
                            cellStudentName.appendChild(document.createTextNode(row[key]));
                        }
                        ind+=1;
                        // let cellStudentId = document.createElement("td");
                        // cellStudentId.setAttribute("colspan", "2");
                        // cellStudentId.appendChild(document.createTextNode(row[key]));
                        // trow.appendChild(cellStudentId);

                        // tableHTML += '<td>' + row[key] + '</td>';
                    }
                    trow.appendChild(cellStudentId);
                    trow.appendChild(cellStudentName);
                    tableTable.appendChild(trow);
                    // tableHTML += '</tr>';
                });
                // tableHTML += '</tbody>';

                // tableHTML += '</table>';
                clickedRow.parentNode.insertBefore(tableRow, nextSibling);


            },


            error: function (xhr, status, error) {
            alert("Error: " + query);
            }
        });

        // Example data for testing
        let studentData = [
            { student_id: "1", student_name: "John Doe" },
            { student_id: "2", student_name: "Jane Smith" },
            { student_id: "3", student_name: "Mike Johnson" }
        ];



        // Create the table cells for student ID and student name


        // Append the student ID and student name to the table cells
        // studentData.forEach(function(student) {
        //     let trow = document.createElement("tr");
        //     let cellStudentId = document.createElement("td");
        //     cellStudentId.setAttribute("colspan", "2");
        //     let cellStudentName = document.createElement("td");
        //     cellStudentName.setAttribute("colspan", "2");
        //     cellStudentId.appendChild(document.createTextNode(student.student_id));
        //     cellStudentName.appendChild(document.createTextNode(student.student_name));
        //     trow.appendChild(cellStudentId);
        //     trow.appendChild(cellStudentName);
        //     tableTable.appendChild(trow);
        // });
        //
        //
        // // Insert the table row after the clicked row
        // clickedRow.parentNode.insertBefore(tableRow, nextSibling);
    }
}




    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
