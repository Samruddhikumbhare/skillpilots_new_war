$('#select_lesson').multiselect({
	enableClickableOptGroups:true,
	buttonWidth:'100%',
	dropRight:true,
	enableFiltering: true,
	nonSelectedText: '-- Select Lessons --'
});

$('.input_date').datepicker({
	autoclose: true,
	format: 'yyyy-MM-dd',
	startDate: new Date('2019-02-12'),
	todayHighlight: true}).on('changeDate', function(e) {
		$(this).datepicker('hide');
	});

var test_report_table = $("#test_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var employee_report_table = $("#employee_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var lesson_report_table0 = $("#lesson_report_table1").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var lesson_report_table1 = $("#lesson_report_table2").DataTable({
	searching:false,
	paging:false,
	info:false,
});


$("#report_type").change(function(){
	if($(this).val()=='T') {
		$("#test_div").show();
		$("#employee_div").hide();
		$("#lesson_div1").hide();
		$("#lesson_div").hide();
		$("#batch_div").hide();
		$("#trainer_div").hide();
	} else if($(this).val()=='E') {
		$("#test_div").hide();
		$("#employee_div").show();
		$("#lesson_div1").hide();
		$("#lesson_div").hide();
		$("#batch_div").hide();
		$("#trainer_div").hide();
	} else if($(this).val()=='L') {
		$("#test_div").hide();
		$("#employee_div").hide();
		$("#lesson_div1").show();
		//$("#lesson_div").show();
		$("#batch_div").hide();
		$("#trainer_div").hide();
	}else if($(this).val()=='TBR') {
		$("#test_div").hide();
		$("#employee_div").hide();
		$("#lesson_div").hide();
		$("#batch_div").show();
		$("#trainer_div").hide();
	}else if($(this).val()=='MNR') {
		$("#trainer_div").show();
		$("#test_div").hide();
		$("#employee_div").hide();
		$("#lesson_div").hide();
		$("#batch_div").hide();
	}else if($(this).val()=='TDR') {
		$("#trainer_div").hide();
		$("#test_div").hide();
		$("#employee_div").hide();
		$("#lesson_div").hide();
		$("#batch_div").hide();
	}else if($(this).val()=='LE') {
		$("#trainer_div").hide();
		$("#test_div").hide();
		$("#employee_div").hide();
		$("#lesson_div").show();
		$("#batch_div").hide();
	}
});

