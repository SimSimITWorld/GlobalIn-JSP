package com.free.model;

import java.sql.*;
import java.util.*;

public class Free_BoardDAO {

	private static Free_BoardDAO instance = null;
	
	private Free_BoardDAO() {}
	
	public static Free_BoardDAO getInstance() {
		
		if(instance==null) {
			synchronized (Free_BoardDAO.class) {
				instance = new Free_BoardDAO();
			}
		}
		return instance;
	}
	
	// 게시판 작업을 하나하나 메소드로 작성해서 추가하면 됨
	
	/*
	 * 실제 데이터베이스에 데이터를 저장할 insertFree(Free_BoardVO free) 메소드를 구현함
	 */
	public void insertFree(Free_BoardVO free) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int no = free.getNo();
		int ref = free.getRef();
		int step = free.getStep();
		int depth = free.getDepth();
		int number = 0;
		String sql = "";
		
		try {
			
			conn = ConnUtil.getConnection();
			
			pstmt = conn.prepareStatement("select max(no) from proprac_free");
			rs = pstmt.executeQuery();
			if(rs.next()) 
				number = rs.getInt(1)+1;
			else
				number = 1;
			
			if(no!=0) {
				sql = "update proprac_free set step=step+1 where ref=? and step>?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				step = step+1;
				depth = depth+1;
			}else {
				ref = number;
				step = 0;
				depth = 0;
			}
			
			// 쿼리 작성
			sql = "insert into proprac_free(no, title, writer, pass, content, ref, step, depth, regdate) "
					+ "values(proprac_free_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, free.getTitle());
			pstmt.setString(2, free.getWriter());
			pstmt.setString(3, free.getPass());
			pstmt.setString(4, free.getContent());
			pstmt.setInt(5, free.getRef());
			pstmt.setInt(6, free.getStep());
			pstmt.setInt(7, free.getDepth());
			pstmt.setTimestamp(8, free.getRegdate());
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
		
	} // end insertFree
	
