<%-- 
    Document   : errorStudent
    Created on : 15 Jun 2024, 8:34:06 pm
    Author     : Nur Ezreena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>errorStudent</title>
 </head>
 <body>
    <form id="errorFrm" action="insertStudent.jsp" method="post">
        <p>Error occur when inserting record...!</p>
        <p>Error Message: ${exception.getMessage()}</p>
        <br>
    </form>
 </body>
</html>