package com.homedeco.purchase.model;

import java.sql.SQLException;
import java.util.List;

import com.homedeco.member.model.MemberVO;
import com.homedeco.product.model.ProductVO;

public class PurchaseService {
	private PurchaseDAO plDao;
	
	public PurchaseService() {
		plDao=new PurchaseDAO();
	}
	
	public int insertPurchaseList(MemberVO member, ProductVO pd, int qty) throws SQLException {
		return plDao.insertPurchaseList(member, pd, qty);
	}
	
	public List<PurchaseVO> selectByUserid(String userid) throws SQLException {
		return plDao.selectByUserid(userid);
	}

}
