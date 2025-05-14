<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>SkillPilots | Create Password</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.css">
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
.register-page-wrap .wizard-content .wizard>.content {
	min-height: 80px;
}

.fade:not(.show) {
	opacity: 1;
}
</style>
</head>

<body class="login-page">
	  <div class="login-header box-shadow">
      <div
        class="container-fluid d-flex justify-content-between align-items-center"
      >
        <div class="brand-logo" style="width: 12%">
          <a href="${pageContext.request.contextPath}/home">
            <img
              src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
              alt=""
            />
          </a>
        </div>
      </div>
    </div>
	<div class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/register-page-img.png" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="register-box bg-white box-shadow border-radius-10">
						<div class="wizard-content">
							<c:url var="addAction" value="/student_reg_step2"></c:url>
						 <form class="tab-wizard2 wizard-circle wizard" action="${pageContext.request.contextPath}/changepass"   id="myForm" modelAttribute="user"
						               method="post"  style="margin-bottom:0px;">			
					               <h5>Student Registration</h5>
								<section>
							<div class="form-wrap max-width-600 mx-auto">
							
							
										<div hidden  class="form-group row">
											<label class="col-sm-4 col-form-label">User Name</label>
											<div class="col-sm-8">
											<input type="email" name="email" value="${email}" >
												
											
										</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">Enter Password*</label>
											<div class="col-sm-8">
												<input type="password" id="pass" name="password" class="form-control"
												placeholder="Password" maxlength="255" required="true"  onkeyup="checkPasswordLength()">
												 <small id="passwordLengthMsg" class="form-text text-muted">You must enter 8 characters.</small>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">Confirm Password*</label>
											<div class="col-sm-8">
												<input type="password" name="cpass" oninput="checkPass()" id="cPass" class="form-control" placeholder="Enter Confirm Password" maxlength="255"
											required="true"/>
											</div>
										</div>
										
										<div class="alert alert-danger alert-dismissable fade in errorBox" id="errorBox2" style="display: none;">
										<a href="#" class="close" aria-label="close">&times;</a>
										<span id="errorText2"></span>
										                            <span id="errorText"></span>


									</div>
									</div>
								
							</form>
						</div>
					</div>
				</div>
				<c:if test="${not empty message}">
		<!-- <div class="register-box alert alert-success fade in" style="margin-top: 15%; text-align:center;">
			<span>${message}</span><br>
			<span><a href="/">Login</a></span>
		</div> -->
	</c:if>

			</div>
		</div>
	</div>
	<!-- success Popup html Start -->
	<!-- success Popup html End -->
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
		<script >   function checkPasswordLength() {
        var password = document.getElementById('pass').value;
        var remainingChars = 8 - password.length;
        var msg = document.getElementById('passwordLengthMsg');
        
        if (remainingChars > 0) {
            msg.textContent = "You must enter " + remainingChars + " more characters.";
            msg.style.color = "red"; 
        } else {
            msg.textContent = "Password length is sufficient.";
            msg.style.color = "green"; 
        }
    }</script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps1.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/steps-setting.js"></script>
	<script type="text/javascript">
$("#Submit").click(function (e) {
    e.preventDefault(); // Prevent the default form submission

    var password = $("#pass").val().trim();
    var confirmPassword = $("#cPass").val().trim();

    // Validation checks
    if (password === "" || confirmPassword === "") {
        $("#errorText2").text("Please enter both password and confirm password");
        $("#errorBox2").css("display", "block");
        return;
    }

    if (password !== confirmPassword) {
        $("#errorText2").text("Passwords do not match");
        $("#errorBox2").css("display", "block");
        return;
    }

    if (password.length < 8) {
        $("#errorText2").text("Password must be at least 8 characters.");
        $("#errorBox2").css("display", "block");
        return;
    }

    // Clear error message box if validation passes
    $("#errorBox2").css("display", "none");

    // Submit the form using AJAX
    $.ajax({
        url: $("#myForm").attr("action"), // Form action URL
        type: $("#myForm").attr("method"), // Form method (POST in your case)
        data: $("#myForm").serialize(), // Serialize form data
        success: function (response) {
     Swal.fire({
                title: 'Registration Successful!',
                text: 'Your registration has been completed successfully.',
                icon: 'success',
                confirmButtonText: 'OK',
                allowOutsideClick: false, // Disable clicking outside the alert
                timer: 3000, // Auto close the alert after 3 seconds
                timerProgressBar: true, // Show progress bar for the timer
                didClose: () => {
                    // Redirect to login page after the alert closes (or after 3 seconds if timer)
                    window.location.href = '${pageContext.request.contextPath}/login_check'; // Replace with your login page URL
                }
            });
        },
        error: function (xhr, status, error) {
            // Handle error
            console.error("Form submission failed: ", error);
            Swal.fire({
                title: 'Error!',
                text: 'There was a problem submitting the form. Please try again.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        }
    });
});

	
	
	</script>
<script>
                //  function validateForm() {
                //     var password = document.getElementById('pass').value;
                //     var confirmPassword = document.getElementById('cPass').value;
                    
                //     if (password.length < 8) {
                //         alert("Password must be at least 8 characters.");
                //         return false;
                //     }
                    
                //     if (password !== confirmPassword) {
                //         alert("Passwords do not match.");
                //         return false;
                //     }
                    
                //     return true;
                // }

             </script>
<script>
	function checkPass(){
		console.log("working");
		 var pass = $("#pass").val();
	var confirmPass = $("#cPass").val();
	if (pass !== "" && confirmPass !== "") {
		if (pass === confirmPass) {
			$("#errorText2").text("");
			$("#errorBox2").hide();
		} else {
			$("#errorText2").text(" Enter Passwords do not match!");
			$("#errorBox2").show();
		}
	}
}
$(".close").click(function() {
	$(".errorBox").hide();
});
	
	
</script>
<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

</html>