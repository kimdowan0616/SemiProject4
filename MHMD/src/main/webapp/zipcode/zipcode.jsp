<%@page import="com.homedeco.zipcode.model.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="zipcodeService" class="com.homedeco.zipcode.model.ZipcodeService" 
	scope="session"></jsp:useBean>    
<%
	request.setCharacterEncoding("utf-8");
	String dong=request.getParameter("dong");
	
	List<ZipcodeVO> list=null;
	int totalList = 0;
	if(dong!=null && !dong.isEmpty()){
		try{
			list=zipcodeService.selectZipcode(dong);	
			totalList = list.size();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		dong="";
	}
	
	int c_page = 1;
	if(request.getParameter("c_page") != null){
		c_page = Integer.parseInt(request.getParameter("c_page"));
	}
	
	int pageSize = 10;
	int totalPage = (int)Math.ceil((float)totalList/pageSize);
	int blockSize = 10;
	
	int firstP = c_page-((c_page-1)%blockSize);
	int lastP = firstP+(blockSize-1);
	
	int curPos = (c_page-1)*pageSize;
	int num = totalList-curPos;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function setZipcode(address, zipcode){
		$(opener.document).find('#zipcode').val(zipcode);
		$(opener.document).find('input[name=address]').val(address);
		self.close();
	}
</script>

</head>
<body>
<h2>우편번호 검색</h2>
<p>동(읍/면)을 입력하세요</p>
	<form name="frmZipcode" method="post" action="zipcode.jsp">
		<label for="dong">지역명: </label>
		<input type="text" name="dong" id="dong"  style="ime-mode:active"
			value="<%=dong%>">
		<input type="submit" id="submit" value="찾기">
	</form>	
	<%if(list!=null){ %>
		<table style="width:470px" class="box2" 
		summary="우편번호 검색 결과에 관한 표로써, 우편번호, 주소에 대한 정보를 제공합니다.">
			<caption>우편번호 검색</caption>
			<colgroup>
				<col style="width:20%" />
				<col style="width:*" />				
			</colgroup>
			<thead>
			  <tr><th scope="col">우편번호</th><th scope="col">주소</th>	 </tr>
			</thead>
			<tbody>
				<%if(list==null || list.isEmpty()){ %>
					<tr>
						<td colspan="2">해당하는 데이터가 없습니다.</td>
					</tr>
				<%}else{ 
					for(int i=0;i<pageSize;i++){
						if(num < 1){ 
							break;
						}
						
						ZipcodeVO vo=list.get(curPos++);
						num--;
						
						String address=vo.getSido()+" " + vo.getGugun()+" " 
							+ vo.getDong();
						String sbunji=vo.getStartbunji();
						String ebunji=vo.getEndbunji();
						
						String bunji="";
						if(ebunji!=null && !ebunji.isEmpty()){
							bunji=sbunji+" ~ " + ebunji;
						}else{
							bunji=sbunji;	
						}
				%>
						<tr>
							<td><%=vo.getZipcode() %></td>
							<td>
								<a href="#" 
						onclick="setZipcode('<%=address%>','<%=vo.getZipcode()%>')">
									<%=address %> <%=bunji %>
								</a>	
							</td>						
						</tr>			
				<%
					}//for
				}//if %>			
			</tbody>
		</table>
		<div class="divPage">
	<%	if(firstP>1){ %>
			<a href="zipcode.jsp?c_page=<%=firstP-1%>&dong=<%=dong%>">
				<img src="../images/first.JPG" alt="이전블럭">
			</a>	
	<%	}	%>					

	<%	for(int i=firstP;i<=lastP;i++){
			if(i>totalPage){ 
				break; 
			}
			
			if(i==c_page){ 	%>
				<span style="color:blue;font-weight: bold;font-size: 1em"><%=i %></span>
	<%		} else{ %>
				<a href="zipcode.jsp?c_page=<%=i%>&dong=<%=dong%>">[<%=i %>]</a>			
	<%		} %>
	<%	} 	%>
	
	<%	if(lastP < totalPage){ %>
			<a href="zipcode.jsp?c_page=<%=lastP+1%>&dong=<%=dong%>">
				<img src="../images/last.JPG" alt="다음블럭">
			</a>	
	<%	}	%>						
</div>
	<%} %>	
</body>
</html>