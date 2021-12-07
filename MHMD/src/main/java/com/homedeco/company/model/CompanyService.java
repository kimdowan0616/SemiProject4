package com.homedeco.company.model;

import java.sql.SQLException;

public class CompanyService {
	public static final int EXIST_ID=1;
	public static final int NON_EXIST_ID=2;
	
	public static final int LOGIN_OK=1;
	public static final int PWD_NOT_MATCH=2;
	public static final int USERID_NONE=3;
	
	private CompanyDAO comDao;
	
	public CompanyService() {
		comDao=new CompanyDAO();
	}
	
	public int insertCompany(CompanyVO vo) throws SQLException {
		return comDao.insertCompany(vo);
	}
	
	public int duplicateId(String userid) throws SQLException {
		return comDao.duplicateId(userid);
	}
	
	public int loginCheck(String userid, String pwd) throws SQLException {
		return comDao.loginCheck(userid, pwd);
	}
	
	public CompanyVO selectByUserid(String userid) throws SQLException {
		return comDao.selectByUserid(userid);
	}

}
