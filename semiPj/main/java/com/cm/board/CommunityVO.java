package com.cm.board;

import java.sql.Timestamp;

public class CommunityVO {
	private int no;
	private String title;
	private String userid;
	private String pwd;
	private String content;
	private Timestamp regdate;
	private int readcount;
	private String fileName;    
	private long fileSize;    
	private int downCnt;    
	private String originalFileName;
	
	public CommunityVO() {
		super();
	}

	public CommunityVO(int no, String title, String userid, String pwd, String content, Timestamp regdate,
			int readcount, String fileName, long fileSize, int downCnt, String originalFileName) {
		super();
		this.no = no;
		this.title = title;
		this.userid = userid;
		this.pwd = pwd;
		this.content = content;
		this.regdate = regdate;
		this.readcount = readcount;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.downCnt = downCnt;
		this.originalFileName = originalFileName;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getDownCnt() {
		return downCnt;
	}

	public void setDownCnt(int downCnt) {
		this.downCnt = downCnt;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	@Override
	public String toString() {
		return "CommunityVO [no=" + no + ", title=" + title + ", userid=" + userid + ", pwd=" + pwd + ", content="
				+ content + ", regdate=" + regdate + ", readcount=" + readcount + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", downCnt=" + downCnt + ", originalFileName=" + originalFileName + "]";
	}
	
	

}
