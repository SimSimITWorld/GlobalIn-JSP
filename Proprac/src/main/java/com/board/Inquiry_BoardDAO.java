package com.board;

import java.sql.*;
import java.util.*;

public class Inquiry_BoardDAO {

	
	// 데이터베이스 연결
	
	private static Inquiry_BoardDAO instance = null;
	
	private Inquiry_BoardDAO() {};
	
	public static Inquiry_BoardDAO getInstance() {
		
		if(instance==null) {
			synchronized (Inquiry_BoardDAO.class) {
				instance = new Inquiry_BoardDAO();
			}
		}
		
		return instance;
	}
	
	
	// 데이터베이스에 저장할 메소드 insertInquiryBoard 작성
	
	public void insertInquiryBoard(Inquiry_BoardVO inquiry) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int no = inquiry.getNo();
		int ref = inquiry.getRef();
		int step = inquiry.getStep();
		int depth = inquiry.getDepth();
		int number = 0;							// 답글인 경우 카운트(몇번째 답글인지)
		String sql = "";
		
		try {
			conn = ConnUtil.getConnection();
			
			pstmt = conn.prepareStatement("select max(no) from proprac");	// 데이터베이스 proprac 테이블에서 (번호)의 가장 큰 값
			rs  = pstmt.executeQuery();
			if(rs.next()) 
				number = rs.getInt(1)+1;	// 첫번째 값에서 하나 더해주기
			else
				number = 1;
			
			if(no!=0) {	// 1이 아니기 때문에 답변글이 있으므로, 그 경우 계산할 값
				sql = "update proprac set step=step+1 where ref=? and step>?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				step = step+1;		// 한 칸 띄어주기
				depth = depth+1;	// 한 칸 아래로 띄어주기
			}else {	// 0이기 때문에 답변글이 없으므로 0 값으로 설정
				ref = number;
				step = 0;
				depth = 0;
			}
			
			sql = "insert into proprac(no, title, writer, pass, content, ref, step, depth, regdate) "
					+ "values(proprac_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquiry.getTitle());
			pstmt.setString(2, inquiry.getWriter());
			pstmt.setString(3, inquiry.getPass());
			pstmt.setString(4, inquiry.getContent());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, step);
			pstmt.setInt(7, depth);
			pstmt.setTimestamp(8, inquiry.getRegdate());
			pstmt.executeUpdate();
			
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
			
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		}
	} // end insertInquiryBoard
	
	
	// 전체 글의 개수를 가져오는 메소드 구현
	
	public int getInquiryCount() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			conn = ConnUtil.getConnection();
			String sql = "select count(*) from proprac";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);	// 데이터베이스에 저장된 번호 가져오기
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
	} // end getInquiryCount
	
	
	
	
	
	
	// 데이터 목록 가져오는 메소드
	
	public List<Inquiry_BoardVO> getInquiry_Boards(int start, int end){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry_BoardVO> inquiry_List = null;
		
		try {
			
			conn = ConnUtil.getConnection();
		//	String sql = "select * from proprac order by no desc";
			String sql = "select * from (select rownum rnum, no, title, writer, pass, content, readcount, ref, step, depth, regdate "
					+ "from (select * from proprac order by ref desc, step asc)) where rnum>=? and rnum<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				inquiry_List = new ArrayList<Inquiry_BoardVO>(end-start+1);
				
				do {
					Inquiry_BoardVO inquiry_board = new Inquiry_BoardVO();
					inquiry_board.setNo(rs.getInt("no"));
					inquiry_board.setTitle(rs.getString("title"));
					inquiry_board.setWriter(rs.getString("writer"));
					inquiry_board.setPass(rs.getString("pass"));
					inquiry_board.setContent(rs.getString("content"));
					inquiry_board.setReadcount(rs.getInt("readcount"));
					inquiry_board.setRef(rs.getInt("ref"));
					inquiry_board.setStep(rs.getInt("step"));
					inquiry_board.setDepth(rs.getInt("depth"));
					inquiry_board.setRegdate(rs.getTimestamp("regdate"));
					
					inquiry_List.add(inquiry_board);
					
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
		
		return inquiry_List;
	} // end getInquiry_Boards
	
	
	/*
	 * 	Inquiry_Board_List.jsp 에서 글 제목을 클릭했을 경우 글 내용을 볼 수 있도록 하는 작업
	 * 	글의 no를 매개변수로 해서 하나의 글에 대한 상세한 정보를 데이터베이스에서 가져와야 함
	 */
	public Inquiry_BoardVO getInquiryBoard(int no) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Inquiry_BoardVO inquiry_board = null;
		
		try {
			conn = ConnUtil.getConnection();
			
			String sql = "update proprac set readcount=readcount+1 where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			sql = "select * from proprac where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				inquiry_board = new Inquiry_BoardVO();
				inquiry_board.setNo(rs.getInt("no"));
				inquiry_board.setTitle(rs.getString("title"));
				inquiry_board.setWriter(rs.getString("writer"));
				inquiry_board.setPass(rs.getString("pass"));
				inquiry_board.setContent(rs.getString("content"));
				inquiry_board.setReadcount(rs.getInt("readcount"));
				inquiry_board.setRef(rs.getInt("ref"));
				inquiry_board.setStep(rs.getInt("step"));
				inquiry_board.setDepth(rs.getInt("depth"));
				inquiry_board.setRegdate(rs.getTimestamp("regdate"));
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
			
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		}
		return inquiry_board;
	} // end getInquiryBoard
	
	
	
	/*
	 *  조회수는 증가하지 않으므로 제외시키고 번호에 해당하는 글을 가져옴
	 */
	public Inquiry_BoardVO inquiry_updateGetBoard(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Inquiry_BoardVO inquiry_board = null;
		String sql = "";
		try {
			
			conn = ConnUtil.getConnection();
			
			sql = "select * from proprac where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				inquiry_board = new Inquiry_BoardVO();
				inquiry_board.setNo(rs.getInt("no"));
				inquiry_board.setTitle(rs.getString("title"));
				inquiry_board.setWriter(rs.getString("writer"));
				inquiry_board.setPass(rs.getString("pass"));
				inquiry_board.setContent(rs.getString("content"));
				inquiry_board.setReadcount(rs.getInt("readcount"));
				inquiry_board.setRef(rs.getInt("ref"));
				inquiry_board.setStep(rs.getInt("step"));
				inquiry_board.setDepth(rs.getInt("depth"));
				inquiry_board.setRegdate(rs.getTimestamp("regdate"));
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
			
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		}
		return inquiry_board;
	} // inquiry_updateGetBoard
	
	
	/*
	 *  글 수정 페이지에서 글수정 버튼을 클릭하면 데이터베이스에서 실제 데이터가 수정이
	 *  이루어져야함 글수정 메소드 추가
	 */
	public int inquiry_updateBoard(Inquiry_BoardVO inquiry_board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String inquiry_dbpasswd = "";
		String sql = "";
		int result = -1;
		
		try {
			
			conn = ConnUtil.getConnection();
			sql = "select pass from proprac where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquiry_board.getNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				inquiry_dbpasswd = rs.getString("pass");
				if(inquiry_dbpasswd.equals(inquiry_board.getPass())){
					sql = "update proprac set title=?, content=? where no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, inquiry_board.getTitle());
					pstmt.setString(2, inquiry_board.getContent());
					pstmt.setInt(3, inquiry_board.getNo());
					pstmt.executeUpdate();
					result=1;	// 글 수정 성공
				}else {
					result=0;	// 글 수정 실패
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
	} // end inquiry_updateBoard
	
	
	/*
	 * 	글 삭제
	 * 
	 * 		글 삭제 처리를 하려면 입력받은 비밀번호와 데이터베이스에 저장된 비밀번호를 비교하여
	 * 		같으면 삭제처리한다.
	 * 		글 삭제 성공 : 1
	 *		비밀번호 : 0
	 *		삭제 글이 존재하지 않을 경우 : -1
	 */
	public int delete_Inquiry_Board(int no, String pass) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String inquiry_dbpasswd = "";
		String sql = "";
		int result = -1;
		
		try {
			conn = ConnUtil.getConnection();
			sql = "select pass from proprac where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				
				inquiry_dbpasswd = rs.getString("pass");
				if(inquiry_dbpasswd.equals(pass)) {
					
					sql = "delete from proprac where no=?";
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
	}// end delete_Inquiry_Board
	
	
	// 검색한 내용이 몇개인지를 반환하는 함수(what: 검색조건, content: 검색내용)
	public int getInquiryCount(String what, String content) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			
			conn = ConnUtil.getConnection();
			String sql = "select count(*) from proprac where "+ what + " like '%"+ content+"%'";
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
	} // end getInquiryCount
	
	// 검색한 내용을 리스트로 받아서 반환하는 함수(what: 검색조건, content: 검색내용, start, end)
	public List<Inquiry_BoardVO> getInquiry_Boards(String what, String content, int start, int end){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry_BoardVO> inquiry_List = null;
		
		try {
			
			conn = ConnUtil.getConnection();
			String sql = "select * from (select rownum rnum, no, title, writer, pass, content, readcount, ref, step, depth, regdate "
					+ "from (select * from proprac where "+ what +" like '%" + content +"%' order by ref desc, step asc)) where rnum>=? and rnum<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				inquiry_List = new ArrayList<Inquiry_BoardVO>(end-start+1);
				
				do {
					Inquiry_BoardVO inquiry_board = new Inquiry_BoardVO();
					inquiry_board.setNo(rs.getInt("no"));
					inquiry_board.setTitle(rs.getString("title"));
					inquiry_board.setWriter(rs.getString("writer"));
					inquiry_board.setPass(rs.getString("pass"));
					inquiry_board.setContent(rs.getString("content"));
					inquiry_board.setReadcount(rs.getInt("readcount"));
					inquiry_board.setRef(rs.getInt("ref"));
					inquiry_board.setStep(rs.getInt("step"));
					inquiry_board.setDepth(rs.getInt("depth"));
					inquiry_board.setRegdate(rs.getTimestamp("regdate"));
					
					inquiry_List.add(inquiry_board);
					
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
		return inquiry_List;
	} // end getInquiry_Boards
}
