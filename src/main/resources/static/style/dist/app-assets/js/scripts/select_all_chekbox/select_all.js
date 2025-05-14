
$(document).ready(function(){
	$("#select_all").change(function(){  //"select all" change 
		var status = this.checked; // "select all" checked status
		$('.checkbox').each(function(){ //iterate all listed checkbox items
			this.checked = status; //change ".checkbox" checked status
		});
	});

	$('.checkbox').change(function(){ //".checkbox" change 
		if(this.checked == false){ //if this item is unchecked
			$("#select_all")[0].checked = false; //change "select all" checked status to false
		}
		
		if ($('.checkbox:checked').length == $('.checkbox').length ){ 
			$("#select_all")[0].checked = true; //change "select all" checked status to true
		}
	});
});
