package com.homedeco.purchase.model;

import java.sql.Timestamp;

public class PurchaseVO {
	private int plCode;
	private int qty;
	private int total;
	private Timestamp regdate;
	private int memNo;
	private int pdCode;
	
	public PurchaseVO() {
		super();
	}

	public PurchaseVO(int plCode, int qty, int total, Timestamp regdate, int memNo, int pdCode) {
		super();
		this.plCode = plCode;
		this.qty = qty;
		this.total = total;
		this.regdate = regdate;
		this.memNo = memNo;
		this.pdCode = pdCode;
	}

	public int getPlCode() {
		return plCode;
	}

	public void setPlCode(int plCode) {
		this.plCode = plCode;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getPdCode() {
		return pdCode;
	}

	public void setPdCode(int pdCode) {
		this.pdCode = pdCode;
	}

	@Override
	public String toString() {
		return "PurchaseVO [plCode=" + plCode + ", qty=" + qty + ", total=" + total + ", regdate=" + regdate
				+ ", memNo=" + memNo + ", pdCode=" + pdCode + "]";
	}
}
