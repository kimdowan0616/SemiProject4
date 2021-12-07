<%@page import="java.sql.SQLException"%>
<%@page import="com.cm.board.CommunityDAO"%>
<%@page import="com.cm.board.CommunityVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../section/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<title>글쓰기</title>
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
			location.href='cmlist.jsp';	
		});
		
	});
</script>
</head>
<body class="masthead">
	<section class="page-section" id="contents"
		style="padding-top: 0px; padding-bottom: 0px; text-align: center">
		<div class="container">
			<form name="frmWrite" method="post" action="cmwrite_ok.jsp" 
				enctype="multipart/form-data">
			 <fieldset>
				<legend>글쓰기</legend>
			        <div class="firstDiv">
			            <label for="title">제목</label>
			            <input type="text" id="title" name="title" class="infobox" />
			        </div>
			        <div>
			            <label for="userid">아이디</label>
			            <input type="text" id="userid" name="userid" class="infobox" />
			        </div>
			        <div>
			            <label for="pwd">비밀번호</label>
			            <input type="password" id="pwd" name="pwd" class="infobox" />
			        </div>
			        <div>  
			        	<label for="content">내용</label>        
			 			<textarea id="content" name="content" rows="12" cols="40"></textarea>
			        </div>
			        <div>
			            <label for="upfile">첨부파일</label>
			            <input type="file" id="upfile" name="upfile" />
			            <span>(최대 2M)</span>
			        </div>
			        <div class="center">
			            <input type = "submit" value="등록"/>
			            <input type = "Button" id="btList" value="글목록" />         
			        </div>
			    </fieldset>
		</form>
		<br><br><br>  
	</div>
</section>

<%@include file="../section/footer.jsp"%>