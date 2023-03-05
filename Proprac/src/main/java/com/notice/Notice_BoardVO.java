package com.notice;

import java.sql.Timestamp;

public class Notice_BoardVO {

	private int no1;					// 번호
	private String title1;			// 제목
	private int readcount1;			// 조회수
	private Timestamp regdate;// 날짜
	private String content1;		// 본문
	
	public int getNo1() {
		return no1;
	}
	public void setNo1(int no1) {
		this.no1 = no1;
	}
	public String getTitle1() {
		return title1;
	}
	public void setTitle1(String title1) {
		this.title1 = title1;
	}
	public int getReadcount1() {
		return readcount1;
	}
	public void setReadcount1(int readcount1) {
		this.readcount1 = readcount1;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	
	
}
