<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Change Password</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
<link rel="icon" type="image/png" sizes="16x16" href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css'>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css'>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css'>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css'>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css'>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
<style type="text/css">
.sidebar-menu .dropdown-toggle {
		padding: 15px 12px 15px 54px!important;
		font-size: 15px!important;
	}
.user-notification .dropdown-toggle .badge {
    position: absolute;
    right: 5px;
    top: 7px;
   /*  background: #0f2c7eeb; */
    width: 5px;
    height: 5px;
    display: block;
    padding: 0;
}
.notification-list ul li a {
    display: block;
    position: relative;
    padding: 0px 15px 1px 7px!important;
    min-height: 75px;
    color: #666;
    font-size: 13px;
    font-weight: 500;
    font-family: 'Inter', sans-serif;
    border-radius: 1px;
}
</style>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg' alt="">
			</div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">Loading...</div>
		</div>
	</div>

	<%@include file="header.jsp"%>

	<div class="right-sidebar">
		<div class="sidebar-title">
			<h3 class="weight-600 font-16 text-blue">
				Layout Settings <span class="btn-block font-weight-400 font-12">User
					Interface Settings</span>
			</h3>
			<div class="close-sidebar" data-toggle="right-sidebar-close">
				<i class="icon-copy ion-close-round"></i>
			</div>
		</div>
		<div class="right-sidebar-body customscroll">
			<div class="right-sidebar-body-content">
				<h4 class="weight-600 font-18 pb-10">Header Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary header-white">White</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary header-dark active">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-light ">White</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-dark active">Dark</a>
				</div>

				<div class="reset-options pt-30 text-center">
					<button class="btn btn-danger" id="reset-settings">Reset
						Settings</button>
				</div>
			</div>
		</div>
	</div>

	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="javascript:;"> <img
				src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg' alt="" class="dark-logo"> 
				<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg' alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="title pb-20 text-center">
			<h3 class="h4 mb-0 text-center" style="color: white;background: #0f2c7eeb;border-radius: 5px;">Change Your Password</h3>
			</div>
			<div class="pd-20 card-box mb-30">

				<form modelAttribute="user" action="changePassword" method="post"
					class="form-horizontal" id="pass_form">
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Old Password:</label>
<div class="col-sm-5 col-md-5">
    <input type="password" id="old_pass" name="old_pass" placeholder="Enter old password" class="form-control" required="true" oninput="checkOldPasswordAndSubmit()" />
    <small id="old_pass_error_lbl" style="color: red; display: none;">Old password is incorrect</small>
</div>
<div class="alert alert-danger alert-dismissable fade in errorBox" id="errorBox2" style="display: none;">
    <a href="#" class="close" aria-label="close">&times;</a>
    <span id="errorText2"></span>
</div>

					</div>
					<div class="form-group row">
    <label class="col-sm-12 col-md-2 col-form-label">New Password:</label>
    <div class="col-sm-5 col-md-5">
        <input type="password" name="pass"  id="pass" class="form-control" placeholder="Enter New password" required="true" />
    </div>
</div>

					
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Confirm
							Password : </label>
						<div class="col-sm-5 col-md-5">
							<input type="password" id="cPass" 
								oninput="checkPass()" class="form-control"
								placeholder="Re-Enter New password" required="required" /> 
								<small
								id="errorText2" style="color: red;"></small>
						</div>
						
					</div>
					<button class="btn btn-success">Click ME</button>
					<div class="form-group row">
						<div hidden class="col-sm-5 col-md-5">
							<button type="submit" class="btn btn-primary btn-sm"
								onclick="submit_form()" style="float: right;">Submit</button>
						</div>

					</div>
				</div>
				</form>
			</div>
			<%@include file="modal_common.jsp"%>
			<%@include file="footer.jsp"%>
		</div>
	</div>
	
	<!-- js -->
	<script>
		function checkPass() {
			var pass = document.getElementById('pass').value; // Original password
			var cPass = document.getElementById('cPass').value; // Confirmation password
			var errorText = document.getElementById('errorText2');
		
			if (pass !== cPass) {
				// Passwords don't match
				document.getElementById('cPass').style.backgroundColor = 'pink'; // Change background color
				errorText.textContent = 'Passwords do not match!'; // Display error message
			} else {
				// Passwords match
				document.getElementById('cPass').style.backgroundColor = ''; // Remove background color
				errorText.textContent = ''; // Clear error message
			}
		}
		</script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/change_password.js"></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/apexcharts/apexcharts.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js'></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	

	<script>
	function checkOldPasswordAndSubmit() {
	    var oldPassword = document.getElementById("old_pass").value;

	    $.ajax({
	        type: "POST",
	        url: "/checkOldPassword",
	        data: { oldPassword: oldPassword },
	        success: function(response) {
	            if (response === true) {
	                // Old password is correct, proceed with changing the password
	                document.getElementById("old_pass_error_lbl").style.display = "none"; // Hide error message
	                document.getElementById("pass").disabled = false
	              //  document.getElementById("pass_form").submit(); // Submit the form
	            } else {
	                // Old password is incorrect or user not logged in, display error message
	                document.getElementById("old_pass_error_lbl").innerText = "Old password is incorrect";
	                document.getElementById("old_pass_error_lbl").style.display = "block"; // Show error message
	                document.getElementById("pass").disabled = true; 
	            }
	        },
	        error: function(xhr, status, error) {
	            // Handle error
	            console.error("Error checking old password:", error);
	        }
	    });
	}
	</script>

	
</body>
</html>