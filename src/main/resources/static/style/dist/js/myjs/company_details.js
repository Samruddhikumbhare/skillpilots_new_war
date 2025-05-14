$(".cmpname").each(function(){ 
		var cmp_id=this.id;
		console.log("working");
		$.ajax({
			type : "GET",
			url : "getCompanyDetails?company_id="+cmp_id,
			success : function(response) {
				$(".cmp"+cmp_id).html(response.company_name);
			return response;
		},
			error : function() {
				alert(error_fetch);
			}
		});
	});