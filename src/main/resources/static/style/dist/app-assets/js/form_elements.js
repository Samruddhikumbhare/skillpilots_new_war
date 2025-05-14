if($(".mytable").length ){
$(document).ready(function() {
	$('.mytable').DataTable({
		"lengthMenu": [[5, 10, 20,30, -1], [5, 10, 20,30, "All"]],
	});
});
}

if($(".mydatepicker").length ){
$(function() {
	$('.mydatepicker').datepicker({
	autoclose: true,
	dateFormat : 'yyyy-mm-dd',
	todayHighlight: true
	}).val();
});
}

if($("#datepicker").length ){
$('#datepicker').datepicker({
	autoclose: true,
	format: 'yyyy-mm-dd',
	todayHighlight: true
	});
}

if($(".resp_data_table").length ){
	$('.resp_data_table').DataTable( {
		"lengthMenu": [[5, 10, 20,30, -1], [5, 10, 20,30, "All"]],
	    responsive: {
	        details: {
	            type: 'column',
	            target: 0
	        }
	    },
	    columnDefs: [ {
	        className: 'control',
	        orderable: false,
	        targets: 0
	    } ],
	    order: [ 1, 'asc' ]
	} );
}

function getDepts(dept_type, callback) {
	$.ajax({
		type : "get",
		url : "getDepartmentsByType?dept_type=" + dept_type,
		success : function(response) {
			callback(response);
		},
		error : function() {
			alert(error_fetch);
		}
	});
}