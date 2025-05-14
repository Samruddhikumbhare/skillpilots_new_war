<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>SkillPilots | Student Registration</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/dist/css/terms_and_conditions_with_privacy_policy.css">
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
	<style type="text/css">
	.login-box {
		max-width: 400px;
	}
	.input-group {
    margin-bottom: 0px;
}
	</style>
	<style type="text/css">
	.form-group{
		width: 100%!important;
	}
	</style>
</head>
<body class="login-page">
	  <div class="login-header box-shadow">
      <div
        class="container-fluid d-flex justify-content-between align-items-center"
      >
        <div class="brand-logo" style="width: 12%">
          <a href="${pageContext.request.contextPath}/login_check">
            <img
              src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
              alt=""
            />
          </a>
        </div>
      </div>
    </div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/register-page-img.png" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Register With SkillPilots</h2>
						</div>
						<c:url var="addAction" value="/student_reg_step1"></c:url>
								<form action="student_reg_step1" method="post" id="my_form">
							<div class="input-group custom">
								<input type="email" name="email" id="mail_id" class="form-control form-control-lg"
								maxlength="255" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" autofocus=""
										required="required" onchange="checkExists(this);"
								 placeholder="Enter Email Id">
								<div class="input-group-append custom">
									
									<span class="input-group-text mb-20"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input id="contact" onchange="checkContactExists(this)" pattern="\d*" name="contact_no"
											onblur="checkContactExists(this)" class="form-control form-control-lg contact" 
											maxlength="12" minlength="10" required="true"
											placeholder="Enter Mobile Number">
								<div class="input-group-append custom">
									<span class="input-group-text" style="margin-bottom: 30px;"><i class="icon-copy dw dw-smartphone2"></i></span>
								</div><label id="contact_error" style="color: red;margin-left: 35px;font-size: 14px;"></label>
							</div>
							<div style="padding-top:0px; text-align:center">
										<label id="maillabel" style="color: red;margin-left:14px; font-size:14px;"></label>
										<br>

										<a href="https://www.skillpilots.com/termsCondition" style="margin-top:5px; display:none; font-size:14px;" id="resend_mail_btn">

										<a href="#" style="margin-top:5px; display:none; font-size:14px;" id="resend_mail_btn">

											Resend registration mail?</a>
										<span style="color:green; font-size:14px;">${linkAlreadySent}</span>
										<input type="hidden" name="resend"id="txt_resend_mail" value="no">
									</div>
									<div style="padding-top:0px; text-align:center">
									<!-- Add this button/link below your registration form -->
                                
   
									<div style="padding-top:10px;">
										<span style="margin-left: 3px;font-size:14px; vertical-align:bottom;" id="terms_conditions" 
											data-toggle="tooltip" data-placement="top" 
                          title="Please go through the T&C's and Privacy Policy and accept the same.">
											<input type="checkbox" id="term_conditions">


												I accept<a href="https://www.skillpilots.com/termsCondition"  style="vertical-align:  bottom;color: #1b00ff;" target="_blank">  *Terms and Conditions</a>

												and <a href="https://www.skillpilots.com/privacyPolicy"  style="vertical-align:  bottom;color: #1b00ff;" target="_blank"> *Privacy Policy</a>
										</span><br>
										<!-- >br><label id="privacy_policy_error" style="color: red;"></label-->
                                    </div><br>
							
							
							<div class="row">
							<div class="col-sm-3"></div>
								<div class="col-sm-6">
										<button class="btn btn-primary btn-sm btn-block btn-test" type="submit"
											value="Sign In" id="sbtn">Register Now</button>
								</div><div class="col-sm-3"></div>
							</div>
						</form>
					</div>
				</div>
<%-- 				<%@include file="terms_and_conditions_with_privacy_policy.jsp" %>
 --%>			</div>
		</div>
	</div>
	<div id="emailAlert" class="alert alert-warning alert-dismissible fade" role="alert" style="display: none;">
  <strong>Warning!</strong> Email already exists. Please use a different email address.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	<c:if test="${not empty message}">
		<div class="register-box alert alert-success fade in"
			style="margin-top: 15%;">
			<a href="/home" class="close">&times;</a>
			<span>${message}</span>
		</div>
	</c:if>
		<%@include file="scriptfiles.jsp"%>
	<!-- js -->
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
<!-- Include SweetAlert Library -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility.js"></script>
	
	<!-- Terms and Conditions Views as PDF -->
	<script  src="${pageContext.request.contextPath}/style/dist/pdfobject.min.js"></script>
<%-- <script  src="${pageContext.request.contextPath}/style/dist/js/myjs/terms_and_condition_with_privacy_policy.js"></script>
 --%>	<script type="text/javascript">
	$(function() {
		$('body').on('keydown', '#mail_id', function(e) {
			console.log(this.value);
			if (e.which === 32 && e.target.selectionStart === 0) {
				return false;
			}
		});
	});
	
		$(document).ready(function() {
			$(window).keydown(function(event) {
				if (event.keyCode == 13) {
					event.preventDefault();
					return false;
				}
			});
		});

		$("#resend_mail_btn").click(function(){
			$("#txt_resend_mail").val("yes");
			var email = $.trim($('#mail_id').val());
			 if (email == '') {
				 alert("Please enter email address.");
			 }else{
				 $("#my_form").submit();
			 }
		});
		
		$("#mail_id").keyup(function(event) {
		    if (event.keyCode === 13) {
		        $("#sbtn").click();
		    }
		});


	

	</script>

	
</body>
</html>