package com.homedeco.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.homedeco.db.ConnectionPoolMgr;

public class MemberDAO {
	private ConnectionPoolMgr pool;
	
	public MemberDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into member_consumer(memno, name, userid, pwd, hp, zipcode,"
					+ " address, addressDetail)"
					+ " values(mem_consumer_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getUserid());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getHp());
			ps.setString(5, vo.getZipcode());
			ps.setString(6, vo.getAddress());
			ps.setString(7, vo.getAddressDetail());
			
			int cnt=ps.executeUpdate();
			System.out.println("회원 가입 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
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
			
			String sql="select count(*) from member_consumer where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if (rs.next()) {
				result=MemberService.EXIST_ID;
			} else {
				result=MemberService.NON_EXIST_ID;
			}
			
			System.out.println("아이디 중복확인 결과 result="+result);
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
			
			String sql="select pwd from member_consumer"
					+" where userid=? and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if (rs.next()) {
				String dbPwd=rs.getString(1);
				if (pwd.equals(dbPwd)) {
					result=MemberService.LOGIN_OK;
				} else {
					result=MemberService.PWD_NOT_MATCH;
				}
			} else {
				result=MemberService.USERID_NONE;
			}
			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public MemberVO selectByUserid(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		MemberVO vo=new MemberVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from member_consumer where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if (rs.next()) {
				int memNo=rs.getInt("memNo");
				String name=rs.getString("name");
				String pwd=rs.getString("pwd");
				String hp=rs.getString("hp");
				String zipcode=rs.getString("zipcode");
				String address=rs.getString("address");
				String addressDetail=rs.getString("addressDetail");
				Timestamp regdate=rs.getTimestamp("regdate");
				int point=rs.getInt("point");
				Timestamp outdate=rs.getTimestamp("outdate");
				
				vo.setMemNo(memNo);
				vo.setName(name);
				vo.setUserid(userid);
				vo.setPwd(pwd);
				vo.setHp(hp);
				vo.setZipcode(zipcode);
				vo.setAddress(address);
				vo.setAddressDetail(addressDetail);
				vo.setRegdate(regdate);
				vo.setPoint(point);
				vo.setOutdate(outdate);
			}
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update member_consumer set hp=?,"
					+" zipcode=?, address=?, addressdetail=?"
					+" where userid=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getHp());
			ps.setString(2, vo.getZipcode());
			ps.setString(3, vo.getAddress());
			ps.setString(4, vo.getAddressDetail());
			ps.setString(5, vo.getUserid());
			
			int cnt=ps.executeUpdate();
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int withdrawMember(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update member_consumer set outdate=sysdate"
					+" where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			int cnt=ps.executeUpdate();
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updatePointInfo(MemberVO member, int total) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update member_consumer"
					+" set point=?"
					+" where userid=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, member.getPoint()-total);
			ps.setString(2, member.getUserid());
			
			int cnt=ps.executeUpdate();
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
}
