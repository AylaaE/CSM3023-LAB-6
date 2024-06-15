<%-- 
    Document   : insertStudent
    Created on : 15 Jun 2024, 8:04:04 pm
    Author     : Nur Ezreena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head> 
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>Student Registration</title>
 </head>
 <body>
    <fieldset>
        <legend>Student Registration</legend>
        <form action="processStudent.jsp" method="POST">
            <table>
                <tr>
                    <td><label for="stuno">Student No</label></td>
                    <td><input type="text" id="stuno" name="stuno" placeholder="E.g.:UKXXXXXX" required></td>
                </tr>
                <tr>
                    <td><label for="name">Name</label></td>
                    <td><input type="text" id="name" name="name" placeholder="Enter your name" required></td>
                </tr>
                <tr>
                    <td><label for="program">Program</label></td>
                    <td>
                        <select id="program" name="program" required>
                            <option value="BSc. Soft. Eng.">BSc. Soft. Eng.</option>
                            <option value="BSc. with IM">BSc. with IM</option>
                            <option value="BSc. in Networking">BSc. in Networking</option>
                            <option value="BSc. in Robotics">BSc. in Robotics</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br>
                        <button type="submit" value="Submit">Submit</button>
                        <button type="reset" value="Reset">Cancel</button>
                    </td>
                </tr>
            </table>
        </form>
    </fieldset>
    <br>
 </body>
</html>
