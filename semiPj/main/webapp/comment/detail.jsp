<%@page import="com.homedeco.comments.model.CommentsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.homedeco.common.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../section/top.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/comm.css" />
<script type="text/javascript" src="../js/comm.js"></script>
<jsp:useBean id="bVo" class="com.cm.board.CommunityVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="bDao" class="com.cm.board.CommunityDAO"
	scope="page"></jsp:useBean>
<jsp:useBean id="cVo" class="com.homedeco.comments.model.CommentsVO"
	scope="page"></jsp:useBean>	
<jsp:useBean id="cDao" class="com.homedeco.comments.model.CommentsDAO"
	scope="page"></jsp:useBean>	
	
<%
	String no=request.getParameter("no");
	String l_userid=(String)session.getAttribute("userid");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="list.jsp";
		</script>
	<% return; 
	} 
	
	List<CommentsVO> list=cDao.showByNo(Integer.parseInt(no));
	
	bVo=bDao.selectByNo(Integer.parseInt(no));
	String title=bVo.getTitle();
	String userid=bVo.getUserid();
	String content=bVo.getContent();
	Timestamp regdate=bVo.getRegdate();
	String fileName=bVo.getFileName();
	long fileSize=bVo.getFileSize();
	int downCnt=bVo.getDownCnt();
	String originalFileName=bVo.getOriginalFileName();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String date=Utility.getIntime(regdate); //시간
	
	String fileInfo="", downInfo="";
	if(bVo.getFileName()!=null && !bVo.getFileName().isEmpty()){
		fileInfo=Utility.showFileInfo(bVo.getOriginalFileName(), bVo.getFileSize());
		downInfo="다운로드횟수 : " + bVo.getDownCnt();
	}
	%>


<div id="wrapper" style="margin-top: 82px; height: 100%;">
	<div id="post">
		<div id="header_title">
			<h1><%=title %></h1>
		</div>
		<div id="header_info">
			<span><%=userid %></span>
			<span><%=date %></span>
		</div>
		<%if(fileName!=null){ %>
		<div id="image">
			<img src="<%=request.getContextPath() %>/uploadFile/<%=fileName%>"	style="max-width: 100%; height: auto;"/>
		</div>
		<%} %>
		
		<div id="content">
			<pre id="ss" <%if(fileName==null){%>style="border-bottom: 1px solid rgb(132,132,232);"<% }%>><%=content %>
			</pre>
		</div>
		<%if(fileName!=null){ %>
		<div id="files">
			<span style="font-weight:bold;">첨부파일&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<a href="downCnt.jsp?no=<%=no%>&fileName=<%=bVo.getFileName()%>"><%=fileInfo %></a></span>
			<span style="color:gray; float:right; margin-right:10px"><%=downInfo %></span>
		</div>
		<%} %>
		<div id="buttons">
			<a href="<%=request.getContextPath() %>/community/cmlist.jsp" >목록</a>
			<a href="<%=request.getContextPath() %>/community/cmwrite.jsp" >글쓰기</a>
		</div>
		<div id="comment">
			<img src="<%=request.getContextPath() %>/images/tree.png" />
			<form name="frm1" method="post" action="comment_ok.jsp">
				<input type="hidden" name="l_userid" value="<%=l_userid%>"/>
				<input type="hidden" name="no" value="<%=no%>" />
				<textarea name="textarea"></textarea>
				<input type="submit" name="s" value="등록"/>
			</form>
		</div>
	
		<ul id="list">
		<%for(int i=0;i<list.size();i++) { %>
			<li class="aa">
				<div>
					<div >
						<span><%=list.get(i).getUserid() %></span>
						<span><%=Utility.getIntime(list.get(i).getRegdate()) %></span>
						<a href="#" class="re" data-value="1">댓글</a>
						<%if(list.get(i).getUserid().equals(l_userid)) {%>
						<a href="#" class="re" data-value="2">수정</a>
							<%if(!(cDao.groupCnt(Integer.parseInt(no),list.get(i).getGroupNo())>1 && list.get(i).getSortNo()==0)){ %>
							<a href="delete.jsp?no=<%=no %>&groupNo=<%=list.get(i).getGroupNo()%>&sortNo=<%=list.get(i).getSortNo()%>">삭제</a>
							<%} %>
						<%} %>
						<%if(list.get(i).getStep()>0){ %>
						<img src="<%=request.getContextPath() %>/images/re.png" id="reImg" 
						<%if(list.get(i).getUserid().equals(l_userid)) {%> style="left:-198px;" />
							<%} %>
						<%} %>
					</div>
					<div>
					<%=list.get(i).getComm() %>
					<%=Utility.displayNew(list.get(i).getRegdate()) %>
					</div>
					<form style="display:none;" name="frm2" method="post" action="comment_ok.jsp">
						<input type="hidden" name="type" class="val" value=""/>
						<input type="hidden" name="sortNo" value="<%=list.get(i).getSortNo()%>"/>
						<input type="hidden" name="groupNo" value="<%=list.get(i).getGroupNo()%>"/>
						<input type="hidden" name="l_userid" value="<%=l_userid%>"/>
						<input type="hidden" name="no" value="<%=no%>" />
						<input type="text" name="reCom"/>
						<input type="submit" value="입력" />
					</form>
				</div>
			</li>
			<%} %>
		</ul>
	</div>
</div>
</body>	
<%@ include file="../section/footer.jsp" %>