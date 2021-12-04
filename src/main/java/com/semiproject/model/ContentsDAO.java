package com.semiproject.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semiproject.DB.ConnectionPoolMgr2;


public class ContentsDAO {
	private ConnectionPoolMgr2 pool;
	
	public ContentsDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	/**
	 * 글등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertContents(ContentsVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="insert into contents(no, title, userid, pwd,content2, image, fileName, fileSize, originalFileName,pdCode)\r\n"
					+ " values(Contents_seq.nextval, ?,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getUserid());
			ps.setString(3, vo.getPwd());
			ps.setString(4, vo.getContent2());
			ps.setString(5, vo.getImage());
			ps.setString(6, vo.getFileName());
			ps.setLong(7, vo.getFileSize());
			ps.setString(8, vo.getOriginalFileName());
			ps.setString(9, "21");
						
			//4
			int cnt=ps.executeUpdate();
			System.out.println("글쓰기 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	/**
	 * 글 목록 메서드
	 * @return
	 * @throws SQLException
	 */
	public List<ContentsVO> selectAll(String condition, String keyword) 
			throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ContentsVO> list=new ArrayList<ContentsVO>();
		try {
			//1,2 con
			con=pool.getConnection();
			
			//3 ps
			String sql="select * from contents ";
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우				
				sql+= "	where " + condition +" like '%' || ? || '%'";
			}
			sql += " order by no desc";			
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우	
				ps.setString(1, keyword);
			}
			
			//4 exec
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String title=rs.getString("title");
				String userid=rs.getString("userid");
				String pwd=rs.getString("pwd");
				String content2=rs.getString("content2");
				String image=rs.getString("image");
				String fileName=rs.getString("fileName");
				String originalFileName=rs.getString("originalFileName");
				Timestamp regdate=rs.getTimestamp("regdate");
				int pdCode=rs.getInt("pdCode");
				int readcount=rs.getInt("readcount");
				long fileSize=rs.getLong("fileSize");
				int downCnt=rs.getInt("downCnt");
				
				ContentsVO vo = new ContentsVO
						(no, title, userid, pwd, content2, regdate, image, 
								fileName, fileSize, downCnt, readcount, 
								originalFileName, pdCode);
						
				list.add(vo);
			}
			System.out.println("글목록 결과 list.size="+list.size()
				+", keyword="+keyword+", condition="+condition);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	 //글 상세보기 메서드-번호로 조회
	public ContentsVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ContentsVO vo=new ContentsVO();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from Contents where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String userid=rs.getString("userid");
				String pwd=rs.getString("pwd");
				String content2=rs.getString("content2");
				int readcount=rs.getInt("readcount");
				Timestamp regdate=rs.getTimestamp("regdate");
				String image=rs.getString("image");
				//자료실 추가
				String fileName=rs.getString("fileName");
				long fileSize=rs.getLong("fileSize");
				int downCnt=rs.getInt("downCnt");
				String originalFileName=rs.getString("originalFileName");
				int pdCode=rs.getInt("pdCode");
				
				vo.setNo(no);
				vo.setTitle(title);
				vo.setUserid(userid);
				vo.setContent2(content2);
				vo.setPwd(pwd);
				vo.setRegdate(regdate);
				vo.setImage(image);
				vo.setFileName(fileName);
				vo.setFileSize(fileSize);
				vo.setDownCnt(downCnt);
				vo.setReadcount(readcount);
				vo.setOriginalFileName(originalFileName);
				vo.setPdCode(pdCode);
			}
			System.out.println("상세보기 결과 vo="+vo+", 매개변수 no="+no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateContents(ContentsVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update Contents";
			sql+= " set userid=?,title=?, pdCode=?, content2=?";
			
			//파일이 첨부된 경우
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) { 
				sql+=", fileName=?, fileSize=?, originalFileName=?";
			}
			sql+= " where no=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getTitle());
			ps.setInt(3, vo.getPdCode());
			ps.setString(4, vo.getContent2());
			
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) {
				ps.setString(5, vo.getFileName());
				ps.setLong(6, vo.getFileSize());
				ps.setString(7, vo.getOriginalFileName());
				ps.setInt(8, vo.getNo());				
			}else {			
				ps.setInt(5, vo.getNo());
			}
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("글 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public boolean checkPwd(ContentsVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		boolean bool=false;
		try {
			//1,2
			con=pool.getConnection();
			
			//3.
			String sql="select pwd from Contents where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(vo.getPwd())) {
					bool=true;
				}
			}
			System.out.println("비밀번호 체크 결과 bool="+bool+", 매개변수 vo="+vo);
			
			return bool;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public void deleteContents(ContentsVO vo) throws SQLException {
		Connection con=null;
		CallableStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="delete from Contents where no=?";
			ps=con.prepareCall(sql);
			ps.setInt(1, vo.getNo());
			
			//4
			boolean bool=ps.execute();
			System.out.println("글 삭제 bool="+ bool +", 매개변수 vo="+vo);			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateReadCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update Contents set readcount=readcount+1"					
					+ " where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int updateDownCnt(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update Contents set downCnt=downCnt+1"					
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











