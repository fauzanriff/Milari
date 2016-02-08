package milari;


import connection.DatabaseConnection;
import java.sql.*;

public class Milari {
    
    public static void main(String[] args) throws SQLException {
        Connection conn = DatabaseConnection.create();
        conn.close();
        
        Connection conn2 = DatabaseConnection.create();
        conn2.close();
    }
}
