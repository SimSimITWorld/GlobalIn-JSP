package com.notice;

import java.sql.*;
import java.util.*;

public class Notice_BoardDAO {

	// 데이터베이스 연결
	
	private static Notice_BoardDAO instance = null;
	
	private Notice_BoardDAO() {};
	
	public static Notice_BoardDAO getInstance() {
		
		if(instance==null) {
			synchronized (Notice_BoardDAO.class) {
				instance = new Notice_BoardDAO();
			}
		}
		
		return instance;
	}
	
	// 데이터베이스에 저장할 메소드 insertNoticeBoard 작성
	
	public void insertNoticeBoard(Notice_BoardVO notice) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int no1 = notice.getNo1();
		int number = 0;
		String sql = "";
		
		try {
			
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select max(no1) from proprac_notice");
			rs = pstmt.executeQuery();
			if(rs.next()) 
				number = rs.getInt(1)+1;
			else
				number = 1;
			
			sql = "insert into proprac_notice(no1, title1, content1, regdate) "
					+ "values(proprac_notice_seq.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle1());
			pstmt.setString(2, notice.getContent1());
			pstmt.setTimestamp(3, notice.getRegdate());
			pstmt.executeUpdate();
	
		
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
	}
	
	
	// 전체 글의 개수를 가져오는 메소드 구현
	
	public int getNoticeCount() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			
			conn = ConnUtil.getConnection();
			String sql = "select count(*) from proprac_notice";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
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
		
		return count;
	}
	
	/*
	 * Notice_Board_List.jsp 에서 글 제목을 클릭했을 경우 글 내용을 볼 수 있도록 하는 작업
	 * 글의 no1를 매개변수로 해서 하나의 글에 대한 상세한 정보를 데이터베이스에서 가져와야 함
	 */
	public Notice_BoardVO getNoticeBoard(int no1) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice_BoardVO notice_board = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			
			String sql = "update proprac_notice set readcount1=readcount1+1 where no1=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no1);
			pstmt.executeUpdate();
			
			sql = "select * from proprac_notice where no1=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no1);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				notice_board = new Notice_BoardVO();
				notice_board.setNo1(rs.getInt("no1"));
				notice_board.setTitle1(rs.getString("title1"));
				notice_board.setContent1(rs.getString("content1"));
				notice_board.setReadcount1(rs.getInt("readcount1"));
				notice_board.setRegdate(rs.getTimestamp("regdate"));
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
		
		return notice_board;
		
	}
	
	/*
	 * 조회수는 증가하지 않으므로 제외시키고 번호에 해당하는 글을 가져옴
	 */
	public Notice_BoardVO notice_updateGetBoard(int no1) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Notice_BoardVO notice_board = null;
		String sql = "";
		try {
			
			conn = ConnUtil.getConnection();
			
			sql = "select * from proprac_notice where no1=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no1);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				notice_board = new Notice_BoardVO();
				notice_board.setNo1(rs.getInt("no1"));
				notice_board.setTitle1(rs.getString("title1"));
				notice_board.setContent1(rs.getString("content1"));
				notice_board.setReadcount1(rs.getInt("readcount1"));
				notice_board.setRegdate(rs.getTimestamp("regdate"));
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
		return notice_board;
	}
	
	
	
	// 데이터 목록 가져오는 메소드
	public List<Notice_BoardVO> getNotice_Boards(int start, int end){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice_BoardVO> notice_List = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			String sql = "select * from (select rownum rnum, no1, title1, content1, readcount1, regdate "
					+ "from (select * from proprac_notice order by no1 desc)) where rnum>=? and rnum<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				notice_List = new ArrayList<Notice_BoardVO>(end-start+1);
				
				do {
					
					Notice_BoardVO notice_board = new Notice_BoardVO();
					notice_board.setNo1(rs.getInt("no1"));
					notice_board.setTitle1(rs.getString("title1"));
					notice_board.setContent1(rs.getString("content1"));
					notice_board.setReadcount1(rs.getInt("readcount1"));
					notice_board.setRegdate(rs.getTimestamp("regdate"));
					
					notice_List.add(notice_board);
					
				}while(rs.next());
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
		
		
		return notice_List;
	}
	
	
	// 검색한 내용이 몇개인지를 반환하는 함수(what: 검색조건, content: 검색내용)
	public int getNoticeCount(String what, String content) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			
			conn = ConnUtil.getConnection();
			String sql = "select count(*) from proprac_notice where " + what + " like '%" + content + "%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
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
	
	// 검색한 내용을 리스트로 받아서 반환하는 함수(what: 검색조건, content: 검색내용, start, end)
	public List<Notice_BoardVO> getNotice_Boards(String what, String content, int start, int end){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice_BoardVO> notice_List = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			String sql = "select * from (select rownum rnum, no1, title1, content1, readcount1, regdate "
					+ "from (select * from proprac_notice where " + what + " like '%" + content + "%')) where rnum>=? and rnum<=?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				notice_List = new ArrayList<Notice_BoardVO>(end-start+1);
				
				do {
					
					Notice_BoardVO notice_board = new Notice_BoardVO();
					notice_board.setNo1(rs.getInt("no1"));
					notice_board.setTitle1(rs.getString("title1"));
					notice_board.setContent1(rs.getString("content1"));
					notice_board.setReadcount1(rs.getInt("readcount1"));
					notice_board.setRegdate(rs.getTimestamp("regdate"));
					
					notice_List.add(notice_board);
					
				}while(rs.next());
				
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
		
		return notice_List;
	}
}
