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
	cVo.setcNo(Integer.parseInt(cNo));
	cVo.setGroupNo(Integer.parseInt(groupNo));
	cVo.setSortNo(Integer.parseInt(sortNo));
	int cnt=cDao.deleteComm(cVo);
	response.sendRedirect("/semi/comment/detail.jsp?no="+cNo);
%>
	
	
	
		

