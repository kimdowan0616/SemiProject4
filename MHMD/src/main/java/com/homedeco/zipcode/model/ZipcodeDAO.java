package com.homedeco.zipcode.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.homedeco.db.ConnectionPoolMgr;

public class ZipcodeDAO {
	private ConnectionPoolMgr pool;
	
	public ZipcodeDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from zipcode where dong like '%' || ? || '%'";
			ps=con.prepareStatement(sql);
			ps.setString(1, dong);
			
			rs=ps.executeQuery();
			while (rs.next()) {
				int seq=rs.getInt("seq");
				String zipcode=rs.getString("zipcode");
				String sido=rs.getString("sido");
				String gugun=rs.getString("gugun");
				String dong2=rs.getString("dong2");
				String startbunji=rs.getString("startbunji");
				String endbunji=rs.getString("endbunji");
				
				ZipcodeVO vo=new ZipcodeVO(seq, zipcode, sido, gugun, dong2, startbunji, endbunji);
				list.add(vo);
			}
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

}
