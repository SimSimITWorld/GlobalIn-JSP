package com.logon;

import java.sql.*;
import javax.sql.*;

import com.boardone.BoardDAO;

import javax.naming.*;

public class LogonDBBean {

	private static LogonDBBean instance = null;

	public static LogonDBBean getInstance() {

		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new LogonDBBean();
			}
		}
		return instance;
	}

	public int UserCheck(String id, String passwd) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try {
			conn = ConnUtil.getConnection();
			String sql = "select passwd from tempmember where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				dbpasswd = rs.getString("passwd");
				if(dbpasswd.equals(passwd)) 
					x = 1;
				else
					x = 0;
			}
				
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			
			if(rs!=null) {
				try {
					rs.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
		
		
		return x;
	}
	
	private LogonDBBean() {}

}
