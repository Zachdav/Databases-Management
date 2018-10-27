package edu.uga.DIYDB.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * This class should be configured for each user's specific database configuration. For
 * example, the database name, username, and password should be changed before using this
 * class.
 * 
 * @author Brandon Canaday
 *
 */
public class DatabaseAccess {
	
	static final String DRIVER = "com.mysql.jdbc.Driver"; // never changes
	
	static final String SUPRESS_ERRORS = "?verifyServerCertificate=false&useSSL=true"; // never changes
	
	static final String BASE_URL = "jdbc:mysql://localhost:3306/"; // never changes
	
	static final String DATABASE = "employees"; // chosen database
	
	static final String URL = BASE_URL + DATABASE + SUPRESS_ERRORS;
	
	static final String USER = "root"; // mysql user
	
	static final String PASS = "ZxCvBnM1"; // mysql pass
	
	/**
	 * Creates and returns a JDBC connection object for the stored db configuration.
	 * 
	 * @return the JDBC connection obj
	 */
	public static Connection mysql_connect() {
		Connection con = null;
		try { // try to load mysql driver and start connection with mysql
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASS); 
		} catch (ClassNotFoundException e) { // if driver wasn't found
			e.printStackTrace();
		} catch (SQLException e) { // if connection failed
			e.printStackTrace();
		} // try/catch
		return con;
	} // mysql_connect
	
	/**
	 * Tries to execute an SQL query on the given JDBC connection
	 * object. Note, the query is executed as is.
	 * 
	 * @param con the JDBC connection obj
	 * @param query the query to execute (assumes proper format)
	 * @return a result set of tuples for the specified query
	 */
	public static ResultSet execute_query(Connection con, String query) {
		ResultSet rset = null;
		try { // try to execute SQL statement. ResultSet will be empty (NOT null) if SQL didn't grab anything
			Statement stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			return rset;
		} catch (SQLException e) { // if invalid SQL or missing data
			e.printStackTrace();
		} // try/catch
		return rset;
	} // query_results
	
	/**
	 * Closes the given JDBC connection object. This can be called at the end
	 * of the servlet lifecycle.
	 * 
	 * @param con the JDBC connection obj
	 */
	public static void mysql_close(Connection con) {
		try { // try to close mysql connection
			if (con != null) {
				con.close();
			} // if
		} catch (SQLException e) { // if closing failed
			e.printStackTrace();
		} // try/catch
	} // mysql_close
	
} // DatabaseAccess
