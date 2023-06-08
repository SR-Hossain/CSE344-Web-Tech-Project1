import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class My extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("home.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String real_pass = "";

        try {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject", "srhossain", "SR-Hossain7");
            Statement stmt = conn.createStatement();
            String usrr = "";

            if (username.equals("admin")) {
                if (password.equals("admin")) {
                    response.sendRedirect("admin.jsp");
                    return;
                } else {
                    throw new IOException("Incorrect password");
                }
            } else if (username.startsWith("t")) {
                usrr = "teacher";
            } else {
                usrr = "student";
            }

            String query = "SELECT " + usrr + "_pass FROM "+usrr+" WHERE " + usrr + "_id = '" + username + "'";
            ResultSet rs = stmt.executeQuery(query);

            if (rs.next()) {
                real_pass = rs.getString(usrr + "_pass");

                if (real_pass.equals(password)) {
                    if (usrr.equals("teacher")) {
                        response.sendRedirect("teacher.jsp");
                    } else {
                        response.sendRedirect("student.jsp");
                    }
                } else {
                    throw new IOException("Incorrect password");
                }
            } else {
                throw new IOException("User not found");
            }
        } catch (Exception e) {
            response.sendRedirect("login.jsp?error=true");
            e.printStackTrace();
        }
    }
}



