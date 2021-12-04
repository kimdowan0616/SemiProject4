<%@page import="com.semiproject.common.Utility"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semiproject.model.ContentsVO"%>
<%@page import="com.semiproject.model.ContentsDAO"%>
<%@ include file="../section/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>컨텐츠게시판 - 수정</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<%
//detail.jsp에서 [수정]링크 클릭하면 get방식으로 이동
//1
String no = request.getParameter("no");

if (no == null || no.isEmpty()) {
%>
<script type="text/javascript">
	alert("잘못된 url입니다.");
	location.href = "list.jsp";
</script>

<%
return;
}

//2
ContentsDAO dao = new ContentsDAO();

ContentsVO vo = null;
try {
vo = dao.selectByNo(Integer.parseInt(no));
} catch (SQLException e) {
e.printStackTrace();
}

String content = vo.getContent2();
String oldFileName = vo.getFileName();

if (content == null)
content = "";
if (oldFileName == null)
oldFileName = "";
%>

<script type="text/javascript">
	
</script>

</head>
<body class="masthead">
	<section class="page-section" id="contents"
		style="padding-top: 0px; padding-bottom: 0px">
		<div class="container">
			<form name="frmEdit" method="post" action="edit_ok.jsp"
				enctype="multipart/form-data">
				<!-- 수정시 no가 필요하므로 히든 필드에 담아서 넘겨준다 -->
				<input type="hidden" name="no" value="<%=no%>">

				<fieldset>
					<legend>글수정</legend>
					<div class="firstDiv">
						<label for="title">제목</label> <input type="text" id="title"
							name="title" value="<%=vo.getTitle()%>" />
					</div>
					<div>
						<label for="name">작성자</label> <input type="text" id="userid"
							name="userid" value="<%=vo.getUserid()%>" />
					</div>
					<div>
						<label for="pwd">비밀번호</label> <input type="password" id="pwd"
							name="pwd" />
					</div>
					<div>
						<label for="upfile">첨부파일</label> <input type="file" id="upfile"
							name="upfile" />
					</div>
					<div>
						<span class="sp1">첨부파일목록</span>
						<%
						if (vo.getFileName() != null && !vo.getFileName().isEmpty()) {
						%>
						<span><%=Utility.showFileInfo(vo.getOriginalFileName(), vo.getFileSize())%>
						</span><br> <span style="color: green; font-weight: bold">
							첨부파일을 새로 지정할 경우 기존 파일은 삭제됩니다.</span>
						<%
						}
						%>
					</div>

					<div>
						<label for="content">내용</label>
						<textarea id="content" name="content" rows="12" cols="40"><%=content%></textarea>
					</div>
					<div class="center">
						<input type="submit" value="수정" /> <input type="Button"
							value="글목록" onclick="location.href	='list.jsp'" />
					</div>
				</fieldset>
			</form>
		</div>

		</div>
	</section>

	<%@ include file="../section/footer.jsp"%>