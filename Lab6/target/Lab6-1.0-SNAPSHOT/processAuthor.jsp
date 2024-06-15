<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="myAuthor" class="lab6.com.Author" scope="request"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Process Author</title>
</head>
<body>
    <h1>Task 2 - Perform creating and retrieving records via JSP page</h1>

    <jsp:setProperty name="myAuthor" property="*"/>

    <%
        try {
       
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            String myURL = "jdbc:mysql://localhost:3306/lab6_csm3023";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

            // Prepare SQL insert statement
            String sInsertQry = "INSERT INTO author(authno, name, address, city, state, zip) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
            myPS.setString(1, myAuthor.getAuthno());
            myPS.setString(2, myAuthor.getName());
            myPS.setString(3, myAuthor.getAddress());
            myPS.setString(4, myAuthor.getCity());
            myPS.setString(5, myAuthor.getState());
            myPS.setString(6, myAuthor.getZip());

            // Execute update
            int result = myPS.executeUpdate();

            // Check result and print corresponding messages
            if (result > 0) {
                out.println("<p style='color:blue;'>Record successfully added into Author table...!</p>");
                out.print("<p style='color:blue;'>Record with author no " + myAuthor.getAuthno() + " successfully created..!</p>");
                out.print("<p style='color:blue;'>Details of record are:</p>");
                out.print("<p style='color:blue;'>Name: " + myAuthor.getName() + "</p>");
                out.print("<p style='color:blue;'>Address: " + myAuthor.getAddress() + "</p>");
                out.print("<p style='color:blue;'>City: " + myAuthor.getCity() + "</p>");
                out.print("<p style='color:blue;'>State: " + myAuthor.getState() + "</p>");
                out.print("<p style='color:blue;'>Zip: " + myAuthor.getZip() + "</p>");
            } else {
                out.println("<p style='color:red;'>Failed to add record into Author table.</p>");
            }

            // Close database connection
            myConnection.close();
        } catch (ClassNotFoundException e) {
            out.println("<p style='color:red;'>JDBC Driver not found: " + e.getMessage() + "</p>");
        } catch (SQLException e) {
            out.println("<p style='color:red;'>SQL Error: " + e.getMessage() + "</p>");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    %>

</body>
</html>
