
var selectedManager='';
$('#add_com_mem').hide();

$(function(){
	//When an active team is selected
	$('input[name="active_com_id"]').click(function(){
		if ($(this).is(':checked'))
			$(".active_team_action").attr("disabled", false);
	});
	//When a deleted team is selected
	$('input[name="del_com_id"]').click(function(){
		if ($(this).is(':checked'))
			$(".del_team_action").attr("disabled", false);
	});
	//When Create New/Choose Existing Manager option is selected
	$('input[name="rad_manager"]').click(function(){
		var rad_id=$(this).attr('id');
		console.log(rad_id)
		if ($(this).is(':checked'))
		{
			$("#managers_list").val($("#managers_list option:first").val());
			$("#unametxt").val('');
			$("#exist_manager_id").val('0');
			$('#mail_id').val('');
			$('#contact').val('');
			if(rad_id==='existing'){
				$("#div_existing_manager").show();
				$("#div_new_manager").hide();
				$("#mail_id").prop('disabled', true);
				$("#contact").prop('disabled', true);
			}else{
				$("#div_existing_manager").hide();
				$("#div_new_manager").show();
				$("#mail_id").prop('disabled', false);
				$("#contact").prop('disabled', false);
			}
		}
	});
});

function clearForm(){
	$('#team_name').val('');
	$("#team_name").prop('disabled', false);
	$('#unametxt').val('');
	$("#unametxt").prop('disabled', false);
	$('#mail_id').val('');
	$("#mail_id").prop('disabled', false);
	$('#contact').val('');
	$("#contact").prop('disabled', false);
	$("#comp_dept_link_id").val('');
	$("#exist_manager_id").val('0');
	$("#sbtn").prop('disabled', false);
	selectedManager='';
}

function showForm(dept_link_id){
	console.log("djdjsjdjdjdj")
	
	console.log("id"+dept_link_id)
	if(dept_link_id!='none'){
		$("#compDeptLinkId").val(dept_link_id);
	}
			
	$('#addcompmember2').modal("show");
	$('#addcompmember').modal("show");

}

$("#add_team_btn").click(function(){
	clearForm();
	$('#form_action').val('NewTeam');
	showForm('none');
});	

//for getting selected Radio button data

    $(document).ready(function() {
        $("#change_team").click(function(){
            clearForm();
            
            console.log("djdjdjdjd")
            var dept_link_id = $('input[type=radio][name=active_com_id]:checked').attr('id');
            console.log("loooooooooooooooooooooooooooooooooooooooo"+dept_link_id)
            selectedManager = $("#manager" + dept_link_id).val();
            console.log(selectedManager)
            var teamName = $("#active_team_name" + dept_link_id).text(); // Get the team name text content
             console.log(teamName)
        $("#team").val(teamName); // Set the team name in the input field
        $("#team").attr("readonly", true);
        $('#form_action').val('ChangeManager');
          $('#compDeptLinkId').val(dept_link_id);
        showForm(dept_link_id);
        });
    });



//cancel request
$("#cancel_team").click(function(){
	var id=$('input[type=radio][name=active_com_id]:checked').attr('id');
	var team_name = document.getElementById("active_team_name"+id).textContent;
	confirmDialog(function(selection){
		if(selection=="Confirm"){
			$.ajax({
				type : "GET",
				url : "cancel_com_team?team_id="+id,
				success : function(response) {
					swal("Success!", "Team deleted successfully.!", "success");
					location.reload();
				},
				error : function() {
					alert(error_save);
				}
			});
		}
	},"Team deletion confirmation","Are you sure you want to delete the team "+team_name+"?","Confirm","Cancel");
});

//restore Team request
$("#restore_team").click(function(){
	var id=$('input[type=radio][name=del_com_id]:checked').attr('id');
	var team_name = document.getElementById("del_team_name"+id).textContent;
	var manager_id=$("#manager"+id).val();
	var manager_name=document.getElementById(manager_id).textContent;
	confirmDialog(function(manager_selection){
		if(manager_selection==="New"){
			clearForm();
			$("#team_name").val(team_name);
			$("#team_name").attr("readonly", true);
			$('#form_action').val('restoreTeam');
			showForm(id);
		}else{
			$("#team_name").val(team_name);
			$("#exist_manager_id").val("RestoreExistingManager");
			$("#unametxt").val(manager_name);
			get_user(manager_id, function(output) {
				$('#mail_id').val(output.email_id);
				$('#contact').val(output.contact_no);
			});
			$('#form_action').val('restoreTeam');
			$("#cmpteam_form").submit();
		}
	},"Restore Team - Manager Confirmation",
	"Would you like to restore the team with its existing manager or choose/create a new one?","New","Existing");
});

function assignlead(dept_link_id){
	
	clearForm();
	$('#form_action').val('AssignLead');
	
	 $('#compDeptLinkId').val(dept_link_id); // Assuming 'modal_dept_link_id' is the ID of the element where you want to display the dept_link_id

	$('#addcompmember').modal("show");
}

