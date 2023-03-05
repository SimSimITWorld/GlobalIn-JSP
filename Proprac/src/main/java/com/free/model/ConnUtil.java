package com.free.model;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class ConnUtil {
	
	private static DataSource ds;
	
	static {
		try {
			InitialContext ctx = new InitialContext();
		} catch (NamingException e) {
		
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
}
