<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.cm.board.CommunityVO"%>
<%@page import="com.cm.board.CommunityDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.cm.db.Utility"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../section/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="masthead">

<%
	//cmwrite.jsp에서 post방식으로 서브밋됨

	//실제 물리적인 경로(절대 경로)
	String saveDir=application.getRealPath(Utility.UPLOAD_PATH); //업로드 경로
	saveDir=config.getServletContext().getRealPath(Utility.UPLOAD_PATH);
	System.out.print(saveDir);
	saveDir=Utility.TEST_PATH;
	
	int maxSize=2*1024*1024;  //업로드파일의 최대 크기, 2M
	String encoding="utf-8";
	
	try{
		MultipartRequest mr
		=new MultipartRequest(request, saveDir, maxSize, encoding,
				new DefaultFileRenamePolicy());
		System.out.println("업로드 완료!");
		
		//업로드 파일의 정보 
		String fileName=mr.getFilesystemName("upfile");
		long fileSize=0;
		String originalFName="";
		if(fileName!=null){  //파일이 첨부된 경우만
			File file=mr.getFile("upfile");
			fileSize=file.length();
			
			originalFName=mr.getOriginalFileName("upfile");
		}
		
		//1. 요청 파라미터 읽어오기
		String title=mr.getParameter("title");
		String userid=mr.getParameter("userid");
		String pwd=mr.getParameter("pwd");
		String content=mr.getParameter("content");
		
		//ip 읽어오기
		String ip=request.getRemoteAddr();
		String ip2=request.getRemoteHost();
		System.out.println("ip="+ip+", ip2="+ip2);
		
		//2. db작업
		CommunityDAO dao = new CommunityDAO();
		CommunityVO vo = new CommunityVO();
		vo.setContent(content);
		vo.setUserid(userid);
		vo.setPwd(pwd);
		vo.setTitle(title);
		vo.setFileName(fileName);
		vo.setOriginalFileName(originalFName);
		vo.setFileSize(fileSize);
		
		int cnt=dao.insertCommunity(vo);
		
		//3. 결과 처리  
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("글쓰기 처리되었습니다.");
				location.href="cmlist.jsp";
			</script>
	<%  }else{ %>
			<script type="text/javascript">
				alert("글쓰기 실패!");
				history.back();
			</script>			
	<%	}//if
	}catch(SQLException e){
		e.printStackTrace();
	}catch(IOException e){ %>
		<script type="text/javascript">
			alert("2M 이상의 파일은 업로드 불가!");
			history.back();
		</script>	
	<%	e.printStackTrace();
	}
%>


<%@include file="../section/footer.jsp"%>