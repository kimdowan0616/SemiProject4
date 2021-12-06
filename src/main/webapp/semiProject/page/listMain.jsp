<%@page import="com.semiproject.model.ContentsVO"%>
<%@page import="com.semiproject.model.ContentsDAO"%>
<%@page import="com.semiproject.common.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
int pageSize = 6; //한 페이지에 보여줄 레코드 수
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
	<section class="page-section portfolio" id="portfolio"
		style="padding-top: 0px; padding-bottom: 0px">
		<div class="container">
			<div class="row justify-content-center">
				
					<!--게시판 내용 반복문 시작  -->
					<%for (int i = 0; i < pageSize; i++) {
							if (num < 1) break;

							ContentsVO vo = list.get(curPos++);
							num--;
					%>
					<div class="col-md-6 col-lg-4 mb-5">
						<div class="portfolio-item mx-auto" >
							<a href="<%=request.getContextPath() %>/semiProject/page/countUpdate.jsp?no=<%=vo.getNo()%>"
								style="font-size: 1.1em; font-weight: bold; color: black"> 
								<!-- 썸네일 -->
								<%=Utility.displayFile(vo.getFileName())%>
								<!-- 제목이 긴 경우 일부만 보여주기 -->
								<%=Utility.cutString(vo.getTitle(), 35)%>
							</a> 
						</div>
					</div>	
					<% } //for %>
					<!--반복처리 끝  -->
				
			</div>
		</div>
	</section>
