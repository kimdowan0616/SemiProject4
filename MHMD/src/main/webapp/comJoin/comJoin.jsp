<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../section/top.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if ($('#name').val().length<1){
				alert('이름을 입력하세요');
				$('#name').focus();
				event.preventDefault();
			} else if (!validate_userid($('#userid').val())){
				alert('아이디는 영문,숫자,_ 만 가능합니다.');
				$('#userid').focus();
				event.preventDefault();
			} else if ($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			} else if ($('#pwd').val()!=$('#pwd2').val()){
				alert('비밀번호가 일치하지 않습니다!');
				$('#pwd2').focus();
				event.preventDefault();
			} else if (!validate_phone($('#hp2').val()) || 
					!validate_phone($('#hp3').val()) ){
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp2').focus();
				event.preventDefault();
			} else if ($('#chkId').val()!='Y'){
				alert('아이디 중복확인을 하세요!');
				$('#btnChkId').focus();
				event.preventDefault();
			}		
		});
		
		$('#email2').change(function(){
			if($(this).val()=="etc"){
				$('#email3').val('');
				$('#email3').css('visibility',"visible");				
				$('#email3').focus();				
			}else{
				$('#email3').css('visibility',"hidden");				
			}
		});
		
		$('#btnChkId').click(function(){
			var userid=$('#userid').val();
			open('checkUserid.jsp?userid='+userid,'dup',
			 'width=400,height=300,left=0,top=0,location=yes,resizable=yes');
		});
		
		$('#btnZipcode').click(function(){
			open('../zipcode/zipcode.jsp','zip',
			 'width=500,height=500,left=0,top=0,location=yes,resizable=yes');
		});
	});
	
	function validate_userid(id){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);
	}
	
	function validate_phone(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
</script>
<body class="masthead">
	<section class="page-section" id="portfolio"
		style="padding-top: 0px; padding-bottom: 0px">
		<article>
			<div class="divForm">
			<form name="frm1" method="post" action="comJoin_ok.jsp">
			<fieldset>
				<legend>회원 가입</legend>
			    <div>        
			        <label for="name">성명</label>
			        <input type="text" name="name" id="name" style="ime-mode:active">
			    </div>
			    <div>
			        <label for="userid">회원ID</label>
			        <input type="text" name="userid" id="userid"
			        		style="ime-mode:inactive">&nbsp;
			        <input type="button" value="중복확인" id="btnChkId" title="새창열림">
			    </div>
			    <div>
			        <label for="pwd">비밀번호</label>
			        <input type="Password" name="pwd" id="pwd">
			    </div>
			    <div>
			        <label for="pwd2">비밀번호 확인</label>
			        <input type="Password" name="pwd2" id="pwd2">
			    </div>
			    <div>
			        <label for="zipcode">주소</label>
			        <input type="text" name="zipcode" id="zipcode" ReadOnly  
			        	title="우편번호" class="width_80">
			        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
			        <span class="sp1">&nbsp;</span>
			        <input type="text" name="address" ReadOnly title="주소"  class="width_350"><br />
			        <span class="sp1">&nbsp;</span>
			        <input type="text" name="addressDetail" title="상세주소"  class="width_350">
			    </div>
			    <div>
			        <label for="hp1">핸드폰</label>&nbsp;<select name="hp1" id="hp1" title="휴대폰 앞자리">
			            <option value="010">010</option>
			            <option value="011">011</option>
			            <option value="016">016</option>
			            <option value="017">017</option>
			            <option value="018">018</option>
			            <option value="019">019</option>
			       	</select>
			        -
			        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
			        	class="width_80">-
			        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
			        	class="width_80">
			    </div>
			    <div>
			        <label for="email1">이메일 주소</label>
			        <input type="text" name="email1"  id="email1" title="이메일주소 앞자리">@
			        <select name="email2" id="email2"  title="이메일주소 뒷자리">
			            <option value="naver.com">naver.com</option>
			            <option value="hanmail.net">hanmail.net</option>
			            <option value="nate.com">nate.com</option>
			            <option value="gmail.com">gmail.com</option>
			            <option value="etc">직접입력</option>
			        </select>
			        <input type="text" name="email3" id="email3" title="직접입력인 경우 이메일주소 뒷자리"
			        	style="visibility:hidden">
			    </div>
			    <div class="center">
			         <input type="submit" id="wr_submit" value="회원가입">
			    </div>
			</fieldset>
			
			    <input type ="hidden" name="chkId" id="chkId">
			        
			</form>
			</div>
		</article>
	</section>
</body>
<%@ include file="../section/footer.jsp"%>