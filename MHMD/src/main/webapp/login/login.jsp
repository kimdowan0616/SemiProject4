<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../section/top.jsp" %>
<%

	String ck_value="";
	Cookie[] ckArr = request.getCookies();
	if(ckArr!=null){
		for(int i=0;i<ckArr.length;i++){
			if(ckArr[i].getName().equals("ck_userid")){
				ck_value=ckArr[i].getValue();
				break;
			}
		}
}

%>
<script type="text/javascript">
	$(function(){
		$('#lg_submit').click(function(){
			<%String targetPage="";%>
			if ($('#memKind').val()=="개인회원") {
				<%targetPage="login_ok.jsp";%>
			} else {
				<%targetPage="comLogin_ok.jsp";%>
			}
		});
	});
</script>
<body class="masthead">
	<section class="page-section" id="portfolio"
			style="padding-top: 0px; padding-bottom: 0px">
	<article class="simpleForm">
		<form name="frmLogin" method="post"	action="<%=targetPage%>">
			<fieldset>
				<legend>로그인</legend>
				<div>
					<label for="userid" class="label">아이디</label>
					<input type="text" name="userid" id="userid"
						value="<%=ck_value%>">
				</div>
				<div>
					<label for="pwd" class="label">비밀번호</label>
					<input type="password" name="pwd" id="pwd">
				</div>
				<div>
					<label for="memKind"></label>
					<input type="radio" name="memKind" id="memKind" value="개인회원" checked> 개인회원
					<input type="radio" name="memKind" id="memKind" value="기업회원"> 기업회원
				</div>
				<div class="align_center">
					<input type="submit" id="lg_submit" value="로그인">
					<input type="checkbox" name="chkSave" id="chkSave"
						<%if(ck_value!=null && !ck_value.isEmpty()){ %>
							checked="checked"
						<%} %>
						>
					<label for="chkSave">아이디 저장하기</label>
				</div>
			</fieldset>
		</form>
	</article>
	</section>
</body>
<%@ include file="../section/footer.jsp" %>