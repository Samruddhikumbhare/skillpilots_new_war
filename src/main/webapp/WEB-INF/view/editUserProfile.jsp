<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@include file="user_session.jsp" %>
			<!DOCTYPE html>
			<html>

			<head>
				<!-- Basic Page Info -->
				<meta charset="utf-8">
				<title>SkillPilots | Edit Profile</title>

				<!-- Site favicon -->
				<link rel="apple-touch-icon" sizes="180x180"
					href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
				<link rel="icon" type="image/png" sizes="16x16"
					href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

				<!-- Mobile Specific Metas -->
				<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

				<!-- Google Font -->
				<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
					rel="stylesheet">
				<!-- CSS -->
				<link rel="stylesheet" type="text/css"
					href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
				<link rel="stylesheet" type="text/css"
					href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
				<link rel="stylesheet" type="text/css"
					href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
				<link rel="stylesheet" type="text/css"
					href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
				<link rel="stylesheet" type="text/css"
					href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">

				<!-- Global site tag (gtag.js) - Google Analytics -->
				<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
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
						padding: 15px 12px 15px 54px !important;
						font-size: 15px !important;
					}

					.user-notification .dropdown-toggle .badge {
						position: absolute;
						right: 5px;
						top: 7px;
						/* background: #0f2c7eeb; */
						width: 5px;
						height: 5px;
						display: block;
						padding: 0;
					}

					.notification-list ul li a {
						display: block;
						position: relative;
						padding: 0px 15px 1px 7px !important;
						min-height: 75px;
						color: #666;
						font-size: 13px;
						font-weight: 500;
						font-family: 'Inter', sans-serif;
						border-radius: 1px;
					}

					.form-control {
						height: 40px;
					}
				</style>
				<c:if test="${user_data.role eq '1'}">

					<style type="text/css">
						.sidebar-menu .dropdown-toggle {
							padding: 15px 12px 15px 54px !important;
							font-size: 15px !important;
						}
					</style>
				</c:if>

			</head>

			<body>
				<div class="pre-loader">
					<div class="pre-loader-box">
						<div class="loader-logo">
							<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
								alt="">
						</div>
						<div class='loader-progress' id="progress_div">
							<div class='bar' id='bar1'></div>
						</div>
						<div class='percent' id='percent1'>0%</div>
						<div class="loading-text">Loading...</div>
					</div>
				</div>

				<%@include file="header.jsp" %>

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
									<a href="javascript:void(0);" class="btn btn-outline-primary header-white">White</a>
									<a href="javascript:void(0);"
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
									src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg'
									alt="" class="dark-logo">
								<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg'
									alt="" class="light-logo">
							</a>
							<div class="close-sidebar" data-toggle="left-sidebar-close">
								<i class="ion-close-round"></i>
							</div>
						</div>
						<c:if test="${user.role eq '1'|| user.role eq '2'}">
							
								<div class="menu-block customscroll">
									<div class="sidebar-menu">
										<ul id="accordion-menu">
											<li><a href="company_dashboard" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-house-1"></span><span
														class="mtext">Dashboard</span>
												</a></li>
											<li><a href="company_internships" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-certificate"></span><span
														class="mtext">Internships</span>
												</a></li>
											<li><a href="company_posts" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-computer"></span><span class="mtext">Manage
														Advertisements</span>
												</a></li>
													<li><a href="recruitment_campus" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer"></span><span class="mtext">Job Advertisements</span>
					</a></li>
											<li><a href="external_internship_request_company"
													class="dropdown-toggle no-arrow">
													<span class="micon dw dw-computer-1"></span><span
														class="mtext">External Request</span>
												</a></li>
											<li><a href="company_internal_request" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-computer-1"></span><span
														class="mtext">Internal Request</span>
												</a></li>
											<li hidden><a href="college_tie_up" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-repeat-1"></span><span
														class="mtext">Institute Tie-Ups</span>
												</a></li>
											<li><a href="add_company_member" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-user-11"></span><span class="mtext">Manage
														Teams</span>
												</a></li>
											<li><a href="company_online_test" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-personal-computer"></span><span
														class="mtext">Manage Test</span>
												</a></li>
											<li hidden><a href="companyTransactions" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-money-2"></span><span
														class="mtext">Balances</span>
												</a></li>
											<li><a href="company_report" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-file3"></span><span
														class="mtext">Internship Reports</span>
												</a></li>
											<li><a href="certificate" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-certificate-1"></span><span
														class="mtext">Certificates</span>
												</a></li>
												 <li><a href="meet" class="dropdown-toggle no-arrow">
										<span class="micon dw dw-chat3"></span><span class="mtext">SkillMeet</span>
									  </a></li>
										</ul>
									</div>
								</div>
					
						</c:if>
						<c:if test="${user.role eq '3' || user.role eq '4'}">
							
								<div class="menu-block customscroll">
									<div class="sidebar-menu">
										<ul id="accordion-menu">
											<li><a href="company_dashboard" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-house-1"></span><span
														class="mtext">Dashboard</span>
												</a></li>
											<li><a href="company_internships" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-certificate"></span><span
														class="mtext">Internships</span>
												</a></li>
											<li><a href="company_internal_request" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-computer-1"></span><span
														class="mtext">Internal Request</span>
												</a></li>
											<!-- <li><a href="college_tie_up" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-repeat-1"></span><span
														class="mtext">Institute Tie-Ups</span>
												</a></li> -->
											<li><a href="add_company_member" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-user-11"></span><span class="mtext">Manage Teams</span>
					</a></li>
											<li><a href="live_chat" class="dropdown-toggle no-arrow">
													<span class="micon dw dw-chat3"></span><span class="mtext">Live
														Chat</span>
												</a></li>
												 <li><a href="meet" class="dropdown-toggle no-arrow">
										<span class="micon dw dw-chat3"></span><span class="mtext">SkillMeet</span>
									  </a></li>
										</ul>
									</div>
								</div>
							</c:if>
						
							<%@include file="sidebar.jsp"%>
						
					</div>
					<div class="mobile-menu-overlay"></div>

					<div class="main-container">
						<div>

							<div class="title pb-20 text-center">
								<h5 class="h4 mb-0" style="background: #0f2c7eeb;color: white;border-radius: 4px;">Edit
									Profile Information</h5>
							</div>
							<div class="pd-20 card-box mb-30">
								<div class="row">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30">
										<div class="pd-20 card-box height-100-p">
											<!-- <div class="profile-photo">
								<a href="modal" data-toggle="modal" data-target="#modal"
									class="edit-avatar"><i class="fa fa-pencil"></i></a> <img
									src="/get_logo" alt="" class="avatar-photo"
									style="width: -webkit-fill-available; height: -webkit-fill-available;">
								<div class="modal fade" id="modal" tabindex="-1" role="dialog"
									aria-labelledby="modalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-body pd-5">
												<div class="img-container">
													<img id="image" src="/get_logo"
														alt="Picture" style="inline-size: -webkit-fill-available;">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> -->
											<h5 class="text-center h5 mb-0">${user.username}</h5>
											<p class="text-center text-muted font-14"></p>
											<div class="profile-info">
												<h5 class="mb-20 h5 text-blue">Contact Information</h5>
												<ul>
													<li><span>Email Address:</span>${user.email}</li>
													<li><span>Phone Number:</span> ${user.contact_no}</li>
													<li><span>Gender :</span>${user2.gender}</li>
													<if test="${user.verified} eq 1"> 
														<li><span>Account Verified :</span> true
													</if>
													</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30">
										<div class="card-box height-100-p overflow-hidden">
											<div class="profile-tab height-100-p">
												<div class="tab height-100-p">
													<ul class="nav nav-tabs customtab" role="tablist">
														<li class="nav-item"><a class="nav-link active"
																data-toggle="tab" href="#timeline" role="tab">Edit Your
																Personal
																Information</a></li>
													</ul>
													<div class="tab-content">
														<!-- Timeline Tab start -->

