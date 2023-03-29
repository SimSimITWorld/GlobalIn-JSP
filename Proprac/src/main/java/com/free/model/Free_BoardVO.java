package com.free.model;

import java.sql.*;

public class Free_BoardVO {
	
	private int no;							// 번호
	private String title;					// 제목
	private String writer;				// 글쓴이
	private String pass;					// 비밀번호
	private String content;				// 본문
	private int readcount;				// 조회수
	private int ref;						// 기본댓글
	private int step;						// 댓글에 댓글달기
	private int depth;					// 댓글이 몇개까지 달릴 수 있는지 한계설정(엔터표시같이 화살표)
	private Timestamp regdate;		// 날짜
	
	// 댓글
	private String writerreply;				// 댓글 글쓴이 
	private String contentreply;			// 댓글 본문
	private int parentno;					// 댓글 번호
	private int rcount;						// 댓글 전체수
	
	public int getParentno() {
		return parentno;
	}
	public void setParentno(int parentno) {
		this.parentno = parentno;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	
	public String getWriterreply() {
		return writerreply;
	}
	public void setWriterreply(String writerreply) {
		this.writerreply = writerreply;
	}

	public String getContentreply() {
		return contentreply;
	}
	public void setContentreply(String contentreply) {
		this.contentreply = contentreply;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
	
}
