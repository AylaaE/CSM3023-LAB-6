<%-- 
    Document   : SampleInsertionRecord
    Created on : 5 Jun 2024, 3:47:32 pm
    Author     : Nur Ezreena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lab 6 - Task 1 - Sample Insertion records into MYSQL through JSP's page</h1>
        
        <%
            int result;
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            out.println("Step 1 : MySQL driver loaded..!");
        %>
        <br>
        <% 
            String myURL = "jdbc:mysql://localhost/lab6_csm3023";
            // Step 2: Establish the connection
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
            out.println("Step 2 : Database is connected...!");
        %>
        <br>
        <% 
            // Step 3: Create a prepared statement
            out.println("Step 3 : Prepared statement created..!");
            // Prepared SQL query as a string
            String sInsertQry = "INSERT INTO FirstTable  VALUES (?)";
            // Call method prepared statement
            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
        %>
        <br>
        <%
            // Step 4: Perform insertion of record
            out.println("Step 4 : Perform insertion of record ..!");
            String name = "Welcome to access MySQL database with JSP...!";
            myPS.setString(1, name);
            
            result = myPS.executeUpdate();
            
            if (result > 0) {
        %>
        <br>
        <%
            out.println("Step 5 : Close Database connection..!");
            
            out.println(" ");
            out.println("Database connection is closed..!");
            
            out.print("<p><font color=\"blue\">" + "The record : (" + name + ") is successfully created..!" + "</font></p>");            }
            //Step 5: Close database connection...!
            myConnection.close();

            
        %>
    </body>
</html>
