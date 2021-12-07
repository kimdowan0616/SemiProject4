package com.homedeco.product.model;

import java.sql.SQLException;

public class ProductService {
	private ProductDAO pdDao;
	
	public ProductService() {
		pdDao=new ProductDAO();
	}
	
	public ProductVO selectByPdCode(int pdCode) throws SQLException {
		return pdDao.selectByPdCode(pdCode);
	}
	
}