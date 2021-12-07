package com.homedeco.purchase.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.homedeco.db.ConnectionPoolMgr;
import com.homedeco.member.model.MemberVO;
import com.homedeco.product.model.ProductVO;

public class PurchaseDAO {
	private ConnectionPoolMgr pool;
	
	public PurchaseDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	
	  public int insertPurchaseList(MemberVO member, ProductVO pd, int qty) throws SQLException {
		  Connection con=null;
		  PreparedStatement ps=null;
		  
		  try {
			  con=pool.getConnection();
			  
			  String sql="insert into purchase_list(plcode, qty, total, memno, pdcode)"
					  +" values(plist_seq.nextval, ?, ?, ?, ?)";
			  ps=con.prepareStatement(sql);
			  ps.setInt(1, qty);
			  ps.setInt(2, pd.getPrice()*qty);
			  ps.setInt(3, member.getMemNo());
			  ps.setInt(4, pd.getPdCode());
			  
			  int cnt=ps.executeUpdate();
			  return cnt;
		  } finally {
			  pool.dbClose(ps, con);
		  }
	  }
	  
	  public List<PurchaseVO> selectByUserid(String userid) throws SQLException {
		  Connection con=null;
		  PreparedStatement ps=null;
		  ResultSet rs=null;
		  List<PurchaseVO> list=new ArrayList<PurchaseVO>();
		  
		  try {
			  con=pool.getConnection();
			  
			  String sql="select * from purchase_list where userid=?";
			  ps=con.prepareStatement(sql);
			  ps.setString(1, userid);
			  
			  rs=ps.executeQuery();
			  while (rs.next()) {
				  int plCode=rs.getInt("plcode");
				  int qty=rs.getInt("qty");
				  int total=rs.getInt("total");
				  Timestamp regdate=rs.getTimestamp("regdate");
				  int memNo=rs.getInt("memno");
				  int pdCode=rs.getInt("pdcode");
				  
				  PurchaseVO vo=new PurchaseVO(plCode, qty, total, regdate, memNo, pdCode);
				  list.add(vo);
			  }
			  return list;
		  } finally {
			  pool.dbClose(rs, ps, con);
		  }
	  }
	 
	  
}
