$(function() {
			$('.mydatepicker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
			$('.mydatepicker').keypress(function(event) {
				return ((event.keyCode || event.which) === 9 ? true : false);
			});
		})
		
		
		$(document).ready(function(){
		$('input').bind('copy paste cut', function(e) {
			e.preventDefault();
			alert('cut,copy & paste options are disabled !!');
		});
		});
		
		//to edit assessment test data
		function edit_assessment_Test_Data(test_id) {
			alert(test_id);
			$.ajax({
				type : "GET",
				url : "get_Assessment_Test_Data?id=" + test_id,
				dataType : 'json',
				success : function(response) {
					$("#assessment_test_form").hide();
					$("#test_id").val(response.test_id);
					$("#test_name").val(response.test_name);
					$("#total_mark").val(response.total_mark);
					$("#total_que").val(response.total_que);
					$("#time").val(response.time);
					$("#cut_off").val(response.cut_off);
					$("#mark_per_que").val(response.mark_per_que);
					var options = {year: 'numeric', month: '2-digit', day: '2-digit' };
					var from_date = new Date(response.from_date);
					var to_date = new Date(response.to_date);
					$("#from_date").val(from_date.toLocaleDateString("en-US", options));
					$("#to_date").val(to_date.toLocaleDateString("en-US", options));
					$("#test_submit").val("Update Test");
					$("#assessment_test_form").show();
					$('.content').animate({scrollTop: 0}, 1000);
				},
				error : function() {
					alert("Error Loading..!!!")

				}
			});
		}
		
		
		//manage status of test Inactive or Active
		function manage_Status(elem,test_id){
			var status = $(elem).is(':checked');
				$.ajax({
					type : "POST",
					url : "update_status_of_assessment_test?test_id="+test_id+"&status="+status,
					success : function(response) {
						alert(response);
						if(response.includes('Success')){
							$(elem).prop("checked",status);
							//enable/disable edit buttons
							if(status){
								$("#edit_btn_"+test_id).replaceWith('<input type="button" id="edit_btn_'+test_id+'" class='
									+'"btn btn-primary" value="Edit" disabled="disabled" title="An active test cannot be edited."/>');
								document.getElementById(test_id).onclick=function(){};
								$("#"+test_id).prop("title","An active test cannot be edited.");
							}
						}
						else
							$(elem).prop("checked",!status);
						
					},error : function() {
						alert("Error Loading..!!!")
			
					}
				});
				//$(elem).prop("checked",false);
		}

		//delete the test
		function delete_assessment_Test_Data(test_id){
			if ($("#"+test_id).is(":checked")) {
				alertMsg("Active test cannot be deleted.");
				return;
			}
			confirmDialog(function(confirm){
				if(confirm === 'Confirm') {
					$.ajax({
						url : "delete_assessment_Test_Data?test_id=" + test_id,
						type : "get",
						success : function(response) {
							$("#actions_"+test_id).text("Test Deleted");
						}, error : function(err) {
							alert(err);
						}
					});
				}
			},"Confirm Action","Are you sure you want to Delete the selected test?","Confirm","Cancel");
		}
