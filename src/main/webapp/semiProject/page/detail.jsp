<%@page import="com.semiproject.model.ContentsVO"%>
<%@page import="com.semiproject.model.ContentsDAO"%>
<%@page import="com.semiproject.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@ include file="../section/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//countUpdate.jsp에서 조회수 증가 성공하면 get방식으로 이동
	//=> http://localhost:9090/herbmall/reBoard/detail.jsp?no=3
	//1
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="list.jsp";
		</script>
	<%	return;
	}
	
	//2
	ContentsDAO dao = new ContentsDAO();
	
	ContentsVO vo=null;
	try{
		vo=dao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String content=vo.getContent2();
	if(content!=null){  //내용 줄바꿈 처리, \r\n => <br>
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	String fileInfo="", downInfo="";
	if(vo.getFileName()!=null && !vo.getFileName().isEmpty()){
		fileInfo=Utility.showFileInfo(vo.getOriginalFileName(), vo.getFileSize());
		downInfo="다운 : " + vo.getDownCnt();
	}
	
	String oldFileName=vo.getFileName();	
	if(oldFileName==null) oldFileName="";
%>    
<!DOCTYPE HTML>
<head>
<meta charset="UTF-8">
<title>컨텐츠 게시판</title>
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style>  
</head>
<body class="masthead">
	<section class="page-section" id="contents"
		style="padding-top: 0px; padding-bottom: 0px">
	<div class="container">
		<div class="firstDiv">
			<span class="sp1"></span> <span style="font-size: 2em; font-weight: bold;"><%=vo.getTitle() %></span>
		</div>
		<div>
			<span class="sp1">아이디</span> <span><%=vo.getUserid() %></span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span><%=vo.getRegdate() %></span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span><%=vo.getReadcount() %></span>
		</div>
		<div>
			<span class="sp1">사용된 제품의 코드</span> <span><%=vo.getPdCode() %></span>
		</div>
		<div>
			<span class="sp1">첨부파일</span> 
			<span>
				<a href="downCount.jsp?no=<%=no%>&fileName=<%=vo.getFileName()%>">
				<%=fileInfo %></a> 
				<%=downInfo %></span>
		</div>		
		<div class="lastDiv">
		<div>
		<img src="../uploadFile/<%=vo.getFileName()%>" width="500" onerror="" /><br />
		</div>	
			<p class="content"><%=content %></p>
		</div>
		<div class="center">
			<div class="btn btn-primary">
				<a href='edit.jsp?no=<%=no%>' style="color: black">수정</a>
			</div>
			<div class="btn btn-primary">
				<a href='delete.jsp?no=<%=no%>&oldFileName=<%=oldFileName%>' style="color: black">삭제</a>
			</div>
			<div class="btn btn-primary">
				<a href='list.jsp' style="color: black">목록</a>
			</div>
		</div>
		<br><br><br><br><br>
	</div>
	</section>

	<%@ include file="../section/footer.jsp"%>