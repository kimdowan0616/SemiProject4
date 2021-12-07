package com.homedeco.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int memNo;
	private String name;
	private String userid;
	private String pwd;
	private String hp;
	private String zipcode;
	private String address;
	private String addressDetail;
	private Timestamp regdate;
	private int point;
	private Timestamp outdate;
	
	public MemberVO() {
		super();
	}

	public MemberVO(int memNo, String name, String userid, String pwd, String hp, String zipcode, String address,
			String addressDetail, Timestamp regdate, int point, Timestamp outdate) {
		super();
		this.memNo = memNo;
		this.name = name;
		this.userid = userid;
		this.pwd = pwd;
		this.hp = hp;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.regdate = regdate;
		this.point = point;
		this.outdate = outdate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Timestamp getOutdate() {
		return outdate;
	}

	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}

	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", name=" + name + ", userid=" + userid + ", pwd=" + pwd + ", hp=" + hp
				+ ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail + ", regdate="
				+ regdate + ", point=" + point + ", outdate=" + outdate + "]";
	}
}
