<%-- 
    Document   : processMarathon
    Created on : 15 Jun 2024, 9:06:22 pm
    Author     : Nur Ezreena
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="lab6.com.Database" %>
<%@ page import="lab6.com.Marathon" %>
<%@ page import="lab6.com.MarathonDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marathon Registration Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
        }
        p {
            margin: 10px 0;
        }
        footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background: #f1f1f1;
        }
    </style>
</head>
<body>
    <h1>Marathon Registration Result</h1>

    <jsp:useBean id="myMarathon" class="lab6.com.Marathon" scope="request"/>
    <jsp:setProperty name="myMarathon" property="*"/>

    <%
        int result;
        Database myDB = new Database();
        MarathonDAO marathonDAO = new MarathonDAO();

        try {
            // Add the records
            result = marathonDAO.addDetails(myMarathon);

            // Check if the transaction is successful
            if (result > 0) {
                out.print("<p style='color:green;'>Record with IC No " + myMarathon.getIcno() + " successfully created!</p>");
                out.print("<p>Details of the record are:</p>");
                out.print("<p>IC No: " + myMarathon.getIcno() + "</p>");
                out.print("<p>Name: " + myMarathon.getName() + "</p>");
                out.print("<p>Category: " + myMarathon.getCategory() + "</p>");
            } else {
                out.print("<p style='color:red;'>There was an error! Maybe you have already registered before?</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<p style='color:red;'>An error occurred while processing your registration. Please try again later.</p>");
        } finally {
            // Close the database connection
            myDB.closeConnection();
        }
    %>
    
</body>
</html>
