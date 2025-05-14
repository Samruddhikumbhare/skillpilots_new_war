<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Company Registration</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css"
	rel="stylesheet">

<!-- Google Font -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/dist/css/terms_and_conditions_with_privacy_policy.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
				window.dataLayer = window.dataLayer || [];
				function gtag() { dataLayer.push(arguments); }
				gtag('js', new Date());

				gtag('config', 'UA-119386393-1');

			</script>

<style type="text/css">
.is-invalid {
	border-color: red;
}

.custom-control-input {
	position: absolute;
	left: 0px;
	z-index: 0;
	width: 2rem;
	height: 2.25rem;
	opacity: 0;
}

.register-page-wrap .wizard-content .wizard>.steps>ul {
	flex-wrap: initial !important;
}

.custom-file {
	text-align: end;
	width: 117%;
	margin-top: 10px;
}

.register-page-wrap .register-box {
	max-width: fit-content;
}
</style>
</head>

<body class="login-page">
	<div class="login-header box-shadow">
		<div
			class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo" style="width: 12%">
				<a href="${pageContext.request.contextPath}/login_check"> <img
					src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
					alt="" />
				</a>
			</div>
		</div>
	</div>
	<div
		class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img
						src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/industry.png"
						alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="register-box bg-white box-shadow border-radius-10">
						<div class="wizard-content">
							<c:url var="addAction" value="/add_company"></c:url>
							<form modelAttribute="company" id="my_form" action="add_company"
								enctype="multipart/form-data" method="post"
								class="form-horizontal tab-wizard2 wizard-circle wizard">
								<h5>Company Details</h5>
								<section>
								<div class="form-wrap max-width-600 mx-auto">
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Company Name<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input name="company_name" id="comp_name"
												class="form-control firstCapital" required="true"
												placeholder="Name of the Company" maxlength="200"
												title="Complete name of the company (to maintain its uniqueness)" />
											<small id="namelabel" style="color: red;"></small>
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Registration
											No. (CIN/GST/etc)<span style="color: red">*</span>
										</label>
										<div class="col-sm-8">
											<input name="registration_no" class="form-control"
												required="true" placeholder="Registration number"
												maxlength="22" title="Anything for us to verify its legal!" />
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Registration
											Date<span style="color: red">*</span>
										</label>
										<div class="col-sm-8">
											<input type="date" name="estd_date"
												class="form-control date_OB " id="date" required="true"
												placeholder="Date of Registration" />
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Web URL<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input id="web_url" name="web_url"
												placeholder="Company Website" class="form-control"
												required="true" maxlength="30" title="www.example.com"
												 />
											
										</div>

									</div>
<div class="form-group row align-items-center">
    <label class="col-sm-4 col-form-label">About<span style="color: red">*</span></label>
    <div class="col-sm-8">
        <textarea name="about" class="form-control" maxlength="5000" 
            rows="3" 
            style="resize: none; height:80px; overflow-y: scroll;"
            placeholder="About company..."></textarea>
    </div>
