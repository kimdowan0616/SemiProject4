<%@page import="java.sql.SQLException"%>
<%@page import="com.semiproject.model.ContentsDAO"%>
<%@page import="com.semiproject.model.ContentsVO"%>
<%@ include file="../section/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//[1] 글쓰기 - 파라미터 no가 없는 경우
	//[2] 답변 - 파라미터 no가 있는 경우
	String no=request.getParameter("no");
	String title="", btVal="", actionVal="";
	String titleVal="";
	boolean isReply=false;
	ContentsVO vo=null;
	if(no!=null && !no.isEmpty()){
		isReply=true;
		title="답변하기";
		btVal="답변";
		actionVal="reply_ok.jsp";
		
		ContentsDAO dao = new ContentsDAO();		
		try{
			vo=dao.selectByNo(Integer.parseInt(no));
			titleVal="Re : "+vo.getTitle();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		title="글쓰기";		
		btVal="등록";
		actionVal="write_ok.jsp";
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />

<title>컨텐츠게시판 - 글쓰기 <%=title %>
</title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmWrite]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html() + "을(를) 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;  //each 탈출
				}
			});
		});
		
		$('#btList').click(function(){
			location.href="list.jsp";
		});
		
	});
</script>

</head>
<body class="masthead">
<section class="page-section" id="contents"
		style="padding-top: 0px; padding-bottom: 0px; text-align: center;">
	<div class="container">
		<form name="frmWrite" method="post" action="<%=actionVal %>"
			enctype="multipart/form-data">
			<fieldset>
				<legend><%=title %></legend>
				<div class="firstDiv">
					<label for="title">제목 :</label> <input type="text" id="title"
						name="title" class="infobox" value="<%=titleVal %>" />
				</div>
				<div>
					<label for="userid">아이디 : </label> <input type="text" id="userid"
						name="userid" class="infobox" />
				</div>
				<div>
					<label for="pwd">비밀번호 </label> <input type="password" id="pwd"
						name="pwd" class="infobox" />
				</div>
				<div>
					<label for="pdCode">상품번호 </label> <input type="text" id="pdCode"
						name="pdCode" class="infobox" />
				</div>
				<div>
					<label for="content">내용</label>
					<textarea id="content" name="content2" rows="12" cols="40"></textarea>
				</div>
				<div>
					<label for="upfile">첨부파일</label> <input type="file" id="upfile"
						name="upfile" /> <span>(최대 2M)</span>
				</div>
				<div class="center">
					<input type="submit" value="<%=btVal %>"/>
					<a href="list.jsp">
					<input type="Button" id="btList" value="글목록"/></a>
				</div>
			</fieldset>
		</form>
		<br><br><br>
	</div>
</section>

<%@include file="../section/footer.jsp"%>