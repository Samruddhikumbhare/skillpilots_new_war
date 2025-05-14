$('.input_date').datepicker({
	autoclose: true,
	format: 'yyyy-MM-dd',
	startDate: new Date('2019-02-12'),
	todayHighlight: true}).on('changeDate', function(e) {
		$(this).datepicker('hide');
	});

var batch_report_table = $("#batch_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var course_report_table = $("#course_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var trainee_report_table = $("#trainee_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var date_report_table = $("#date_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var accomodation_report_table = $("#accomodation_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var food_report_table = $("#food_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var trainer_report_table = $("#trainer_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var group_report_table = $("#group_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var lesson_report_table = $("#lesson_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});
var batchwise_accomo_report_table = $("#batchwise_accomo_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

// List Of Reports (first dropdown menu )
$("#report_type").change(function(){
	// for Batch Wise Report
	if($(this).val()=='TBR') {
		$("#batch_div").show();
		$("#course_div").hide();
		$("#trainee_div").hide();
		$("#trainer_div").hide();
		$("#between_date_div").show();
		$("#accomodation_div").hide();
		$("#batchwise_accomo_div").hide();
		$("#food_div").hide();
		$("#group_div").hide();
		$("#lesson_div").hide();
		// report section hide/show on click on generate button
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
		
		// for Course Wise Report
	} /*else if($(this).val()=='CR') {
		$("#course_div").show();
		$("#batch_div").hide();
		$("#trainee_div").hide();
		$("#between_date_div").hide();
		$("#accomodation_div").hide();
		$("#food_div").hide();
		$("#trainer_div").hide();
		$("#group_div").hide();
		$("#lesson_div").hide();
		// Report View Section
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		
	}*/
	else if($(this).val()=='CWR') {
	$("#course_div").show();
	$("#batch_div").hide();
	$("#trainee_div").hide();
	$("#between_date_div").hide();
	$("#accomodation_div").hide();
	$("#food_div").hide();
	$("#trainer_div").hide();
	$("#group_div").hide();
	$("#lesson_div").hide();
	$("#batchwise_accomo_div").hide();
	// Report View Section
	$("#food_report_div").hide();
	$("#date_report_div").hide();
	$("#trainee_report_div").hide();
	$("#course_report_div").hide();
	$("#accomodation_report_div").hide();
	$("#batch_report_div").hide();
	$("#trainer_report_div").hide();
	$("#group_report_div").hide();
	$("#lesson_report_div").hide();
	$("#batchwise_accomo_report_div").hide();
	
	}// for Trainee Name Wise Report
		else if($(this).val()=='TNR') {
		$("#trainee_div").show();
		$("#batch_div").hide();
		$("#course_div").hide();
		$("#between_date_div").hide();
		$("#accomodation_div").hide();
		$("#food_div").hide();
		$("#trainer_div").hide();
		$("#group_div").hide();
		$("#lesson_div").hide();
		$("#batchwise_accomo_div").hide();
		// report section hide/show on click on generate button
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
		
		// for Date Wise Report
	}else if($(this).val()=='TDR') {
		$("#between_date_div").show();
		$("#course_div").hide();
		$("#subject_div").hide();
		$("#batch_div").hide();
		$("#trainee_div").hide();
		$("#accomodation_div").hide();
		$("#food_div").hide();
		$("#trainer_div").hide();
		$("#group_div").hide();
		$("#lesson_div").hide();
		$("#batchwise_accomo_div").hide();
		// freport section hide/show on click on generate button
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
		
		// for Accomodation Wise Report
	}else if($(this).val()=='TAR') {
		$("#accomodation_div").show();
		$("#between_date_div").hide();
		$("#status_div").hide();
		$("#course_div").hide();
		$("#batch_div").hide();
		$("#trainee_div").hide();
		$("#food_div").hide();
		$("#trainer_div").hide();
		$("#group_div").hide();
		$("#lesson_div").hide();
		$("#batchwise_accomo_div").hide();
		// report section hide/show on click on generate button
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
		
		// for Food Wise Report
	}else if($(this).val()=='FR') {
		$("#food_div").show();
		$("#accomodation_div").hide();
		$("#between_date_div").hide();
		$("#status_div").hide();
		$("#course_div").hide();
		$("#batch_div").hide();
		$("#trainee_div").hide();
		$("#trainer_div").hide();
		$("#group_div").hide();
		$("#lesson_div").hide();
		$("#batchwise_accomo_div").hide();
		// report section hide/show on click on generate button
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
		
		//for Moderator Name Wise Report
	}else if($(this).val()=='MNR') {
		$("#trainer_div").show();
		$("#accomodation_div").hide();
		$("#between_date_div").hide();
		$("#status_div").hide();
		$("#course_div").hide();
		$("#batch_div").hide();
		$("#trainee_div").hide();
		$("#food_div").hide();
		$("#group_div").hide();
		$("#lesson_div").hide();
		$("#batchwise_accomo_div").hide();
		// report section hide/show on click on generate button
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}
	// for Group Wise Report
	else if($(this).val()=='GR') {
		$("#group_div").show();
		$("#trainer_div").hide();
		$("#accomodation_div").hide();
		$("#between_date_div").hide();
		$("#status_div").hide();
		$("#course_div").hide();
		$("#batch_div").hide();
		$("#trainee_div").hide();
		$("#food_div").hide();
		$("#lesson_div").hide();
		$("#batchwise_accomo_div").hide();
		// report section hide/show on click on generate button
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
		
		// for Lesson Wise Report
	}else if($(this).val()=='LR') {
		$("#lesson_div").show();
		$("#group_div").hide();
		$("#trainer_div").hide();
		$("#accomodation_div").hide();
		$("#between_date_div").hide();
		$("#status_div").hide();
		$("#course_div").hide();
		$("#batch_div").hide();
		$("#trainee_div").hide();
		$("#food_div").hide();
		$("#batchwise_accomo_div").hide();
		// report section hide/show on click on generate button
		$("#lesson_report_div").hide();
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}else if($(this).val()=='BAR') {
		$("#batchwise_accomo_div").show();
		$("#course_div").hide();
		$("#batch_div").hide();
		$("#trainee_div").hide();
		$("#between_date_div").hide();
		$("#accomodation_div").hide();
		$("#food_div").hide();
		$("#trainer_div").hide();
		$("#group_div").hide();
		$("#lesson_div").hide();
		// Report View Section
		$("#batchwise_accomo_report_div").hide();
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
	}
});

$("#get_report").click(function(){
 if($("#report_type").val()=='TBR'){
		var batch_name = $("#select_batch").val();
		var fromdate = $("#txt_fromdt").val();
		var todate = $("#txt_todt").val();
		$("#before_report").hide();
		generateTraineeBatchReport(batch_name,fromdate,todate);
		$("#batch_report_div").show();
		$("#course_report_div").hide();
		$("#trainee_report_div").hide();
		$("#date_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#food_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	} 
 	else if($("#report_type").val()=='TSR'){
		var subject = $("#select_course").val();
		$("#before_report").hide();
		generateSubjectReport(subject);
		$("#course_report_div").show();
		$("#trainee_report_div").hide();
		$("#batch_report_div").hide();
		$("#date_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#food_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}
 	else if($("#report_type").val()=='TNR'){
		var sap_id = $("#select_trainee").val();
		$("#before_report").hide();
		generateTraineeReport(sap_id);
		$("#trainee_report_div").show();
		$("#course_report_div").hide();
		$("#batch_report_div").hide();
		$("#date_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#food_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}	
 	else if($("#report_type").val()=='TDR'){
		var fromdate = $("#txt_fromdt").val();
		var todate = $("#txt_todt").val();
		/*if(fromdate=="" && todate==""){
			alert("Please select a Trainee to generate the report.");
			return;
		}*/
		$("#before_report").hide();
		generateBetweenDateReport(fromdate,todate);
		$("#date_report_div").show();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#batch_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#food_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}
 	else if($("#report_type").val()=='LR'){
		var lesson = $("#select_lesson").val();
		$("#before_report").hide();
		generateLessonWiseReport(lesson);
		$("#lesson_report_div").show();
		$("#trainee_report_div").hide();
		$("#batch_report_div").hide();
		$("#date_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#food_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}
 	else if($("#report_type").val()=='TAR'){
		var day = $("#select_day").val();
		if(day==""){
			alert("Please select a Accomodation to generate the report.");
			return;
		}
		$("#before_report").hide();
		generateAccomodationReport(day);
		$("#accomodation_report_div").show();
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}	
 		else if($("#report_type").val()=='FR'){
		var food = $("#select_food").val();
		var batch = $("#select_bat").val();
		$("#before_report").hide();
		generateFoodReport(food,batch);
		$("#food_report_div").show();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}	
 	else if($("#report_type").val()=='MNR'){
		var trainer_name = $("#select_trainer").val();
		$("#before_report").hide();
		generateTrainerReport(trainer_name);
		$("#trainer_report_div").show();
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
	}
 	else if($("#report_type").val()=='GR'){
		var group_name = $("#select_group").val();
		$("#before_report").hide();
		generateGroupWiseReport(group_name);
		$("#group_report_div").show();
		$("#trainer_report_div").hide();
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
		
	}else if($("#report_type").val()=='CWR'){
		var course = $("#select_course").val();
		$("#before_report").hide();
		generateCourseWiseReport(course);
		$("#group_report_div").hide();
		$("#trainer_report_div").hide();
		$("#food_report_div").hide();
		$("#date_report_div").hide();
		$("#trainee_report_div").hide();
		$("#course_report_div").show();
		$("#accomodation_report_div").hide();
		$("#batch_report_div").hide();
		$("#lesson_report_div").hide();
		$("#batchwise_accomo_report_div").hide();
		
	}else if($("#report_type").val()=='BAR'){
		var batch_name = $("#select_batch_acc").val();
		$("#before_report").hide();
		generateBatchWiseAccomodationReport(batch_name);
		$("#batchwise_accomo_report_div").show();
		$("#course_report_div").hide();
		$("#trainee_report_div").hide();
		$("#batch_report_div").hide();
		$("#date_report_div").hide();
		$("#accomodation_report_div").hide();
		$("#food_report_div").hide();
		$("#trainer_report_div").hide();
		$("#group_report_div").hide();
		$("#lesson_report_div").hide();
	}
});

function generateTraineeBatchReport(batch_name,fromdate,todate){
	$.ajax({
		url : "generateTraineeBatchReport?batch_name=" + batch_name+"&fromdate="+fromdate+"&todate="+todate,
		type : "get",
		success : function(response) {
			$("#batch_report_title").html("Batch Wise Report for " + $("#select_batch option:selected").text());
			batch_report_table.clear().draw(false);
			var options = {year: 'numeric', month: '2-digit', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var to_date = new Date(response[0][i].to_date);
				var from_date = new Date(response[0][i].from_date);
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				batch_report_table.row.add([i+1,
					response[0][i].sap_id,
					response[0][i].first_name+" "+response[0][i].middle_name+" "+response[0][i].last_name,
					response[0][i].batch_name,
					response[0][i].food,
					response[0][i].mob_no,
					response[0][i].e_mail,
					'<center>'+response[0][i].accomodation+'</center>',
					'<center>'+response[0][i].arrival+'</center>',
					'<center>'+response[0][i].dept+'</center>',
					fromdt,
					todate,
					'<center>'+days+'</center>'
					]);
			}
			batch_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(batch_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					orientation: 'landscape',
					pageSize: 'A4',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Batch Wise Report for - " + $("#select_batch option:selected").text(),
					title: " Batch Wise Report for " + $("#select_batch option:selected").text(),
				}]
			});
			batch_report_table.buttons().container().appendTo($('#batch_report_export_buttons'));
			batch_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateCourseWiseReport(course){
	$.ajax({
		url : "getCourseReport?course=" + course,
		type : "get",
		success : function(response) {
			$("#course_report_title").html(" Course Wise Report for " + $("#select_course option:selected").text());
			course_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var from_date = new Date(response[0][i].from_date);
				var to_date = new Date(response[0][i].to_date);
				
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				course_report_table.row.add([i+1,
					response[0][i].course_name,
					response[0][i].batch_name,
					'<center>'+response[0][i].ndays+'</center>',
					'<center>'+response[0][i].trainees+'</center>',
					fromdt,
					todate,
					'<center>'+days+'</center>'
					]);
			}
			course_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(course_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Course Wise Report for - " + $("#select_course option:selected").text(),
					title: "Course Wise Report for " + $("#select_course option:selected").text(),
				}]
			});
			course_report_table.buttons().container().appendTo($('#course_report_export_buttons'));
			course_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateLessonWiseReport(lesson){
	$.ajax({
		url : "getLessonWiseReport?lesson=" + lesson,
		type : "get",
		success : function(response) {
			$("#lesson_report_title").html("Lesson Wise Report for " + $("#select_lesson option:selected").text());
			lesson_report_table.clear().draw(false);
			var options = {year: 'numeric', month: '2-digit', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var to_date = new Date(response[0][i].to_date);
				var from_date = new Date(response[0][i].from_date);
				
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				lesson_report_table.row.add([i+1,
					response[0][i].batch_name,
					response[0][i].lesson_name,
					fromdt,
					todate,
					'<center>'+response[0][i].ndays+'</center>',
					'<center>'+response[0][i].trainees+'</center>',
					'<center>'+days+'</center>',
					]);
			}
			lesson_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(lesson_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					/*orientation: 'landscape',
					pageSize: 'A4',*/
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Lesson Wise Report For - " + $("#select_lesson option:selected").text(),
					title: " Lesson Wise Report for " + $("#select_lessson option:selected").text(),
				}]
			});
			lesson_report_table.buttons().container().appendTo($('#lesson_report_export_buttons'));
			lesson_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateTrainerReport(trainer_name){
	$.ajax({
		url : "getTrainerReport?trainer_name=" + trainer_name,
		type : "get",
		success : function(response) {
			$("#trainer_report_title").html("Moderator Wise Report for " + $("#select_trainer option:selected").text());
			trainer_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit'};
			for(i=0; i<response[0].length; i++) {
				var to_date = new Date(response[0][i].to_date);
				var from_date = new Date(response[0][i].from_date);
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var new_fdate = from_date.toLocaleDateString("en-US", options);
				var new_tdate = to_date.toLocaleDateString("en-US", options);
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				if(new_fdate=="1/01/1970" && new_tdate=="1/01/1970"){
					new_fdate="Not Available";
					new_tdate="Not Available";
					trainer_report_table.row.add([i+1,
					    response[0][i].moderator_id,
                        response[0][i].trainer_name,
						response[0][i].course_name,
						response[0][i].lesson_name,
						response[0][i].batch_name,
						response[0][i].level,
						'<center>'+response[0][i].trainees+'</center>',
						new_fdate,
						new_tdate,
						'<center>'+days+'</center>'
						]);
				}else{
						trainer_report_table.row.add([i+1,
                        response[0][i].moderator_id,
                        response[0][i].trainer_name,
  						response[0][i].course_name,
  						response[0][i].lesson_name,
  						response[0][i].batch_name,
  						response[0][i].level,
  						'<center>'+response[0][i].trainees+'</center>',
  						new_fdate,
  						new_tdate,
  						'<center>'+days+'</center>'
					 ]);
				}
			}
			trainer_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons( trainer_report_table, {
				
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				
				{
					extend:'pdf',
					orientation: 'landscape',
					pageSize: 'A4',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Moderator Wise Report for - " + $("#select_trainer option:selected").text(),
					title: "Moderator Wise Report for " + $("#select_trainer option:selected").text(),
					
					
				}],
			});
			trainer_report_table.buttons().container().appendTo($('#trainer_report_export_buttons'));
			trainer_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateBetweenDateReport(fromdate,todate){
	$.ajax({
		url : "getBetweenDateReport?fromdate=" + fromdate+"&todate="+todate,
		type : "get",
		success : function(response) {
			$("#date_report_title").html("Betweeen Date Wise Report for " + $("#select_status option:selected").text());
			date_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var from_date = new Date(response[0][i].from_date);
				var to_date = new Date(response[0][i].to_date);
				
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				date_report_table.row.add([i+1,
					response[0][i].sap_id,
					response[0][i].first_name+" "+response[0][i].middle_name+" "+response[0][i].last_name,
					response[0][i].batch_name,
					response[0][i].e_mail,
					response[0][i].mob_no,
					response[0][i].moderator_id,
					response[0][i].lesson_name,
					fromdt,
					todate,
					'<center>'+days+'</center>'
				]);
			}
			date_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(date_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					orientation: 'landscape',
					pageSize: 'A4',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Date Wise Report for - " + $("#select_status option:selected").text(),
					title: "Date Wise Report Between " + $("#select_status option:selected").text(),
				}]
			});
			date_report_table.buttons().container().appendTo($('#date_report_export_buttons'));
			date_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateGroupWiseReport(groupName){
	$.ajax({
		url : "getGroupWiseReport?groupName=" + groupName,
		type : "get",
		success : function(response) {
			$("#group_report_title").html("Group Wise Report for " + $("#select_group option:selected").text()),
			group_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var from_date = new Date(response[0][i].from_date);
				var to_date = new Date(response[0][i].to_date);
				
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				group_report_table.row.add([i+1,
				    response[0][i].moderator_id,
					response[0][i].course,
					response[0][i].lesson_name,
					response[0][i].batch_name,
					'<center>'+response[0][i].group_name+'</center>',
					'<center>'+response[0][i].trainees+'</center>',
					fromdt,
					todate,
					'<center>'+days+'</center>',
					]);
			}
			group_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(group_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					orientation: 'landscape',
					pageSize: 'A4',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Group Wise Report for - " + $("#select_group option:selected").text(),
					title: "Group Wise Report for " + $("#select_group option:selected").text(),
				}]
			});
			group_report_table.buttons().container().appendTo($('#group_report_export_buttons'));
			group_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

/*function generateAccomodationReport(day){
$.ajax({
	url : "getAccomodationReport?accomodation=" + day,
	type : "get",
	success : function(response) {
		$("#accomodation_report_title").html(" Accomodation Wise Report for " + $("#select_day option:selected").text());
		accomodation_report_table.clear().draw(false);
		var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
		for(i=0; i<response[0].length; i++) {
			var from_date = new Date(response[0][i].from_date);
			var to_date = new Date(response[0][i].to_date);
			
			var fromdate = from_date;
			var dd = ("0" + fromdate.getDate()).slice(-2);
			var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
			var yyyy = fromdate.getFullYear();
			var fromdt = ""+dd + "/" + mm + "/" + yyyy;
			
			var todate = to_date;
			var dd = ("0" + todate.getDate()).slice(-2);
			var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
			var yyyy = todate.getFullYear();
			var todate = ""+dd + "/" + mm + "/" + yyyy;
			
			accomodation_report_table.row.add([i+1, 
				response[0][i].sap_id,
				response[0][i].first_name+" "+response[0][i].middle_name+" "+response[0][i].last_name,
				response[0][i].batch_name,
				response[0][i].accomodation,
				fromdt,
				todate,
				]);
		}
		accomodation_report_table.buttons().remove();
		var space_for_alignment="																												";
		new $.fn.dataTable.Buttons(accomodation_report_table, {
			buttons: [{
				extend:'excel',
				text: 'Download as Excel',
				className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
			},
			{
				extend:'pdf',
				orientation: 'landscape',
				pageSize: 'A4',
				text: 'Download as PDF',
				className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
				filename: "Accomodation Wise Report for - " + $("#select_day option:selected").text(),
				title: "Accomodation Wise Report for " + $("#select_day option:selected").text(),
			}]
		});
		accomodation_report_table.buttons().container().appendTo($('#accomodation_report_export_buttons'));
		accomodation_report_table.draw(false);
	}, error : function(err) {
		alert(err);
	}
});
}*/

/*function generateFoodReport(food,batch){
	$.ajax({
		url : "getFoodReport?food=" + food+"&batch="+batch,
		type : "get",
		success : function(response) {
			$("#batch_report_div").hide();
			$("#food_report_title").html("Food Wise Report for " + $("#select_food option:selected").text()),
			food_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var from_date = new Date(response[0][i].from_date);
				var to_date = new Date(response[0][i].to_date);
				
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				food_report_table.row.add([i+1,
					response[0][i].sap_id,
					response[0][i].first_name+" "+response[0][i].middle_name+" "+response[0][i].last_name,
					response[0][i].batch_name,
					response[0][i].food,
					fromdt,
					todate,
					'<center>'+days+'</center>'
					]);
			}
			food_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(food_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					orientation: 'landscape',
					pageSize: 'A4',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Food Wise Report for - " + $("#select_food option:selected").text(),
					title: "Food Wise Report for " + $("#select_food option:selected").text(),
				}]
			});
			food_report_table.buttons().container().appendTo($('#food_report_export_buttons'));
			food_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}*/

function generateTraineeReport(sap_id){
	$.ajax({
		url : "getTraineeReport?sap_id=" + sap_id,
		type : "get",
		success : function(response) {
			$("#trainee_report_title").html("Trainee Wise Report for " + $("#select_trainee option:selected").text());
			trainee_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var from_date = new Date(response[0][i].from_date);
				var to_date = new Date(response[0][i].to_date);
				
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				trainee_report_table.row.add([i+1,
					response[0][i].sap_id,
					response[0][i].first_name+" "+response[0][i].middle_name+" "+response[0][i].last_name,
					response[0][i].batch_name,
					response[0][i].e_mail,
					response[0][i].mob_no,
					fromdt,
					todate,
					'<center>'+days+'</center>'
					]);
			}
			trainee_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons( trainee_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					orientation: 'landscape',
					pageSize: 'A4',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Trainee Wise Report for - " + $("#select_trainee option:selected").text(),
					title: "Trainee Wise Report for " + $("#select_trainee option:selected").text(),
				}]
			});
			trainee_report_table.buttons().container().appendTo($('#trainee_report_export_buttons'));
			trainee_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

/*function generateBatchWiseAccomodationReport(batch_name){
	$.ajax({
		url : "generateBatchWiseAccomoReport?batch_name=" + batch_name,
		type : "get",
		success : function(response) {
			$("#batchwise_accomo_report_title").html("Batch Wise Accomodation Report for " + $("#select_batch_acc option:selected").text());
			batchwise_accomo_report_table.clear().draw(false);
			var options = {year: 'numeric', month: '2-digit', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var to_date = new Date(response[0][i].to_date);
				var from_date = new Date(response[0][i].from_date);
				var fromdate = from_date;
				var dd = ("0" + fromdate.getDate()).slice(-2);
				var mm = ("0" + (fromdate.getMonth() + 1)).slice(-2);
				var yyyy = fromdate.getFullYear();
				var fromdt = ""+dd + "/" + mm + "/" + yyyy;
				
				var todate = to_date;
				var dd = ("0" + todate.getDate()).slice(-2);
				var mm = ("0" + (todate.getMonth() + 1)).slice(-2);
				var yyyy = todate.getFullYear();
				var todate = ""+dd + "/" + mm + "/" + yyyy;
				
				var d = 1000*60*60*24;
				var days = (to_date - from_date)/d;
				batchwise_accomo_report_table.row.add([i+1,
					response[0][i].sap_id,
					response[0][i].first_name+" "+response[0][i].middle_name+" "+response[0][i].last_name,
					response[0][i].batch_name,
					response[0][i].food,
					response[0][i].mob_no,
					response[0][i].e_mail,
					'<center>'+response[0][i].accomodation+'</center>',
					'<center>'+response[0][i].arrival+'</center>',
					'<center>'+response[0][i].dept+'</center>',
					fromdt,
					todate,
					'<center>'+days+'</center>'
					]);
			}
			batchwise_accomo_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(batchwise_accomo_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					orientation: 'landscape',
					pageSize: 'A4',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Batch Wise Accomodation Report For - " + $("#select_batch_acc option:selected").text(),
					title: " Batch Wise Accomodation Report for " + $("#select_batch_acc option:selected").text(),
				}]
			});
			batchwise_accomo_report_table.buttons().container().appendTo($('#batchwise_accomo_report_export_buttons'));
			batchwise_accomo_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}*/