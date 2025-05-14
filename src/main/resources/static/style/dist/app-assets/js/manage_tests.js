$('.mytable tbody').on('click', '.chk_status', function() {
	var test_id = $(this).attr("id");
	//stored in variable since the event is closed when confirm dialog is opened and hence 'this' doesnt work
	var control = this;
	var status,msg_txt;
	if ($(this).is(":checked")) {
		status = true;
		msg_txt="publish";
	} else {
		status = false;
		msg_txt="unpublish";
	}
	
	confirmDialog(function(confirm){
		if(confirm === 'Confirm') {
			$.ajax({
				url : "testPublish?status=" + status + "&test_id=" + test_id,
				type : "get",
				success : function(response) {
					/*  alert(response);  */
				},
				error : function(err) {
					/* alert(err); */
				}
			});
		}else{
			if(status){
				$(control).prop('checked',false);
			}else
				$(control).prop('checked',true);
		}
	},"Confirm Action","Are you sure you want to "+msg_txt+" the selected test?","Confirm","Cancel");
	
});

$(".test_modal_body :input").prop('disabled',true);
function viewTest(test_id){
	$.ajax({
		url : "gettest?test_id=" + test_id,
		type : "get",
		success : function(response) {
			$("#testname").val(response.test_name);
			$("#testdesc").val(response.test_desc);
			$("#lesson").val($("#lessons_"+test_id).text());
			$("#category").val($("#category_"+test_id).text());
			$("#pattern").val($("#pattern_"+test_id).text());
			if(response.language == 'ENG')
				$("#view_language").val('English');
			else if(response.language == 'HIN')
				$("#view_language").val('Hindi');
			else if(response.language == 'MAR')
				$("#view_language").val('Marathi');
			$("#totalq").val(response.total_question);
			$("#totalmarks").val(response.total_marks);
			$("#cutoff").val(response.cut_off);
			$("#totaltime").val(response.total_time);
			$("#fromdt").val(new Date(response.schedule_from).toDateString());
			$("#todt").val(new Date(response.schedule_to).toDateString());
			if(response.test_key=='EK')
				$("#test_key").val("Employee based");
			else
				$("#test_key").val("Test based");
			if(response.show_correct_ans)
				$("#chk_showans").prop('checked',true);
			else
				$("#chk_showans").prop('checked',false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function editTest(test_id){
	if ($("#"+test_id).is(":checked")) {
		alertMsg("Published test cannot be edited.");
		return;
	}
	var form = document.createElement('form');
	document.body.appendChild(form);
	form.method = 'post';
	form.action = document.getElementById("create_test_btn").getAttribute("href");
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'test_id';
	input.value = test_id;
	form.appendChild(input);
    form.submit();
}

function assignTest(test_id){
	if ($("#"+test_id).is(":checked")) {
		alertMsg("Published test cannot be assigned.");
		return;
	}
	var form = document.createElement('form');
	document.body.appendChild(form);
	form.method = 'post';
	form.action = 'assignTest';
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'assign_test_id';
	input.value = test_id;
	form.appendChild(input);
    form.submit();
}

function viewTestKey(test_id){
	if($("#test_key_value_"+test_id).val()=='EK'){
		/*$.ajax({
			url : "getTestKeyForEmployee?test_id=" + test_id,
			type : "get",
			success : function(response) {
				var employee_test_key_table = $("#employee_test_key_table").DataTable();
				employee_test_key_table.clear().draw(false);
				for(i=0; i<response.length; i++) {
					employee_test_result_table.row.add([i+1,response[i].sap_id,response[i].first_name+" "+response[i].last_name,
						response[i].test_key]);
				}
				employee_test_key_table.draw(false);
				$("#employee_based_key").show();
				$("#test_based_key").hide();
			}, error : function(err) {
				alert(err);
			}
		});*/
		$("#employee_based_key").show();
		$("#test_based_key").hide();
	} else {
		$("#employee_based_key").hide();
		$("#test_based_key").show();
		$("#test_key_value").val($("#test_key_value_"+test_id).val());
	}
}

function deletetest(test_id){
	if ($("#"+test_id).is(":checked")) {
		alertMsg("Published test cannot be deleted.");
		return;
	}
	confirmDialog(function(confirm){
		if(confirm === 'Confirm') {
			$.ajax({
				url : "deleteTest?test_id=" + test_id,
				type : "get",
				success : function(response) {
					$("#actions_"+test_id).text("Deleted");
				}, error : function(err) {
					alert(err);
				}
			});
		}
	},"Confirm Action","Are you sure you want to Delete the selected test?","Confirm","Cancel");
}