<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.semiproject.common.Utility"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.semiproject.model.ContentsVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semiproject.model.ContentsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//edit.jsp에서 post방식으로 서브밋됨
	
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
		
		//1
		String title=mr.getParameter("title");
		String userid=mr.getParameter("userid");
		String pwd=mr.getParameter("pwd");
		String content=mr.getParameter("content2");
		String no=mr.getParameter("no");
		String oldFileName=mr.getParameter("oldFileName");
		String pdCode=mr.getParameter("pdCode");
		
		//2
		ContentsDAO dao = new ContentsDAO();	
		ContentsVO vo = new ContentsVO();
		vo.setContent2(content);
		vo.setUserid(userid);
		vo.setNo(Integer.parseInt(no));
		vo.setPwd(pwd);
		vo.setTitle(title);
		vo.setFileName(fileName);
		vo.setOriginalFileName(originalFName);
		vo.setFileSize(fileSize);
		vo.setPdCode(Integer.parseInt(pdCode));
		
		if(dao.checkPwd(vo)){		
			int cnt=dao.updateContents(vo);
			
			//3
			if(cnt>0){ 
				//새로 업로드한 경우-기존 파일이 존재하면 기존파일 삭제처리
				if(fileName!=null){
					if(oldFileName!=null && !oldFileName.isEmpty()){
						File oldFile = new File(saveDir, oldFileName);
						if(oldFile.exists()){
							boolean bool=oldFile.delete();
							System.out.println("기존파일 삭제 여부:"+bool);
						}
					}
				}//if
		%>
				<script type="text/javascript">
					alert("글 수정되었습니다.");
					location.href="detail.jsp?no=<%=no%>";
				</script>	
		<%	}else{ %>
				<script type="text/javascript">
					alert("글 수정 실패!");
					history.go(-1);				
				</script>
		<%	}
		}else{  //비번 불일치 %>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
				history.go(-1);				
			</script>	
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>