<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cVo" class="com.homedeco.comments.model.CommentsVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="cDao" class="com.homedeco.comments.model.CommentsDAO"
	scope="page"></jsp:useBean>
    
<%
	request.setCharacterEncoding("utf-8");
	String cNo=request.getParameter("no");
	String groupNo=request.getParameter("groupNo");
	String sortNo=request.getParameter("sortNo");
%>	
	<script type="text/javascript">
	if(confirm('정말 삭제하시겠습니까?')){
		location.href="delete_ok.jsp?no=<%=cNo%>&groupNo=<%=groupNo%>&sortNo=<%=sortNo%>";
	}else{
		location.href="detail.jsp?no=<%=cNo%>";
	} 
	</script>
	
	
	
		

