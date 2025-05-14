function viewDue(id){
	//alert(id);
	$.ajax({
		url : "getdue?issue_id=" + id,
		type : "get",
		success : function(response) {
			//var options = {year: 'numeric', month: 'numeric', day: '2-digit' };
			//$("#tdate").val(new Date(response.to_date).toLocaleDateString("en-GB", options));
			//$("#currdate").val(new Date().toDateString());
			//$("#dueday").val(todate.time-currdate.time);
			$("#issue_id").val(response.issue_id);
		}
	, error : function(err) {
			alert(err);
		}
	});
}

$(document).ready(function() {
	$('#mytable').DataTable({
		/*"lengthMenu" : [ [ 5, 10, 30, -1 ], [ 5, 10, 30, "All" ] ]*/
	});
});

$(function() {
	$('body').on('keydown', '#tdate', function(e) {
		console.log(this.value);
		if (e.which === 32 && e.target.selectionStart === 0) {
			return false;
		}
	});
});

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}  
