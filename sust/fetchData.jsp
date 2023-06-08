<%@ page contentType="application/json; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>

<%
    // Retrieve the command parameter from the AJAX request
    String command = request.getParameter("command");

    // Establish a database connection
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject", "srhossain", "SR-Hossain7");
        statement = connection.createStatement();

        // Execute the SQL command and retrieve the data
        resultSet = statement.executeQuery(command);

        // Convert the ResultSet to JSON array
        JSONArray jsonArray = new JSONArray();
        ResultSetMetaData metaData = resultSet.getMetaData();
        int columnCount = metaData.getColumnCount();

        while (resultSet.next()) {
            JSONObject jsonObject = new JSONObject();

            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnName(i);
                String columnValue = resultSet.getString(i);
                jsonObject.put(columnName, columnValue);
            }

            jsonArray.add(jsonObject);
        }

        // Output the JSON array as the response
        response.getWriter().write(jsonArray.toString());
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database resources
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    }
%>
