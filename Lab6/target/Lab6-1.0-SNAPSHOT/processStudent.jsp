<%-- 
    Document   : processStudent
    Created on : 15 Jun 2024, 8:06:07 pm
    Author     : Nur Ezreena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page errorPage="errorStudent.jsp"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Process Student</title>
 </head>
 <body>
    <jsp:useBean id="myStudent" class="lab6.com.Student" scope="request"/>
    <jsp:setProperty name="myStudent" property="*"/>
 
    <%
        int result;
        try {
            // Step 1: Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Step 1: MySQL driver loaded...!");

            // Step 2: Establish the connection
            String myURL = "jdbc:mysql://localhost:3306/lab6_csm3023";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
            System.out.println("Step 2: Database is connected...!");

            // Step 3: Create a PreparedStatement object
            String sInsertQry = "INSERT INTO student(stuno, stuname, stuprogram) VALUES(?, ?, ?)";
            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);

            // Assign each value to respective columns for Student's table (C-Create)
            String studentNo = myStudent.getStuno();
            if (studentNo.length() > 10) {
                throw new Exception("Student number exceeds maximum length of 10 characters.");
            }
            
            myPS.setString(1, studentNo);
            myPS.setString(2, myStudent.getName());
            myPS.setString(3, myStudent.getProgram());

            result = myPS.executeUpdate();
            if (result > 0) {
                out.println("\tRecord successfully added into Student table...!");
                out.print("<p style='color:blue;'>" + "Record with student no " + myStudent.getStuno() + " successfully created..!" + "</p>");
                out.print("<p style='color:blue;'>" + "Details of record are; " + "</p>");
                out.print("<p style='color:blue;'>Student ID : " + myStudent.getStuno() + "</p>");
                out.print("<p style='color:blue;'>Name : " + myStudent.getName() + "</p>");
                out.print("<p style='color:blue;'>Program : " + myStudent.getProgram() + "</p>");
            }

            // Step 5: Close database connection
            myConnection.close();
            System.out.println("Database connection is closed..!");
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    %>
 </body>
</html>
