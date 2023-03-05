package com.prac;

import java.sql.*;
import java.util.*;

public class PracDAO {
	
	public PracDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ce) {
			ce.printStackTrace();
		}
	}
	
	public Vector<PracMember> getPrac(){
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		Vector<PracMember> PracList = new Vector<PracMember>();
		
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from Moon");
			
			while(rs.next()) {
				PracMember vo = new PracMember();
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setViewr(rs.getInt("viewer"));
				PracList.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			
			if(conn!=null) {
				try {
					conn.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
			
			if(stmt!=null) {
				try {
					stmt.close();
				}catch(SQLException se) {
					se.printStackTrace();
				}
			}
		}
		
		return PracList;
		
	}
}