$("#get_report").click(function(){
	if($("#report_type").val()=='T'){
		var test_id = $("#select_test").val();
		var fromdate = $("#txt_fromdt").val();
		var todate = $("#txt_todt").val();
		if(new Date($("#txt_todt").val()) < new Date($("#txt_fromdt").val())){
			alert('Schedule-to date should be after schedule-from date.');
			return false;
		}
		$("#before_report").hide();
		generateTestReport(test_id,fromdate,todate);
		$("#test_report_div").show();
		$("#employee_report_div").hide();
		$("#lesson_report_div1").hide();
		$("#lesson_report_div").hide();
		$("#employee_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		
	} else if($("#report_type").val()=='E'){
		var emp_id = $("#select_employee").val();
		if(emp_id==""){
			alertMsg("Please select a Employee to generate the report.");
			return;
		}
		var fromdate = $("#txt_fromdt").val();
		var todate = $("#txt_todt").val();
		if(new Date($("#txt_todt").val()) < new Date($("#txt_fromdt").val())){
			alert('Schedule-to date should be after schedule-from date.');
			return false;
		}
		$("#before_report").hide();
		generateEmployeeReport(emp_id,fromdate,todate);
		$("#test_report_div").hide();
		$("#employee_report_div").show();
		$("#lesson_report_div1").hide();
		$("#lesson_report_div").hide();
		//$("#employee_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
	} else if($("#report_type").val()=='L'){
		var lesson_id = $("#select_lesson").val();
		if(lesson_id==""){
			alertMsg("Please select atleast one lesson to generate the report.");
			return;
		}
		var fromdate = $("#txt_fromdt").val();
		var todate = $("#txt_todt").val();
		if(new Date($("#txt_todt").val()) < new Date($("#txt_fromdt").val())){
			alert('Schedule-to date should be after schedule-from date.');
			return false;
		}
		$("#before_report").hide();
		generateLessonReport(lesson_id,fromdate,todate);
		
		$("#test_report_div").hide();
		$("#employee_report_div").hide();
		$("#lesson_report_div1").show();
		
	}else if($("#report_type").val()=='LE'){
		var lesson_id = $("#select_lesson").val();
		if(lesson_id==""){
			alertMsg("Please select atleast one lesson to generate the report.");
			return;
		}
		var fromdate = $("#txt_fromdt").val();
		var todate = $("#txt_todt").val();
		if(new Date($("#txt_todt").val()) < new Date($("#txt_fromdt").val())){
			alert('Schedule-to date should be after schedule-from date.');
			return false;
		}
		$("#before_report").hide();
		generateLessonReportForMod(lesson_id,fromdate,todate);
		$("#test_report_div").hide();
		$("#employee_report_div").hide();
		//$("#lesson_report_div1").show();
		$("#lesson_report_div").show();
		$("#employee_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
	}	
});

function generateTestReport(test_id,fromdate,todate){
	$.ajax({
		url : "getTestReport?test_id=" + test_id + "&fromdate=" + fromdate + "&todate=" + todate,
		type : "get",
		success : function(response) {
			$("#test_report_title").html("Report for Test : "+$("#select_test option:selected").text());
			var options = {year: 'numeric', month: 'short', day: '2-digit' };
			test_report_table.clear().draw(false);
			
			for(i=0; i<response[0].length; i++) {
				var schedule_from = new Date(response[0][i].schedule_from);
				var schedule_to = new Date(response[0][i].schedule_to);

				test_report_table.row.add([i+1, "<a data-toggle='modal' data-target='#view_result_modal' " +
						"onclick=\"viewTestResult('"+response[0][i].test_id+"','"+response[0][i].schedule_from+
						"','"+response[0][i].schedule_to+"')\" title='View Test Result'>"+response[0][i].test_name+"</a>",
						response[0][i].lesson, response[0][i].total_question, response[0][i].total_marks, response[0][i].cut_off,
					schedule_from.toLocaleDateString("en-US", options)+" - "+schedule_to.toLocaleDateString("en-US", options),
					response[0][i].count]);
			}
			test_report_table.buttons().remove();
			new $.fn.dataTable.Buttons( test_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					orientation: 'landscape',
					filename: $("#select_test option:selected").text() + " Results",
					title: $("#select_test option:selected").text() + " Results",
				}]
			});
			test_report_table.buttons().container().appendTo($('#test_report_export_buttons'));
			test_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateEmployeeReport(sap_id,fromdate,todate){
	$.ajax({
		url : "getEmployeeReport?sap_id=" + sap_id + "&fromdate=" + fromdate + "&todate=" + todate,
		type : "get",
		success : function(response) {
			$("#employee_report_title").html("Test Report for " + $("#select_employee option:selected").text());
			employee_report_table.clear().draw(false);
			
			for(i=0; i<response[0].length; i++) {
				var result = "";
				var curr_date = (new Date()).setHours(0,0,0,0);
				switch(response[0][i].status){
				case 'P' : 
					console.log(response[0][i].schedule_to);
					if((new Date(response[0][i].schedule_to)).getTime() >= curr_date)
						result="Pending";
					else
						result="Test Expired!";
					break;
				case 'A' : 
					if(new Date(response[0][i].updation_date).getTime() === curr_date)
						result="Active";
					else
						result="Test Incomplete!"
							break;
				case 'D' : result="Disqualified";break;
				case 'C' : 
					if(Number(response[0][i].marks_scored)>=Number(response[0][i].cut_off))
						result="Passed";
					else
						result="Failed";
					break;
				}

				employee_report_table.row.add([i+1, response[0][i].test_name, response[0][i].lesson,
					response[0][i].total_question, response[0][i].total_marks, response[0][i].cut_off,
					result,response[0][i].marks_scored,(Number(response[0][i].marks_scored)/response[0][i].total_marks*100).toFixed(2)]);
			}
			employee_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons( employee_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Employee Report - " + $("#select_employee option:selected").text(),
					title: "Test Report for " + $("#select_employee option:selected").text(),
				}]
			});
			employee_report_table.buttons().container().appendTo($('#employee_report_export_buttons'));
			employee_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateLessonReport(lesson_id,fromdate,todate){
	$.ajax({
		url : "getLessonReport?lesson_id=" + lesson_id + "&fromdate=" + fromdate + "&todate=" + todate,
		type : "get",
		success : function(response) {
			var title="";
			for(i=0; i<response[0].length; i++) {
				if(title=="")
					title = response[0][i];
				else
					title += "," + response[0][i];
			}
			$("#lesson_report_title1").html("Report for Lesson(s) : " +title);
			var options = {year: 'numeric', month: 'short', day: '2-digit' };
			lesson_report_table0.clear().draw(false);
			
			for(i=0; i<response[1].length; i++) {
				var schedule_from = new Date(response[1][i].schedule_from);
				var schedule_to = new Date(response[1][i].schedule_to);
				
				lesson_report_table0.row.add([i+1, response[1][i].test_name, response[1][i].lesson, 
					response[1][i].total_question, response[1][i].total_marks, response[1][i].cut_off,
					schedule_from.toLocaleDateString("en-US", options)+" - "+schedule_to.toLocaleDateString("en-US", options),
					response[1][i].count]);
			}
			lesson_report_table0.buttons().remove();
			new $.fn.dataTable.Buttons( lesson_report_table0, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Lesson-wise Report",
					title: "Lesson-wise Report",
					orientation: 'landscape',
					messageTop: "Report for Lesson(s) : " +title,
				}]
			});
			lesson_report_table0.buttons().container().appendTo($('#lesson_report_export_buttons1'));

			lesson_report_table0.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateLessonReportForMod(lesson_id,fromdate,todate){
	$.ajax({
		url : "getLessonReport?lesson_id=" + lesson_id + "&fromdate=" + fromdate + "&todate=" + todate,
		type : "get",
		success : function(response) {
			var title="";
			for(i=0; i<response[0].length; i++) {
				if(title=="")
					title = response[0][i];
				else
					title += "," + response[0][i];
			}
			$("#lesson_report_title").html("Report for Lesson(s) : " +title);
			var options = {year: 'numeric', month: 'short', day: '2-digit' };
			lesson_report_table1.clear().draw(false);
			
			for(i=0; i<response[1].length; i++) {
				var schedule_from = new Date(response[1][i].schedule_from);
				var schedule_to = new Date(response[1][i].schedule_to);
				
				lesson_report_table1.row.add([i+1, response[1][i].test_name, response[1][i].lesson, 
					response[1][i].total_question, response[1][i].total_marks, response[1][i].cut_off,
					schedule_from.toLocaleDateString("en-US", options)+" - "+schedule_to.toLocaleDateString("en-US", options),
					response[1][i].count]);
			}
			lesson_report_table1.buttons().remove();
			new $.fn.dataTable.Buttons( lesson_report_table1, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Lesson-wise Report",
					title: "Lesson-wise Report",
					orientation: 'landscape',
					messageTop: "Report for Lesson(s) : " +title,
				}]
			});
			lesson_report_table1.buttons().container().appendTo($('#lesson_report_export_buttons'));

			lesson_report_table1.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

/* "<center><input type='checkbox' class='checkBoxClass' id="+response[0][i].trainee_id+" name='getId[]' value="+response[0][i].trainee_id+"></center>", */