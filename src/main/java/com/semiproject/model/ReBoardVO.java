package com.semiproject.model;

import java.sql.Timestamp;

public class ReBoardVO {
	private int no;
	private String name;	
	private String pwd;
	private String title;
	private String email;
	private Timestamp regdate;
	private int readcount;
	private String content;
	
	//답변형 게시판 필드 추가
	private int groupNo;
	private int step; 
	private int sortNo;
	private String delFlag;
	
	//자료실 필드 추가
	private String fileName;
	private long fileSize; 
	private int downCount;
	private String originalFileName;
	
	public ReBoardVO() {
		super();
	}

	public ReBoardVO(int no, String name, String pwd, String title, String email, Timestamp regdate, int readcount,
			String content, int groupNo, int step, int sortNo, String delFlag, String fileName, long fileSize,
			int downCount, String originalFileName) {
		super();
		this.no = no;
		this.name = name;
		this.pwd = pwd;
		this.title = title;
		this.email = email;
		this.regdate = regdate;
		this.readcount = readcount;
		this.content = content;
		this.groupNo = groupNo;
		this.step = step;
		this.sortNo = sortNo;
		this.delFlag = delFlag;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.downCount = downCount;
		this.originalFileName = originalFileName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
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

	public int getDownCount() {
		return downCount;
	}

	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	@Override
	public String toString() {
		return "ReBoardVO [no=" + no + ", name=" + name + ", pwd=" + pwd + ", title=" + title + ", email=" + email
				+ ", regdate=" + regdate + ", readcount=" + readcount + ", content=" + content + ", groupNo=" + groupNo
				+ ", step=" + step + ", sortNo=" + sortNo + ", delFlag=" + delFlag + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", downCount=" + downCount + ", originalFileName=" + originalFileName
				+ "]";
	}
	
	
}
