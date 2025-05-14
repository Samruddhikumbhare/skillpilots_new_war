
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>SkillPilots | College Registration</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon-16x16.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/dist/css/terms_and_conditions_with_privacy_policy.css">
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
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="javascript:;">
					<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg" alt="">
				</a>
			</div>
			<div class="login-menu">
				<ul>
					<li><a href="/home">Home</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/8747.png" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="register-box bg-white box-shadow border-radius-10">
						<div class="wizard-content">
							<form action="college_registration" id="my_form" modelAttribute="college" enctype="multipart/form-data"
					class="form-horizontal tab-wizard2 wizard-circle wizard">
								<h5>College Details</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Institute Name<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="college_name" class="form-control firstCapital" maxlength="200"
											required="true" placeholder="Name of the Institute" title="Complete name of the Institute (to maintain its uniqueness)"/>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Established Date<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="estd_date" class="form-control date_OB date-picker" id="datepicker" 
											placeholder="Date of establishment" readonly='true'/>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Web URL<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="web_url" class="form-control" maxlength="30" placeholder="Institute Website"
											pattern="[a-zA-Z0-9_\-]+(\.[a-zA-Z0-9_\-]+){2,3}$" title="www.example.com"/>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Email-Id<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="email_id" id="mail_id" class="form-control" onchange="checkExists(this)" onblur="checkExists(this)" 
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+(\.[a-z]+){1,2}$" required="true" maxlength="50" placeholder="Institute Email-Id"/>
											<label id="maillabel" style="color: red;"></label>
											</div>
										</div><sub style="bottom: 0.75em;color: red;float: right;">Note : (*) All Fields Are Mandetory</sub>
									</div>
								</section>
								<!-- Step 2 -->
								<h5>College Located At</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
									<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">City<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="address-autocomplete" id="address-autocomplete" placeholder="Enter your City" onFocus="geolocate()" type="text" class="form-control" required="true"></input>
											</div>
										</div>
									<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Address (Line-1)<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="address.line_1" class="form-control" placeholder="Address line 1 "
										id="street_number" required="true" disabled="false" maxlength="100" title="${MessageConstants.address_tooltip}"/>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Address (Line-2)</label>
											<div class="col-sm-8">
												<input name="address.line_2" class="form-control" id="route" placeholder="Address line 2"
										disabled="false" maxlength="100" title="${MessageConstants.address_tooltip}"/>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">City<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="address.city" class="form-control" title="Please select the city first in the given area."
										placeholder="City" id="locality" readonly="false" required="true" maxlength="25" />
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">State<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="address.state" class="form-control" placeholder="State" id="administrative_area_level_1"
										readonly="false" required="true" maxlength="25" title="${MessageConstants.address_tooltip}"/>
											</div>
										</div><sub style="bottom: 0.75em;color: red;float: right;">Note : (*) All Fields Are Mandetory</sub><br>
									</div>
								</section>
								<!-- Step 3 -->
								<h5>Contact Details</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
									<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Country<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="address.country" class="form-control" placeholder="Country" id="country"
										readonly="true" required="false" maxlength="25" title="${MessageConstants.address_tooltip}"/>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Pincode<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input name="address.pincode" class="form-control" pattern="[0-9]{6}" title="${MessageConstants.address_tooltip}"
										placeholder="Pincode" id="postal_code" disabled="false" maxlength="6" required="true" />
											</div>
										</div>
									<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Contact #1</label>
											<div class="col-sm-8">
												<input name="contact_1" id="contact" class="form-control contact" pattern="\d*"
										placeholder="Contact #1" onchange="checkContactExists(this)"
										onblur="checkContactExists(this)" required="true" maxlength="10" minlength="10" />
									<small id="contact_error" style="color: red;"></small>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Contact #2</label>
											<div class="col-sm-8">
												<input name="contact_2" id="contact2" class="form-control contact" pattern="\d*"
										placeholder="Contact #2" onchange="checkContactExists(this)"
										onblur="checkContactExists(this)" maxlength="10" minlength="10" />
									<small id="contact2_error" style="color: red;"></small>
											</div>
										</div><sub style="bottom: 0.75em;color: red;float: right;">Note : (*) All Fields Are Mandetory</sub>
									</div>
								</section>
								<!-- Step 4 -->
								<h5>III Cell / T&P Head Details</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Name<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input
											type="text" name="username" class="form-control  firstCapital"
											placeholder="User's Name" pattern="[a-zA-Z\s]{1,200}">
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Email-Id<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input type="text" name="uemail" id="mail_id2" class="form-control" required="true" 
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+(\.[a-z]+){1,2}$" maxlength="50"
											placeholder="User's Email-Id" onchange="checkExists(this)" onblur="checkExists(this)"/>
										<label id="maillabel2" style="color: red;"></label>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Contact Number<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<input
											type="text" name="ucontact" id="contact3" class="form-control contact" pattern="\d*"
											placeholder="User's Contact No." onchange="checkContactExists(this)"
											onblur="checkContactExists(this)" required="true" maxlength="12" minlength="10">
										<label id="contact3_error" style="color: red;"></label>
											</div>
										</div>
										<div class="form-group row align-items-center">
											<label class="col-sm-4 col-form-label">Gender<span style="color: red">*</span></label>
											<div class="col-sm-8">
												<select name="ugender" class="form-control" style="padding:0px !important;cursor:pointer;" required="true">
											<option selected value="" disabled="disabled">--Select Gender--</option>
											<option value="${ProjectConstants.reg_user_gender_male}">Male</option>
											<option value="${ProjectConstants.reg_user_gender_female}">Female</option>
										</select>
									
											</div>
										</div><sub style="bottom: 0.75em;color: red;float: right;">Note : (*) All Fields Are Mandetory</sub><br>
									</div>
								</section>
								<h5>Upload Logo</h5>
								<section>
									<div class="form-wrap max-width-600 mx-auto">
									<div class="form-group row align-items-center">
										<div class="col-sm-12 row">
										<div class="col-sm-10">
											<input type="file" name="collegelogo" id="upload-photo" accept="image/*" class="form-control-file form-control height-auto">
											<small>Upload Institute's Logo Here<span style="color: red">*</span></small>
										</div>
									</div></div>
									<div class="col-sm-12 row">
										<div class="col-sm-5">
												<img id="profile-upload"
													src="/images/blank_profile.jpg"
													alt="Institute's Logo"
													 />
										</div>
										<div class="col-sm-1"></div>
									</div>
									<br>
									<div class="custom-control custom-checkbox">
										<span style="margin-left: 6px; font-size: 14px;"
											id="terms_conditions" data-toggle="tooltip"
											data-placement="top"
											title="Please go through the T&C's and Privacy Policy and accept the same.">
											<input type="checkbox" id="term_conditions"
											/> I
											accept <a href="#" class="embed-link"> *Terms and
												Conditions</a> and <a href="#" class="embed-link-privacy">
												*Privacy Policy</a>
										</span><br>
										<span style="margin-left: 6px; font-size:14px; ">
						<input type="checkbox" name="subscribe" checked="true" style="margin-top:2px; vertical-align:top;">
						  Subscribe to SkillPilots newsletters
					</span>
									</div>
								</div>
								</section>
								<button type="button" id="success-modal-btn" hidden data-toggle="modal" data-target="#success-modal" data-backdrop="static">Launch modal</button>
	<div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered max-width-400" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-18">
					<h3 class="mb-20">Thank You!</h3>
					<div class="mb-30 text-center"><img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/success.png"></div>
					Press Ok To Validate Your Information.
				</div>
				<div class="modal-footer justify-content-center">
					<input type="submit" id="subbtn"
									class="btn btn-primary btn-sm" value="Submit" /></div>
			</div>
		</div>
	</div>
							<form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="terms_and_conditions_with_privacy_policy.jsp" %>
	<%@include file="scriptfiles.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>	
	<script  src="${pageContext.request.contextPath}/style/dist/pdfobject.min.js"></script>
	<script  src="${pageContext.request.contextPath}/style/dist/js/myjs/terms_and_condition_with_privacy_policy.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUlCQ6MBRc_JIpz68S5-7prwYjevo1s1M&libraries=places&callback=initAutocomplete" async defer></script>
	<script  src="${pageContext.request.contextPath}/style/dist/js/myjs/geolocation.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/steps-setting.js"></script>
	 <script type="text/javascript">
	$(document).ready(function() {
				$(document).on('change', '.btn-file :file', function() {
					var input = $(this),
						label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
					input.trigger('fileselect', [label]);
				});

				$('.btn-file :file').on('fileselect', function(event, label) {

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
						reader.onload = function(e) {
							$('#profile-upload').attr('src', e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}

				$("#upload-photo").change(function() {
					readURL(this);
				});
				
		 });

	</script>
</body>

</html>