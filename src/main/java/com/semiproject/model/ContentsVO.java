package com.semiproject.model;

import java.sql.Timestamp;

public class ContentsVO {
	private int no;
	private String title;
	private String userid;
	private String pwd;
	private String content2;
	private Timestamp regdate;
	private String image;
	private String fileName;
	private long fileSize; 
	private int downCnt;
	private int readcount;
	private String originalFileName;
	private int pdCode;
	
	public ContentsVO() {
		super();
	}

	public ContentsVO(int no, String title, String userid, String pwd, String content2, Timestamp regdate, String image,
			String fileName, long fileSize, int downCnt, int readcount, String originalFileName, int pdCode) {
		super();
		this.no = no;
		this.title = title;
		this.userid = userid;
		this.pwd = pwd;
		this.content2 = content2;
		this.regdate = regdate;
		this.image = image;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.downCnt = downCnt;
		this.readcount = readcount;
		this.originalFileName = originalFileName;
		this.pdCode = pdCode;
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

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public int getPdCode() {
		return pdCode;
	}

	public void setPdCode(int pdCode) {
		this.pdCode = pdCode;
	}

	@Override
	public String toString() {
		return "ContentsVO [no=" + no + ", title=" + title + ", userid=" + userid + ", pwd=" + pwd + ", content2="
				+ content2 + ", regdate=" + regdate + ", image=" + image + ", fileName=" + fileName + ", fileSize="
				+ fileSize + ", downCnt=" + downCnt + ", readcount=" + readcount + ", originalFileName="
				+ originalFileName + ", pdCode=" + pdCode + "]";
	}


	
}
