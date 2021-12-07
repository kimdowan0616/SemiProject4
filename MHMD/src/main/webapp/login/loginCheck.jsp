<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String l_userid=(String)session.getAttribute("userid");
	String ctxPath=request.getContextPath();
	
	if(l_userid==null || l_userid.isEmpty()){ %>
		<script type="text/javascript">
			alert("먼저 로그인하세요!");
			location.href="<%=ctxPath%>/login/login.jsp";			
		</script>
		
	<%	return;
	}
%>