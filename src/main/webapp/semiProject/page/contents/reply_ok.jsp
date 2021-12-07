<%@page import="com.semiproject.model.ReBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semiproject.model.ReBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply_ok.jsp</title>
</head>
<body>
<%
	//write.jsp에서 답변버튼 클릭하면 post방식으로 서브밋
	
	request.setCharacterEncoding("utf-8");

	//1
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String content=request.getParameter("content");
	String groupNo=request.getParameter("groupNo");
	String step=request.getParameter("step");
	String sortNo=request.getParameter("sortNo");
	
	//2
	ReBoardDAO dao = new ReBoardDAO();
	try{
		ReBoardVO vo= new ReBoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setGroupNo(Integer.parseInt(groupNo));
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setSortNo(Integer.parseInt(sortNo));
		vo.setStep(Integer.parseInt(step));
		vo.setTitle(title);
		
		int cnt=dao.reply(vo);
		
		//3
		if(cnt>0){ %>
			<script type="text/javascript">
				alert('답변 등록되었습니다.');
				location.href="list.jsp";
			</script>		
	<%	}else{%>
			<script type="text/javascript">
				alert('답변 등록 실패!');
				history.back();
			</script>
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}	
	
%>
</body>
</html>