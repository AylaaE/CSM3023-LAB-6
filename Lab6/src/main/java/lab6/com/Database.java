/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab6.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

    private static Connection myConnection = null;
    private static final String myURL = "jdbc:mysql://localhost:3306/lab6_csm3023";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (myConnection != null && !myConnection.isClosed()) {
            return myConnection;
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                myConnection = DriverManager.getConnection(myURL, "root", "admin");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                throw e; // Rethrow the exception to handle it at a higher level if needed
            }
            return myConnection;
        }
    }

    public void closeConnection() {
        try {
            if (myConnection != null && !myConnection.isClosed()) {
                myConnection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
