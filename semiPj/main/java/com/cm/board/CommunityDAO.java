package com.cm.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.homedeco.db.ConnectionPoolMgr2;


public class CommunityDAO {

	private ConnectionPoolMgr2 pool;

	public CommunityDAO() {
		pool=new ConnectionPoolMgr2();
	}

	//글등록 메서드

	public int insertCommunity(CommunityVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into Community(no,title,userid,pwd,content,filename,filesize,originalfilename)"
					+ " VALUES(Community_SEQ.nextval,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getUserid());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getFileName());
			ps.setLong(6, vo.getFileSize());
			ps.setString(7, vo.getOriginalFileName());
			
			int cnt=ps.executeUpdate();
			System.out.println("글쓰기 결과 : "+cnt+", 매개변수 vo : "+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<CommunityVO> selectAll(String condition, String keyword)
		throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<CommunityVO> list=new ArrayList<CommunityVO>();
		try {
			con=pool.getConnection();
			
			String sql="select * from Community";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql+=" order by no desc";
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				int readcount=rs.getInt("readcount");
				String title=rs.getString("title");
				String userid=rs.getString("userid");
				String pwd=rs.getString("pwd");
				String content=rs.getString("content");
				Timestamp regdate=rs.getTimestamp("regdate");
				//자료실 추가
				String fileName=rs.getString("filename");
				long fileSize=rs.getLong("filesize");
				int downCnt=rs.getInt("downcnt");
				String originalFileName=rs.getString("originalfilename");
				
				CommunityVO vo= new CommunityVO(no, title,
						userid, pwd, content, regdate, readcount,
						fileName, fileSize, downCnt, originalFileName);
				
				list.add(vo);
			}
			System.out.println("list.size="+list.size()
				+", keyword="+keyword+", condition="+condition);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public CommunityVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		CommunityVO vo = new CommunityVO();
		try {
			con=pool.getConnection();
			
			String sql="select * from Community where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String userid=rs.getString("userid");
				String pwd=rs.getString("pwd");
				String content=rs.getString("content");
				Timestamp regdate=rs.getTimestamp("regdate");
				int readcount=rs.getInt("readcount");
				//자료실 추가
				String fileName=rs.getString("filename");
				long fileSize=rs.getInt("filesize");
				int downCnt=rs.getInt("downcnt");
				String originalFileName=rs.getString("originalfilename");
				
				vo.setTitle(title);
				vo.setUserid(userid);
				vo.setPwd(pwd);
				vo.setContent(content);
				vo.setRegdate(regdate);
				vo.setReadcount(readcount);
				
				vo.setFileName(fileName);
				vo.setFileSize(fileSize);
				vo.setDownCnt(downCnt);
				vo.setOriginalFileName(originalFileName);
				
			}
			System.out.println("상세보기 결과 vo : "+vo+", 매개변수 no : "+no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateCommunity(CommunityVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update Community";
			sql+=" set title=?,userid=?,pwd=?,content=?";
			
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) {
				sql+=", filename=?,filesize=?,originalFilename=?";
			}
			
			sql+=" where no=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getUserid());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getContent());
			
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) {
				ps.setString(5, vo.getFileName());
				ps.setLong(6, vo.getFileSize());
				ps.setString(7, vo.getOriginalFileName());
				ps.setInt(8, vo.getNo());
			}else {
				ps.setInt(5, vo.getNo());
			}
			
			int cnt=ps.executeUpdate();
			System.out.println("글 수정결과 cnt : "+cnt+", 매개변수 vo : "+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public boolean checkPwd(CommunityVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		boolean bool=false;
		
		try {
			con=pool.getConnection();
			
			String sql="select pwd from Community where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(vo.getPwd())) {
					bool=true;
				}
			}
		
		}finally {
			pool.dbClose(rs, ps, con);
		}
		System.out.println("비밀번호 체크결과 bool="+bool+", 매개변수 vo="+vo);
		return bool;
	}
	
	public void deleteCommunity(CommunityVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from community where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			boolean bool=ps.execute();
			System.out.println("글 삭제 bool="+bool+", 매개변수 vo="+vo);
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateReadCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update Community set readcount=readcount+1"					
					+ " where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println(" cnt="+cnt+" no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateDownCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update community set downcnt=downcnt+1"					
					+ " where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("다운로드수 증가 결과 cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}


