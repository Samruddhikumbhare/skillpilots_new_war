function checkExists(elem) {
	var v = elem.id;
	var input_val = $("#" + v).val();
	var labelId = "none";
	var lblmsg = "none";
	var hitURL = "none";
	if (v == 'comp_name') {
		input_val = $("#comp_name").val();
		hitURL = "compname_exists?company_name=" + input_val;
		labelId = "#namelabel";
		lblmsg = "Company name already exists.";
	}
	if (v == 'mail_id') {
		input_val = $("#mail_id").val();
		hitURL = "email_exists?email_id=" + input_val;
		labelId = "#maillabel";
		lblmsg = "Email-id already exists.";
	}
	$.ajax({
		type : "GET",
		url : hitURL,
		success : function(response) {
			if (response == "exists") {
				$(labelId).text(lblmsg);
				$("#sbtn").prop('disabled', true);
			} else {
				$(labelId).text("");
				$("#sbtn").prop('disabled', false);
			}
			return response;
		},
		error : function() {
			alert(error_verify);
		}
	});
}

function showForm() {
	$
	.ajax({
		type : "GET",
		url : "check_member_balance",
        global: false, 
		success : function(response) {
			if (response == "success") {
				$("#username").val("");
				$("#contact_no").val("");
				$("#mail_id").val("");
				$("#dept").attr("disabled", false);
				$("#dept").val($("#dept option:first").val());
				$("#addcollmember").modal().show();
			} else {
				/*if (confirm("You don't have sufficient balance. Do you want to recharge?")) {
							showPackages();
						}*/
				confirmDialog(function(resp){
					if(resp==button_yes){
						showPackages();
					}
				},'Insufficient Balance','Sorry! You dont have sufficient balance. Do you want to recharge?',button_yes,button_no);



			}
			return response;
		},
		error : function() {
			alert(error_verify);
		}
	});
}
function closeForm() {
	$("#user_form").hide();
}


$("#dept").change(function(){
	if($("#"+$(this).val()).val()!=undefined) {
		alertMsg("This department already exists!");
		$("#dept").val(-1);
	}
});
function get_user(id, getdata) {
	$.ajax({
		type : "GET",
		url : "getUser?id=" + id,
		success : function(response) {
			getdata(response);
		},
		error : function() {
			alert(error_verify);
		}
	});
}

$("#cancel_dept").click(
		function() {
			confirmDialog(function(resp){
				if(resp==button_yes){
					var id = $('input[type=radio][name=rowid]:checked').attr('id');
					$.ajax({
						type : "GET",
						url : "cancel_college_dept?coll_dept_link_id=" + id
						+ "&action=cancel",
						success : function(response) {
							alertMsg(response);
						},
						error : function() {
							alert(error_save);
						}
					});
					location.reload();
				}
			},'Cancel Department','Do you really want to cancel this department?',button_yes,button_no);
		});
$("#change_dept").click(function() {
    var id = $('input[type=radio][name=rowid]:checked').attr('id');
    var user_id, dept_id;
    $("#collDeptLinkId").val(id);

  

    // Update the value of iiiDeptCoId input field with the selected ID
    $("#iiiDeptCoId").val(id);

    $.ajax({
        type: "GET",
        url: "get_coll_dept_link?dept_link_id=" + id,
        success: function(response) {

            get_user(response.head_id, function(output) {
                $("#dept").val(response.deptId);
                $("#dept").attr("disabled", true);
                $("#addcollmember").modal().show();
            });
        },
        error: function() {
            alert(error_verify);
        }
    });
    
    // Add event listener for modal close to unselect radio buttons
    $('#addcollmember').on('hidden.bs.modal', function (e) {
        // Clear the selection of radio buttons
        $('input[type=radio][name=rowid]').prop('checked', false);
        location.reload();
    });
});



