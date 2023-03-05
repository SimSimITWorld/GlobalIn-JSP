package com.board;

import java.sql.*;

public class Inquiry_BoardVO {

	private int no;						// 번호
	private String title;				// 제목
	private String writer;			// 작성자
	private String pass;				// 비밀번호
	private int readcount;			// 조회수
	private int ref;					// 기본댓글
	private int step;					// 댓글에 답할 때 밑에 옆으로 옮기는 간격
	private int depth;				// 댓글에 답할 때 밑에 내리는 간격
	private Timestamp regdate;	// 날짜
	private String content;			// 본문
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
