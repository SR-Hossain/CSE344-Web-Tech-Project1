# CSE344-Web-Tech-Project1

This is a web-based project developed using Java Servlets and Tomcat 9.

## Project Description

The CSE344-Web-Tech-Project1 is a web application that provides functionality for a student management system. It allows users to register as students or teachers, log in to their respective accounts, and perform various operations based on their roles.

The project includes the following key features:

- User registration: Students and teachers can register for an account using the registration form (`register.jsp`).
- User authentication: The login functionality (`login.jsp`) allows registered users to log in to their accounts securely.
- Role-based access control: Different functionalities are provided based on the user's role (student or teacher).
- Student Dashboard: The student dashboard (`student.jsp`) displays information about the student, such as assignments, grades, etc.
- Teacher Dashboard: The teacher dashboard (`teacher.jsp`) allows teachers to manage students, assign tasks, and view student submissions.
- Error handling: Custom error pages (`error.jsp`) are provided to handle various error scenarios and display appropriate messages to the user.

## Getting Started

To run the project locally, you need to have Tomcat 9 or a compatible servlet container installed. Follow these steps:

1. Clone the project repository:
   ```bash
   git clone https://github.com/<username>/CSE344-Web-Tech-Project1.git
   ```

2. Deploy the project:
   - Open the Tomcat installation directory and navigate to the `webapps` directory.
   - Create a new directory called `sust`.
   - Copy the project files and directories into the `sust` directory.
   - Start the Tomcat server.

3. Access the application:
   - Open a web browser and visit `http://localhost:8080/sust`.
   - The application should be up and running, and you can interact with it.

## Project Structure

The project directory structure is as follows:

- `add_student.jsp`: Page to add a new student to the system.
- `admin.jsp`: Admin dashboard with administrative functionalities.
- `error.jsp`: Custom error page to handle and display error messages.
- `home.jsp`: Home page of the application.
- `login.jsp`: Login page for users to authenticate themselves.
- `register.jsp`: User registration page.
- `student.jsp`: Student dashboard displaying student-specific information.
- `teacher.jsp`: Teacher dashboard for managing students and assignments.
- `welcome.jsp`: Welcome page after successful login.
- `WEB-INF/`: Directory containing web application configuration files and resources.
    - `classes/`: Directory containing compiled Java classes.
        - `My.class`: Servlet class for handling HTTP requests and responses.
        - `My.java`: Source code for the servlet class.
    - `lib/`: Directory containing external libraries used by the project.
        - `json-simple-1.1.1.jar`: JSON library for parsing and generating JSON data.
        - `jsoup-1.16.1.jar`: Java HTML parser library for web scraping and manipulation.
        - `mysql-connector-j-8.0.33.jar`: JDBC driver for connecting to MySQL database.
    - `web.xml`: Deployment descriptor file that configures the web application.

- `res/`: Directory containing additional resources used by the project.
    - `background.jpg`: Background image used in the application.
    - `student.jpg`, `student2.jpg`, `student3.jpg`: Images related to student profiles.
    - `teacher.jpg`, `teacher2.jpg`: Images related to teacher
