package com.jobportal;

import java.sql.*;

public class DBConnection {
    public static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/job_portal?useSSL=false&allowPublicKeyRetrieval=true",
                "root",
                "root" 
            );

            System.out.println("Connected Successfully!");

        } catch (Exception e) {
            System.out.println("Connection Failed!");
            e.printStackTrace();
        }
        return con;
    }
}
