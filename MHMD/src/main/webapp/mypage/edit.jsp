<%@page import="java.sql.SQLException"%>
<%@page import="com.homedeco.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../section/top.jsp"%>
<jsp:useBean id="memService" class="com.homedeco.member.model.MemberService" 
	scope="session"></jsp:useBean>
<%

	String userid=(String)request.getAttribute("userid");
	MemberVO vo=null;
	
	try {
		vo=memService.selectByUserid(userid);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	String zipcode=vo.getZipcode();
	String address=vo.getAddress();
	String addressDetail=vo.getAddressDetail();
	if(zipcode==null) zipcode="";
	if(address==null) address="";
	if(addressDetail==null) addressDetail="";
	
	String hp=vo.getHp();
	String hp1="", hp2="", hp3="";
	if(hp!=null && !hp.isEmpty()){
		String[] hpArr=hp.split("-");
		hp1=hpArr[0];
		hp2=hpArr[1];
		hp3=hpArr[2];
	}
%>
<script type="text/javascript">
	$(function(){
		$('#wr_submit').click(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else if($('#pwd').val()!=$('#pwd2').val()){
				alert('비밀번호가 일치하지 않습니다!');
				$('#pwd2').focus();
				event.preventDefault();
			}else if(!validate_phone($('#hp2').val()) || 
					!validate_phone($('#hp3').val()) ){
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp2').focus();
				event.preventDefault();			
			}
		});
	});
</script>
<body class="masthead">
<section class="page-section" id="portfolio"
	style="padding-top: 0px; padding-bottom: 0px">
<article>
<div class="divForm">
<form name="frm1" method="post" action="edit_ok.jsp">
<fieldset>
	<legend>회원 정보 수정</legend>
    <div>        
        <label for="name">성명</label>
        <span><%=vo.getName() %></span>
    </div>
    <div>
        <label for="userid">회원ID</label>
        <span><%=vo.getUserid() %></span>
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
        	title="우편번호" class="width_80" value="<%=zipcode %>">
        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="address" ReadOnly 
        	title="주소"  class="width_350" value="<%=address %>"><br />
        <span class="sp1">&nbsp;</span>
        <input type="text" name="addressDetail" title="상세주소"  
        	class="width_350" value="<%=addressDetail %>">
    </div>
    <div>
        <label for="hp1">핸드폰</label>&nbsp;
        <select name="hp1" id="hp1" title="휴대폰 앞자리">
            <option value="010" 
            	<%if(hp1.equals("010")){ %>
            		selected="selected"
            	<%} %>
            >010</option>
            <option value="011"
            	<%if(hp1.equals("011")){ %>
            		selected="selected"
            	<%} %>
            >011</option>
            <option value="016"
            	<%if(hp1.equals("016")){ %>
            		selected="selected"
            	<%} %>
            >016</option>
            <option value="017"
            	<%if(hp1.equals("017")){ %>
            		selected="selected"
            	<%} %>
            >017</option>
            <option value="018"
            	<%if(hp1.equals("018")){ %>
            		selected="selected"
            	<%} %>
            >018</option>
            <option value="019"
            	<%if(hp1.equals("019")){ %>
            		selected="selected"
            	<%} %>
            >019</option>
       	</select>
        -
        <input type="text" name="hp2" id="hp2" maxlength="4" title="휴대폰 가운데자리"
        	class="width_80" value="<%=hp2%>">-
        <input type="text" name="hp3" id="hp3" maxlength="4" title="휴대폰 뒷자리"
        	class="width_80" value="<%=hp3%>">
    </div>
    <div class="center">
         <input type="submit" id="wr_submit" value="수정">
    </div>
</fieldset>
</form>
</div>
</article>
</section>
</body>
<%@include file="../section/footer.jsp"%>

