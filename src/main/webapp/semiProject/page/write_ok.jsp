<%@page import="com.semiproject.model.ContentsVO"%>
<%@page import="com.semiproject.model.ContentsDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.semiproject.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@ include file="../section/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body class="masthead">
<section class="page-section" id="portfolio"
		style="padding-top: 0px; padding-bottom: 0px">
	<div class="contentsthumbnail">
<%
	//write.jsp에서 post방식으로 서브밋됨
	
	//실제 물리적인 경로(절대 경로)
	String saveDir=application.getRealPath(Utility.UPLOAD_PATH); //업로드 경로
	saveDir=config.getServletContext().getRealPath(Utility.UPLOAD_PATH);
	System.out.print(saveDir);
	saveDir=Utility.TEST_PATH;
	
	int maxSize=2*1024*1024;  //업로드파일의 최대 크기, 2M
	String encoding="UTF-8";
	
	try{
		MultipartRequest mr=new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
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
		String content2=mr.getParameter("content2");
		
		//ip 읽어오기
		String ip=request.getRemoteAddr();
		String ip2=request.getRemoteHost();
		System.out.println("ip="+ip+", ip2="+ip2);
		
		//2. db작업
		ContentsDAO dao = new ContentsDAO();
		ContentsVO vo=new ContentsVO();
		vo.setContent2(content2);
		vo.setUserid(userid);
		vo.setPwd(pwd);
		vo.setTitle(title);
		vo.setFileName(fileName);
		vo.setOriginalFileName(originalFName);
		vo.setFileSize(fileSize);
		
		int cnt=dao.insertContents(vo);
		
		//3. 결과 처리  
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("글쓰기 처리되었습니다.");
				location.href="list.jsp";
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
	</div>
</section>

<%@include file="../section/footer.jsp"%>



