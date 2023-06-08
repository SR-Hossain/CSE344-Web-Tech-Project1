<%
        String user = (String) session.getAttribute("username");

        if(user == null){
            response.sendRedirect("login.jsp");
        }
        else if(user.startsWith("t")){
            response.sendRedirect("teacher.jsp");
        }
        else if(user.startsWith("2")){
            response.sendRedirect("student.jsp");
        }
        else if(user.startsWith("admin")){
            response.sendRedirect("admin.jsp");
        }
        else{
            response.sendRedirect("login.jsp");
        }
%>