	// 전체 글의 개수를 가져오는 메소드 구현
	public int getFreeCount() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = ConnUtil.getConnection();
			String sql = "select count(*) from proprac_free";
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
	} // end getFreeCount
	
	// 데이터 목록을 가져오는 메소드
	public List<Free_BoardVO> getFrees(int start, int end){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Free_BoardVO> freeList = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			String sql = "select * from (select rownum rnum, no, title, writer, pass, content, readcount, ref, step, depth, regdate "
					+ "from (select * from proprac_free order by ref desc, step asc)) "
					+ "where rnum>=? and rnum<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 
				freeList = new ArrayList<Free_BoardVO>(end-start+1);
				
				do {
					Free_BoardVO free = new Free_BoardVO();
					free.setNo(rs.getInt("no"));
					free.setTitle(rs.getString("title"));
					free.setWriter(rs.getString("writer"));
					free.setPass(rs.getString("pass"));
					free.setContent(rs.getString("content"));
					free.setReadcount(rs.getInt("readcount"));
					free.setRef(rs.getInt("ref"));
					free.setStep(rs.getInt("step"));
					free.setDepth(rs.getInt("depth"));
					free.setRegdate(rs.getTimestamp("regdate"));
					
					freeList.add(free);
					
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
		return freeList;
	} // end getFrees;
	
	/*
	 * list.jsp에서 글 제목을 클릭했을 경우 글 내용을 볼 수 있도록 하는 작업
	 * 
	 * 글의 no를 매개변수로 해서 하나의 글에 대한 상세한 정보를 데이터베이스에서 가져와야 함
	 */
	public Free_BoardVO getFree(int no) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Free_BoardVO free = null;
		
		// 댓글
		PreparedStatement pstmtreply = null;
		ResultSet rsreply = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			
			String sql = "update proprac_free set readcount=readcount+1 where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			sql = "select * from proprac_free where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			//String sqlreply = "select * from proprac_free_reply where parentno=?";
			//pstmtreply = conn.prepareStatement(sqlreply);
			//pstmtreply.setInt(1, no);
			//rsreply = pstmt.executeQuery();
			
			if(rs.next()) {
				
				free = new Free_BoardVO();
				free.setNo(rs.getInt("no"));
				free.setTitle(rs.getString("title"));
				free.setWriter(rs.getString("writer"));
				free.setPass(rs.getString("pass"));
				free.setContent(rs.getString("content"));
				free.setReadcount(rs.getInt("readcount"));
				free.setRef(rs.getInt("ref"));
				free.setStep(rs.getInt("step"));
				free.setDepth(rs.getInt("depth"));
				free.setRegdate(rs.getTimestamp("regdate"));
				
				//free.setParentno(rs.getInt("no"));
				//free.setContentreply(rsreply.getString("contentreply"));
				//free.setWriterreply(rsreply.getString("writerreply"));
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
		return free;
	} // end getFree
	
	/*
	 * 조회수는 증가하지 않으므로 제외시키고 번호에 해당하는 글을 가져옴
	 */
	public Free_BoardVO updateGetFree(int no) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Free_BoardVO free = null;
		String sql = "";
		try {
			
			conn = ConnUtil.getConnection();
			
			sql = "select * from proprac_free where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				free = new Free_BoardVO();
				free.setNo(rs.getInt("no"));
				free.setTitle(rs.getString("title"));
				free.setWriter(rs.getString("writer"));
				free.setPass(rs.getString("pass"));
				free.setContent(rs.getString("content"));
				free.setReadcount(rs.getInt("readcount"));
				free.setRef(rs.getInt("ref"));
				free.setStep(rs.getInt("step"));
				free.setDepth(rs.getInt("depth"));
				free.setRegdate(rs.getTimestamp("regdate"));
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
		return free;
	} // end updateGetFree
	
	/*
	 * 글 수정 페이지에서 글수정을 클릭하면 데이터베이스에서 실제 데이터가 수정이 이루어져야함
	 * 글 수정 메소드 추가
	 */
	public int updateFree(Free_BoardVO free) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpass = "";
		String sql = "";
		int result = -1;
		
		try {
			
			conn = ConnUtil.getConnection();
			sql = "select pass from proprac_free where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, free.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpass = rs.getString("pass");
				if(dbpass.equals(free.getPass())) {
					sql = "update proprac_free set title=?, content=? where no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, free.getTitle());
					pstmt.setString(2, free.getContent());
					pstmt.setInt(3, free.getNo());
					pstmt.executeUpdate();
					result = 1;
				}else {
					result = 0;
				}
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
		
		return result;
	} // end updateFree
	
	/*
	 * 글 삭제
	 * 	
	 * 		글 삭제 처리를 하려면 입력받은 비밀번호와 데이터베이스에 저장된 비밀번호를 비교하여
	 * 		같으면 삭제처리한다.
	 * 		글 삭제 성공 : 1
	 * 		비밀번호 : 0
	 * 		삭제 글이 존재하지 않을 경우 : -1
	 */
	public int deleteFree(int no, String pass) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpass = "";
		String sql = "";
		int result = -1;
		
		try {
			
			conn = ConnUtil.getConnection();
			sql = "select pass from proprac_free where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpass = rs.getString("pass");
				if(dbpass.equals(pass)) {
					sql = "delete from proprac_free where no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.executeUpdate();
					result=1;
				}else {
					result=0;
				}
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
		return result;
	} // end deleteFree
	
	// 검색한 내용이 몇개인지를 반환하는 함수(what: 검색조건, content: 검색내용)
	public int getFreeCount(String find, String find_box) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			
			conn = ConnUtil.getConnection();
			
			if(find.equals("writer")) {
				pstmt = conn.prepareStatement("select count(*) from proprac_free where writer=?");
				pstmt.setString(1, find_box);
			}else if(find.equals("title")) {
				pstmt = conn.prepareStatement("select count(*) from proprac_free where title like '%" + find_box + "%'");
			}else if(find.equals("content")) {
				pstmt = conn.prepareStatement("select count(*) from proprac_free where content like '%" + find_box +"%'");
			}else {
				pstmt = conn.prepareStatement("select count(*) from proprac_free");
			}
			
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
	} // end getFreeCount
	
	// 검색한 내용을 리스트로 받아서 반환하는 함수(what: 검색조건, content: 검색내용, start, end)
	public List<Free_BoardVO> getFrees(String find, String find_box, int start, int end){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Free_BoardVO> freeList = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * from ");
			sql.append("(select rownum rnum, no, title, writer, pass, content, readcount, ref, step, depth, regdate from ");
			if(find.equals("writer")) {
				sql.append("(select * from proprac_free where writer like '%" + find_box + "%' order by ref desc, step asc, no desc)) where rnum>=? and rnum<=?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else if(find.equals("title")) {
				sql.append("(select * from proprac_free where title like '%" + find_box + "%' order by ref desc, step asc, no desc)) where rnum>=? and rnum<=?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else if(find.equals("content")) {
				sql.append("(select * from proprac_free where content like '%" + find_box + "%' order by ref desc, step asc, no desc)) where rnum>=? and rnum<=?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else {
				sql.append("(select * from proprac_free order by ref desc, step asc, no desc)) where rnum>=? and rnum<=?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				freeList = new ArrayList<Free_BoardVO>(end-start+1);
				
				do {
					
					Free_BoardVO free = new Free_BoardVO();
					free.setNo(rs.getInt("no"));
					free.setTitle(rs.getString("title"));
					free.setWriter(rs.getString("writer"));
					free.setPass(rs.getString("pass"));
					free.setContent(rs.getString("content"));
					free.setReadcount(rs.getInt("readcount"));
					free.setRef(rs.getInt("ref"));
					free.setStep(rs.getInt("step"));
					free.setDepth(rs.getInt("depth"));
					free.setRegdate(rs.getTimestamp("regdate"));
					
					freeList.add(free);
					
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
		return freeList;
	} // end getFrees
	
	// 댓글 DAO
	public void commentWrite(Free_BoardVO reply) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into proprac_free_reply values(proprac_free_reply_seq.nextval, ?, ?, sysdate, ?)";
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reply.getCid());
			pstmt.setString(2, reply.getCcontent());
			pstmt.setInt(3, reply.getParentno());
			rs = pstmt.executeQuery();
			
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
	
	public int commentCheck(String no) { // 댓글체크
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select * from proprac_free_reply where parentno=?";
		
		try {
			
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=1;
			}else {
				result=0;
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
		return result;
	}
}
