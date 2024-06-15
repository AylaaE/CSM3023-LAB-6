<%-- 
    Document   : registerMarathon
    Created on : 15 Jun 2024, 9:04:17 pm
    Author     : Nur Ezreena
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marathon Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        fieldset {
            margin: 20px auto;
            padding: 20px;
            border: 2px solid #ccc;
            max-width: 400px;
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        button {
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        button[type="reset"] {
            background-color: #DC3545;
        }
        button:hover {
            opacity: 0.9;
        }
        footer {
            text-align: center;
            margin-top: auto;
            padding: 10px;
            background: #f1f1f1;
        }
    </style>
</head>
<body>
    <h1>Marathon Registration</h1>
    <fieldset>
        <legend>Marathon Registration</legend>
        <form action="processMarathon.jsp" method="post">
            <table>
                <tr>
                    <td>
                        <label for="icno">IC No</label>
                    </td>
                    <td>
                        <input type="text" id="icno" name="icno" placeholder="E.g.: 921110-10-2514" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">Name</label>
                    </td>
                    <td>
                        <input type="text" id="name" name="name" placeholder="Enter your name" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="category">Category</label>
                    </td>
                    <td>
                        <select id="category" name="category" required>
                            <option value="5 KM">5 KM</option>
                            <option value="7 KM">7 KM</option>
                            <option value="10 KM">10 KM</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <br>
                        <button type="submit" value="Submit">Submit</button>
                        <button type="reset" value="Reset">Cancel</button>
                    </td>
                </tr>
            </table>
        </form>
    </fieldset>
   
</body>
</html>
