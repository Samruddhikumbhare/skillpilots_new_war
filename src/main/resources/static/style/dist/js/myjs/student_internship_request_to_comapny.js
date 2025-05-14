//approved student
function approve(request_id) {
	// alert('make call'+id+"-"+tech);
	$.ajax({
		type : 'GET',
		url : 'studentRequestApprove?request_id=' + request_id,
		success : function(res) {
			location.reload();
		},
		error : function() {
			alert('Error occured');
		}
	});
}
//assign student and and tech

$('#send').click(function(event) {
	var request_id = $('#txt_request_id').val();
	var rejection_msg = $('#txt_rejection_msg').val();
	var json = {
			"request_id" : request_id,
			"rejection_msg" : rejection_msg
	};
	$("#student_req_reject").modal("hide");
	$("body").addClass("loading");
	$.ajax({
		url : 'student_req_reject',
		data : JSON.stringify(json),
		type : "POST",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
			
		},
		success : function(data) {
		//	$("body").removeClass("loading")
		alert("Rejected Succesfully!")
			location.reload();
		}
	});

	event.preventDefault();
});

function undoRejection(requestid) {
	// alert("Request ID " + requestid);
	$.ajax({
		url : "undo_rejection?request_id=" + requestid,
		type : "get",
		success : function(response) {
			alert(response);
			location.reload();
		},
		error : function(errorResponse) {
			console.log(errorResponse);
		}
	});
}
function assignTeamToStudent(request_id) {
	// alert(request_id);
	var team_name, duration, technology;
	team_name = $("#teamToAssign" + request_id).val();
	duration = $("#duration" + request_id).val();
	technology = $("#tech" + request_id).val();

	if (team_name == -1 ||team_name ==null) {
		alert("Please select team.");
	} else if (duration == 0 || duration==null) {
		alert("Please select duration.");
	} else if (technology == -1 || technology==null) {
		alert("Please select technology.");
	} else {
		$("#assignBtn" + request_id).prop('disabled', false);
		var data = {
				"request_id" : request_id,
				"team_name" : team_name,
				"technology" : technology,
				"duration" : duration
		};
		$.ajax({
			url : "assignCompTeamToStudent",
			type : "get",
			data : data,
			success : function(response) {
				if(response=='err_team'){
					alert('Team should not be empty. Please select team.');
					$("#assignBtn" + request_id).prop('disabled', false);
				}else if(response=='err_duration'){
					alert('Duration should be greater than 0.');
					$("#assignBtn" + request_id).prop('disabled', false);
				}else if(response=='err_tech'){
					alert('Please enter technology.');
					$("#assignBtn" + request_id).prop('disabled', false);
				}else if(response=='ongoing'){
					alert(already_has_ongoing_internship);
					$("#assignBtn" + request_id).prop('disabled', false);
				} else {
					swal(response);
					if(response.includes("success"))
						location.reload();
				}
			},
			error : function(errorResponse) {
				console.log(errorResponse);
			}
		});
	}
}
function collegeReqMsg(request_id,message){
	$("#reqId").val(request_id);
	if(message!='none'){
		$("#collReqMsg").val(message);
	}
	$("#collReqMsgModal").modal('show');
}
function addNote(){
	var request_id=$("#reqId").val();
	var msg=$("#collReqMsg").val();
	var data = {
			"request_id" : request_id,
			"message" : msg,
	};
	$.ajax({
		url : "addNoteForHR",
		type : "get",
		data : data,
		success : function(response) {
			alert(response);
			$("#collReqMsgModal").modal('hide');
			approve(request_id);
		},error: function(){
			alert("Error Occured!");
		}
	});
}