</div>


									<sub style="bottom: 0.75em; color: red;">Note : (*) All
										Fields Are Mandetory</sub><br>
								</div>
								</section>
								<!-- Step 2 -->
								<h5>Company Information</h5>
								<section>
								<div class="form-wrap max-width-600 mx-auto">
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Email-Id<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input type="email" name="email_id" id="mail_id2"
												class="form-control" required="true"
												placeholder="Company Email-Id" onchange="checkExists(this);" />
											<small id="maillabel" style="color: red;"></small>
										</div>
									</div>

									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Address
											(Line-1)<span style="color: red">*</span>
										</label>
										<div class="col-sm-8">
											<input name="line_1" class="form-control"
												placeholder="Address line 1 " id="street_number"
												required="true" maxlength="100"
												title="Please select the city first in the given area." />
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Address
											(Line-2)</label>
										<div class="col-sm-8">
											<input name="line_2" class="form-control"
												title="Please select the city first in the given area."
												id="route" placeholder="Address line 2" maxlength="100" />
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">City<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input name="city" class="form-control"
												title="Please select the city first in the given area."
												placeholder="City" id="locality" onFocus="geolocate()"
												required="true" maxlength="25" />
										</div>
									</div>
									<sub style="bottom: 0.75em; color: red;">Note : (*) All
										Fields Are Mandetory</sub><br>
								</div>
								</section>
								<!-- Step 3 -->
								<h5>Contact Details</h5>
								<section>
								<div class="form-wrap max-width-600 mx-auto">
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">State<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input name="state" class="form-control"
												title="Please select the city first in the given area."
												placeholder="State" id="administrative_area_level_1"
												required="true" maxlength="25" />
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Country<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input name="country" class="form-control"
												title="Please select the city first in the given area."
												placeholder="Country" id="country" required="true"
												maxlength="25" />
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Pincode<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input name="pincode" class="form-control" pattern="[0-9]{6}"
												title="Please select the city first in the given area."
												placeholder="Pincode" id="postal_code" maxlength="6"
												required="true" />
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Contact #1<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input type="text" name="contact_1" id="contact_1"
												class="form-control contact" placeholder="Contact #1"
												required="true"
												oninput="validateContactNum(this, 'contact1_error')"
												maxLength=12 /> <small id="contact1_error"
												style="color: red;"></small>
										</div>

									</div>

									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Contact #2</label>

										<div class="col-sm-8">
											<input type="text" name="contact_2" id="contact_2"
												class="form-control contact" placeholder="Contact #2"
												oninput="validateContactNum(this, 'contact2_error')"
												maxLength=12 /> <small id="contact2_error"
												style="color: red;"></small>
										</div>
									</div>
									<br>
								</div>
								</section>
								<!-- Step 4 -->
								<h5>HR Details</h5>
								<section>
								<div class="form-wrap max-width-600 mx-auto">
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Name<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input type="text" name="username"
												class="form-control firstCapital" required="true"
												placeholder="User's Name" maxlength="200">
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Email-Id<span
											style="color: red">*</span></label>
										<div class="col-sm-8">
											<input type="email" name="email" id="mail_id2"
												class="form-control" maxlength="50"
												onchange="checkExists(this);"
												oninput="validateEmails();"
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+(\.[a-z]+){1,2}$"
												required="true" placeholder="Enter Email-Id"> <small
												id="maillabel2" style="color: red;"></small>
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label"> Contact Number<span
											style="color: red">*</span>
										</label>
										<div class="col-sm-8">
											<input type="text" name="contact_no" id="contact_3"
												class="form-control contact" placeholder="Enter Contact No"
												required maxLength=12
												oninput="validateContactNum(this, 'contact3_error')"
												maxLength=12 /> <small id="contact3_error"
												style="color: red;"></small>
										</div>
									</div>
									<div class="form-group row align-items-center">
										<label class="col-sm-4 col-form-label">Gender</label>
										<div class="col-sm-8">
											<select name="gender" class="form-control"
												style="padding: 0px !important; cursor: pointer;"
												required="true">
												<option selected value="" disabled="disabled">--Select
													Gender--</option>
												<option value="M">Male</option>
												<option value="F">Female</option>
											</select>

										</div>
									</div>
									<sub style="bottom: 0.75em; color: red;">Note : (*) All
										Fields Are Mandetory</sub><br>
								</div>
								</section>
								<h5>Accept</h5>
								<section>
								<div class="form-wrap max-width-600 mx-auto">
									<div class="form-group row align-items-center">
										<div class="col-sm-12 row">
											<div class="col-sm-6">
												<input type="file" name="companylogo" id="upload-photo"
													accept="image/*"
													class="form-control-file form-control height-auto">
												<small>Upload Company Logo Here</small>
											</div>

											<div class="col-sm-6">
												<input type="file" name="hrSign" id="upload-hr_sign"
													accept="image/*"
													class="form-control-file form-control height-auto">
												<small>Upload HR Signature Here</small><br>
											</div>
										</div>
										<div class="col-sm-12 row">
											<div class="col-sm-5">
												<img id="profile-upload"
													src="<c:url value='https://i0.wp.com/vssmn.org/wp-content/uploads/2018/12/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png?fit=860%2C681&ssl=1' />" />
											</div>
											<div class="col-sm-1"></div>
											<div class="col-sm-5">
												<img id="sign-upload"
													src="<c:url value='https://i0.wp.com/vssmn.org/wp-content/uploads/2018/12/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png?fit=860%2C681&ssl=1' />" />
											</div>
											<div class="col-sm-1"></div>
											<div class="col-sm-5"></div>
										</div>


										<br>
										<div class="custom-control custom-checkbox">
											<span style="margin-left: 6px; font-size: 14px;"
												id="terms_conditions" data-toggle="tooltip"
												data-placement="top"
												title="Please go through the T&C's and Privacy Policy and accept the same.">
												<input type="checkbox" required="true" id="term_conditions"
												style="margin-top: 2px; vertical-align: top;"> I
												accept <a href="https://www.skillpilots.com/termsCondition"
												class="embed-link" target="_blank"> *Terms and
													Conditions</a> and <a
												href="https://www.skillpilots.com/privacyPolicy"
												class="embed-link-privacy" target="_blank"> *Privacy
													Policy</a>

											</span><br> <span style="margin-left: 6px; font-size: 14px;">
												<input type="checkbox" name="subscribe" checked="true"
												style="margin-top: 2px; vertical-align: top;">
												Subscribe to SkillPilots newsletters
											</span>
										</div>
									</div>
								</section>


							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
				function validateForm() {
					// Get the terms and conditions checkbox
					var termsConditions = document.getElementById("term_conditions");

					// Check if terms and conditions checkbox is checked
					if (!termsConditions.checked) {
						alert("Please accept the Terms and Conditions before submitting.");
						return false; // Prevent form submission
					}
					return true; // Allow form submission
				}

				function validateContactNum(input, errorId) {
				    var value = input.value;
				    var errorElement = document.getElementById(errorId);

				    // Remove non-numeric characters
				    value = value.replace(/[^0-9]/g, "");

				    // Update the input value without non-numeric characters
				    input.value = value;

				    // Check if the input is empty
				    if (value.trim() === "") {
				        errorElement.textContent = " - Not applicable"; // Display 'Not applicable' if input is empty
				    }
				    // Check if the input is 10, 11, or 12 digits
				    else if (!/^\d{10,12}$/.test(value)) {
				        errorElement.textContent = "Please enter exactly 10, 11, or 12 digits"; // Display message for invalid length
				    } else {
				        errorElement.textContent = ""; // Clear error if input is valid
				    }
				}



			</script>

	<!-- success Popup html Start -->

	<!-- success Popup html End -->
	<!-- js -->
	<%@include file="terms_and_conditions_with_privacy_policy.jsp"%>
	<%@include file="scriptfiles.jsp"%>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility1.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/pdfobject.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/terms_and_condition_with_privacy_policy.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUlCQ6MBRc_JIpz68S5-7prwYjevo1s1M&libraries=places&callback=initAutocomplete"
		async defer></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/geolocation.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/steps-setting.js"></script>
	<script type="text/javascript">
						$(document).ready(function () {
							$(document).on('change', '.btn-file :file', function () {
								var input = $(this),
									label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
								input.trigger('fileselect', [label]);
							});

							$('.btn-file :file').on('fileselect', function (event, label) {

								var input = $(this).parents('.input-group').find(':text'),
									log = label;

								if (input.length) {
									input.val(log);
								} else {
									if (log) alert(log);
								}

							});
							function readURL(input) {
								if (input.files && input.files[0]) {
									var reader = new FileReader();
									reader.onload = function (e) {
										$('#profile-upload').attr('src', e.target.result);
									}
									reader.readAsDataURL(input.files[0]);
								}
							}

							$("#upload-photo").change(function () {
								readURL(this);
							});

							$(document).on('change', '.btn-file :file', function () {
								var input = $(this),
									label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
								input.trigger('fileselect', [label]);
							});

							$('.btn-file :file').on('fileselect', function (event, label) {

								var input = $(this).parents('.input-group').find(':text'),
									log = label;

								if (input.length) {
									input.val(log);
								} else {
									if (log) alert(log);
								}

							});
							function read1URL(input) {
								if (input.files && input.files[0]) {
									var reader = new FileReader();
									reader.onload = function (e) {
										$('#sign-upload').attr('src', e.target.result);
									}
									reader.readAsDataURL(input.files[0]);
								}
							}

							$("#upload-hr_sign").change(function () {
								read1URL(this);
							});
						});
						// $("#Submit").click(function () {
						// 	$("#my_form").submit();
						// }); 
					</script>
	<script>
						document.getElementById("my_form").onsubmit = function (event) {
							var requiredFields = this.querySelectorAll("[required]");
							var hasEmptyFields = false;
							for (var i = 0; i < requiredFields.length; i++) {
								if (!requiredFields[i].value.trim()) {
									// Show an error message or highlight the empty required field
									requiredFields[i].style.borderColor = "red"; // Example of highlighting
									hasEmptyFields = true;
								} else {
									// Reset visual cues for filled fields
									requiredFields[i].style.borderColor = ""; // Resetting any highlighting
								}
							}

							if (hasEmptyFields) {
								event.preventDefault(); // Stop the form from submitting
								// Show an alert for missing fields
								Swal.fire({
									icon: 'warning',
									title: 'Incomplete Form',
									text: 'Please fill in all required fields.'
								});
								return false; // Prevent the form submission
							}

							return true; // Allow the form to submit

							

						};
					</script>
	<script>

						function checkEmail(email_id, callback) {
							$.ajax({
								type: 'GET',
								url: 'email_exists?email_id=' + encodeURIComponent(email_id), // Ensure the email is URL-encoded
								success: function (response) {
									if (response) {
										console.log("Email exists"); // Log when email exists
									}
									callback(response); // Execute the callback function with the response
								},
								error: function (error) {
									console.log(error); // Log any errors
								}
							});
						}
						function checkExists(inputElement) {
						    var email = inputElement.value;

						    // Simulate email check
						    checkEmail(email, function (exists) {
						        if (exists) {
						            // Use SweetAlert to display a user-friendly alert
						            Swal.fire({
						                icon: 'warning',
						                title: 'Email Already Exists!',
						                text: 'Please use a different email address.',
						                confirmButtonText: 'OK',
						                confirmButtonColor: '#3085d6'
						            }).then(() => {
						                // Clear the input field after the alert
						                inputElement.value = "";
						            });
						        }
						    });
						}



					</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
						$(document).ready(function () {
							// When the submit button is clicked
							$("#Submit").click(function (e) {
								e.preventDefault();  // Prevent form submission
								e.stopPropagation();  // Prevent any further event propagation
					
								// Disable the button temporarily to prevent multiple clicks during validation
								$(this).prop('disabled', true);
					
								let hasEmptyFields = false;
								const termsCheckbox = document.getElementById('term_conditions');  // Get checkbox element
					
								console.log('Checkbox checked:', termsCheckbox.checked); // Debugging line
					
								// Check for empty required fields
								$("#my_form").find("input[required]").each(function () {
									if ($(this).val() === "") {
										hasEmptyFields = true;
									}
								});
					
								// Check if terms and conditions checkbox is checked
								if (!termsCheckbox.checked) {
									console.log('Terms not accepted'); // Debugging line
									Swal.fire({
										icon: 'warning',
										title: 'Terms and Conditions',
										text: 'Please accept the Terms and Conditions and Privacy Policy.',
									}).then(() => {
										// Re-enable the button after the warning
										$("#Submit").prop('disabled', false);
									});
									return;  // Prevent form submission if terms are not checked
								}
					
								
					
								// If all validations pass, submit the form
								if (!hasEmptyFields) {
									Swal.fire({
										title: 'Please wait...',
										text: 'Submitting your data...',
										allowOutsideClick: false,
										didOpen: () => {
											Swal.showLoading(); // Show loading spinner
										}
									});
					
									// Simulate delay for form submission
									setTimeout(function () {
										Swal.close();  // Close the loading spinner
										Swal.fire({
											icon: 'success',
											title: 'Registration successful!',
											text: 'You will be redirected shortly.',
											showConfirmButton: false,
											allowOutsideClick: false,
											didOpen: () => {
												Swal.showLoading();  // Show loading spinner
											}
										});
					
										// Submit the form programmatically after success message
										$("#my_form")[0].submit();  // Use vanilla JS to ensure submission
									}, 2000);  // Adjust delay (2 seconds)
								} else {
									Swal.fire({
										icon: 'error',
										title: 'Oops...',
										text: 'Please fill in all required fields.',
									}).then(() => {
										// Re-enable the button if there are empty fields
										$("#Submit").prop('disabled', false);
									});
								}
							});
						});
					
						// URL validation function
						function validateUrl() {
							const urlInput = document.getElementById("web_url");
							const urlError = document.getElementById("urlError");
					
							// Simple URL validation regex
							const urlPattern = /^(https?:\/\/)?(www\.)?([a-zA-Z0-9-]+)\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$/;
					
							if (urlInput.value && !urlPattern.test(urlInput.value)) {
								// Show error if URL is invalid
								urlError.style.display = "block";
								urlInput.classList.add("is-invalid");  // Optional: Add validation style
								return false;  // URL is invalid
							} else {
								// Hide error if URL is valid
								urlError.style.display = "none";
								urlInput.classList.remove("is-invalid");
								return true;  // URL is valid
							}
						}
					</script>





	<script>
    function validateContact(input, errorElementId, minLength, maxLength) {
        var contact = input.value;
        var error = document.getElementById(errorElementId);
        var nextButton = document.getElementById('nextButton'); // Assuming there is a Next button

        // Remove any non-numeric characters and enforce max length
        contact = contact.replace(/\D/g, '').slice(0, maxLength);
        input.value = contact; // Update the input with sanitized value

        if (contact.length < minLength) {
          
        } else if (contact.length > maxLength) {
            error.innerText = `Contact cannot exceed ${maxLength} Number.`;
            if (nextButton) nextButton.disabled = true;
        } else {
            error.innerText = "";
            if (nextButton) nextButton.disabled = false;
        }
    }
</script>

	<script>
						// Get the current date and format it as yyyy-mm-dd
						const today = new Date();
						const maxDate = today.toISOString().split('T')[0];

						// Set the max attribute of the date input
						document.getElementById('date').setAttribute('max', maxDate);
					</script>
<script>
	function validateEmails() {
	  const email1 = document.querySelector('input[name="email_id"]').value;
	  const email2 = document.querySelector('input[name="email"]').value;
  
	  if (email1 && email2 && email1 === email2) {
		Swal.fire({
		  icon: "warning",
		  title: "Validation Error",
		  text: "HR Email ID and Company Email ID cannot be the same!",
		}).then(() => {
		  document.querySelector('input[name="email"]').value = "";
		});
	  }
	}
  </script>
</body>

</html>