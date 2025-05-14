
function viewPkgDetailsClg(detailsOf, detailsOfId) {
	var creation_date,expiration_date;
	if (detailsOf == 'pkg') {
		$("#modal-heading").text("Package Details");
		getPackageDetails(detailsOfId, function(data) {
			$("#pkg_details_body").empty();
			$("#pkg_details_body").append(
					'<tr><td>' + data.package_name + '</td><td>'+'<i class=\"fa fa-rupee\"></i>'+'&nbsp;'
					+ data.amount + '</td><td>'
					+ data.no_of_dept + '</td><td>'
					+ data.no_of_internships + '</td><td>'
					+ data.validity + '</td></tr>');
			$("#bal_details_table_div").hide();
			$("#pkg_details_table_div").show();
		});
		$("#detailsModal").modal("show");
	} else {
		$("#modal-heading").text("Balance Usage Details");
		viewBalanceDetails(detailsOfId, function(resp) {
			$("#bal_details_body").empty();
			for (var i = 0; i < resp.length; i++) {
				var data = resp[i];
				var status;
				if(data[3]=='A' || data[3]=='a'){
					status='Active';
				}else if(data[3]=='D' || data[3]=='d'){
					status='Deactive';
				}
				else if(data[3]=='C' || data[3]=='c'){
					status='Deleted';
				}else{
					status=data[3];
				}
				if(data[2]!=null){
					expiration_date = new Date(data[2]).toDateString();
				}else{
					expiration_date=null;
				}
				if(data[1]!=null){
					creation_date= new Date(data[1]).toDateString();
				}else{
					creation_date=null;
				}
				$("#bal_details_body").append(
						'<tr><td>' + data[4] + '</td><td>' + creation_date
						+ '</td><td>' +expiration_date+ '</td><td>'
						+ status + '</td></tr>');
			}

			$("#pkg_details_table_div").hide();
			$("#bal_details_table_div").show();
		});
		$("#detailsModal").modal("show");
	}
}

function viewPkgDetailsOfComp(detailsOf, detailsOfId) {
	var date;
	if (detailsOf == 'pkg') {
		$("#modal-heading").text("Package Details");
		getPackageDetails(detailsOfId, function(data) {
			$("#pkg_details_body").empty();
			$("#pkg_details_body").append(
					'<tr><td>' + data.package_name + '</td><td>'
					+ data.amount + '</td><td>'
					+ data.no_of_internships + '</td><td>'
					+ data.validity + '</td></tr>');
			$("#bal_details_table_div").hide();
			$("#pkg_details_table_div").show();
		});
		$("#detailsModal").modal("show");
	} 
}

function getPackageDetails(packageid, callback) {
	$.ajax({
		type : 'get',
		url : 'getPackageDetails?package_id=' + packageid,
		global : false,
		success : function(response) {
			callback(response);
		},
		error : function(errorResp) {
			console.log(errorResp);
		}
	});
}

function viewBalanceDetails(balanceid, callback) {
	$.ajax({
		type : 'get',
		url : 'getBalanceDetails?balance_id=' + balanceid,
		global : false,
		success : function(response) {
			callback(response);
		},
		error : function(errorResp) {
			console.log(errorResp);
		}
	});
}