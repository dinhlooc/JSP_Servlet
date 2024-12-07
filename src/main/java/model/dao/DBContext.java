package model.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:mysql://localhost:3306/ltm";
            Class.forName("com.mysql.jdbc.Driver");
            String username = "root";
            String password = "1503";
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }

    }
}
