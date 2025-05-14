//needed to select dept when editting edu row since dept are loaded runtime.
var sel_department='';
var edu_table = $("#edu_table").DataTable({
	searching:false,
	paging:false,
	info:false,
	"bSort" : false
	});

if(edu_table.rows().any())
	$("#empty_edu_div").hide();
else
	$("#empty_edu_div").show();

function setDepartments(degree, dept, activeDept) {
	getDepts(degree, function(data) {
		console.log(data);
		$('#select_departments_' + dept).children('option:not(:first)').remove();
		for (var i = 0; i < data.length; i++) {
			if (activeDept == data[i].dept_id) {
				$('#select_departments_' + dept).append(
						'<option selected="selected" value="'+data[i].dept_id+'">'
						+ data[i].dept_name + '</option>');
			} else {
				$('#select_departments_' + dept).append(
						'<option value="'+data[i].dept_id+'">'
						+ data[i].dept_name + '</option>');
			}
		}
	});
}

$("#existing_colleges").change( function() {
	if ($(this).val() == 'other') {
		$("#edu_organization").val("")
		$("#edu_organization").attr("placeholder","Enter College name here");
		$('#edu_organization').prop('required',true);
		$("#organization_text").show();
	} else {
		var clgName = $("#existing_colleges option:selected").text();
		$("#edu_organization").val(clgName);
		$('#edu_organization').prop('required',false);
		$("#organization_text").hide();
	}
});

$("#existing_colleges1").change( function() {
	if ($(this).val() == 'other') {
		$("#organization_text").show();
		$('#edu_organization1').show();
		$("#edu_organization1").val("")
		$("#edu_organization1").attr("placeholder","Enter College name here");
		$('#edu_organization1').prop('required',true);
		$("#organization_text1").show();
	} else {
		var clgName = $("#existing_colleges1 option:selected").text();
		$("#edu_organization1").val(clgName);
		$('#edu_organization1').prop('required',false);
		$("#organization_text1").hide();
	}
});

function clear_edu_form(){
	$('#degreeSelector').prop('disabled',false);
	$('.degreeSelector').prop('disabled',false);
	document.getElementById("edu_div").style.display="none";
	document.getElementById("edu_div2").style.display="none";
	//document.getElementById("edu_div2").style.display="none";
	
	$('#edu_form1').val('');
	$('#edu_stud_past_id').val('0');
	$('#edu_category').val('');
	$("#existing_organization").show();
	$("#existing_colleges").val('');
	$("#organization_text").hide();
	$('#edu_departments1').val('');
	$('#edu_organization').val('');
	$('#edu_board').val('');
	$('#edu_description').val('');
	$('#edu_departments').val('');
	$('#edu_enddate').val('');
}

function editeducation(stud_past_id,category,department,organization,board,description,end_date){
	clear_edu_form();
	if(stud_past_id!='0'){
		$("#edu_stud_past_id1").val(stud_past_id);
		$("#edu_category1").val(category);
		 $('#degreeSelector option').remove();
		if(category=='HSC'){
			$("#existing_colleges1").hide();
			$('#edu_organization1').show();
			$('#edu_organization1').val(organization);
			$('#edu_departments1').append('<option value="2001">Arts</option>');
			$('#edu_departments1').append('<option value="2002">Science</option>');
			$('#edu_departments1').append('<option value="2003">Commerce</option>');
		}else{
			$("#existing_colleges1").show();
			$('#edu_organization1').hide();
		}
		
		if($("#existing_colleges1").val()==null || $("#existing_colleges1").val()==''){
			$("#existing_colleges1").val('other');
			$("#organization_text1").show();
		}
		//$('#edu_organization1').val(organization);
		$('#edu_board1').val(board);
		$('#edu_description1').val(description);
		//value will be set when dept is of HSC and rest name will be used to set dept
		$("#existing_colleges1 option:contains("+organization+")").prop('selected', true);
		$("#edu_departments1 option:contains("+department+")").prop('selected',true);
		//will be used when dep are loaded
		sel_department=department;
		$('#edu_enddate1').val(end_date);
	} else
		$('#degreeSelector').val('');
	$("#addMoreEdu").modal('show');
	$("#edu_div2").attr("style", "display:block")
}
//getDepts() present in form_elements.js
$('#degreeSelector').on('change', function() {
    // Hide all form elements first
	$('#edu_form1').hide();
   
    
    var degree = this.value;
    $("#edu_category").val(degree);
    
    if (degree == 'SSC' || degree == 'HSC') {
        $("#edu_organization_label").text("School Name");
        $("#existing_organization").hide();
        $("#organization_text").show();
        $('#edu_organization').prop('required', true);
        
        if (degree == 'HSC') {
            $('#edu_departments').children('option:not(:first)').remove();
            $('#edu_departments').append('<option value="2001">Arts</option>');
            $('#edu_departments').append('<option value="2002">Science</option>');
            $('#edu_departments').append('<option value="2003">Commerce</option>');
            $('#edu_departments').prop('required', true);
            $("#edu_department_div").show();
        } else {
            $('#edu_departments').prop('required', false);
            $("#edu_department_div").hide();
        }
    } else if (degree == 'DIP' || degree == 'UG' || degree == 'PG' || degree == 'PHD') {
        $("#edu_organization_label").text("Institute Name");
        $("#existing_organization").show();
        $("#existing_colleges").val("");
        $("#organization_text").hide();
        $('#edu_organization').prop('required', false);
        $("#edu_department_div").show();
        $('#edu_departments').prop('required', true);
        
        getDepts(degree, function(data) {
            $('#edu_departments').children('option:not(:first)').remove();
            for (var i = 0; i < data.length; i++) {
                $('#edu_departments').append('<option value="'+data[i].dept_id+'">'+data[i].dept_name+'</option>');
            }
            $("#edu_departments option:contains('"+sel_department+"')").prop('selected', true);
            sel_department = '';
        });
    }
    
    // Display only the selected form elements
    $('#edu_form_' + degree).show();
    
    document.getElementById("edu_div").style.display = "inline-block";
    document.getElementById("edu_div2").style.display = "inline-block";
});


