<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dynamic JSP Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif; /* Set the font family to Arial */
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
            color: #212529;
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


        .registered-button {
            background-image: linear-gradient(to right, #f5ce62, #e43603, #fa7199, #e85a19) !important;
    box-shadow: 0 4px 15px 0 rgba(229, 66, 10, 0.75) !important;
        }

        /* Hover styling for the registered button */
        .registered-button:hover {
            background-color: orange !important;
        }


        .apply-button{
            text-align: right;
            margin-top: 10px;
        }

        .apply-btn{
/*             background-color: green !important; */
            background-image: linear-gradient(to right, #0ba360, #3cba92, #30dd8a, #2bb673) !important;
            box-shadow: 0 4px 15px 0 rgba(23, 168, 108, 0.75);
        }



        .btn {
            min-width: 200px;
        /*     font-size: 16px; */
        /*     font-weight: 600; */
            color: #fff;
            cursor: pointer;
        /*     margin: 20px; */
        /*     height: 55px; */
            text-align:center;
            border: none;
            background-size: 300% 100%;

            border-radius: 10px;
            moz-transition: all .4s ease-in-out;
            -o-transition: all .4s ease-in-out;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;

            background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
            box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);

        }

        .btn:hover {
            background-position: 100% 0;
            moz-transition: all .4s ease-in-out;
            -o-transition: all .4s ease-in-out;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        .btn:focus {
            outline: none;
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




        // Function to toggle registration for a single course
        function toggleRegistration(button) {
            if (button.classList.contains('registered-button')) {
                button.textContent = 'Deselect';
            } else {
                button.textContent = 'Register';
            }
            button.classList.toggle('registered-button');
        }

        // Function to handle "Register All" button click
        function registerAll(rootButton) {

            const registerButtons = document.querySelectorAll('.btn-primary:not(.apply-btn .register-all-btn)');

            if(rootButton.classList.contains("clicked")){
                rootButton.textContent = "Deselect All";
                registerButtons.forEach(button => {
                    if(!button.classList.contains('registered-button')){button.textContent = 'Deselect';button.classList.toggle('registered-button');}
                });
            }
            else{
                rootButton.textContent = "Register All";
                registerButtons.forEach(button => {
                    if(button.classList.contains('registered-button')){button.textContent = 'Register';button.classList.toggle('registered-button');}
                });
            }
            rootButton.classList.toggle('clicked');
            rootButton.classList.toggle('registered-button');
        }
    </script>
</head>
<body>
    <%
        String studentId = (String) session.getAttribute("username");

        if(studentId==null || studentId.startsWith("t") || studentId.startsWith("admin")){
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
            String query = "SELECT * FROM student WHERE student_id=" + studentId;
            rs = stmt.executeQuery(query);

            String username = studentId;
            String studentDept = "error";
            if (rs.next()) {
                username = rs.getString("student_name");
                studentDept = rs.getString("department");
            }
    %>

    <div class="header">
        <h1>Student Dashboard</h1>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="toggleDropdown()">
                <%= username %>
            </button>
            <div class="dropdown-menu" id="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">student ID: <%= studentId %></a>
                <a class="dropdown-item" href="#">Department: <%= studentDept %></a>
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
                    <th>Course Semester</th>
                    <th>Teacher</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String courseQuery = "select course_reg.course_id, department.course_name, department.course_credit, department.semester, department.teacher_id, teacher.teacher_name, student_course_registration_done from course_reg join department on  department.course_id=course_reg.course_id join student on student.department=department.department and student.semester>=department.semester and student.student_id="+studentId+" left join teacher on teacher.teacher_id=department.teacher_id;";
                    ResultSet courseRs = stmt.executeQuery(courseQuery);

                    int rowCounter = 1;
                    while (courseRs.next()) {
                        String courseId = courseRs.getString("course_id");
                        String courseName = courseRs.getString("course_name");
                        String courseCredit = courseRs.getString("course_credit");
                        String teacherName = courseRs.getString("teacher_name");
                        String courseSemester = courseRs.getString("semester");
                        int courseRegistrationDone = courseRs.getInt("student_course_registration_done");
                        boolean isCourseRegistered = (courseRegistrationDone == 1);

                        String rowClass = "fade-in";
                        if (rowCounter % 2 == 0) {
                            rowClass += " even-row";
                        }
                %>
                        <tr class="<%= rowClass %>">
                            <td><%= courseId %></td>
                            <td><%= courseName %></td>
                            <td><%= courseCredit %></td>
                            <td><%= courseSemester %></td>
                            <td><%= teacherName %></td>
                            <td>
                                <% // Add the condition to enable/disable the Register button based on course_registration_done %>
                                <% if (isCourseRegistered) { %>
                                    <button class="btn btn-secondary" disabled>Registered</button>
                                <% } else { %>
                                    <button class="btn btn-primary" onclick="toggleRegistration(this)">Register</button>

                                <% } %>
                                <script>
                                    function toggleRegistration(button) {
                                        button.classList.toggle('registered-button'); // Toggle the "registered-button" class
                                        // button.disabled = true; // Disable the button after clicking

                                        if (button.classList.contains('registered-button')) {
                                            button.textContent = 'Deselect'; // Update the button text to "Registered" when toggled
                                        } else {
                                            button.textContent = 'Register'; // Update the button text to "Register" when toggled back
                                        }
                                    }
                                </script>
                            </td>
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
            <tfoot>
            <tr>
                <td colspan="6" class="apply-button">
                <button class="btn register-all-btn clicked" onclick="registerAll(this)">Register All</button>
                <button class="btn apply-btn" onclick="applyRegistration()">Apply</button>

                </td>
            </tr>
            </tfoot>
        </table>
        <div id="result-container"></div>


    </div>
    <script>
        function applyRegistration() {
            const registeredRows = document.querySelectorAll('.registered-button');
            const courseIDs = Array.from(registeredRows).map(button => {
                button.disabled = true; // Disable the button
                button.classList.remove('btn-primary'); // Remove the "btn-primary" class
                button.classList.add('btn-secondary'); // Add the "btn-secondary" class
                button.textContent = 'Registered'; // Update the button text to "Registered"
                button.classList.remove('registered-button');

                return button.parentNode.parentNode.querySelector('td:first-child').textContent;
            });
            const courseIDString = courseIDs.join('\', \''); // Join the course IDs with commas
            const allCourse = "update course_reg set student_course_registration_done=1 where course_id in ('" + courseIDString + "') and student_id="+ '<%= studentId %>' ;

            window.location.href = "register.jsp?prevLink=student.jsp&&message=" + encodeURIComponent(allCourse);

            const resultContainer = document.getElementById('result-container');
            resultContainer.textContent = allCourse; // Display the course IDs with a label

            // Optional: Scroll to the result container for better visibility
            resultContainer.scrollIntoView({ behavior: 'smooth' });

            // Send an AJAX request to the same JSP file
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
