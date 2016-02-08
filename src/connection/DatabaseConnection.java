package connection;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseConnection {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/milari?zeroDateTimeBehavior=convertToNull";
    
    static final String USER="milari";
    static final String PASS="password";

    
    private static DatabaseConnection dc = null;
    private static Connection conn = null;
    
    private DatabaseConnection() {
        /* Register JDBC Driver */
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            System.out.println("Create new Connection. Connecting to database ...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /* Singleton class, using interface create to get the connection */
    public static Connection create() {
        if (dc == null) {
            dc = new DatabaseConnection();
        } else {
            System.out.println("Using exising connection");
        }
        return conn;
    }
    
}
