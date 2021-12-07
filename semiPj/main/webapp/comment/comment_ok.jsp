<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cVo" class="com.homedeco.comments.model.CommentsVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="cDao" class="com.homedeco.comments.model.CommentsDAO"
	scope="page"></jsp:useBean>
   <%
   		request.setCharacterEncoding("utf-8");
    	String comm=request.getParameter("textarea");
    	String cNo=request.getParameter("no");
    	String userid=request.getParameter("l_userid");
    	String reCom=request.getParameter("reCom");
    	String groupNo=request.getParameter("groupNo");
    	String sortNo=request.getParameter("sortNo");
    	String type=request.getParameter("type");
    	
    	//session user
    	
    	cVo.setcNo(Integer.parseInt(cNo));
    	cVo.setUserid(userid);
    	int result=0;
    	if(reCom!=null){
    		if(type.equals("1")){
        		cVo.setComm(reCom);
        		cVo.setGroupNo(Integer.parseInt(groupNo));
        		result=cDao.reply(cVo);
    		}else if(type.equals("2")){
        		cVo.setComm(reCom);
        		cVo.setGroupNo(Integer.parseInt(groupNo));
        		cVo.setSortNo(Integer.parseInt(sortNo));
        		result=cDao.updateComm(cVo);
    		}
    	}else{
    		cVo.setComm(comm);
    		result=cDao.insertComm(cVo);
    	}
		
    	if(result>0){%>
    		<script type="text/javascript">
				location.href="detail.jsp?no=<%=cNo%>";
			</script>
    	<% }else{ %>
    		<script type="text/javascript">
				alert('댓글 등록 실패');
				location.href="detail.jsp?no=<%=cNo%>";
			</script>
	    <% }%>
