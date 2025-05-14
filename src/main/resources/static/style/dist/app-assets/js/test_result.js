var employee_test_result_table = $("#employee_test_result_table").DataTable({
									searching:false,
									paging:false,
									info:false,
									});

function viewTestResult(test_id,fromdate,todate){
	$.ajax({
		url : "getTestResult?test_id=" + test_id + "&fromdate=" + fromdate + "&todate=" + todate,
		type : "get",
		success : function(response) {
			$("#det_title").html(response[0].test_name);
			var total_marks = response[0].total_marks;
			var cut_off=response[0].cut_off;
			$("#result_duration").html(response[0].total_time);
			$("#result_scheduled_on").html(new Date(response[0].creation_date).toDateString());
			$("#result_total_marks").html(response[0].total_marks);
			$("#result_scheduled_from").html(new Date(response[0].schedule_from).toDateString());
			$("#result_cutoff").html(cut_off);
			$("#result_scheduled_to").html(new Date(response[0].schedule_to).toDateString());
			
			employee_test_result_table.clear().draw(false);
			for(i=0; i<response[1].length; i++) {
				var result = "";
				var curr_date = (new Date()).setHours(0,0,0,0);
				switch(response[1][i].status){
					case 'P' : 
						if((new Date(response[0].schedule_to)).getTime() >= curr_date)
							result="Pending";
						else
							result="Test Expired!";
						break;
					case 'A' : 
						if(new Date(response[1][i].updation_date).getTime() === curr_date)
							result="Active";
						else
							result="Test Incomplete!"
						break;
					case 'D' : result="Disqualified";break;
					case 'C' : 
						if(Number(response[1][i].marks_scored)>=cut_off)
							result="Passed";
						else
							result="Failed";
						break;
				}
				
				employee_test_result_table.row.add([i+1, response[1][i].sap_id, 
					response[1][i].first_name+" "+response[1][i].last_name,
					response[1][i].marks_scored,(Number(response[1][i].marks_scored)/total_marks*100).toFixed(2),
					result]);
			}
			employee_test_result_table.buttons().remove();
			var space_for_alignment="																												";
			new $.fn.dataTable.Buttons( employee_test_result_table, {
				buttons: [{
					extend:'excel',
					text: 'Download as Excel',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right'
				},
				{
					extend:'pdf',
					text: 'Download as PDF',
					className: 'btn mr-1 mb-1 btn-primary btn-sm pull-right',
					filename: $("#det_title").text()+" Results",
					title: $("#det_title").text()+" Results",
					messageTop: "Duration : "+$("#result_duration").html()
					+" Mins"+space_for_alignment+"Scheduled On : "+$("#result_scheduled_on").html()
					+"\nTotal Marks : "+$("#result_total_marks").html()
					+space_for_alignment+"	Scheduled From : "+$("#result_scheduled_from").html()
					+"\nCut-Off : "+$("#result_cutoff").html()
					+space_for_alignment+"								To : "+$("#result_scheduled_to").html()
				}]
			});
			employee_test_result_table.buttons().container().appendTo($('#export_buttons'));
			employee_test_result_table.draw(false);
		}, error : function(err) {
			alert(err);
		}
	});
}