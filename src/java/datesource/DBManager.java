/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datesource;

import config.PropertyManager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 *
 * @author JIAJUN XUE <nicoxue0324@gmail.com>
 */
public class DBManager {

    public Connection conn = null;
    public Statement stmt = null;
    public ResultSet rs = null;

    public static Connection getMysqlConn() throws SQLException {
        Connection conn = null;
        try {
            String db_driver = PropertyManager.getProperty("db_driver");
            String db_url = PropertyManager.getProperty("db_url");
            String db_username = PropertyManager.getProperty("db_username");
            String db_password = PropertyManager.getProperty("db_password");
            Class.forName(db_driver);
            conn = DriverManager.getConnection(db_url, db_username, db_password);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();

        }
        return conn;
    }

    public ResultSet executeQuery(String sql) {
        try {
            conn = getMysqlConn();
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return rs;
    }

    /*
     * function:update
     */
    public int executeUpdate(String sql) {
        int result = 0;
        try {
            conn = getMysqlConn();
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            result = stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            result = 0;
        }
        return result;
    }

    /*
     * function:close connection
     */
    public void close() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
}
