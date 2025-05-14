//$("#dur_ation").hide();
function getrowId(id) {
	$("#hid").val(id);
	/* $("#"+$('.rid').attr('id')).val(id);
			$("#"+$('.rid').attr('id')).attr("id", id); */
}
function sendRequest(id, msg) {
	$.ajax({
		type : "GET",
		url : "externalReq?college_id=" + id.value
		+ "&msg=" + msg.value,
		success : function(response) {
			//alert(response);
			location.reload();
		},
		error : function() {
			//alert('Error occured');
			location.reload();
		}
	});
}

// get all interns group student
function studentId(studentIds){
	var stud_ids=studentIds.id;	
	$.ajax({
		type:"GET",
		url : "internsgroupIds?studentids="+stud_ids,
		success : function(response) {
			// alert(response);
			$("#s_data").empty();
			for (i = 0; i < response.length; i++) {
				var func="dispStudentData('"+response[i].student_id+"')";
				var row='<tr><td style="padding:0.5rem;"><span class="pointer actionSpan" data-toggle="modal" data-target="#studentDetailsModal" onclick="'+func+'">'+response[i].student_name+'</span></td></tr>';
				$("#s_data").append(row);
				/* + response[i].capacity
								+ "</td><td>"
								+ response[i].stipend
								+ "</td><td>"
								+ response[i].duration
								+ "</td></tr>"); */

			}
		},

		error : function() {
			alert('oops! Some error occured while checking data. Please try again after sometime.');
		}
	});
}

//cancled request by college(Role 1)
function cancledReq(id){
	$.ajax({
		type : "GET",
		url : "cancledInternsRequest?request_id="+id,
		success : function(response) {
			if(response=='Sucess'){
				alert("Group Request cancled");
				location.reload();
			}

			return response;
		},
		error : function() {
			alert('oops! Some error occured while checking data. Please try again after sometime.');
		}
	});
}

function checkAvailabiltyOfInterns(request_id){
	var team_name, duration, technology;
	team_name = $("#teamToAssign" + request_id).val();
	duration = $("#duration" + request_id).val();
	technology = $("#tech" + request_id).val();
	
	if (team_name == -1 ||team_name ==null) {
		swal("Please select team.");
	} else if (duration == 0 || duration==null) {
		swal("Please select duration.");
	} else if (technology == -1 || technology==null) {
		swal("Please select technology.");
	} else{
	$.ajax({
		type : "GET",
		url : "checkAvailabiltyOfInterns?request_id="+request_id,
		success : function(response) {
		if(response==null){
			window.location="logout";
		}
			else if(response.status=='success'){
				assignInternship(request_id,response.collegeBalanceId,response.companyBalanceId);
			}else if(response.status=='recharge_col'){
				swal(interncoins_exhausted_college);
			}else{
				swal(interncoins_exhausted_temp);
				/*confirmDialog(function(resp){
						if(resp=='yes'){
							alertMsg(interncoins_exhausted_temp);
							showCompanyPackage();
						}
					},'Insufficient Balance',interncoins_exhausted);*/
			}
			return response;
		},
		error : function() {
			alert('oops! Some error occured while checking student\'s eligibility to apply. Please try again after sometime.');
		}
	});
}
}	

function get_package_list(package_for, getdata) {
	$.ajax({
		type : "GET",
		url : "get_clgPkg_list?package_for=" +package_for+"&package_type=T",
		success : function(response) {
			getdata(response);
		},
		error : function() {
			alert('oops! Some error occured while checking data. Please try again after sometime.');
		}
	});
}

$("#btn-payAndRecharge").click(
		function() {
			if ($('input[type=radio][name=choose_pkg]').is(':checked')) {
				var new_package_id = $(
				'input[type=radio][name=choose_pkg]:checked')
				.attr('id');
				$.ajax({
					type : "GET",
					url : "add_topupdata_company?package_id="
						+ new_package_id,
						success : function(response) {
							$('#balanceDataModal').modal('hide');
							alertMsg('Top up successfull');
						},
						error : function() {
							alert('oops! Some error occured while saving data. Please try again after sometime.');
						}
				});
			} else {
				alertMsg('Single package must be selected');
			}
		});

function assignInternship(request_id,collegeBalanceId,companyBalanceId){
	var team_name, duration, technology;
	team_name = $("#teamToAssign" + request_id).val();
	duration=$('#duration'+request_id).val();
	technology=$('#tech'+request_id).val();
	$.ajax({
		type : "POST",
		url : "assignInternshipByCompany?technology_name="+technology+"&team_name="+team_name+"&duration="+duration+"&request_id="+request_id+"&colBalId="+collegeBalanceId+"&compBalId="+companyBalanceId,
		success : function(response) {
			location.reload();
			return response;
		},
		error : function() {
			alert('oops! Some error occured while saving data. Please try again after sometime.');
		}
	});
}

//student grp rejection msg by Company
function sendRejection(){
	var rej_id=$('#rejection_id').val();
	var rej_msg=$('#rejection_msg').val();
	//alert(external_req_approval_status_rejected+"  "+rej_id);
	$.ajax({
		type : "POST",
		url : "ext_req_status_change?status="+ external_req_approval_status_rejected
		+"&req_id="+rej_id+"&reject_msg="+rej_msg,
		success : function(response) {
			location.reload();
			return response;
		},
		error : function() {
			alert('oops! Some error occured while saving data. Please try again after sometime.');
		}
	});
}

function undoExtReqRejection(requestid) {
	// alert("Request ID " + requestid);
	$.ajax({
		url : "undoExtReqRejection?request_id=" + requestid,
		type : "get",
		success : function(response) {
			swal("Success!", "Request Status Updated!!", "success");
			location.reload();
		},
		error : function(errorResponse) {
			console.log(errorResponse);
		}
	});
}

function approveListOfSt(){
	var erReqId=$('#hdnERID').val();	
	var stIdArr=[];
	var stIdPending=[];
	$("input:checkbox[name=chkStdId]:checked").each(function(){
		stIdArr.push($(this).val());
	});	
	
	$("input:checkbox[name=chkStdId]").each(function(){
		var status=$(this).is(':checked');
		if(status){
		}else {
			stIdPending.push($(this).val());
		}
	});	
	
	
	if(stIdArr.length>0){	
		window.location = 'ext_req_status_change?status=' + external_req_approval_status_approved+'&req_id='+erReqId+'&stud_list='+stIdArr+'&stIdPending='+stIdPending;
	}else{
		alert("Please select atleast a student or you can reject request.");
	}
	
}
function rejectStListWithReason(){
	var erReqId=$('#hdnERID').val();	
	$('#rejection_id').val(erReqId);
	$("#rejectModelfor_External_req").modal("show");
}
