package com.homedeco.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.homedeco.db.ConnectionPoolMgr;

public class ProductDAO {
	private ConnectionPoolMgr pool;
	
	public ProductDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public ProductVO selectByPdCode(int pdCode) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ProductVO vo=new ProductVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from product where pdcode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, pdCode);
			
			rs=ps.executeQuery();
			if (rs.next()) {
				String pdName=rs.getString("pdname");
				int price=rs.getInt("price");
				Timestamp regdate=rs.getTimestamp("regdate");
				int cgCode=rs.getInt("cgcode");
				int comNo=rs.getInt("comno");
				
				vo.setPdCode(pdCode);
				vo.setPdName(pdName);
				vo.setPrice(price);
				vo.setRegdate(regdate);
				vo.setCgCode(cgCode);
				vo.setComNo(comNo);
			}
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

}
