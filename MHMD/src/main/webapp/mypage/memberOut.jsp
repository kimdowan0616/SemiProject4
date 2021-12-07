<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../section/top.jsp"%>
<body class="masthead">
<section class="page-section" id="portfolio"
	style="padding-top: 0px; padding-bottom: 0px">
	<article class="simpleForm">
		<form name="frmOut" method="post" action="memberOut_ok.jsp" >
			<fieldset>	<legend>회원 탈퇴</legend>
				<p class="p">안전한 탈퇴를 위하여 비밀번호를 다시 입력해주세요.</p>
				<div> 	<label for="pwd"  class="p">비밀번호</label>
					<input type="password" name="pwd" id="pwd">
				</div>
				<div class="align_center">
					<input type="submit" id="submit" value="회원탈퇴">
					<input type="reset" value="취소">
				</div>
			</fieldset>	
		</form>
	</article>
</section>
</body>

<%@include file="../section/footer.jsp"%>
