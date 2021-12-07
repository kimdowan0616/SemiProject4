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


public class ReBoardDAO {
	private ConnectionPoolMgr2 pool;
	
	public ReBoardDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	/**
	 * 글등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertReBoard(ReBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="insert into reBoard(no, name, pwd, title, email, "
					+ "content, groupno, filename, filesize, originalFilename)"
					+ " values(reBoard_seq.nextval, ?,?,?,?,?,"
					+ " reBoard_seq.nextval,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getContent());
			ps.setString(6, vo.getFileName());
			ps.setLong(7, vo.getFileSize());
			ps.setString(8, vo.getOriginalFileName());
						
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
	public List<ReBoardVO> selectAll(String condition, String keyword) 
			throws SQLException {
		/*
		select * from reBoard
		where title like '%안녕%';
		select * from reBoard
		where name like '%길동%';
		select * from reBoard
		where content like '%내용%';
		*/
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ReBoardVO> list=new ArrayList<ReBoardVO>();
		try {
			//1,2 con
			con=pool.getConnection();
			
			//3 ps
			String sql="select * from reBoard";
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우				
				sql+= "	where " + condition +" like '%' || ? || '%'";
			}
			sql += " order by groupno desc, sortno";			
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우	
				ps.setString(1, keyword);
			}
			
			//4 exec
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				int readcount=rs.getInt("readcount");
				String title=rs.getString("title");
				String name=rs.getString("name");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String content=rs.getString("content");
				Timestamp regdate=rs.getTimestamp("regdate");
				//답변형 추가
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String delFlag=rs.getString("delflag");
				//자료실 추가
				String fileName=rs.getString("filename");
				String originalFileName=rs.getString("originalFilename");
				int downCount=rs.getInt("downcount");
				long fileSize=rs.getLong("fileSize");
				
				ReBoardVO vo = new ReBoardVO(no, name, pwd, title, email, 
						regdate, readcount, content, groupNo, step, 
						sortNo, delFlag, fileName, fileSize, downCount, 
						originalFileName);
						
				list.add(vo);
			}
			System.out.println("글목록 결과 list.size="+list.size()
				+", keyword="+keyword+", condition="+condition);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/**
	 * 글 상세보기 메서드-번호로 조회
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public ReBoardVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ReBoardVO vo=new ReBoardVO();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from reBoard where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String name=rs.getString("name");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String content=rs.getString("content");
				int readcount=rs.getInt("readcount");
				Timestamp regdate=rs.getTimestamp("regdate");
				//답변형 추가
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String delFlag=rs.getString("delflag");
				//자료실 추가
				String fileName=rs.getString("filename");
				String originalFileName=rs.getString("originalFilename");
				int downCount=rs.getInt("downcount");
				long fileSize=rs.getLong("fileSize");
				
				vo.setContent(content);
				vo.setEmail(email);
				vo.setName(name);
				vo.setNo(no);
				vo.setPwd(pwd);
				vo.setReadcount(readcount);
				vo.setRegdate(regdate);
				vo.setTitle(title);
				
				vo.setGroupNo(groupNo);
				vo.setSortNo(sortNo);
				vo.setStep(step);
				vo.setDelFlag(delFlag);
				
				vo.setFileName(fileName);
				vo.setFileSize(fileSize);
				vo.setOriginalFileName(originalFileName);
				vo.setDownCount(downCount);
			}
			System.out.println("상세보기 결과 vo="+vo+", 매개변수 no="+no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateReBoard(ReBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update reBoard";
			sql+= " set name=?,title=?, email=?, content=?";
			
			//파일이 첨부된 경우
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) { 
				sql+=", filename=?, filesize=?, originalFilename=?";
			}
			sql+= " where no=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getEmail());
			ps.setString(4, vo.getContent());
			
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
	
	public boolean checkPwd(ReBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		boolean bool=false;
		try {
			//1,2
			con=pool.getConnection();
			
			//3.
			String sql="select pwd from reboard where no=?";
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
	
	public void deleteReBoard(ReBoardVO vo) throws SQLException {
		Connection con=null;
		CallableStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="call delete Reboard(?,?,?)";
			ps=con.prepareCall(sql);
			ps.setInt(1, vo.getNo());
			ps.setInt(2, vo.getStep());
			ps.setInt(3, vo.getGroupNo());
			
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
			
			String sql="update reBoard set readcount=readcount+1"					
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
	
	public int reply(ReBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try {
			//1,2 con
			con=pool.getConnection();
			
			//transaction 시작
			con.setAutoCommit(false);  //자동커밋 안되게 막는다
			
			//3. ps
			//[1] update - sortNo를 1씩 증가시켜 자리확보
			String sql="update reboard"
					+ " set sortno=sortno+1"
					+ " where groupno=? and sortno > ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			//4. exec
			cnt=ps.executeUpdate();
			System.out.println("답변달기 - update 결과 cnt="+cnt
					+", 매개변수 vo="+vo);
			
			//[2] insert
			sql="insert into reboard(no, name, pwd, title, email, content, "
				+ "groupno, step, sortno)"
				+ "values(reboard_seq.nextval, ?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getContent());
			ps.setInt(6, vo.getGroupNo());
			ps.setInt(7, vo.getStep()+1);
			ps.setInt(8, vo.getSortNo()+1);
			
			
			cnt=ps.executeUpdate();
			System.out.println("답변하기 결과 cnt="+cnt);
			
			//커밋 - 모두 성공하면
			con.commit();
		}catch(SQLException e) {
			//롤백 - 하나라도 실패하면
			con.rollback();
			e.printStackTrace();
		}finally {			
			//transaction 종료
			
			//다시 자동커밋 되도록
			con.setAutoCommit(true);
			pool.dbClose(ps, con);
		}
		
		return cnt;
	}
	
	public int updateDownCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update reBoard set downcount=downcount+1"					
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