<c:url var="addAction" value="/editUserProfile"></c:url>
<form modelAttribute="user" action="${addAction}" method="post" enctype="multipart/form-data">
    <ul class="profile-edit-list row">
        <li class="weight-500 col-md-6">
            <div class="form-group ml-2">
                <label>Full Name</label>
                <input type="text" name="username" value="${user2.username}" class="form-control form-control-lg" required="true" />
            </div>
       <!-- Email Field -->
<div class="form-group ml-2">
    <label>Email</label>
    <input name="email_id" value="${user2.email}"
           id="mail_id" onchange="checkExists(this)"
           pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
           class="form-control form-control-lg"
           <c:if test="${user.role eq '1' || user.role eq '5'}"> </c:if>
           <c:if test="${user.role ne '1' && user.role ne '5'}">readonly disabled</c:if> />
</div>

<!-- Gender Field -->
<div class="form-group ml-2" style="padding-bottom: 18px;">
    <label>Gender</label>
    <div class="d-flex">
        <!-- Male Radio Button -->
        <div class="custom-control custom-radio mb-5 mr-20">
            <input type="radio" id="maleRadio" name="gender" class="custom-control-input" value="M"
                   ${user2.gender == 'M' ? 'checked="checked"' : ''}
                   <c:if test="${user.role eq '1' || user.role eq '5'}"> </c:if>
                   <c:if test="${user.role ne '1' && user.role ne '5'}">disabled</c:if> />
            <label class="custom-control-label weight-400" for="maleRadio">Male</label>
        </div>

        <!-- Female Radio Button -->
        <div class="custom-control custom-radio mb-5">
            <input type="radio" id="femaleRadio" name="gender" class="custom-control-input" value="F"
                   ${user2.gender == 'F' ? 'checked="checked"' : ''}
                   <c:if test="${user.role eq '1' || user.role eq '5'}"> </c:if>
                   <c:if test="${user.role ne '1' && user.role ne '5'}">disabled</c:if> />
            <label class="custom-control-label weight-400" for="femaleRadio">Female</label>
        </div>
    </div>
