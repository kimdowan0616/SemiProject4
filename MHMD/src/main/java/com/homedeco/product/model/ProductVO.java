package com.homedeco.product.model;

import java.sql.Timestamp;

public class ProductVO {
	private int pdCode;
	private String pdName;
	private int price;
	private Timestamp regdate;
	private int cgCode;
	private int comNo;
	
	public ProductVO() {
		super();
	}

	public ProductVO(int pdCode, String pdName, int price, Timestamp regdate, int cgCode, int comNo) {
		super();
		this.pdCode = pdCode;
		this.pdName = pdName;
		this.price = price;
		this.regdate = regdate;
		this.cgCode = cgCode;
		this.comNo = comNo;
	}

	public int getPdCode() {
		return pdCode;
	}

	public void setPdCode(int pdCode) {
		this.pdCode = pdCode;
	}

	public String getPdName() {
		return pdName;
	}

	public void setPdName(String pdName) {
		this.pdName = pdName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getCgCode() {
		return cgCode;
	}

	public void setCgCode(int cgCode) {
		this.cgCode = cgCode;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	@Override
	public String toString() {
		return "ProductService [pdCode=" + pdCode + ", pdName=" + pdName + ", price=" + price + ", regdate=" + regdate
				+ ", cgCode=" + cgCode + ", comNo=" + comNo + "]";
	}
}
