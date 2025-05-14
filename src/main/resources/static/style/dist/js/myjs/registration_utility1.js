//duplicate email-id,company-college name validation. user should not enter email-id and comp-coll name which is already used.
function checkExists(elem){
	$("#Submit").prop('disabled', true);
	var v=elem.id;
	var input_val=$("#"+v).val();
	var labelId="none";
	var lblmsg="none";
	var hitURL="none";

	if(v=='comp_name') {
		input_val=$("#comp_name").val();
		hitURL="compname_exists?company_name="+input_val;
		labelId="#namelabel";
		lblmsg=company_exist;
	}

	if(v=='mail_id') {
		input_val=$("#mail_id").val();
		hitURL="email_exists?email_id="+input_val;
		labelId="#maillabel";
		lblmsg=email_exist;
		forceLower(elem);
	}

	if(v=='mail_id2') {
		input_val=$("#mail_id2").val();
		hitURL="email_exists?email_id="+input_val;
		labelId="#maillabel2";
		lblmsg=email_exist;
		forceLower(elem);
	}

	$.ajax({
		type:"GET",
		url : hitURL,
		success : function(response) {
			if(response=="exists") {
				$(labelId).text(lblmsg);
				$("#Submit").prop('disabled', true);
				$("#resend_mail_btn").hide();
			}else if(response==user_initials_student)	{
				$(labelId).text(lblmsg);
				$("#Submit").prop('disabled', true);
				$("#resend_mail_btn").show();
			}else{
				$("#resend_mail_btn").hide();
				$(labelId).text("");
				if($('#term_conditions').val() != undefined)
					$('#Submit').prop('disabled', !$('#term_conditions:checked').length);
				else
					$('#Submit').prop('disabled', false);
			}
		},
		error: function() {
			alert(error_fetch);
		}
	});
}

function forceLower(strInput) 
{
	strInput.value=strInput.value.toLowerCase();
}

$(".contact").keypress(function (e) {
	//if the letter is not digit then display error and don't type anything
	if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		/* display error message */
		$("#"+this.id+"_error").html("Number Only").show().fadeOut("slow");
		return false;
	}else
		$("#"+this.id+"_error").html('');
});

//duplicate contact no. validation. user should not enter contact which is already used.
function checkContactExists(elem){
	var id=elem.id;
	var input_val=$("#"+id).val();
	if(input_val.length > 9){
		$.ajax({
			type:'get',
			url:'contact_exists?contact='+input_val,
			success:function(response){
				if(response=="exist")
				{
					$("#"+id+"_error").text("Contact no. already exists.");
					$("#Submit").prop('disabled', true);
				}else{
					$("#"+id+"_error").text("");
					$("#Submit").prop('disabled', false);
				}
			},
			error:function(error){
				console.log(error);
			}
		});
	}
}

//check if user entered same email of company/college and hr/iiicell
$(function(){
	if($("#Submit").length){
		$("#Submit").hover(function(){
			var clg_name =$("#college_name").val();
			var email1=$("#mail_id").val();
			var email2=$("#mail_id2").val();
			var contact=$("#contact").val();
			var contact2=$("#contact2").val();
			var hrcontact=$("#contact3").val();
			if(email1==email2 && email2 != undefined && email2 != ''){
				$("#maillabel2").text("Should not be same as institute's email id.");
				$("#Submit").prop('disabled', true);
			}else if((hrcontact==contact || hrcontact==contact2) && hrcontact != undefined && hrcontact != ''){
				$("#contact3_error").text("Should not be same as institute's contact.");
				$("#Submit").prop('disabled', true);
			}
		});
	}
});



