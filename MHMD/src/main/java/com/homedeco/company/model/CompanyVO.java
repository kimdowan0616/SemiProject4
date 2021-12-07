package com.homedeco.company.model;

import java.sql.Timestamp;

public class CompanyVO {
	private int comNo;
	private String comName;
	private String userid;
	private String pwd;
	private String email;
	private String tel;
	private String zipcode;
	private String address;
	private String addressDetail;
	private Timestamp regdate;
	private String website;
	private Timestamp outdate;
	
	public CompanyVO() {
		super();
	}

	public CompanyVO(int comNo, String comName, String userid, String pwd, String email, String tel, String zipcode,
			String address, String addressDetail, Timestamp regdate, String website, Timestamp outdate) {
		super();
		this.comNo = comNo;
		this.comName = comName;
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.tel = tel;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.regdate = regdate;
		this.website = website;
		this.outdate = outdate;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Timestamp getOutdate() {
		return outdate;
	}

	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}

	@Override
	public String toString() {
		return "CompanyVO [comNo=" + comNo + ", comName=" + comName + ", userid=" + userid + ", pwd=" + pwd + ", email="
				+ email + ", tel=" + tel + ", zipcode=" + zipcode + ", address=" + address + ", addressDetail="
				+ addressDetail + ", regdate=" + regdate + ", website=" + website + ", outdate=" + outdate + "]";
	}
}
