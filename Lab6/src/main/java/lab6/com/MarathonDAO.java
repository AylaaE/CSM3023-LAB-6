/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab6.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MarathonDAO {

    private Connection connection;
    private int result = 0;

    public MarathonDAO() throws ClassNotFoundException, SQLException {
        connection = Database.getConnection();
    }

    public int addDetails(Marathon marathon) {
        PreparedStatement preparedStatement = null;
        try {
            String mySQL = "INSERT INTO marathon(icno, name, category) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(mySQL);

            // Set parameters for the PreparedStatement
            preparedStatement.setString(1, marathon.getIcno());
            preparedStatement.setString(2, marathon.getName());
            preparedStatement.setString(3, marathon.getCategory());

            // Execute the query
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close PreparedStatement in finally block to ensure it always gets closed
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    // Ensure to close the connection when the DAO is no longer needed
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
