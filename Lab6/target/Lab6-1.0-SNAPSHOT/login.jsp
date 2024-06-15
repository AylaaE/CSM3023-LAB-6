<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Exercise - User Login</title>
</head>
<body>
    <h1>Login</h1>
    <fieldset>
        <legend>User Login</legend>
        <form action="doLogin.jsp" method="post">
            <table>
                <tr>
                    <td><label for="username">Username</label></td>
                    <td><input type="text" id="username" name="username" placeholder="Enter a username"></td>
                </tr>
                <tr>
                    <td><label for="password">Password</label></td>
                    <td><input type="password" id="password" name="password" placeholder="Enter a password"></td>
                </tr>
                <tr>
                    <td><button type="submit">Submit</button></td>
                    <td><button type="reset">Cancel</button></td>
                </tr>
            </table>
        </form>
    </fieldset>

    <%
    String errorMessage = request.getParameter("error");
    if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
    <p style="color: red"><%= errorMessage %></p>
    <%
    }
    %>

</body>
</html>
