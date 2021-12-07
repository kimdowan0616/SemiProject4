package com.homedeco.comments.model;

import java.sql.Timestamp;

public class CommentsVO {
	private int cNo;
	private String userid;
	private int groupNo;
	private String comm;
	private int sortNo;
	private int step;
	private Timestamp regdate;
	private String delflag;
	
	public CommentsVO() {
		super();
	}

	public CommentsVO(int cNo, String userid, int groupNo, String comm, int sortNo, int step, Timestamp regdate,
			String delflag) {
		super();
		this.cNo = cNo;
		this.userid = userid;
		this.groupNo = groupNo;
		this.comm = comm;
		this.sortNo = sortNo;
		this.step = step;
		this.regdate = regdate;
		this.delflag = delflag;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getComm() {
		return comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	@Override
	public String toString() {
		return "CommentsVO [cNo=" + cNo + ", userid=" + userid + ", groupNo=" + groupNo + ", comm=" + comm + ", sortNo="
				+ sortNo + ", step=" + step + ", regdate=" + regdate + ", delflag=" + delflag + "]";
	}

	
}
