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

var issue_report_table = $("#issue_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var employee_report_table = $("#employee_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});


$("#report_type").change(function(){
	if($(this).val()=='ISSUE') {
		$("#issue_div").show();
		$("#employee_div").hide();
	} else if($(this).val()=='E') {
		$("#issue_div").hide();
		$("#employee_div").show();
	} 
});

$("#get_report").click(function(){
 if($("#report_type").val()=='E'){
		var emp_id = $("#select_employee").val();
		if(emp_id==""){
			alertMsg("Please select a Employee to generate the report.");
			return;
		}
		$("#before_report").hide();
		generateEmpReport(emp_id);
		$("#issue_report_div").hide();
		$("#employee_report_div").show();
	} else if($("#report_type").val()=='ISSUE'){
		var sap_id = $("#select_book").val();
		if(sap_id==""){
			alertMsg("Please select a Book Status to generate the report.");
			return;
		}
		$("#before_report").hide();
		generateIssueReport(sap_id);
		$("#issue_report_div").show();
		$("#employee_report_div").hide();
	} 
});

function generateEmpReport(sap_id){
	$.ajax({
		url : "getEmpReport?sap_id=" + sap_id ,
		type : "get",
		success : function(response) {
			$("#employee_report_title").html("Test Report for " + $("#select_employee option:selected").text());
			employee_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'short', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var to_date = new Date(response[0][i].to_date);
				var from_date = new Date(response[0][i].from_date);
				employee_report_table.row.add([i+1, response[0][i].book_id,
					response[0][i].book_name,from_date.toLocaleDateString("en-US", options),
					to_date.toLocaleDateString("en-US", options),response[0][i].due_amt, response[0][i].status]);
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


function generateIssueReport(sap_id,status){
	$.ajax({
		url : "getIssueReport?sap_id=" + sap_id+ "&status=" + status,
		type : "get",
		success : function(response) {
			$("#issue_report_title").html("Test Report for " + $("#select_book option:selected").text());
			issue_report_table.clear().draw(false);
			
			for(i=0; i<response[0].length; i++) {
				issue_report_table.row.add([i+1, response[0][i].book_id,
					response[0][i].book_name]);
			}
			issue_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons( issue_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Employee Report - " + $("#select_book option:selected").text(),
					title: "Test Report for " + $("#select_book option:selected").text(),
				}]
			});
			issue_report_table.buttons().container().appendTo($('#employee_report_export_buttons'));
			issue_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}
