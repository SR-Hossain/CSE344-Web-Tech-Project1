<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery UI library -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>

    <title>Flip Card</title>
    <style>
        body{
            background-color: grey;
        }
        .logo {
            width: 100px; /* Adjust the width as needed */
            height: 100px; /* Adjust the height as needed */
            border-radius: 50%; /* Make the image circular */
            object-fit: cover; /* Ensure the image fills the container */
            margin: 10px; /* Adjust the margin as needed */
            grid-column: 2/3;
        }

        .flip-card {
            width: 100%;
            perspective: 1000px;
            cursor: pointer;
        }

        .flip-card-inner {
            width: 100%;
            height: 100vh;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
        }

        .flip-card.is-flipped .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front,
        .flip-card-back {
            width: 100%;
            height: 100%;
            position: absolute;
            backface-visibility: hidden;
        }

        .flip-card-front {
            background-color: #bbb;
            color: black;
        }

        .flip-card-back {
            background-color: dodgerblue;
            color: white;
            transform: rotateY(180deg);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .section {
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            text-align: center;
        }

        .add-student-section {
            background-image: linear-gradient(to bottom, rgba(245, 246, 252, 0.52), black),
                url('res/student3.jpg');
            width: 100%;
            height: 100vh;
            object-fit: cover;
            background-size: cover;
            color: white;
            padding: 20px;
            align-items: center;
            justify-content: center;
        }

        .assign-course-section {
            background-image: linear-gradient(to bottom, rgba(245, 246, 252, 0.52), black),
                url('res/teacher.jpg');
            width: 100%;
            height: 100vh;
            background-size: cover;
            color: white;
            padding: 20px;
        }


        .btn {
            min-width: 200px;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-size: 300% 100%;
            background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
            box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);
            cursor: pointer;
        }

        .btn:hover {
            background-position: 100% 0;
            transition: all .4s ease-in-out;
        }

        .btn:focus {
            outline: none;
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

        .flip-card-back {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .flip-card-back .text-container {
        flex: 1;
        padding: 20px;
    }

    .flip-card-back .form-container {
        flex: 2;
        padding: 20px;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .flip-card.is-flipped .form-container {
        opacity: 1;
        transition-delay: 1.5s;
    }

    .flip-card.is-flipped .text-slide {
        animation: slideInLeft 1.6s forwards;

    }

    @keyframes slideInLeft {
        0% {
            opacity: 0;
            transform: translateX(100%);
        }
        100% {
            opacity: 1;
            transform: translateX(0);
        }
    }

    .centered-section {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh; /* Adjust the height as needed */
        text-align: center;
    }

    .grid-container {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        gap: 20px;
    }

    .text-container {
        grid-column: 1 / 1;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .manage-teacher {
        grid-column: 1/1;
    }
    .form-container {
        grid-column: 2 / 3;
    }
    .tableContainer {
        grid-column: 3/4;
    }

/*
    form{
        height: 520px;
        width: 400px;
        background-color: grey;
        position: absolute;
        transform: translate(-50%,-50%);
        top: 50%;
        left: 50%;
        border-radius: 30px;
        backdrop-filter: blur(10px);
        border: 2px solid rgba(255,255,255,0.1);
        box-shadow: 0 0 40px rgba(8,7,16,0.6);
        padding: 50px 35px;
    }*/
    form {
        height: 520px;
        width: 400px;
        border-radius: 30px;
        padding: 50px 35px;
        font-family: 'Poppins', sans-serif;
        letter-spacing: 0.5px;
        outline: none;
        border: none;
        background-image: url('res/student3.jpg');
        background-color: rgba(0, 0, 0, 0.5); /* Adjust the alpha value to control the darkness */
        backdrop-filter: blur(20px); /* Adjust the blur radius as needed */
        position: relative;
    }

    .teachForm{
        height: 390px;
        background-image: url('res/teacher.jpg') !important;
    }

    .assignTeacherForm{
        height: 220px;
        background: black;
    }

    form h3{
        font-size: 32px;
        font-weight: 500;
        line-height: 42px;
        text-align: center;
    }

    label{
        display: block;
        margin-top: 30px;
        font-size: 16px;
        font-weight: 500;
    }
    input{
        display: block;
        height: 50px;
        width: 100%;
        background-color: grey;
        border-radius: 30px;
        padding: 10 10px;
        margin-top: 8px;
        font-size: 14px;
        font-weight: 300;
        text-align: center;
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
        /* Styling for the header */
        .header {
            background: none;
            color: white;
            padding: 10px;
            height: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    ::placeholder{
        color: #e5e5e5;
    }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    <%
        String user = (String) session.getAttribute("username");

        if(user==null || !user.startsWith("admin")){
            // jump to error page
            response.sendRedirect("error.jsp");
            return;
        }
    %>
<div class="header">
        <h1>Admin</h1>
            <button class="btn" onclick=logout()>
                Log Out
            </button>
    </div>

<div class="flip-card" onclick="flipCard(this, event)">
    <div class="flip-card-inner">
        <div class="flip-card-front">
            <div class="section add-student-section">
                    <div class="section-content">
                        <h2>Add New Student</h2>
                        <p>Click to add a new student.</p>
                    </div>
            </div>
        </div>
        <div class="flip-card-back">
            <div class="section add-student-section centered-section">
                <div class="grid-container">
                <div class="text-container">
                        <h1 class="text-slide">Add New Student</h1>
                </div>
                <div class="form-container">
                    <form id="studentForm" action="process-form" method="post" onclick="stopPropagation(event)">
                    <div>
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div>
                        <label for="student_id">Registration No:</label>
                        <input type="number" id="student_id" name="student_id" required>
                    </div>
                    <div>
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div>
                        <label for="department">Department:</label>
                        <input type="text" id="department" name="department" required>
                    </div>
                    <h1></h1>
                    <button type="submit" class="btn">Submit</button>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>











<div class="flip-card" onclick="flipCard(this, event)">
    <div class="flip-card-inner">
        <div class="flip-card-front">
            <div class="section assign-course-section">
                <div class="container">
                    <div class="section-content">
                        <h2>Assign Courses</h2>
                        <p>Click to manage teachers.</p>
                    </div>
                </div>
            </div>
        </div>
      <div class="flip-card-back">
  <div class="section assign-course-section">
    <div class="grid-container">
      <div class="container">
        <table>
        <tr>

        <td>
            <div class="form-container" id="formContainer" style="display: none;">
                <form id="teacherForm" class="teachForm" action="process-form" method="post" onclick="stopPropagation(event)">
                <div>
                    <label for="name">New Teacher Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div>
                    <label for="department">Department:</label>
                    <input type="text" id="department" name="department" required>
                </div>
                <h1></h1>
                <button type="submit" class="btn">Submit</button>
                </form>
                </div>
            </div>

          </td>

        <td>
          <table class="logo-table">
            <tr>
              <td>
                <img src="res/teacher_logo.png" alt="Teacher Logo" class="logo" onclick="showForm(event)">
              </td>
            </tr>
            <tr>
              <td>
                <img src="res/department_logo.png" alt="Department Logo" class="logo" onclick="showTable(event)">
              </td>
            </tr>

          </table>
          </td>


          <td>
            <div class="form-container" id="showAssignTeacherForm" style="display: none;">
                <form id="assignTeacherForm" class="assignTeacherForm" onclick="stopPropagation(event)">
                <div>
                    <label for="department">Department</label>
                    <input type="text" id="department" name="department" required>
                </div>
                <div>
                    <label for="semester">Semester:</label>
                    <input type="text" id="semester" name="semester" required>
                </div>
                <h1></h1><button class="btn" type="button" onclick=currentTeacher()>Current Teacher</button>
                </form>
                </div>
            </div>

          </td><td>
            <div id="tableContainer" onclick="stopPropagation(event)"></div>
          </td></tr></table>
      </div>
    </div>
  </div>
</div>






<script>

    const studentForm = document.getElementById('studentForm');
    studentForm.addEventListener('submit', function (event) {
        event.preventDefault();
        // Handle student form submission logic

        const form = event.target;

        // Get the input values
        const student_id = form.student_id.value;
        const name = form.name.value;
        const email = form.email.value;
        const department = form.department.value;
        var randomString = generateRandomString(8);

        // Create the string
        const cmd = "insert into student (student_id, student_name, student_email, department, semester, student_pass) values("+student_id+", '"+name+"', '"+email+"', '"+department+"', 1, '"+randomString+"'); insert into course_reg select department.course_id, student.student_id, 0, 0 from department, student where student.department=department.department and student.student_id="+student_id;

        window.location.href = "register.jsp?prevLink=admin.jsp&&message=" + encodeURIComponent(cmd);

        // Display the string
        alert("Save the password for "+student_id+" is: "+randomString);
        console.log('Student form submitted');
        var element = document.createElement('a');
        var content = "Student Id/Username = "+student_id+"\nStudent Name = "+name+"\nStudent Email = "+email+"\nDepartment = "+department+"\nPassword = "+randomString;
        element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(content));
        element.setAttribute('download', 'student_credentials.txt');
        // element.style.display = 'none';
        document.body.appendChild(element);

        // Trigger the download
        element.click();

        // Clean up
        document.body.removeChild(element);
        // ...
        studentForm.submit(); // Uncomment this line to submit the form
    });

    const teacherForm = document.getElementById('teacherForm');
    teacherForm.addEventListener('submit', function (event) {
        event.preventDefault();
        // Handle teacher form submission logic
        const form = event.target;
        const teacher_name = form.name.value;
        const email = form.email.value;
        const department = form.department.value;
        var randomString = generateRandomString(8);

        const cmd = "insert into teacher (teacher_name, teacher_email, teacher_pass, teacher_department) values('"+ teacher_name+"','"+email+"','"+randomString+"','"+department+"');";

        window.location.href = "register.jsp?prevLink=admin.jsp&&message=" + encodeURIComponent(cmd);
        alert("Pass : "+randomString);
        // ...
        teacherForm.submit(); // Uncomment this line to submit the form
    });

    function logout(){
        window.location.href = "logout.jsp";
    }

    // const assignCourse = document.getElementById('assignCourse');
    // assignCourse.addEventListener('submit', function(event) {
    //     event.preventDefault();
    //     // Handle teacher form submission logic
    //     const form = event.target;
    //     const department = form.department.value;
    //     const semester = form.semester.value;
    //
    //     const cmd = "select department, semester, course_id, course_name, teacher.teacher_id, teacher.teacher_name from department, teacher where department.department=teacher.teacher_department and department.department='"+department+"' and department.semester="+semester+";";
    //
    //     // AJAX request to fetch the data from MySQL
    //     $.ajax({
    //         url: "fetchData.jsp", // the JSP file that fetches data from MySQL
    //         method: "GET",
    //         data: { command: cmd },
    //         success: function(response) {
    //             const tableContainer = document.getElementById('tableContainer');
    //             tableContainer.innerHTML = response; // update the table container with the fetched data
    //             tableContainer.style.display = "block"; // show the table container
    //         },
    //         error: function(xhr, status, error) {
    //             console.log("Error: " + error);
    //         }
    //     });
    //
    //     assignCourse.submit(); // submit the form
    // });
    function currentTeacher() {
        const form = document.getElementById('assignTeacherForm');
        const formData = new FormData(form);

        const department = formData.get('department');
        const semester = formData.get('semester');
        const cmd = "SELECT department.department, department.semester, department.course_id, department.course_name, teacher.teacher_id, teacher.teacher_name, course_dept FROM department LEFT JOIN teacher ON department.teacher_id = teacher.teacher_id WHERE (department.teacher_id = teacher.teacher_id OR teacher.teacher_id IS NULL) and department.department='"+department+"' and department.semester="+semester+";";        // AJAX request to fetch the data from MySQL
        $.ajax({
            url: "fetchData.jsp", // the JSP file that fetches data from MySQL
            method: "GET",
            data: {
            command:
                cmd,
            },
            success: function(response) {
                let tableHTML = '<table>';

                // Create the table header row
                tableHTML += '<thead><tr>';
                for (const key in response[0]) {
                    tableHTML += '<th>' + key + '</th>';
                }
                tableHTML += '</tr></thead>';

                // Create the table body rows
                tableHTML += '<tbody>';
                response.forEach(function(row) {
                    tableHTML += '<tr>';
                    for (const key in row) {
                        tableHTML += '<td>' + row[key] + '</td>';
                    }
                    tableHTML += '</tr>';
                });
                tableHTML += '</tbody>';

                tableHTML += '</table>';

                // Get the container element where you want to insert the table
                const tableContainer = document.getElementById('tableContainer');

                // Set the table HTML inside the container element
                tableContainer.innerHTML = tableHTML;
                tableContainer.classList.add('table-container');

                const tableRows = tableContainer.getElementsByTagName('tr');
                for (let i = 0; i < tableRows.length; i++) {
                    tableRows[(tableRows.length+i+1)%tableRows.length].addEventListener('click', function () {
                        // Get the selected teacher ID and name from the clicked row
                        const selectedTeacherId = response[i].teacher_id;
                        const selectedCourseID = response[i].course_id;
                        const selectedDepartment = response[i].department;
                        const selectedSemester = response[i].semester;
                        const selectedCourseDept = response[i].course_dept;

                        // Construct the URL of the destination JSP page with the data as query parameters
                        const url = 'assignTeacher.jsp?semester=' + selectedSemester + '&department=' + selectedDepartment + '&teacherId=' + selectedTeacherId + '&courseId=' + selectedCourseID + '&course_dept=' + selectedCourseDept;

                        // Navigate to the destination JSP page
                        window.location.href = url;
                    });
                }
            },


            error: function (xhr, status, error) {
            alert("Error: " + error);
            },
        });
    }


    function showAssignTable(event) {
        event.preventDefault();
        // Handle teacher form submission logic
        const form = event.target;
        const department = form.department.value;
        const semester = form.semester.value;

        const cmd = "select department, semester, course_id, course_name, teacher.teacher_id, teacher.teacher_name from department, teacher where department.department=teacher.teacher_department and department.department='" + department + "' and department.semester=" + semester + ";";

        // AJAX request to fetch the data from MySQL
        $.ajax({
            url: "fetchData.jsp", // the JSP file that fetches data from MySQL
            method: "GET",
            data: { command: cmd },
            success: function(response) {
                const tableContainer = document.getElementById('tableContainer');
                tableContainer.innerHTML = response; // update the table container with the fetched data
                tableContainer.style.display = "block"; // show the table container
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
            }
        });
    }

    const assignCourseButton = document.getElementById('assignCourse');
    assignCourseButton.addEventListener('click', showAssignTable);


    function showForm(event) {
        event.stopPropagation();
        var formContainer = document.getElementById("formContainer");
        if (formContainer.style.display === "none") {
            formContainer.style.display = "block";
        } else {
            formContainer.style.display = "none";
        }
    }

    function showTable(event) {
        event.stopPropagation();
        var tableContainer = document.getElementById("showAssignTeacherForm");
        if (tableContainer.style.display === "none") {
            tableContainer.style.display = "block";
        } else {
            tableContainer.style.display = "none";
        }
    }
    function flipCard(card, event) {
        card.classList.toggle('is-flipped');
    }



    function stopPropagation(event) {
        event.stopPropagation();
    }

    function generateRandomString(length) {
        var allowedChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        var randomString = '';

        for (var i = 0; i < length; i++) {
        var randomIndex = Math.floor(Math.random() * allowedChars.length);
        var randomChar = allowedChars.charAt(randomIndex);
        randomString += randomChar;
        }

        return randomString;
    }



    function handleSubmit(event) {

        event.preventDefault();

        // Get the form element
        /*
        const form = event.target;

        // Get the input values
        const student_id = form.student_id.value;
        const name = form.name.value;
        const email = form.email.value;
        const department = form.department.value;
        var randomString = generateRandomString(8);

        // Create the string
        const cmd = "insert into student (student_id, student_name, student_email, department, semester, student_pass) values("+student_id+", '"+name+"', '"+email+"', '"+department+"', 1, '"+randomString+"'); insert into course_reg select department.course_id, student.student_id, 0, 0 from department, student where student.department=department.department and student.student_id="+student_id;

        window.location.href = "register.jsp?prevLink=admin.jsp&&message=" + encodeURIComponent(cmd);

        // Display the string
        alert("Save the password for "+student_id+" is: "+randomString);*/
    }

    document.addEventListener('DOMContentLoaded', function () {
        const form = document.querySelector('form');
        form.addEventListener('submit', handleSubmit);
    });
</script>

</body>
</html>
