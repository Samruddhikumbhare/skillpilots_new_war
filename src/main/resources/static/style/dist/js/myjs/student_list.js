$('#app_btn').attr("disabled", true);
$('#rej_btn').attr("disabled", true);
var student_id=null;
function enable_disable(obj){
	$('#app_btn').attr("disabled", false);
	$('#rej_btn').attr("disabled", false);
	student_id=obj.id;
}

function approve(){
	//alert(student_id);
	$.ajax({
		type:"GET",
		url:"stud_a_r?student_id="+student_id+"&click_type=approve",
		success : function(response) {
			location.reload();
		},
		error: function() {
            alert('Error occured');
        }
		
	});
}
//set id on model
function rejectReqId(req_id){
    $('#rejection_id').val(student_id);
	}

//Rejct internal Req by Company USer
function sendRejection(){
	var reject_msg=$("#rejection_msg").val();
	var stud_id=$("#rejection_id").val();
	 $.ajax({
			type : "GET",
			url : "studentrejection?student_id="+stud_id+"&reject_msg="+reject_msg+"&click_type=reject",
			success : function(response) {
				location.reload();
			return response;
		},
			error : function() {
				alert('error');
			}
		});
}

/*function loadfun(){
	;
}*/
$(document).ready(function () {
	 $.ajax({
			type : "GET",
			url : "getAllstudent",
			success : function(response) {
				for(var i=0;i<response.length;i++){
					if(response[i].user_text!=null){
						$("#row"+response[i].user_id).css({"background-color":"#e60a1494"});
					}
				}
			return response;
		},
			error : function() {
				alert(error_fetch);
			}
		});
});


$(document).ready( function () {
    $('#student_req').DataTable();
    $('#student_approved_list').DataTable();
    
    $(".dept_id").each(function(){
		
		var dept_id=this.id;
		 $.ajax({
			type : "GET",
			url : "getDepartmentDetails?dept_id="+dept_id,
			success : function(response) {
				$(".dept_id"+dept_id).html(response.dept_name);
			return response;
		},
			error : function() {
				alert(error_fetch);
			}
		}); 
	});
} );
