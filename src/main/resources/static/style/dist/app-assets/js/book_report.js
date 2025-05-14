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

var ret_report_table = $("#ret_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var paid_report_table = $("#paid_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var lost_report_table = $("#lost_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var purchase_report_table = $("#purchase_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});

var count_report_table = $("#count_report_table").DataTable({
	searching:false,
	paging:false,
	info:false,
});


$("#report_type").change(function(){
	if($(this).val()=='I') {
		$("#status_div").show();
		$("#employee_div").hide();
		$("#book_purchase_div").hide();
		//$("#btn_div").hide();
		$("#book_purchase_div").show();
	} else if($(this).val()=='E') {
		$("#employee_div").show();
		$("#status_div").hide();
		$("#book_purchase_div").hide();
		//$("#btn_div").hide();
	} else if($(this).val()=='BP') {
		$("#book_purchase_div").show();
		$("#status_div").hide();
		$("#employee_div").hide();
		//$("#btn_div").hide();
	}else if($(this).val()=='NB') {
		$("#book_purchase_div").show();
		$("#status_div").hide();
		$("#employee_div").hide();
		//$("#btn_div").hide();
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
		$("#employee_report_div").show();
		$("#paid_report_div").hide();
		$("#issue_report_div").hide();
		$("#purchase_report_div").hide();
		$("#lost_report_div").hide();
		$("#ret_report_div").hide();
		$("#count_report_div").hide();
	} else if($("#report_type").val()=='BP'){
		var fdate = $("#txt_fromdt").val();
		var tdate = $("#txt_todt").val();
		if(fdate=="" && tdate==""){
			alertMsg("Please select a Date to generate the report.");
			return;
		}
		$("#before_report").hide();
		generatePReport(fdate,tdate);
		$("#purchase_report_div").show();
		$("#employee_report_div").hide();
		$("#paid_report_div").hide();
		$("#issue_report_div").hide();
		$("#lost_report_div").hide();
		$("#ret_report_div").hide();
		$("#count_report_div").hide();
	}else if($("#report_type").val()=='NB'){
		var fdate = $("#txt_fromdt").val();
		var tdate = $("#txt_todt").val();
		if($("#report_type").val()==""){
			alertMsg("Please select Type generate the report.");
			return;
		}
		$("#before_report").hide();
		generateBookReport(fdate,tdate);
		$("#count_report_div").show();
		$("#employee_report_div").hide();
		$("#purchase_report_div").hide();
		$("#paid_report_div").hide();
		$("#issue_report_div").hide();
		$("#lost_report_div").hide();
		$("#ret_report_div").hide();
		$("#btn_div").show();
	}else if($("#report_type").val()=='I'){
		var status = $("#select_status").val();
		if(status=="ISSUE"){
		var fromdate = $("#txt_fromdt").val();
		var todate = $("#txt_todt").val();
		/*if(status=="" && fromdate=="" || todate==""){
			alertMsg("Please select Status to generate the report.");
			return;
		}if(fromdate=="" || todate==""){
			alertMsg("Please select Date to generate the report.");
			return;
		}*/
		$("#before_report").hide();
		generateIssueReport(status,fromdate,todate);
		$("#issue_report_div").show();
		$("#lost_report_div").hide();
		$("#purchase_report_div").hide();
		$("#paid_report_div").hide();
		$("#ret_report_div").hide();
		$("#employee_report_div").hide();
		$("#count_report_div").hide();
		
		}else if(status=="RET"){
			var fromdate = $("#txt_fromdt").val();
			var todate = $("#txt_todt").val();
			/*if(status==""){
				alertMsg("Please select Status to generate the report.");
				return;
			}if(fromdate=="" || todate==""){
				alertMsg("Please select Date to generate the report.");
				return;
			}*/
			$("#before_report").hide();
			generateRetReport(status,fromdate,todate);
			$("#ret_report_div").show();
			$("#purchase_report_div").hide();
			$("#issue_report_div").hide();
			$("#paid_report_div").hide();
			$("#employee_report_div").hide();
			$("#lost_report_div").hide();
			$("#count_report_div").hide();
		}else if(status=="PAID"){
			var fromdate = $("#txt_fromdt").val();
			var todate = $("#txt_todt").val();
			/*if(status==""){
				alertMsg("Please select Status to generate the report.");
				return;
			}if(fromdate=="" || todate==""){
				alertMsg("Please select Date to generate the report.");
				return;
			}*/
			$("#before_report").hide();
			generatePaidReport(status,fromdate,todate);
			$("#paid_report_div").show();
			$("#purchase_report_div").hide();
			$("#issue_report_div").hide();
			$("#ret_report_div").hide();
			$("#count_report_div").hide();
			$("#employee_report_div").hide();
			$("#lost_report_div").hide();
		}if(status=="LOST"){
			var fromdate = $("#txt_fromdt").val();
			var todate = $("#txt_todt").val();
			/*if(status==""){
				alertMsg("Please select Status to generate the report.");
				return;
			}if(fromdate=="" || todate==""){
				alertMsg("Please select Date to generate the report.");
				return;
			}*/
			$("#before_report").hide();
			generateLostReport(status,fromdate,todate);
			$("#lost_report_div").show();
			$("#issue_report_div").hide();
			$("#purchase_report_div").hide();
			$("#paid_report_div").hide();
			$("#ret_report_div").hide();
			$("#employee_report_div").hide();
			$("#count_report_div").hide();
			}
	}
});

function generateEmpReport(sap_id){
	$.ajax({
		url : "getEmpReport?sap_id=" + sap_id,
		type : "get",
		success : function(response) {
			$("#employee_report_title").html("Report for " + $("#select_employee option:selected").text());
			employee_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'short', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var to_date = new Date(response[0][i].to_date);
				var from_date = new Date(response[0][i].from_date);
				employee_report_table.row.add([i+1,
					response[0][i].book_id,
					response[0][i].book_name,
					from_date.toLocaleDateString("en-US", options),
					to_date.toLocaleDateString("en-US", options),
					response[0][i].due_amt, 
					response[0][i].status]);
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

function generateIssueReport(status,fromdate,todate){
	$.ajax({
		url : "getIssueReports?status=" + status+"&fromdate="+fromdate+"&todate="+todate,
		type : "get",
		success : function(response) {
			$("#issue_report_title").html("Report for " + $("#select_status option:selected").text());
			issue_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var from_date = new Date(response[0][i].from_date);
				var to_date = new Date(response[0][i].to_date);
				issue_report_table.row.add([i+1,
					response[0][i].book_id,
					response[0][i].sap_id,
					response[0][i].book_name,
					from_date.toLocaleDateString("en-US", options),
					to_date.toLocaleDateString("en-US", options),
					response[0][i].status]);
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
					filename: "Book Report - " + $("#select_status option:selected").text(),
					title: "Report for " + $("#select_status option:selected").text(),
				}]
			});
			issue_report_table.buttons().container().appendTo($('#issue_report_export_buttons'));
			issue_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateRetReport(status,fromdate,todate){
	$.ajax({
		url : "getIssueReports?status=" + status+"&fromdate="+fromdate+"&todate="+todate,
		type : "get",
		success : function(response) {
			$("#ret_report_title").html("Book Report for " + $("#select_status option:selected").text());
			ret_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				
				var from_date = new Date(response[0][i].from_date);
				var to_date = new Date(response[0][i].to_date);
				
				ret_report_table.row.add([i+1,
					response[0][i].book_id,
					response[0][i].sap_id,
					response[0][i].book_name,
					from_date.toLocaleDateString("en-US", options),
					to_date.toLocaleDateString("en-US", options),
					response[0][i].status]);
			}
			ret_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons( ret_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Book Report - " + $("#select_status option:selected").text(),
					title: "Report for " + $("#select_status option:selected").text(),
				}]
			});
			ret_report_table.buttons().container().appendTo($('#ret_report_export_buttons'));
			ret_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generatePaidReport(status,fromdate,todate){
	$.ajax({
		url : "getIssueReports?status=" + status+"&fromdate="+fromdate+"&todate="+todate,
		type : "get",
		success : function(response) {
			$("#paid_report_title").html("Book Report for " + $("#select_status option:selected").text());
			paid_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var from_date = new Date(response[0][i].from_date);
				var to_date = new Date(response[0][i].to_date);
				var pay_date = new Date(response[0][i].pay_due_date);
				paid_report_table.row.add([i+1,
					response[0][i].book_id,
					response[0][i].sap_id,
					response[0][i].book_name,
					from_date.toLocaleDateString("en-US", options),
					to_date.toLocaleDateString("en-US", options),
					response[0][i].status,
					response[0][i].due_amt,
					pay_date.toLocaleDateString("en-US", options)]);
			}
			paid_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(paid_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Book Report - " + $("#select_status option:selected").text(),
					title: "Report for " + $("#select_status option:selected").text(),
				}]
			});
			paid_report_table.buttons().container().appendTo($('#paid_report_export_buttons'));
			paid_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateLostReport(status,fromdate,todate){
	$.ajax({
		url : "getLostReport?status=" + status+"&fromdate="+fromdate+"&todate="+todate,
		type : "get",
		success : function(response) {
			$("#lost_report_title").html("Report for " + $("#select_status option:selected").text());
			lost_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var lost = new Date(response[0][i].creation_date);
				lost_report_table.row.add([i+1, 
					response[0][i].book_id,
					response[0][i].sap_id,
					response[0][i].book_name,
					response[0][i].author,
					response[0][i].publication,
					response[0][i].remark,
					lost.toLocaleDateString("en-US", options),
					response[0][i].status,
					response[0][i].due_amt]);
			}
			lost_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(lost_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Book Report - " + $("#select_status option:selected").text(),
					title: "Report for " + $("#select_status option:selected").text(),
				}]
			});
			lost_report_table.buttons().container().appendTo($('#lost_report_export_buttons'));
			lost_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generatePReport(fdate,tdate){
	$.ajax({
		url : "getPurReport?fdate=" +fdate+"&tdate="+tdate,
		type : "get",
		success : function(response) {
	
			$("#purchase_report_title").html("Report For Book Purchase");
			purchase_report_table.clear().draw(false);
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var to_date = new Date(response[0][i].to_date);
				var from_date = new Date(response[0][i].date_of_receipt);
				purchase_report_table.row.add([i+1,
					response[0][i].book_id,
					response[0][i].book_name,
					from_date.toLocaleDateString("en-US", options)]);
			}
			purchase_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(purchase_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Report For Book Purchase",
					title: "Report For Book Purchase",
				}]
			});
			purchase_report_table.buttons().container().appendTo($('#purchase_report_export_buttons'));
			purchase_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}

function generateBookReport(fdate,tdate){
	$.ajax({
		url : "getBookReport?fdate=" +fdate+"&tdate="+tdate,
		type : "get",
		success : function(response) {
			//alert(response);
			$("#count_report_title").html("Report For Count Wise");
			count_report_table.clear().draw(false);
			
			/*for(var i=0;i<response.length;i++){
				var row='<tr>'+
				'<td>'+i+'</td>'+
				'<td><center>'+response[i][0]+'<center></td>'+
				'<td>'+response[i][1]+'</td>'+
				'<td>'+response[i][2]+'</td>'+
				'<td>'+response[i][3]+'</td>'+
				'<td>'+response[i][4]+'</td>'
			;
				$("#count_report_table").append(row);
			}*/
			/*$("#count_report_title").html("Report For Book Count");
			purchase_report_table.clear().draw(false);*/
			var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			for(i=0; i<response[0].length; i++) {
				var from_date = new Date(response[0][i].from_date);
				var ret_date = new Date(response[0][i].ret_date);
				var new_date = ret_date.toLocaleDateString("en-US", options);
				//alert(ret_date.toLocaleDateString("en-US", options));
				if(new_date=="1/01/1970"){
					new_date=null;
					count_report_table.row.add([i+1, '<center>'+response[0][i].count+'</center>',
						response[0][i].book_id,
						response[0][i].book_name,
						response[0][i].sap_id,
						from_date.toLocaleDateString("en-US", options),
						new_date]);
				}else{
					count_report_table.row.add([i+1, '<center>'+response[0][i].count+'</center>',
						response[0][i].book_id,
						response[0][i].book_name,
						response[0][i].sap_id,
						from_date.toLocaleDateString("en-US", options),
						new_date]);
				}
			}
			count_report_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons(count_report_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: "Report For Book Count",
					title: "Report For Book Count",
				}]
			});
			count_report_table.buttons().container().appendTo($('#count_report_export_buttons'));
			count_report_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}