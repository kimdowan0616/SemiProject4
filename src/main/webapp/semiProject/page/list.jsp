<%@page import="com.semiproject.model.ContentsVO"%>
<%@page import="com.semiproject.model.ContentsDAO"%>
<%@page import="com.semiproject.common.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="../section/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//[1] write.jsp에서 [글목록]클릭하면 get방식으로 이동
//또는 write_ok.jsp에서 글쓰기 성공하면 get방식으로 이동
//[2] 검색의 경우 - list.jsp에서 검색버튼 클릭하면 post방식으로 서브밋됨

//1
request.setCharacterEncoding("utf-8");
String condition = request.getParameter("searchCondition");
String keyword = request.getParameter("searchKeyword");

//2
ContentsDAO dao = new ContentsDAO();

List<ContentsVO> list = null;
try {
	list = dao.selectAll(condition, keyword);
} catch (SQLException e) {
	e.printStackTrace();
}

//3
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

if (keyword == null)
	keyword = "";

//페이징 처리
int currentPage = 1; //현재 페이지

//list.jsp?currentPage=2
if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

//현재 페이지와 무관한 변수
int totalRecord = list.size(); //총 레코드 개수, 17
int pageSize = 10; //한 페이지에 보여줄 레코드 수
int totalPage = (int) Math.ceil((float) totalRecord / pageSize); //총 페이지수
int blockSize = 11; //한 블럭에 보여줄 페이지 수

//현재 페이지를 이용해서 계산하는 변수
int firstPage = currentPage - ((currentPage - 1) % blockSize); //1,11,21,...
int lastPage = firstPage + (blockSize - 1); //10,20,30,...

//페이지당 ArrayList에서의 시작 index => 0,5,10,15...
int curPos = (currentPage - 1) * pageSize;

//페이지당 글 리스트 시작번호
int num = totalRecord - curPos; //17, 12, 7, 2
%>

<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
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
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="masthead">
	<section class="page-section" id="contents"
		style="padding-top: 0px; padding-bottom: 0px">
		<div class="container">
			<%if (keyword != null && !keyword.isEmpty()) {%>
			<p>검색어 :<%=keyword%>, <%=list.size()%>건 검색되었습니다.</p>
			<% } %>
			<div class="divList">
				<table class="box2"
					summary="게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
					<caption>컨텐츠 게시판</caption>
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 50%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<!--게시판 내용 반복문 시작  -->
						<%for (int i = 0; i < pageSize; i++) {
							if (num < 1) break;

							ContentsVO vo = list.get(curPos++);
							num--;
						%>
						<tr style="text-align: center">
							<td><%=vo.getNo()%></td>
							<td style="text-align: left">
								<%=Utility.displayFile(vo.getFileName())%> <a
								href="countUpdate.jsp?no=<%=vo.getNo()%>"> <!-- 제목이 긴 경우 일부만 보여주기 -->
									<%=Utility.cutString(vo.getTitle(), 35)%>
							</a> <!-- 24시간 이내의 글인 경우 new 이미지 보여주기 --> 
							<%=Utility.displayNew(vo.getRegdate())%>
							</td>
							<td><%=vo.getUserid() %></td>
							<td><%=sdf.format(vo.getRegdate())%></td>
							<td><%=vo.getReadcount()%></td>
						</tr>
						<% } //for %>
						<!--반복처리 끝  -->
					</tbody>
				</table>
			</div>
 			<div class="divPage">
				<!-- 페이지 번호 추가 -->
				<!-- 이전 블럭으로 이동 -->
				<% if (firstPage > 1) { %>
				<a href="list.jsp?currentPage=<%=firstPage - 1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					<img src="../images/first.JPG" alt="이전블럭">
				</a>
				<% } %>

				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<% for (int i = firstPage; i <= lastPage; i++) {
					if (i > totalPage)
						break;
					if (i == currentPage) { %>
				<span style="color: blue; font-weight: bold; font-size: 1em"><%=i%></span>
				<% } else { %>
				<a href="list.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					[<%=i%>]
				</a>
					<% } //if %>
				<% } //for %>

				<!-- 다음 블럭으로 이동 -->
				<% if (lastPage < totalPage) { %>
				<a href="list.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					<img src="../images/last.JPG" alt="다음블럭">
				</a>
				<% } %>
				<!--  페이지 번호 끝 -->
			</div>
			<div class="divSearch">
				<form name="frmSearch" method="post" action='list.jsp'>
					<select name="searchCondition">
						<option value="title" <%if ("title".equals(condition)) {%>
							selected="selected" <%}%>>제목</option>
						<option value="content" <%if ("content".equals(condition)) {%>
							selected="selected" <%}%>>내용</option>
						<option value="name" <%if ("name".equals(condition)) {%>
							selected="selected" <%}%>>작성자</option>
					</select> <input type="text" name="searchKeyword" title="검색어 입력"
						value="<%=keyword%>"> <input type="submit" value="검색">
				</form>
			</div>

			<div class="divBtn">
				<a href='write.jsp'>글쓰기</a>
			</div>
			<!-- 테스트 그리드 모달 끝-->
		</div>
	</section>

	<%@ include file="../section/footer.jsp"%>