$("#edu_form").on( "submit", function( event ) {
	event.preventDefault();
	var degree = $("#edu_category").val();
	if (degree != 'SSC' && degree != 'HSC') {
		if($("#existing_colleges").val() == null || $("#existing_colleges").val() == "") {
			alert("Please select an Institute!");
			return false;
		}
	}
	var fdata = $(this).serialize();
	$.ajax({
		type:'post',
		url:'saveStudentPast',
		data:fdata,
		datatype:'json',
		success:function(response){
			alert("Successfully Saved!");
			if($("#edu_stud_past_id").val()!="0")
				edu_table.row( $('#rem'+$("#edu_stud_past_id").val()).parents('tr') ).remove();
			var dept = $('#edu_departments').val();
			if(null != dept && dept != '')
				dept = $('#edu_departments option:selected').text();
			edu_table.row.add([$("#edu_category").val(),dept,$("#edu_organization").val(),
					$("#edu_board").val(),$("#edu_description").val(),$("#edu_enddate").val(),
					"<i onclick=\"editeducation('"+response+"','"+$("#edu_category").val()+"','"+dept+"','"
						+ $("#edu_organization").val()+"','"+$("#edu_board").val()+"','"+$("#edu_description").val()+"','"
						+ $("#edu_enddate").val()+"')\" class='fa fa-pencil pr-2'></i><i class='fa fa-times' "
						+ "onclick=\"removeStudentEdu('"+response+"')\" id='rem"+response+"'></i>"]).node().id = 'tr_'+$("#edu_category").val();
			
			edu_table.draw(false);
			window.location.reload();
			$("#addMoreEdu").modal('hide');
		},
		error:function(error){
			alert(error);
			alert(error_fetch);
		}
	});
});

$("#edu_form1").on( "submit", function( event ) {
	event.preventDefault();
	var degree = $("#edu_category1").val();
	if (degree != 'SSC' && degree != 'HSC') {
		if($("#existing_colleges1").val() == null || $("#existing_colleges1").val() == "") {
			alert("Please select an Institute!");
			return false;
		}
	}
	var fdata = $(this).serialize();
	$.ajax({
		type:'post',
		url:'saveStudentPast',
		data:fdata,
		datatype:'json',
		success:function(response){
			alert("Successfully Saved!");
			if($("#edu_stud_past_id").val()!="0")
				edu_table.row( $('#rem'+$("#edu_stud_past_id").val()).parents('tr') ).remove();
			var dept = $('#edu_departments1').val();
			if(null != dept && dept != '')
				dept = $('#edu_departments1 option:selected').text();
			edu_table.row.add([$("#edu_category1").val(),dept,$("#edu_organization1").val(),
					$("#edu_board1").val(),$("#edu_description1").val(),$("#edu_enddate1").val(),
					"<i onclick=\"editeducation('"+response+"','"+$("#edu_category1").val()+"','"+dept+"','"
						+ $("#edu_organization1").val()+"','"+$("#edu_board1").val()+"','"+$("#edu_description1").val()+"','"
						+ $("#edu_enddate1").val()+"')\" class='fa fa-pencil pr-2'></i><i class='fa fa-times' "
						+ "onclick=\"removeStudentEdu('"+response+"')\" id='rem"+response+"'></i>"]).node().id = 'tr_'+$("#edu_category1").val();
			
			edu_table.draw(false);
			window.location.reload();
			$("#addMoreEdu").modal('hide');
		},
		error:function(error){
			alert(error);
			alert(error_fetch);
		}
	});
});

function removeStudentEdu(studentPastId){
	$.ajax({
		type:'DELETE',
		url:'removeStudentPast/'+studentPastId,
		success:function(response){
			edu_table.row( $('#rem'+studentPastId).parents('tr') ).remove().draw();
			window.location.reload();
		},
		error:function(error){
			alert(error);
		}
	});
}
function alertMsg(msg){
	$.dialog('<b style="color:red;">'+msg+'</b>');
}