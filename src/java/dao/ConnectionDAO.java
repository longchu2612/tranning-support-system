/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NTA-PC
 */
public class ConnectionDAO {

    private static Connection connection;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                String user = "root";
                String pass = "123456789";
                String url = "jdbc:mysql://localhost:3306/project_swp_391";
                Class.forName("com.mysql.cj.jdbc.Driver");
                System.out.println("Connect successfully!");
                connection = DriverManager.getConnection(url, user, pass);
            } catch (ClassNotFoundException | SQLException ex) {
                ex.printStackTrace();
            }
        }
        return connection;

    }

    public void closeConnection() {
        try {
            connection.close();
        } catch (Exception e) {
        }
    }

}
