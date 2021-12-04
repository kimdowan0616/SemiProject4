<%@page import="com.semiproject.common.Utility"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semiproject.model.ContentsVO"%>
<%@page import="com.semiproject.model.ContentsDAO"%>
<%@ include file="../section/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete_ok.jsp</title>
</head>
<body class="masthead">
<section class="page-section" id="contents"
		style="padding-top: 0px; padding-bottom: 0px">
	<div class="container">
	<%
		//delete.jsp에서 post방식으로 서브밋됨
		request.setCharacterEncoding("utf-8");
	
		//1
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String oldFileName=request.getParameter("oldFileName");
		
		//2
		ContentsDAO dao = new ContentsDAO();
		
		try{
			ContentsVO vo = new ContentsVO();
			vo.setNo(Integer.parseInt(no));
			vo.setPwd(pwd);
			
			if(dao.checkPwd(vo)){
				dao.deleteContents(vo);
				//기존 파일이 존재하면 기존파일 삭제처리
				if(oldFileName!=null && !oldFileName.isEmpty()){
					String saveDir=application.getRealPath(Utility.UPLOAD_PATH); //업로드 경로
					saveDir=config.getServletContext().getRealPath(Utility.UPLOAD_PATH);
					saveDir=Utility.TEST_PATH;
					
					File oldFile = new File(saveDir, oldFileName);
					if(oldFile.exists()){
						boolean bool=oldFile.delete();
						System.out.println("기존파일 삭제 여부:"+bool);
					}
				}
			%>
				<script type="text/javascript">
					alert("글 삭제되었습니다.");
					location.href="list.jsp";
				</script>	
		<%	}else{ %>
				<script type="text/javascript">
					alert("비밀번호가 일치하지 않습니다.");
					history.back();
				</script>
		<%	}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	</div>
</section>

<%@include file="../section/footer.jsp"%>