/*this function is used for both college and student feedback for company*/	
function showFeed(internship_id,student_id,user){
	console.log(user)
		$("#txt_internshipid").val('');
		getStudFeedback(internship_id, student_id, function(data){
			if(data==''){
				console.log("sksksksksks")
				if(user=='1'){
					alert('Feedback not given yet.');
				}else{
					$("#feebackForCompModal").modal("show");
				}
			}else{
				$("#tdOpt1").html(getParamValue(data.parameter_1));
				$("#tdOpt2").html(getParamValue(data.parameter_2));
				$("#tdOpt3").html(getParamValue(data.parameter_3));
				$("#tdOpt4").html(getParamValue(data.parameter_4));
				$("#tdOpt5").html(getParamValue(data.parameter_5));
				$("#tdOpt6").html(getParamValue(data.parameter_6));
				$("#tdOpt7").html(getParamValue(data.parameter_7));
				if(data.parameter_8==1){
					$("#tdOpt8").html('YES');
				}else{
					$("#tdOpt8").html('NO');
				}
				$("#viewStudsFeedModal").modal("show");
			}
		});
		$("#txt_internshipid").val(internship_id);
	}
	function getParamValue(param){
		if(param==feed_param_very_good){
			return 'Very Good';
		}else if(param==feed_param_good){
			return 'Good';
		}else if(param==feed_param_fair){
			return 'Fair';
		}else if(param==feed_param_poor){
			return 'Poor';
		}else{
			return 'Very Poor';
		}
	}
	//feedback from college to company
	function feedbackAgainstCompany(company_id){
		console.log("hHshshshh")
	
		$.ajax({
			type : 'get',
			url : 'checkNoOfInternships?company_id='+company_id,
			success : function(response) {
				if(response=='true'){
					$("#txt_internshipid").val(company_id);
					$("#feebackForCompModal").modal("show");
				}else if(response=='false'){
					alert('At least ten completed internships needed to give feedback.');
				}else{
					//alert(response);
					var fd=JSON.parse(response);
					$("#tdOpt1").html(getParamValue(fd.param1));
					$("#tdOpt2").html(getParamValue(fd.param2));
					$("#tdOpt3").html(getParamValue(fd.param3));
					$("#tdOpt4").html(getParamValue(fd.param4));
					$("#tdOpt5").html(getParamValue(fd.param5));
					$("#tdOpt6").html(getParamValue(fd.param6));
					$("#tdOpt7").html(getParamValue(fd.param7));
					if(fd.param8==1){
						$("#tdOpt8").html('YES');
					}else{
						$("#tdOpt8").html('NO');
					}
					$("#viewStudsFeedModal").modal("show");
				}
			},
			error : function() {
				alert('error');
			}
		});
	}
	/*url present in StudentInternshipController and this function is used for both college and student feedback for company*/
	function submitFeedback(user){
		
		console.log(user+"sjsjsj")
		var req_url='';
		var internship_id=$("#txt_internshipid").val();
		var feeds=$("input[name='q1opt']:checked").val();
		for(var i=2;i<9;i++){
			var radioValue = $("input[name='q"+i+"opt']:checked").val();
			feeds=feeds+"-"+radioValue;
		}
		if(user=="0" || user=="10"){
			req_url='saveFeedbackAgainstCompany?internship_id=' + internship_id+"&feeds="+feeds;
		}else{
			console.log("company")
			req_url='feedbackFromCollToComp?company_id=' + internship_id+"&feeds="+feeds;
		}
		$.ajax({
			type : 'get',
			url : req_url,
			success : function(response) {
				alert(response);
			},
			error : function() {
				alert('error');
			}
		});
		$("#feebackForCompModal").modal("hide");
	}
	
	/*url present in StudentInternshipController and this function is used for both college and student feedback for company*/
	function getStudFeedback(internship_id,student_id,callback){
		$.ajax({
			type : 'get',
			url : 'getStudentsFeed?internship_id=' + internship_id+"&student_id="+student_id,
			success : function(response) {
				callback(response);
			},
			error : function() {
				alert('error');
			}
		});
	}
	
	function viewStudsFeedback(internship_id, student_id){
		getStudFeedback(internship_id, student_id, function(data){
			if(data==''){
				alert("Feedback Not given by student.");
			}else{
				$("#tdOpt1").html(getParamValue(data.parameter_1));
				$("#tdOpt2").html(getParamValue(data.parameter_2));
				$("#tdOpt3").html(getParamValue(data.parameter_3));
				$("#tdOpt4").html(getParamValue(data.parameter_4));
				$("#tdOpt5").html(getParamValue(data.parameter_5));
				$("#tdOpt6").html(getParamValue(data.parameter_6));
				$("#tdOpt7").html(getParamValue(data.parameter_7));
				if(data.parameter_8==1){
					$("#tdOpt8").html('YES');
				}else{
					$("#tdOpt8").html('NO');
				}
				$("#viewStudsFeedModal").modal("show");
			}
		});
	}
