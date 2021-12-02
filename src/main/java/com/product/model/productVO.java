package com.product.model;

import java.sql.Timestamp;

public class productVO {
	private int pdcode;	/* 상품코드 */
	private String pdname;	/* 상품명 */
	private int comno;	/* 기업회원번호(제조업체) */
	private int price;	/* 가격 */
	private Timestamp date;	/* 등록일 */
	private String image;	/* 상품이미지 */
	private int category_code;	/* 카테고리코드 */
	
	public productVO() {
		super();
	}

	public productVO(int pdcode, String pdname, int comno, int price, Timestamp date, String image, int category_code) {
		super();
		this.pdcode = pdcode;
		this.pdname = pdname;
		this.comno = comno;
		this.price = price;
		this.date = date;
		this.image = image;
		this.category_code = category_code;
	}

	public int getPdcode() {
		return pdcode;
	}

	public void setPdcode(int pdcode) {
		this.pdcode = pdcode;
	}

	public String getPdname() {
		return pdname;
	}

	public void setPdname(String pdname) {
		this.pdname = pdname;
	}

	public int getComno() {
		return comno;
	}

	public void setComno(int comno) {
		this.comno = comno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	@Override
	public String toString() {
		return "productVO [pdcode=" + pdcode + ", pdname=" + pdname + ", comno=" + comno + ", price=" + price
				+ ", date=" + date + ", image=" + image + ", category_code=" + category_code + "]";
	}
}
