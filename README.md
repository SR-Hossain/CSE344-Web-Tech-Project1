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

1. Clone the project repository by the name "sust":
   ```bash
   git clone https://github.com/SR-Hossain/CSE344-Web-Tech-Project1.git sust
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


# Installation Process

## Ubuntu
Here are the detailed instructions for setting up and running a Java Servlet project with Tomcat 9, MySQL, Notepad, and Terminal in Debian based Linux Kernels:

## Prerequisites

- Java Development Kit (JDK): Make sure you have Java JDK installed on your system. You can check if it's already installed by running `java -version` in the Terminal. If it's not installed, you can install it using the following command:
  ```
  sudo apt-get install openjdk-8-jdk
  ```

- Apache Tomcat 9: Download the Tomcat 9 package from the Apache website or use the following command to install it:
  ```
  sudo apt-get install tomcat9
  ```

- MySQL: Install MySQL by running the following command in the Terminal:
  ```
  sudo apt-get install mysql-server
  ```



## Project Setup

1. Download this repository by the name "sust" and copy the sust folder into your webapps folder of tomcat9:
   ```bash
   git clone https://github.com/SR-Hossain/CSE344-Web-Tech-Project1.git sust
   sudo cp sust /var/lib/tomcat9/webapps/
   ```

2. Navigate to the project directory: Use the following command to navigate to the newly created project directory:
   ```bash
   cd /var/lib/tomcat9/webapps/sust
   ```

3. Compile the source files: In the Terminal, compile the Java source files using the following command:
   ```
   sudo javac -cp /usr/share/tomcat9/lib/servlet-api.jar /var/lib/tomcat9/webapps/sust/WEB-INF/classes/My.java -d /var/lib/tomcat9/webapps/sust/WEB-INF/classes/
   ```

   This command includes the servlet API JAR file and MySQL Connector JAR file in the classpath.

4. Restart Tomcat9 server
```bash
sudo systemctl restart tomcat9
```

## Database Setup

1. Start MySQL service: Use the following command to start the MySQL service:
   ```
   sudo service mysql start
   ```

2. To create a user in MySQL, you can follow these steps:

    i. Open the Terminal and log in to MySQL as the root user:
    ```
    mysql -u root -p
    ```

    ii. Enter the MySQL root password when prompted.

    iii. Create a new user with the desired username and password. Replace `new_username` and `new_password` with your preferred values: the below command is recommended to run the servlets without any more pain...
    ```sql
    CREATE USER 'srhossain'@'localhost' IDENTIFIED BY 'SR-Hossain7';
    ```

    If you want to allow the user to connect from any host, you can use `'%'` instead of `'localhost'`:
    ```sql
    CREATE USER 'new_username'@'%' IDENTIFIED BY 'new_password';
    ```

    iv. Grant privileges to the user. You can grant specific privileges to the user or use the `ALL PRIVILEGES` keyword to grant all privileges. Replace `database_name` with the name of the database you want to grant access to:
    ```sql
    GRANT ALL PRIVILEGES ON database_name.* TO 'srhossain'@'localhost';
    ```

    If you want to grant access to all databases, you can use the wildcard `*`:
    ```sql
    GRANT ALL PRIVILEGES ON *.* TO 'srhossain'@'localhost';
    ```

    v. Flush the privileges to apply the changes:
    ```sql
    FLUSH PRIVILEGES;
    ```

    vi. Exit the MySQL shell:
    ```sql
    exit;
    ```

    That's it! You have successfully created a new user in MySQL.
2. Access MySQL: Log in to MySQL using the following command and then when prompted give your mysql password that you just set up:
   ```bash
   mysql -u srhossain -p
   ```

3. Create a database: In the MySQL shell, execute the following command to create a new database:
   ```sql
   CREATE DATABASE webproject;
   use webproject;
   ```

4. Create tables: Here are the step-by-step instructions to create the tables in MySQL:

    a. Student Table:
    ```sql
    CREATE TABLE student (
        student_id INT NOT NULL PRIMARY KEY,
        student_name VARCHAR(255),
        student_email VARCHAR(255),
        department VARCHAR(255),
        semester INT,
        student_pass VARCHAR(255)
    );
    ```

    b. Teacher Table:
    ```sql
    CREATE TABLE teacher (
        teacher_main_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        teacher_id VARCHAR(255),
        teacher_name VARCHAR(255),
        teacher_email VARCHAR(255),
        teacher_pass VARCHAR(255),
        teacher_department VARCHAR(255)
    );
    ```

    c. Department Table:
    ```sql
    CREATE TABLE department (
        department VARCHAR(255),
        semester INT,
        course_id VARCHAR(255),
        course_name VARCHAR(255),
        course_credit DECIMAL(3, 2),
        teacher_id VARCHAR(255),
        course_dept VARCHAR(255)
    );
    ```

    d. Course Registration Table:
    ```sql
    CREATE TABLE course_reg (
        course_id VARCHAR(255),
        student_id INT,
        student_course_registration_done TINYINT(1),
        course_registration_eligible TINYINT(1)
    );
    ```

    That's it! You have created the tables in MySQL. Each table is defined with its columns and data types. You can execute these SQL statements in your MySQL database to create the tables.

5. Here are the insertion commands to populate the "department" table in MySQL:

```sql
INSERT INTO department (department, semester, course_id, course_name, course_credit, teacher_id, course_dept)
VALUES ('CSE', 1, 'CSE101', 'Discrete Math', 3.00, NULL, 'CSE');