//image size validation. user should not select image more than 5000kb.
$(function () {
	$("#upload-photo").change(function () {
		if (typeof ($("#upload-photo")[0].files) != "undefined") {
			var size = parseFloat($("#upload-photo")[0].files[0].size / 1024).toFixed(2);
			if(size>5000){
				var msg="Too large Image. Image should not be greater than 5000kb.";
				alert(msg);
				$(this).val(null);
			}else{
				readURL(this);
			}
		} else {
			alert("This browser does not support HTML5.");
		}
	});
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			if($("#img-viewer").length ){
				$('#img-viewer')
				.attr('src', e.target.result);
			}
		};
		reader.readAsDataURL(input.files[0]);
	}
}

//cancel email-editing while update profile
if($("#email-edit-cancel").length ){
	$("#email-edit-cancel").click(function(){
		$("#maillabel").text("");$("#Submit").prop('disabled', false);
		$("#mail_id").val($("#existing_emailid").val());
	});
}

if($("#contact-edit-cancel").length ){
	$("#contact-edit-cancel").click(function(){
		$("#contact_error").text("");$("#Submit").prop('disabled', false);
		$("#contact").val($("#existing_contact").val());
	});
}

if($("#contact-edit-cancel2").length ){
	$("#contact-edit-cancel2").click(function(){
		$("#contact2_error").text("");$("#Submit").prop('disabled', false);
		$("#contact2").val($("#existing_contact2").val());
	});
}

function checkContact(contact_no,callabck){
	$.ajax({
		type:'get',
		url:'contact_exists?contact='+contact_no,
		async: false,
		success:function(response){
			callabck(response);
		},
		error:function(error){
			console.log(error);
		}
	});
}

function checkEmail(email_id,callabck){
	$.ajax({
		type:'get',
		url:'email_exists?email_id='+email_id,
		async: false,
		success:function(response){
			callabck(response);
		},
		error:function(error){
			console.log(error);
		}
	});
}

function checkCompanyName(company_name,callabck){
	$.ajax({
		type:'get',
		url:'compname_exists?company_name='+company_name,
		success:function(response){
			callabck(response);
		},
		error:function(error){
			console.log(error);
		}
	});
}

$("#my_form").submit(function(e) {
	if(validate()){
		return true;
	}else{
		return false;
	}
});

function validate(){
	var email,email2,contact,contact2,contact3,status=true;
	if($('#term_conditions').length && !$('#term_conditions').is(":checked")){
		//$("#privacy_policy_error").text("Please accept the terms & conditions.");
		$("#terms_conditions").tooltip("show");
		return false;
	}if($("#mail_id").length){
		email=$("#mail_id").val();
		checkEmail(email, function(response){
			if(response=="exists"){
				$("#maillabel").text("Email-id already exists.");
				status= false;
			}
		});
		if(!status){
			return false;
		}
	}
	if($("#mail_id2").length){
		email=$("#mail_id2").val();
		checkEmail(email, function(response){
			if(response=="exists"){
				$("#maillabel2").text("Email-id already exists.");
				status= false;
			}
		});
		if(!status){
			return false;
		}
	}
	if($("#mail_id").length && $("#mail_id2").length){
		email=$("#mail_id").val();
		email2=$("#mail_id2").val();
		if(email==email2){
			$("#maillabel2").text("Should not be same as institute's email id.");
			return false;
		}
	}
	if($(".contact").length){
		$(".contact").each(function() {
			id = this.id;
			contact=$(this).val();
			checkContact(contact, function(response){
				if(response=="exist"){
					$("#"+id+"_error").text("Contact no. already exists.");
					
					status=false;
				}
			});
			if(!status){
				return false;
			}
		});
	}
	//return false;
	if($("#contact").length && $("#contact3").length){
		contact=$("#contact").val();contact2=$("#contact2").val();contact3=$("#contact3").val();
		if((contact3==contact || contact3==contact2) && contact3 != ''){
			$("#contact3_error").text("Should not be same as institute's contact.");
			return false;
		}
	}
	if($("#street_number").length){
		if($("#street_number").val()== ''){
			return false;
		}
	}
	if($("#postal_code").length){
		if($("#postal_code").val()== ''){
			return false;
		}
	}
	$("#Submit").prop('disabled', true);
	return true;
}