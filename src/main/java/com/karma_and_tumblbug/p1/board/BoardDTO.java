package com.karma_and_tumblbug.p1.board;

import java.sql.Date;

public class BoardDTO {

	private long boardSort;
	private long num;
	private String title;
	private String writer;
	private Date regDate;
	private long hit;
	private String contents;
	public long getBoardSort() {
		return boardSort;
	}
	public void setBoardSort(long boardSort) {
		this.boardSort = boardSort;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
