	$(function(){
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