</div>


																</li>
																<li class="weight-500 col-md-6">
																	
																	<div class="form-group">
																		<label>Contact Number</label>
																		<input type="text" name="contact_no"
																			value="${user2.contact_no}" , maxlength="10"
																			class="form-control form-control-lg"
																			required="true" />
																	</div>
																	<c:if
																		test="${user.role eq '2'or user.role eq '1' }">
																		<div class="form-group">
																			<label>Upload Hr Signature</label>
																			<div class="custom-file">
																				<input type="file" name="hrSign"
																					id="upload-photo"
																					class="custom-file-input form-control form-control-lg form-control-file">
																				<label class="custom-file-label"
																					style="height: 40px;">Choose
																					file</label>
																			</div>
																		</div>
																	</c:if>
																	<hidden path="role" />
																	<hidden path="acc_verified" />
																	<hidden path="email_verified" />
																	<hidden path="mob_verified" />
																	<div class="form-group mb-0 text-center">
																		<input type="submit" id="sbtn"
																			class="btn btn-primary btn-sm"
																			style="margin-top: 20px;"
																			value="Save & Update" />
																	</div>
																</li>
															</ul>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>

						<input type="hidden" value="${user_data.email_id}" id="existing_emailid"> <input type="hidden"
							value="${user_data.contact_no}" id="existing_contact">
					</div>
					<%@include file="modal_common.jsp" %>
						<%@include file="footer.jsp" %>
							</div>
							</div>

							<!-- js -->
							<%@include file="modal_stud_past.jsp" %>
								<%@include file="scriptfiles.jsp" %>

								<script>
									if (gender === 'M') {
			document.getElementById('maleRadio').checked = true;
		} else if (gender === 'F') {
			document.getElementById('femaleRadio').checked = true;
		}


		
								</script>
									<script
										src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
									<script type="text/javascript"
										src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
									<script type="text/javascript"
										src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/js/myjs/student_past_edu.js"></script>
									<script
										src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUlCQ6MBRc_JIpz68S5-7prwYjevo1s1M&libraries=places&callback=initAutocomplete"
										async defer></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/js/myjs/geolocation2.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/apexcharts/apexcharts.min.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
									<script
										src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js"></script>
									<script type="text/javascript">
										$('#homeCityCheck').change(function () {
											if ($(this).is(":checked")) {
												var returnVal = $('#address-autocomplete').val();
												$('#address-autocomplete2').val(returnVal);
											} else {
												$('#address-autocomplete2').val("");
											}
										});

										var project_table = $("#project_table").DataTable({
											searching: false,
											paging: false,
											info: false,
										});
										var training_table = $("#training_table").DataTable({
											searching: false,
											paging: false,
											info: false,
										});
										var worksample_table = $("#worksample_table").DataTable({
											searching: false,
											paging: false,
											info: false,
										});
										var internship_table = $("#internship_table").DataTable({
											searching: false,
											paging: false,
											info: false,
										});
										var job_table = $("#job_table").DataTable({
											searching: false,
											paging: false,
											info: false,
										});
										$(document).ready(function () {

											$.ajax({
												type: 'get',
												url: 'getStudentPastProfessions',
												success: function (studentPastProfession) {
													if (studentPastProfession.length > 0) {
														$("#empty_professional_div").hide();
														for (i = 0; i < studentPastProfession.length; i++) {
															addStudentProfRow(studentPastProfession[i]);
														}
														if (project_table.rows().any())
															$("#project_div").show();
														else
															$("#project_div").hide();

														if (training_table.rows().any())
															$("#training_div").show();
														else
															$("#training_div").hide();

														if (worksample_table.rows()
															.any())
															$("#worksample_div").show();
														else
															$("#worksample_div").hide();

														if (internship_table.rows()
															.any())
															$("#internship_div").show();
														else
															$("#internship_div").hide();

														if (job_table.rows().any())
															$("#job_div").show();
														else
															$("#job_div").hide();
													} else {
														$("#project_div").hide();
														$("#training_div").hide();
														$("#worksample_div").hide();
														$("#internship_div").hide();
														$("#job_div").hide();
														$("#empty_professional_div").show();
													}
												},
												error: function (error) {
													alert(error);
												}
											});

											//this code checkbox address is same checkbox already checked  
											if ($('#address-autocomplete').val() == $(
												'#address-autocomplete2').val()) {
												$('#homeCityCheck').prop('checked', true);
											}
										});

										function clear_prof_form() {
											$('#prof_stud_past_id').val('0');
											$('#prof_category').val('');
											$('#professionSelector').prop('disabled', false);
											document.getElementById("prof_div").style.display = "none";
											$('#prof_organization').val('');
											$('#prof_profile').val('');
											$('#prof_description').val('');
											$('#prof_location').val('');
											$('#prof_department').val('');
											$('#prof_link').val('');
											$('#prof_start_date').val('');
											$('#prof_end_date').val('');
										}

										function editprofession(stud_past_id, category, organization, location,
											profile, department, start_date, end_date, link, description) {
											clear_prof_form();
											console.log(stud_past_id);
											if (stud_past_id != '0') {
												$("#prof_stud_past_id").val(stud_past_id);
												$("#prof_category").val(category);
												$('#professionSelector').val(category);
												$('#professionSelector').prop('disabled', true);
												$('#professionSelector').change();
												$('#prof_organization').val(organization);
												$('#prof_location').val(location);
												$('#prof_profile').val(profile);
												$('#prof_department').val(department);
												$('#prof_start_date').datepicker('setDate', start_date);
												$('#prof_end_date').datepicker('setDate', end_date);
												$('#prof_link').val(link);
												$('#prof_description').val(description);
											} else
												$('#professionSelector').val('');
											$("#addMoreProfession").modal('show');
										}

										$('#professionSelector').change(function () {
											if ($("#prof_stud_past_id").val() == "0")
												clear_prof_form();
											$("#prof_category").val($(this).val());
											if ($(this).val() != "W") {
												$('#organization_div').show();
												$('#prof_organization').prop('required', true);
												$('#profile_div').show();
												$('#prof_profile').prop('required', true);
												$('#department_div').show();
												$('#prof_department').prop('required', true);
												$('#startdate_div').show();
												$('#prof_start_date').prop('required', true);
												$('#enddate_div').show();
												$('#prof_end_date').prop('required', true);

												if ($(this).val() != "P") {
													$('#location_div').show();
													$('#prof_location').prop('required', true);
												} else {
													$('#location_div').hide();
													$('#prof_location').prop('required', false);
												}

												if ($(this).val() == "I"
													|| $(this).val() == "P") {
													$('#link_div').show();
												} else {
													$('#link_div').hide();
													$('#prof_link').prop('required', false);
												}

												if ($(this).val() == "T") {
													$('#organization_label').text(
														'Institute/Organization Name');
													$('#profile_label')
														.text('Training Program');
													$('#description_div').hide();
													$('#prof_description').prop('required',
														false);
												} else if ($(this).val() == "P") {
													$('#organization_label').text(
														'Project Title');
												} else {
													$('#organization_label').text('Industry');
													$('#profile_label').text('Role');
													$('#description_div').show();
													$('#prof_description').prop('required',
														true);
												}
											} else {
												$('#organization_div').hide();
												$('#prof_organization').prop('required', false);
												$('#profile_div').hide();
												$('#prof_profile').prop('required', false);
												$('#description_div').hide();
												$('#prof_description').prop('required', false);
												$('#location_div').hide();
												$('#prof_location').prop('required', false);
												$('#department_div').hide();
												$('#prof_department').prop('required', false);
												$('#link_div').show();
												$('#prof_link').prop('required', true);
												$('#startdate_div').hide();
												$('#prof_start_date').prop('required', false);
												$('#enddate_div').hide();
												$('#prof_end_date').prop('required', false);
											}
											document.getElementById("prof_div").style.display = "block";
										});

										$("#prof_form").on("submit", function (event) {
											event.preventDefault();
											if (new Date($("#prof_end_date").val()) < new Date($("#prof_start_date").val())) {
												alert('End date should be after Start date.');
												return false;
											}
											var fdata = $(this).serialize();
											console.log(fdata.replace(/%20/g, " "));
											$.ajax({
												type: 'post',
												url: 'saveStudentPast',
												data: fdata,
												datatype: 'json',
												success: function (response) {
													alertMsg("Successfully Saved!");
													if ($("#prof_stud_past_id").val() != "0")
														removeStudentProfRow($("#prof_stud_past_id").val(), $("#prof_category").val())

													addStudentProfRow({
														stud_past_id: response,
														category: $('#prof_category').val(),
														organization: $('#prof_organization').val(),
														profile: $('#prof_profile').val(),
														description: $('#prof_description').val(),
														location: $('#prof_location').val(),
														department: $('#prof_department').val(),
														link: $('#prof_link').val(),
														start_date: $('#prof_start_date').val(),
														end_date: $('#prof_end_date').val()
													});

													$("#empty_professional_div").hide();
													$("#addMoreProfession").modal('hide');
												},
												error: function (error) {
													alert(error);
													alert(error_fetch);
												}
											});
										});

										function removeStudentPast(studentPastId, category) {
											$.ajax({
												type: 'get',
												url: 'removeStudentPast?past_id=' + studentPastId,
												success: function (response) {
													removeStudentProfRow(studentPastId, category);
												},
												error: function (error) {
													alert(error);
												}
											});
										}

										function addStudentProfRow(studentPastProfession) {
											var action_col = "<i class='fa fa-pencil pr-2' style='background: #0f2c7eeb;padding: 3px 9px 2px 8px;color: white;border-radius: 3px;'"
												+ "onclick=\"editprofession('"
												+ studentPastProfession.stud_past_id
												+ "','"
												+ studentPastProfession.category
												+ "','"
												+ studentPastProfession.organization
												+ "','"
												+ studentPastProfession.location
												+ "','"
												+ studentPastProfession.profile
												+ "','"
												+ studentPastProfession.department
												+ "','"
												+ studentPastProfession.start_date
												+ "','"
												+ studentPastProfession.end_date
												+ "','"
												+ studentPastProfession.link
												+ "','"
												+ studentPastProfession.description
												+ "')\"></i><i class='fa fa-times' id='rem"
												+ studentPastProfession.stud_past_id
												+ "'"
												+ "onclick=\"removeStudentPast('"
												+ studentPastProfession.stud_past_id
												+ "','"
												+ studentPastProfession.category + "') style='background: red;padding: 3px 9px 2px 8px;color: white;border-radius: 3px;'\"</i>";
											if (studentPastProfession.category == 'P') {
												project_table.row.add([studentPastProfession.organization,
												studentPastProfession.profile,
												studentPastProfession.department,
												studentPastProfession.start_date,
												studentPastProfession.end_date,
												studentPastProfession.link,
												studentPastProfession.description,
													action_col]).draw(false);
												$("#project_div").show();
											} else if (studentPastProfession.category == 'T') {
												training_table.row.add([studentPastProfession.organization,
												studentPastProfession.profile,
												studentPastProfession.department,
												studentPastProfession.location,
												studentPastProfession.start_date,
												studentPastProfession.end_date, action_col]).draw(false);
												$("#training_div").show();
											} else if (studentPastProfession.category == 'W') {
												worksample_table.row.add(["<a href='http://" + studentPastProfession.link + "' target='_blank'>"
													+ studentPastProfession.link + "</a>", action_col]).draw(false);
												$("#worksample_div").show();
											} else if (studentPastProfession.category == 'I') {
												internship_table.row.add([studentPastProfession.organization,
												studentPastProfession.location,
												studentPastProfession.profile,
												studentPastProfession.department,
												studentPastProfession.start_date,
												studentPastProfession.end_date,
												studentPastProfession.link,
												studentPastProfession.description,
													action_col]).draw(false);
												$("#internship_div").show();
											} else if (studentPastProfession.category == 'J') {
												job_table.row.add([studentPastProfession.organization,
												studentPastProfession.location,
												studentPastProfession.profile,
												studentPastProfession.department,
												studentPastProfession.start_date,
												studentPastProfession.end_date,
												studentPastProfession.description,
													action_col]).draw(false);
												$("#job_div").show();
											}
										}

										function removeStudentProfRow(studentPastId, category) {
											if (category == 'P')
												project_table.row($('#rem' + studentPastId).parents('tr')).remove().draw();
											else if (category == 'T')
												training_table.row($('#rem' + studentPastId).parents('tr')).remove().draw();
											else if (category == 'W')
												worksample_table.row($('#rem' + studentPastId).parents('tr')).remove().draw();
											else if (category == 'I')
												internship_table.row($('#rem' + studentPastId).parents('tr')).remove().draw();
											else if (category == 'J')
												job_table.row($('#rem' + studentPastId).parents('tr')).remove().draw();
										}
									</script>
			</body>

			<script>

				$(document).ready(function() {
    $(document).on('change', '#upload-photo', function() {
        var input = $(this),
            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [label]);
    });

    $('#upload-photo').on('fileselect', function(event, label) {
        var input = $(this).siblings('.custom-file-label');
        if (input.length) {
            input.text(label);
        }
    });
});
			</script>


			</html>