var count=0;
function viewTests(request_id,status){
	$("#testAgainstReq").val(request_id);
	$("#testTableModal").modal("show");

	if(status == 'T'){
		$.ajax({
			type : "GET",
			url : "getAssignedTestName?request_id=" + request_id,
			success : function(response) {
				$("#student_test_id").val(response[0]);
				$("#testCheked_"+response[0]).prop('checked', true);
			},
			error : function() {
				alert('not assigned');
			}
		});
		document.getElementById("footer1").style.display = "block";
		$("#setTestBtn").html('Update Test');
		document.getElementById("footer2").style.display = "none";
		count=0;
	}
	else if(status == 'exp_external' || status == 'exp_student'){
		$("input[name='testRadio']").prop('checked', false);
		//onclick="setRejection_id('RakeshHI');"
		if(status == 'exp_student'){
			document.getElementById("student_group_reject").style.display = "none";
			document.getElementById("reject_btn1").name=request_id;
			document.getElementById("student_reject").style.display = "block";
		}else{
			document.getElementById("student_reject").style.display = "none";
			document.getElementById("reject_btn2").name=request_id;
			document.getElementById("student_group_reject").style.display = "block";
		}
		document.getElementById("footer1").style.display = "none";
		$("#setTestBtn").html('Reassigned Test');
		document.getElementById("footer2").style.display = "block";
		if(count == 0){
		count++;
		}
	}
	else{
		$("input[name='testRadio']").prop('checked', false);
		document.getElementById("footer1").style.display = "block";
		$("#setTestBtn").html('Set Test');
		document.getElementById("footer2").style.display = "none";
		count=0;
	}
}