function changeLead(dept_link_id,deptName){
	clearForm();
	console.log("djdjqqqqqqqqqqqqqqqqqq"+dept_link_id+deptName)
	$('#form_action').val('ChangeLead');
	    $('#compDeptLinkId').val(dept_link_id); // Assuming 'modal_dept_link_id' is the ID of the element where you want to display the dept_link_id

	$('#addcompmember').modal("show");
}

function validate_team_form(){
	var email,contact,status=true;
	if($("#team").val() != undefined){
		if($("#team").val() == null || $("#team").val().trim() == ''){
			swal("Error!", "Please fill the Team name field.!", "error");
			status = false;
		}else if($("#team").val().length > 20){
			swal("Error!", "Only 20 characters allowed in Team name field.!", "error");
			status = false;
		}
	}

	if($("#unametxt").val() != undefined && status){
		if($("#unametxt").val() == null || $("#unametxt").val().trim() == ''){
			swal("Error!", "Please fill the Manager name field.!", "error");
			status = false;
		}else if($("#unametxt").val().length > 200){
			swal("Error!", "Only 200 characters allowed in Manager name field.!", "error");
			status = false;
		}
	}

	if($("#leadname").val() != undefined && status){
		if($("#leadname").val() == null || $("#leadname").val().trim() == ''){
			swal("Error!", "Please fill the Lead name field.!", "error");
			status = false;
		}else if($("#leadname").val().length > 200){
			swal("Error!", "Only 200 characters allowed in Lead name field.!", "error");
			status = false;
		}
	}

	if($("#mail_id").val() != undefined && status){
		if($("#mail_id").val() == null || $("#mail_id").val().trim() == ''){
			swal("Error!", "Please fill the Email-ID field.!", "error");
			status = false;
		}else if($("#mail_id").val().length > 50){
			swal("Error!", "Only 50 characters allowed in Email-ID field.!", "error");
			status = false;
		}else if(!$("#mail_id").val().match(/[a-z0-9._%+-]+@[a-z0-9.-]+(\.[a-z]+){1,2}$/i)){
			swal("Error!", "Please enter a valid email address.!", "error");
			status = false;
		}
	}

	if($("#contact").val() != undefined && status){
		if($("#contact").val() == null || $("#contact").val().trim() == ''){
			swal("Error!", "Please fill the Contact field.!", "error");
			status = false;
		}else if($("#contact").val().length < 10 || $("#contact").val().length > 12){
			swal("Error!", "Only 10-12 digits allowed in Contact field.!", "error");
			status = false;
		}
	}

	if(($("#maillabel").text() != '' || $("#contact_error").text() != '') && status){
		swal("Error!", "Please correct the Email/Contact details.!", "error");
		status = false;
	}

	if(!status){
		return false;
	}
	$("#sbtn").prop('disabled', true);
	return true;
}

$("#sbtn").click(function(){
	var departmentName=$('#team').val();
	var team_action=$('#form_action').val();
	var validated=true;
	if(validate_team_form()){
		var managerExists=$("#exist_manager_id").val();
		if(team_action==='NewTeam'){
			$('#table_comp_team tr').each(function() {
				var team = $(this).find(".comp_team_name").text();
				
				var s1=departmentName.toString().trim().toLowerCase();
				var s2=team.toString().trim().toLowerCase();
				if(s1==s2){
					swal("Error!", "Team already exists and is active.!", "error");
					validated=false;
				}
			});
			if(validated){
				$('#table_comp_team_del tr').each(function() {
					var team = $(this).find(".del_comp_team_name").text();
					var s1=departmentName.toString().trim().toLowerCase();
					var s2=team.toString().trim().toLowerCase();
					if(s1==s2){
						swal("Error!", "Team already exists but is deleted.Please restore it from the deleted tab.!", "error");
						validated=false;
					}
				});
			}
			if(validated){
				$("#cmpteam_form").submit();
			} else {
				$("#sbtn").prop('disabled', false);
			}
		} else if(team_action==='ChangeManager'){
			if(selectedManager==managerExists){
				swal("Error!", "Selected user is already the Manager of this team.!", "error");
				$('#unametxt').val('');
				$("#sbtn").prop('disabled', false);
			}else{
				$("#cmpteam_form").submit();
			}
		}else{
			$("#cmpteam_form").submit();
		}
	}else{
		return false;
	}
});

$('#team_exists_msg').hide();

$("#managers_list").on('change', function() {
	var man_id = $(this).val();
	var manager_name = $("#managers_list option:selected").text();
	console.log(manager_name)
	console.log(man_id)
	//alert(man_id+" "+selectedManager);
	if (man_id == selectedManager) {
		swal("Error!", ""+manager_name+" is already the manager of this team.!", "error");
		$("#managers_list").val($("#managers_list option:first").val());
		$('#mail_id').val('');
		$('#contact').val('');
	} else {
		$("#exist_manager_id").val(man_id);
		$("#unametxt").val(manager_name);
		get_user(man_id, function(output) {
			$('#mail_id').val(output.email);
			$('#contact').val(output.contact_no);
		});
	}
});
// get data from Reg_user table
function get_user(user_id,getdata){
	$.ajax({
		type : "GET",
		url : "getUser?id="+user_id,
		success : function(response) {
		 getdata(response);
		},
		error : function() {
            alert(error_verify);
		}
	});
}
