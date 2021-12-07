
$(function(){
	$('#wrapper pre').height('100%');
	if($('#wrapper pre').height()<=300){
		$('#wrapper pre').height('400px');
	}
	
	$('.re').each(function(){
		var check=false;
		$(this).click(function(){
			var value=$(this).data('value');
			$('.val').val(value);
			if(!check){
				$(this).parent().parent().find('form').show();
			}else{
				$(this).parent().parent().find('form').hide();	
			}
			check=!check;
		});
	});
});