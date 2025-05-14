var internal_request_id='IR00000000000000';
$('#buttonClass').attr("disabled", "disabled");

//when model remove selected list
$("#raised_Modal").on(
		"hidden.bs.modal",
		function() {
			// $('#itemList').empty();
			$("#raised_Modal .modal-body").find('input:radio, input:checkbox').prop('checked', false);
			$('#send_interns').attr("disabled", "disabled");
		});

$(document).on(
		'click',
		'.chk',
		function(event) {
			if ($(this).is(":checked")) {
				$('#buttonClass').removeAttr('disabled');
			} else if ($(this).is(":not(:checked)")) {
				$('#buttonClass').attr("disabled", "disabled");
			}
			var value = $('#' + this.id).val(), $list = $("#itemList");
			// alert(value);
			if (this.checked) {
				// add to the right
				$list.append("<li data-value='" + value + "'>" + value
						+ "</li>");
			} else {
				// hide to the right
				$list.find('li[data-value="' + value + '"]').slideUp("fast",
						function() {
					$(this).remove();
				});
			}
		});

//rejection interns request
function sendRequest(id, msg) {
	$.ajax({
		type : "GET",
		url : "reject_clg_internal_req?req_id=" + id.value + "&rejection_msg=" + msg.value,
		success : function(response) {
			location.reload();
		},
		error : function() {
            alert(error_save);
		}
	});
}

function getcomId(id) {
	$.ajax({
		type : "GET",
		url : "getCompnayAdvertisement?company_id=" + id,
		success : function(response) {
			$("#advertisement_data").empty();
			for (i = 0; i < response.length; i++) {
				$("#advertisement_data").append(
						"<tr><td>" + response[i].technology_name + "</td><td>"
						+ response[i].capacity + "</td><td>"
						+ response[i].stipend + "</td><td>"
						+ response[i].duration + "</td></tr>");
			}
		},error : function() {
            alert(error_fetch);
		}
	});
}

//select Specified company id By RAdio Button
$("input[type='radio']").on("change", function() {
	getComp_id(this);
});

$('input[type=radio][name=cmp_radiobtn]').change(function(){
	$('.student_chk').prop('checked', false); 
	$('#send_interns').attr("disabled","disabled");
});

function getComp_id(cmp) {
	$('#comp_hid').val(cmp.id);
}

//company selected or not
$('#send_interns').attr("disabled", "disabled");
$('.student_chk').click(function() {
	var uncheck=false;
	if (!$("input[type='radio']:checked").val()) {
		swal("", "Please select a Company first!", "error");
		return false;
	} else {
		var checkedIds = $(".student_chk:checked").length;
		if(checkedIds>request_student_limit){
			alert(raise_req_student_limit_rchd);
			uncheck=true;
		} else {
			var company_id=$("#comp_hid").val();
			console.log(company_id)
			var studid=$(this).attr("id");
			$.ajax({
				url:'checkEligibleToApply?student_id='+studid+'&company_id='+company_id,
				type:'get',
				async: false,
				success:function(response){
					if(response.result){
						uncheck=true;
						if(response.reason=="applied"){
							swal(raise_req_student_req_pndng);
						}else{
							swal(already_has_ongoing_internship);
						}
					}
				},error:function(errorResp){
					console.log(errorResp);
					alert("error");
				}
			});
		}
		
		if(uncheck){
			$('#'+studid).prop('checked', false); 
			return false;
		}
		
//		if ($(this).is(":checked")) {
		if(checkedIds>0) {
			$('#send_interns').removeAttr('disabled');
		} else {
			$('#send_interns').attr("disabled", "disabled");
		}
		
	}
});

//set id on model
function rejectReqId(req_id) {
	$('#rejection_hid').val(req_id);
}

//approve interns request
function approveReqId(req_id) {
	internal_request_id=req_id;
	$.ajax({
		type : "GET",
		url : "approveInternsRequestByRole?req_id=" + req_id,
		success : function(response) {
			if(response=='success'){
				location.reload();
			}else{
				alertMsg(interncoins_exhausted_temp);
				/*confirmDialog(function(resp){
					if(resp=='yes'){
						showCollegePackage();
					}
				},'Insufficient InternCoins',interncoins_exhausted);*/
			}
		},
		error : function() {
			alert('Error occured');
		}
	});
}

//get all interns group student
function studentId(studentIds) {
	var stud_ids = studentIds.id;
	$
	.ajax({
		type : "GET",
		url : "internsgroupIds?studentids=" + stud_ids,
		success : function(response) {
			// alert(response);
			$("#s_data").empty();
			for (i = 0; i < response.length; i++) {
				var func="dispStudentData('"+response[i].student_id+"')";
				var row='<tr><td><span class="pointer actionSpan" data-toggle="modal" data-target="#studentDetailsModal" onclick="'+func+'">'+response[i].student_name+'</span></td></tr>';
				$("#s_data").append(row);
			}
		},
		error : function() {
			alert('Error occured');
		}
	});
}

//internal request rejection reason
function rejectionReason(rejectionId) {
	var id = rejectionId.id;
	$.ajax({
		type : "GET",
		url : "rejectionReason?request_id=" + id,
		success : function(response) {
			swal(response);
		},error : function() {
			swal('Error occured');
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
			url : "add_topupdata_college?package_id="
				+ new_package_id+"&request_id="+internal_request_id,
				success : function(response) {
					$('#balanceDataModal').modal('hide');
					alertMsg(top_up_success);
				},error : function() {
					alert('Error occured');
				}
		});
	} else {
		//alert("please select available balance");
		alertMsg('Single package must be selected');
	}
});