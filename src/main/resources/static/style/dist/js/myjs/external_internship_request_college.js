

// get all interns group student
function studentId(studentIds){
	var stud_ids=studentIds.id;	
	$.ajax({
		type:"GET",
		url : "internsgroupIds?studentids="+stud_ids,
		success : function(response) {
			$("#s_data").empty();
			for (i = 0; i < response.length; i++) {
				var func="dispStudentData('"+response[i].student_id+"')";
				var row='<tr><td><span class="pointer actionSpan" data-toggle="modal" data-target="#studentDetailsModal" onclick="'+func+'">'+response[i].student_name+'</span></td></tr>';
				$("#s_data").append(row);
				/* + response[i].capacity
								+ "</td><td>"
								+ response[i].stipend
								+ "</td><td>"
								+ response[i].duration
								+ "</td></tr>"); */

			}
		},

		error : function() {
            alert('oops! Some error occured while checking data. Please try again after sometime.');
		}
	});
}

//for setting Comapny name by Its Ids
$(document).ready(function() {
	$(window).load(function() {

	});
});

//cancled request by college(Role 1)
function cancledReq(id){
	$.ajax({
		type : "GET",
		url : "cancledInternsRequest?request_id="+id,
		success : function(response) {
			if(response=='Sucess'){
				alert("Group Request cancled");
				location.reload();
			}

			return response;
		},
		error : function() {
            alert('oops! Some error occured while saving data. Please try again after sometime.');
		}
	});
}
//get duration
$('#selectbox1').change(function() {

});