INSERT INTO department (department, semester, course_id, course_name, course_credit, teacher_id, course_dept)
VALUES ('CSE', 1, 'CSE127', 'C Programming', 3.00, NULL, 'CSE');

INSERT INTO department (department, semester, course_id, course_name, course_credit, teacher_id, course_dept)
VALUES ('CSE', 1, 'CSE147', 'Ethics', 3.00, NULL, 'CSE');

INSERT INTO department (department, semester, course_id, course_name, course_credit, teacher_id, course_dept)
VALUES ('CSE', 1, 'CSE137', 'Data Structure', 3.00, NULL, 'CSE');

INSERT INTO department (department, semester, course_id, course_name, course_credit, teacher_id, course_dept)
VALUES ('CSE', 2, 'CSE178', 'Electrical', 3.00, NULL, 'EEE');

INSERT INTO department (department, semester, course_id, course_name, course_credit, teacher_id, course_dept)
VALUES ('CSE', 2, 'MAT101', 'Calculus', 3.00, NULL, 'MAT');

INSERT INTO department (department, semester, course_id, course_name, course_credit, teacher_id, course_dept)
VALUES ('CSE', 2, 'MAT103', 'Matrix', 3.00, NULL, 'MAT');

INSERT INTO department (department, semester, course_id, course_name, course_credit, teacher_id, course_dept)
VALUES ('CSE', 2, 'CSE188', 'Algorithm', 3.00, NULL, 'CSE');
```

These commands will insert the respective rows into the "department" table. Make sure to execute these SQL statements in your MySQL database to populate the table with the given data.

## Deploying the Project

Access the application: Open a web browser and visit `http://localhost:8080/sust`. You should see your servlet application running.

## Making Changes to the Project

1. Edit the source files: Use Notepad or any text editor to make changes to your servlet source files.

2. Recompile the source files: In the Terminal, navigate to the project directory and recompile the Java source files:
   ```bash
   sudo javac -cp /usr/share/tomcat9/lib/servlet-api.jar /var/lib/tomcat9/webapps/sust/WEB-INF/classes/My.java -d /var/lib/tomcat9/webapps/sust/WEB-INF/classes/

   sudo systemctl restart tomcat9
    ```
3. If the mysql doesn't work, try restarting
```bash
sudo systemctl restart mysql
sudo systemctl stop mysql
sudo systemctl start mysql
```
4. Change your mysql user info in the jsp files to execute sql command.