function assignTest() {
    if ($("input[name='testRadio']:checked").length) {
        $("#setTestBtn").prop('disabled', true);
        $("body").css("cursor", "wait"); // Set cursor to loading

        // Force UI to update before executing AJAX call
        requestAnimationFrame(() => {
            setTimeout(() => {
                var testId = $("input[name='testRadio']:checked").val();
                var requestId = $("#testAgainstReq").val();
                var data = { 'request_id': requestId, 'test_id': testId };

                $.ajax({
                    url: "assignTest",
                    type: 'POST',
                    data: data,
                    success: function(status) {
                        Swal.fire({
                            title: "Success!",
                            text: "Test assigned successfully!",
                            icon: "success",
                            confirmButtonText: "OK"
                        }).then((result) => {
                            if (result.isConfirmed) {
                                location.reload(); // Reload the page on OK click
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire({
                            title: "Error!",
                            text: "An error occurred while assigning the test.",
                            icon: "error",
                            confirmButtonText: "OK"
                        });
                        console.error("Error assigning test:", error);
                    },
                    complete: function() {
                        $("body").css("cursor", "default"); // Reset cursor to default
                        $("#setTestBtn").prop('disabled', false);
                    }
                });
            }, 0); // Small delay to let UI repaint
        });
    } else {
        Swal.fire({
            title: "Error!",
            text: "Please select a test.",
            icon: "error",
            confirmButtonText: "OK"
        });
    }
}



function viewTests1(request_id,status){
	$("#testAgainstReq").val(request_id);
	$("#testTableModal1").modal("show");
console.log("jdjdjdj"+status)
	if(status == 'T'){
		$.ajax({
			type : "GET",
			url : "getAssignedTestName?request_id=" + request_id,
			success : function(response) {
				$("#student_test_id").val(response[0]);
				$("#testCheked_"+response[0]).prop('checked', true);
			},
			error : function() {
				alert('not assigned');
			}
		});
		document.getElementById("footer1").style.display = "block";
		$("#setTestBtn").html('Update Test');
		document.getElementById("footer2").style.display = "none";
		count=0;
	}
	else if(status == 'exp_external' || status == 'exp_student'){
		$("input[name='testRadio']").prop('checked', false);
		//onclick="setRejection_id('RakeshHI');"
		if(status == 'exp_student'){
			document.getElementById("student_group_reject").style.display = "none";
			document.getElementById("reject_btn1").name=request_id;
			document.getElementById("student_reject").style.display = "block";
		}else{
			document.getElementById("student_reject").style.display = "none";
			document.getElementById("reject_btn2").name=request_id;
			document.getElementById("student_group_reject").style.display = "block";
		}
		document.getElementById("footer1").style.display = "none";
		$("#setTestBtn").html('Reassigned Test');
		document.getElementById("footer2").style.display = "block";
		if(count == 0){
		count++;
		}
	}
	else{
		$("input[name='testRadio']").prop('checked', false);
		document.getElementById("footer1").style.display = "block";
		$("#setTestBtn").html('Set Test');
		document.getElementById("footer2").style.display = "none";
		count=0;
	}
}


// for external
function assignTest1(){
	if($("input[name='testRadio']:checked").length){
		$("#setTestBtn").prop('disabled','disabled');
		var testId=$("input[name='testRadio']:checked").val();
		var requestId=$("#testAgainstReq").val();
		var data={'request_id':requestId,'test_id':testId};
		var type="ext";
		console.log(type)
		$.ajax({
			url:"assignTest",
			type:'POST',
			data:{'request_id':requestId,'test_id':testId,'type':type},
			success:function(status){
				swal("Success!", "Test Assigned Successful!", "success");
		        	location.reload();
		        }
		});
	}else{
		alert("Error!", "Please select a test.", "error");
		alert("");
	}
}


function view_testresult(test_data_id, stud_id, user_role) {
    console.log(user_role);
    $("#testResultModal1").modal("show");
    $("#divLoading").show();
    $("#announcement").text("");
    if (user_role == "1" || user_role=="2") {
        $("#approveReqBtn").click(function () {
            approved(test_data_id);
        });
        $("#approveReqBtn").show();
        $("#rejectReqBtn").click(function () {
            setRejection_id(test_data_id);
        });
        $("#rejectReqBtn").show();
    } else {
        $("#approveReqBtn").hide();
        $("#rejectReqBtn").hide();
    }

	$.ajax({
		url : 'getTestResult',
		type : 'get',
		data:{'test_data_id':test_data_id,'student_id':stud_id},
		success : function(response) {
			var today=new Date();
			
			if(response==null || response==''){
				$("#announcement").text("Student Disqualified.");
				$("#resultDetailsDiv").hide();
			}else if(response.status==student_test_data_status_pending){
				var expdate=new Date(response.exp_date);
				//alert(expdate+"   "+today);
				if(expdate==null || expdate=='' || expdate>=today){
					$("#announcement").text("Student's Test is still pending.");
					$("#resultDetailsDiv").hide();
				}else{
					$("#announcement").text("Student's Test request is expired.");
					$("#resultDetailsDiv").hide();
				}
				
			}else{
			$("#spanTotalMarks").text(response.totalMarks);
			$("#spanOutOf").text(response.outof);
			$("#spanCA").text(response.correctAns);
			$("#spanWA").text(response.wrongAns);
			$("#spanNA").text(response.noAns);
			$("#spanResult").text(response.testResult);
			$("#resultDetailsDiv").show();
			}
			$("#divLoading").hide();
		},
		error : function(err) {
			console.log(err);
		}
	});
}

function viewResultsOfStud(studentids,reqid){
	$("#hdnERID").val(reqid);
	$.ajax({
		type:"GET",
		url : "internsgroupIds?studentids="+studentids,
		success : function(response) {
			// alert(response);
			$("#stTableBody").empty();
			for (i = 0; i < response.length; i++) {
				var func="view_testresult('"+reqid+"','"+response[i].student_id+"')";
				var row='<tr><td><input type="checkbox" name="chkStdId" value="'+response[i].student_id+'"></td><td><span>'+response[i].student_name+'</span></td><td><span class="label label-success pointer" onclick="'+func+'">View Result<span></td></tr>';
				$("#stTableBody").append(row);
			}
			$("#resultsOfStudentsModel").modal("show");
		},

		error : function() {
			alert('oops! Some error occured while checking data. Please try again after sometime.');
		}
	});
}

function reassignedTest(){
	if($("input[name='testRadio']:checked").length){
		$("#setTestBtn").prop('disabled','disabled');
		var testId=$("input[name='testRadio']:checked").val();
		var requestId=$("#testAgainstReq").val();
		var data={'request_id':requestId,'test_id':testId};
		$.ajax({
			url:"reassignedTest",
			type:'POST',
			data:{'request_id':requestId,'test_id':testId},
			success:function(status){
					swal(status);
		        	location.reload();
		        }
		});
	}else{
		alert("Please select a test.");
	}
}
function approved(request_id) {
    // Open the modal for offer letter upload
    $('#uploadPdfModal').modal('show');

    // Handle form submission
    $('#uploadPdfForm').off('submit').on('submit', function(e) {
      e.preventDefault(); // Prevent default form submission

      // Show SweetAlert loader
      swal({
        title: 'Processing...',
        text: 'Please wait while the approval is being processed.',
        icon: 'info',
        buttons: false,
        closeOnClickOutside: false,
        closeOnEsc: false,
        content: {
          element: "div",
          attributes: {
            innerHTML: `<div class="swal-loader"><i class="fa fa-spinner fa-spin"></i> Loading...</div>`
          }
        }
      });

      var formData = new FormData(this);
      formData.append('request_id', request_id);

      // Make API call to upload offer letter and process approval
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/api/approve-student", // Update this URL based on your endpoint
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
          swal.close(); // Close SweetAlert
          swal('Success', 'Student approved successfully.', 'success')
            .then(() => location.reload()); // Reload page on confirmation
        },
        error: function() {
          swal.close(); // Close SweetAlert
          swal('Error', 'Failed to approve student.', 'error');
        }
      });
    });
  }






