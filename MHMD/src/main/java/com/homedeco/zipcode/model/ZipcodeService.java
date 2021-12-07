package com.homedeco.zipcode.model;

import java.sql.SQLException;
import java.util.List;

public class ZipcodeService {
	private ZipcodeDAO zipcodeDao;
	
	public ZipcodeService() {
		zipcodeDao=new ZipcodeDAO();
	}
	
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException {
		return zipcodeDao.selectZipcode(dong);
	}

}
