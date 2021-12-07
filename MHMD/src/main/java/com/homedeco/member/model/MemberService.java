package com.homedeco.member.model;

import java.sql.SQLException;

public class MemberService {
	public static final int EXIST_ID=1;
	public static final int NON_EXIST_ID=2;
	
	public static final int LOGIN_OK=1;
	public static final int PWD_NOT_MATCH=2;
	public static final int USERID_NONE=3;
	
	private MemberDAO memDao;
	
	public MemberService() {
		memDao=new MemberDAO();
	}
	
	public int insertMember(MemberVO vo) throws SQLException {
		return memDao.insertMember(vo);
	}
	
	public int duplicateId(String userid) throws SQLException {
		return memDao.duplicateId(userid);
	}
	
	public int loginCheck(String userid, String pwd) throws SQLException {
		return memDao.loginCheck(userid, pwd);
	}
	
	public MemberVO selectByUserid(String userid) throws SQLException {
		return memDao.selectByUserid(userid);
	}
	
	public int updateMember(MemberVO vo) throws SQLException {
		return memDao.updateMember(vo);
	}
	
	public int withdrawMember(String userid) throws SQLException {
		return memDao.withdrawMember(userid);
	}
	
	public int updatePointInfo(MemberVO member, int total) throws SQLException {
		return memDao.updatePointInfo(member, total);
	}
}
