package com.homedeco.company.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.homedeco.db.ConnectionPoolMgr;
import com.homedeco.member.model.MemberService;

public class CompanyDAO {
	private ConnectionPoolMgr pool;
	
	public CompanyDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertCompany(CompanyVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into member_company(memno, comname, userid, pwd,"
					+ " email, tel, zipcode, address, addressDetail, website)"
					+ " values(mem_company_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getComName());
			ps.setString(2, vo.getUserid());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getTel());
			ps.setString(6, vo.getZipcode());
			ps.setString(7, vo.getAddress());
			ps.setString(8, vo.getAddressDetail());
			ps.setString(9, vo.getWebsite());
			
			int cnt=ps.executeUpdate();
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int duplicateId(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int result=0;
		
		try {
			con=pool.getConnection();
			
			String sql="select count(*) from member_company where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if (rs.next()) {
				result=CompanyService.EXIST_ID;
			} else {
				result=CompanyService.NON_EXIST_ID;
			}
			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int loginCheck(String userid, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int result=0;
		
		try {
			con=pool.getConnection();
			
			String sql="select pwd from member_company"
					+ " where userid=? and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if (rs.next()) {
				String dbPwd=rs.getString(1);
				if (pwd.equals(dbPwd)) {
					result=CompanyService.LOGIN_OK;
				} else {
					result=CompanyService.PWD_NOT_MATCH;
				}
			} else {
				result=MemberService.USERID_NONE;
			}
			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public CompanyVO selectByUserid(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		CompanyVO vo=new CompanyVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from member_company where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if (rs.next()) {
				int comNo=rs.getInt("memno");
				String comName=rs.getString("comName");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String tel=rs.getString("tel");
				String zipcode=rs.getString("zipcode");
				String address=rs.getString("address");				
				String addressDetail=rs.getString("addressDetail");
				Timestamp regdate=rs.getTimestamp("regdate");
				String website=rs.getString("website");
				Timestamp outdate=rs.getTimestamp("outdate");
				
				vo.setComNo(comNo);
				vo.setComName(comName);
				vo.setUserid(userid);
				vo.setPwd(pwd);
				vo.setEmail(email);
				vo.setTel(tel);
				vo.setZipcode(zipcode);
				vo.setAddress(address);
				vo.setAddressDetail(addressDetail);
				vo.setRegdate(regdate);
				vo.setWebsite(website);
				vo.setOutdate(outdate);
			}
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

}
