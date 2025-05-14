//get all interns group student
function studentId(studentIds){
	var stud_ids=studentIds.id;	
	$.ajax({
		type:"GET",
		url : "internsgroupIds?studentids="+stud_ids,
		success : function(response) {
			//  alert(response);
			$("#s_data").empty();
			for (i = 0; i < response.length; i++) {
				var func="dispStudentData('"+response[i].student_id+"')";
				var row='<tr><td style="padding:0.5rem"><span class="pointer actionSpan" data-toggle="modal" data-target="#studentDetailsModal" onclick="'+func+'">'+response[i].student_name+'</span></td></tr>';
				$("#s_data").append(row);
			}
		},error : function() {
			alert(error_verify);
		}
	});
}

//college id replca eby coll name
$(document).ready(function() {
	$(window).load(function() {
		$(".cmp_role_three_id").each(function(){
			var cmp_role_three_id=this.id;
			// get  name of company role 3 user 
			$.ajax({
				type : "GET",
				url : "get_user?id="+cmp_role_three_id,
				success : function(response) {
					$('.cmp_role_three_id'+cmp_role_three_id).val(response.username);
					return response;
				},error : function() {
					alert(error_fetch);
				}
			});
		});

		$(".college_name").each(function(){
			var cmp_id=this.id;
			$.ajax({
				type : "GET",
				url : "getCollegeDetails?college_id="+cmp_id,
				success : function(response) {
					var clgDetails=response.college;
					$(".clgname"+cmp_id).html(clgDetails.college_name);
					return clgDetails;
				},error : function() {
					alert(error_fetch);
				}
			});
		});
	});
});

//approve interns request
function approveReqId(req_id){
	var rej_msg=null;
	$.ajax({
		type:"GET",
		url : "com_internal_req_A_R?req_id="+req_id+"&reject_msg="+rej_msg,
		success : function(response) {
			location.reload();
		},error : function() {
			alert(error_save);
		}
	});
}

//set id on model
function rejectReqId(req_id){
	$('#rejection_id').val(req_id);
}

//Rejct internal Req by Company USer
function sendRejection(){
	var reject_msg=$("#rejection_msg").val();
	var req_id=$("#rejection_id").val();
	$.ajax({
		type : "GET",
		url : "com_internal_req_A_R?req_id="+req_id+"&reject_msg="+reject_msg,
		success : function(response) {
			location.reload();
			return response;
		},error : function() {
			alert(error_save);
		}
	});
}




//internal request rejection reason
function rejectionReason(rejectionId) {
	var id = rejectionId.id;
	$.ajax({
		type : "GET",
		url : "intReqRejReason?request_id=" + id,
		success : function(response) {
			alert(response);
		},error : function() {
			alert('Error occured');
		}
	});
}

//internal request rejection reason
function rejectionReason(rejectionId) {
	var id = rejectionId.id;
	$.ajax({
		type : "GET",
		url : "intReqRejReason?request_id=" + id,
		success : function(response) {
			alert(response);
		},error : function() {
			alert('Error occured');
		}
	});
}