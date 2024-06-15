<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page errorPage="login.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exercise</title>
    </head>
    <body>
        <jsp:useBean id="myUser" class="lab6.com.User" scope="request"/>
        <jsp:setProperty name="myUser" property="*"/>
        
        <%
            int result;
            
            //Step 1: Load JDBC driver..
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Step 1: MySQL driver loaded...!");
            
            //Step 2: Establish the connection
            String myURL = "jdbc:mysql://localhost:3306/lab6_csm3023";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
            System.out.println("Step 2: Database is connected...!");
            
            //Step 3: Create a PreparedStatement object...
            System.out.println("Step3: Prepared Statements created...!");
            String sInsertQry = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES(?, ?, ?, ?)";
            System.out.println("\tSQL Query: " + sInsertQry);
            
            //Call method preparedStatement
            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
            
            //Assign each value to respective columns for Student's table.. (C-Create)
            myPS.setString(1, myUser.getUsername());
            myPS.setString(2, myUser.getPassword());
            myPS.setString(3, myUser.getFirstname());
            myPS.setString(4, myUser.getLastname());
            
            result = myPS.executeUpdate();
            if (result > 0){
                out.println("\tRecord successfully added into User table...!");
                out.print("<p>" + "Record with Username " +myUser.getUsername()
                        + " successfully created..!" + "</p>");
                out.print("<p>" + "Details of record are; " + "</p>");
                out.print("<p>Username : " + myUser.getUsername() + "</p>");
                out.print("<p>Firstname : " + myUser.getFirstname() + "</p>");
                out.print("<p>Lastname : " + myUser.getLastname() + "</p>");
            }
            //Step5: close database connection..!
                System.out.println("Step 5: Close database connection..!");
                myConnection.close();
                System.out.println(" ");
                System.out.println("Database connection is closed..!");
        %>
    </body>
</html>