$("#renew_dept")
.click(
		function() {
			var id = $('input[type=radio][name=rowid]:checked').attr(
			'id');
			$("#renew_coll_dept_link_id").val(id);
			var date;
			$
			.ajax({
				type : "GET",
				url : "get_balancedata_list",
				success : function(response) {
					if (response == null || response == '') {
						/*if (confirm("You don't have sufficient balance. Do you want to recharge?")) {
											showPackages();
										}*/
						confirmDialog(function(resp){
							if(resp==button_yes){
								showPackages();
							}
						},"Insufficient Balance","Sorry! You don't have sufficient balance. Do you want to recharge?",button_yes,button_no);
					} else {
						$("#package_table_div").hide();
						$("#balance_table_div").show();
						$("#table_heading")
						.text("Balance Data");
						$("#balance_departments").empty();
						for (var i = 0; i < response.length; i++) {
							date = new Date(
									response[i].expiration_date);
							$("#balance_departments")
							.append(
									'<tr><td><input type="radio" class="pointer" name="choose_balance" id="'
									+ response[i].balance_data_id
									+ '"/></td><td>'
									+ response[i].no_of_dept
									+ '</td><td>'
									+ response[i].no_of_internships
									+ '</td><td>'
									+ date
									.toDateString()
									+ '</td><td><span class="actionSpan pointer" onclick=viewPkgDetailsClg("pkg","'+response[i].package_id+'")>Show Details</span></td></tr>');
						}
						$('#balanceDataModal').modal('show');
					}
				},
				error : function() {
					alert(error_fetch);
				}
			});
		});

$(function() {
	$('input[name="rowid"]').click(function() {
		if ($(this).is(':checked')) {
			var myArray = $('#status_' + this.id);
			if ($(myArray[0]).text() == 'EXPIRED') {
				$("#change_dept").attr("disabled", true);
				$("#renew_dept").attr("disabled", false);
				$("#cancel_dept").attr("disabled", true);
			} else {
				$("#change_dept").attr("disabled", false);
				$("#renew_dept").attr("disabled", true);
				$("#cancel_dept").attr("disabled", false);
			}
		}
	});
});
function showPackages() {
	$("#table_heading").text("Packages Available");
	$("#balance_table_div").hide();
	$("#package_table_div").show();
	get_package_list('COL', function(output) {
		$("#package_avail").empty();
		for (var i = 0; i < output.length; i++) {
			$("#package_avail").append(
					'<tr><td><input type="radio" class="my-radio pointer" name="choose_pkg" id="'
					+ output[i].package_id + '"/></td><td>'
					+ output[i].package_name + '</td><td>'
					+ output[i].no_of_dept + '</td><td>'
					+ output[i].no_of_internships + '</td><td>'
					+ output[i].validity + '</td>><td>'
					+ output[i].amount + '</td></tr>');
		}
	});
	$('#balanceDataModal').modal('show');
}
function get_package_list(package_for, getdata) {
	$.ajax({
		type : "GET",
		url : "get_clgPkg_list?package_for=" + package_for+"&package_type=R",
		success : function(response) {
			getdata(response);
		},
		error : function() {
			alert(error_fetch);
		}
	});
}

$("#renew_dept_button").click(
		function() {
			var coll_dept_link_id = $('input[type=radio][name=rowid]:checked')
			.attr('id');
			var balance_data_id = $(
			'input[type=radio][name=choose_balance]:checked')
			.attr('id');
			if ($('input[type=radio][name=choose_balance]').is(':checked')) {
				/*$.ajax({
					type : "GET",
					url : "alter_dept?coll_dept_link_id="
							+ coll_dept_link_id + "&balance_data_id="
							+ balance_data_id + "&action=renew",
					success : function(response) {
						//alert(response);
						location.reload();
					},
					error : function() {
		                alert(error_save);
					}
				});*/
				alertMsg(contact_io_team);
			} else {
				alertMsg(select_a_balance);
			}
		});

$("#btn-payAndRecharge").click(
		function() {
			if ($('input[type=radio][name=choose_pkg]').is(':checked')) {
				var new_package_id = $(
				'input[type=radio][name=choose_pkg]:checked')
				.attr('id');
				alert(new_package_id)
				$.ajax({
					type : "GET",
					url : "add_balancedata?package_id="
						+ new_package_id,
					success : function(response) {
						alert(response)
						if(response =="success"){
							$('#balanceDataModal').modal('hide');
							//alert("Department added successfully");
							alertMsg('Department added successfully');

						}else{
						alert("Transaction Failed")	
						}
												},
					error : function() {
		                alert(error_save);
					}
				});
				//alertMsg(contact_io_team);
			} else {
				alertMsg(select_a_package);
			}
		});
