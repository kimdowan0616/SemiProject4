<%@page import="com.cm.db.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.cm.board.CommunityVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cm.board.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../section/top.jsp"%>
<%
	//1
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
	String userid=(String)session.getAttribute("userid");
	
	//2
	CommunityDAO dao= new CommunityDAO();
	
	List<CommunityVO> list=null;
	try{
		list=dao.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	if(keyword==null) keyword="";
	
	//페이징 처리
	int currentPage=1;	//현재페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	//현재 페이지와 무관한 변수
		int totalRecord=list.size(); //총 레코드 개수, 17
		int pageSize=6;  //한 페이지에 보여줄 레코드 수
		int totalPage=(int)Math.ceil((float)totalRecord/pageSize); //총 페이지수
		int blockSize=10;  //한 블럭에 보여줄 페이지 수
	
	//현재 페이지를 이용해서 계산하는 변수
	int firstPage=currentPage-((currentPage-1)%blockSize); //1,11,21,...
	int lastPage=firstPage+ (blockSize-1);  //10,20,30,...
		
	//페이지당 ArrayList에서의 시작 index => 0,5,10,15...
	int curPos=(currentPage-1)*pageSize;
		
	//페이지당 글 리스트 시작번호
	int num=totalRecord-curPos; //17, 12, 7, 2
%>
<script type="text/javascript">
	$(function() {
		$('.divList .box2 tbody tr').hover(function() {
			$(this).css('background', 'skyblue');
		}, function() {
			$(this).css('background', '');
		});
	});
</script>
<style type="text/css">

body {
	padding: 5px;
	margin: 5px;
}

.row .fn {
    text-align: right;
}

.row .fn > * {
    margin-left: 15px;
}

.portfolio-item > a:first-child {
    text-align: center;
}

.portfolio-item > a:first-child > div {
    margin: 16px 0;
}

.row img, svg {
  vertical-align: middle;
  width: 416px;
  height:416px;
}

.divPage {
    text-align: center;
}

a{
	text-decoration:none;
}

</style>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="masthead">
	<seciton class="page-section portfolio" id="portfolio"
		style="padding-top: 0px; padding-bottom: 0px">
		<div class="container">
			<%if(keyword!=null && !keyword.isEmpty()){ %>
			<p>
			검색어 :<%=keyword %>,
			<%=list.size() %>건 검색되었습니다.
			</p>
	<%	} %>
	<div class="container" style="padding-top: 0px; padding-bottom: 10px; float: left;">
				<h2 style="text-align: center">커뮤니티 게시판</h2>
				<div class="btn btn-primary btn-sm" style="float: right">
				<a href='cmwrite.jsp' style="color: black">글쓰기</a></div>
				<div style="float: left; width: 80%">
					<form class="form" method="post" action='cmlist.jsp' border: 10px;">
						<select class="form-select-sm" style="float: left">
							<option value="title" <%if ("title".equals(condition)) {%>
								selected="selected" <%}%>>제목</option>
							<option value="content" <%if ("content".equals(condition)) {%>
								selected="selected" <%}%>>내용</option>
							<option value="userid" <%if ("userid".equals(condition)) {%>
								selected="selected" <%}%>>아이디</option>	
						</select>
					<input class="form-control me-2" type="text" name="searchKeyword"
									placeholder="게시글 내 검색하기" value="<%=keyword%>" style="float: left; width: 30%;">	
					<button class="btn btn-primary btn-sm" type="submit" style="color: black; float: left;">검색</button>
					</form>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<!--게시판 내용 반복문 시작  -->
				<% for(int i=0;i<pageSize;i++){
	    			if(num<1) break;	
	    
					CommunityVO vo=list.get(curPos++);
					num--;
	 			%>
				<div class="col-md-6 col-lg-4 mb-5">
						<div class="portfolio-item mx-auto" >
							<a href="countUpdate.jsp?no=<%=vo.getNo()%>" style="font-size: 1.1em; font-weight: bold; color: black"> 
								<!-- 썸네일 -->
								<img src="<%=request.getContextPath()%>/uploadFile/<%=list.get(i).getFileName()%>" />
								<!-- 제목이 긴 경우 일부만 보여주기 -->
								<div><%=Utility.cutString(vo.getTitle(), 35)%></div>
								<%if(userid.equals(list.get(i).getUserid())){%>
								<div class="fn">
									<span><a href="<%=request.getContextPath() %>/community/cmedit.jsp?no=<%=list.get(i).getNo()%>">수정</a></span>
									<span><a href="<%=request.getContextPath() %>/community/cmdelete.jsp?no=<%=list.get(i).getNo()%>">삭제</a></span>
								</div>
								<%} %>
							</a> 
						</div>
					</div>	
					<% } //for %>
				<!--반복처리 끝  -->
			</tbody>
		</table>
	</div>
	<div class="divPage">
		<!-- 페이지 번호 추가 -->
		<!-- 이전 블럭으로 이동 -->
		<%	if(firstPage>1){ %>
		<a
			href="cmlist.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			<img src="../images/first.JPG" alt="이전블럭">
		</a>
		<%	}	%>

		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break; 
			
			if(i==currentPage){ 	%>
		<span style="color: blue; font-weight: bold; font-size: 1em"> <%=i %></span>
		<%}else{ %>
		<a
			href="cmlist.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			[<%=i %>]
		</a>
		<%}//if %>
		<%	}//for 	%>

		<!-- 다음 블럭으로 이동 -->
		<%	if(lastPage < totalPage){ %>
		<a
			href="cmlist.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
			<img src="../images/last.JPG" alt="다음블럭">
		</a>
		<%	}	%>
		<!--  페이지 번호 끝 -->
	</div>
	<br><br><br>
</div>
</seciton>

<%@include file="../section/footer.jsp"%>