<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../section/top.jsp"%>

<script type="text/javascript">
$(function(){
	$('#submit').click(function(){
		if(!$('#chkAgree').is(':checked')){
			alert('약관에 동의해야합니다.');
			$('#chkAgree').focus();
			event.preventDefault();
		}
	});
});
</script>

<body class="center-agreement">
<section class="agreement-terms-and-conditions">
<article>
<h2>회원 약관</h2><br>
<iframe src="provision.html" width="700px" height="300px"></iframe>
<br><br>
<div style="width:700px">
	<form name="frmAgree" method="post" action="join.jsp">
		<fieldset>
		   <legend style="visibility:hidden;">회원 약관</legend> 
		   <div style="text-align:right">			
			<input type="checkbox" name="chkAgree" id="chkAgree">
			<label for="chkAgree">약관에 동의합니다.</label>
		   </div>
		   <div style="text-align:center">
			<input type="submit" id="submit" value="확인">			
			<input type="reset" value="취소">
		   </div>
		</fieldset>
	</form>
</div>
</article>
</section>
</body>
<%@ include file="../section/footer.jsp" %>
