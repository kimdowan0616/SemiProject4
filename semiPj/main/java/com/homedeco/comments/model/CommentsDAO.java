package com.homedeco.comments.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.homedeco.db.ConnectionPoolMgr2;

public class CommentsDAO {
	private ConnectionPoolMgr2 pool;
	
	public CommentsDAO(){
		pool= new ConnectionPoolMgr2();
	}
	
	public int insertComm(CommentsVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int groupNo=findGNo(vo.getcNo());
		
		try {
			con=pool.getConnection();
			String sql="insert into comments(cNo,userid,groupNo,comm)"
					+ " values(?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getcNo());
			ps.setString(2, vo.getUserid());
			ps.setInt(3, ++groupNo);
			ps.setString(4, vo.getComm());
			int cnt=ps.executeUpdate();
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int findGNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			String sql="select groupNo from comments "
					+ "where cNo=? "
					+ "order by groupNo desc";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();
		
			if(rs.next()) {
				int result=rs.getInt(1);
				return result;
			}
			return 0;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
		
	}
	
	public List<CommentsVO> showByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<CommentsVO> list=new ArrayList<CommentsVO>();
		CommentsVO vo= null;
		
		try {
			con=pool.getConnection();
			String sql="select * from comments where cno=?"
					+ " order by groupno desc, sortno";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();
			while(rs.next()) {
				int cNo=no;
				String userid=rs.getString("userid");
				int groupNo=rs.getInt("groupNo");
				String comm=rs.getString("comm");
				int sortNo=rs.getInt("sortNo");
				int step=rs.getInt("step");
				Timestamp regdate=rs.getTimestamp("regdate");
				String delFlag=rs.getString("delflag");
				vo = new CommentsVO(cNo, userid, groupNo, comm, sortNo, step, regdate, delFlag);
				list.add(vo);
			}
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int reply(CommentsVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		int cnt=0;
		
		try {
			con=pool.getConnection();
			
			con.setAutoCommit(false);  
			
			String sql="update comments"
					+ " set sortno=sortno+1"
					+ " where groupno=? and sortno > ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			cnt=ps.executeUpdate();
			
			sql="insert into comments(cno,userid,groupNo,comm,sortNo,step)"
				+ "values(?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getcNo());
			ps.setString(2, vo.getUserid());
			ps.setInt(3, vo.getGroupNo());
			ps.setString(4, vo.getComm());
			ps.setInt(5, vo.getSortNo()+1);
			ps.setInt(6, vo.getStep()+1);
			cnt=ps.executeUpdate();
			
			con.commit();
		}catch(SQLException e) {
			con.rollback();
			e.printStackTrace();
		}finally {			
			con.setAutoCommit(true);
			pool.dbClose(ps, con);
		}
		
		return cnt;
	}
	
	public int updateComm(CommentsVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="update comments "
					+ "set comm=? "
					+ "where groupNo=? and sortNo=?";
			ps=con.prepareStatement(sql);
			String comm=vo.getComm();
			int groupNo=vo.getGroupNo();
			int sortNo=vo.getSortNo();
			ps.setString(1, comm);
			ps.setInt(2, groupNo);
			ps.setInt(3, sortNo);
			int cnt=ps.executeUpdate();
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
		
	}
	
	public int deleteComm(CommentsVO vo) throws SQLException {
		Connection con= null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="delete from comments where cNo=? and groupNo=? and sortNo=?";
			ps=con.prepareStatement(sql);
			int cNo=vo.getcNo();
			int groupNo=vo.getGroupNo();
			int sortNo=vo.getSortNo();
			ps.setInt(1, cNo);
			ps.setInt(2, groupNo);
			ps.setInt(3, sortNo);
			int result=ps.executeUpdate();
			
			return result;
			
		}finally {
			pool.dbClose(ps, con);
		}
		
	}
	
	public int groupCnt(int cno,int groupNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			String sql="select count(*) from comments where cno=? and groupNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, cno);
			ps.setInt(2, groupNo);
			rs=ps.executeQuery();
			int result=0;
			while(rs.next()) {
				result=rs.getInt(1);
			}
			
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
