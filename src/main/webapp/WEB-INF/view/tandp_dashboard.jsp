<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@include file="user_session.jsp" %>

			<!DOCTYPE html>
			<html>

			<head>
				<!-- Basic Page Info -->
				<meta charset="utf-8">
				<title>SkillPilots | T&P Dashboard</title>

				<!-- Site favicon -->
				<link rel="apple-touch-icon" sizes="180x180"
					href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
				<link rel="icon" type="image/png" sizes="16x16"
					href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>

				<!-- Mobile Specific Metas -->
				<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

				<!-- Google Font -->
				<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
					rel="stylesheet">
				<!-- CSS -->
				<link rel="stylesheet" type="text/css"
					href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css'>
				<link rel="stylesheet" type="text/css"
					href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css'>
				<link rel="stylesheet" type="text/css"
					href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css'>
				<link rel="stylesheet" type="text/css"
					href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css'>
				<link rel="stylesheet" type="text/css"
					href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css'>
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.css"
					integrity="sha512-qGaAtuKvSCWSaqGi3MX0T+h3SYcOUlrwpURUWgIgCsLQ92cBVzNCDtIvvB0/NDawwH2RcHAYvzEYS25+jzMTnQ=="
					crossorigin="anonymous" referrerpolicy="no-referrer" />
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
						/* background: #ffffff; */
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

					.pointer {
						cursor: pointer;
					}

					#style-3::-webkit-scrollbar {
						width: 6px;
						background-color: #F5F5F5;
					}

					#style-3::-webkit-scrollbar-thumb {
						background-color: #0f2c7eeb;
					}

					#div_location::-webkit-scrollbar-track {
						-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
						background-color: #F5F5F5;
					}

					#div_location::-webkit-scrollbar {
						width: 6px;
						background-color: #0f2c7eeb;
					}

					#div_location::-webkit-scrollbar-thumb {
						background-color: #0f2c7eeb;
					}

					#div_tech::-webkit-scrollbar-track {
						-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
						background-color: #F5F5F5;
					}

					#div_tech::-webkit-scrollbar {
						width: 6px;
						background-color: #F5F5F5;
					}

					#div_tech::-webkit-scrollbar-thumb {
						background-color: #0f2c7eeb;
					}

					#div_dept::-webkit-scrollbar-track {
						-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
						background-color: #F5F5F5;
					}

					#div_dept::-webkit-scrollbar {
						width: 6px;
						background-color: #F5F5F5;
					}

					#div_dept::-webkit-scrollbar-thumb {
						background-color: #0f2c7eeb;
					}

					hr {
						border-top-width: medium;
						background: #0f2c7eeb;
					}
				</style>
			</head>

			<body>
				<div class="pre-loader">
					<div class="pre-loader-box">
						<div class="loader-logo">
							<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg'
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
									alt="" class="dark-logo"> <img
									src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg'
									alt="" class="light-logo">
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
							<div class="page-header">
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="title">
											<h4>T&P Dashboard</h4>
										</div>
										<nav aria-label="breadcrumb" role="navigation">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/college_dashboard">Home</a></li>
												<li class="breadcrumb-item active" aria-current="page">T&P Dashboard
												</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
							<div class="row pb-10" style="margin-left: 28%;">
								<div class="col-md-3 mb-20">
									<div class="card-box min-height-200px pd-20 mb-20" data-bgcolor="#455a64"
										style="background-color: rgb(69, 90, 100);">
										<div class="d-flex justify-content-between pb-20 text-white">
											<div class="icon h1 text-white">
												<i class="icon-copy fa fa-university" aria-hidden="true"></i>
												<!-- <i class="icon-copy fa fa-stethoscope" aria-hidden="true"></i> -->
											</div>
											<div class="font-14 text-right">
											</div>
										</div>

										<div class="d-flex justify-content-between align-items-end " >
											<div class="text-white ">
												<div class="font-14 ">

													<a class="text-white" href="createRecrutment">Recruitment</a>
												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 mb-20">
									<div class="card-box min-height-200px pd-20" data-bgcolor="#265ed7"
										style="background-color: rgb(38, 94, 215);">
										<div class="d-flex justify-content-between pb-20 text-white">
											<div class="icon h1 text-white">
												<i class="icon-copy fa fa-user" aria-hidden="true"></i>
											</div>
											<div class="font-14 text-right">
											</div>
										</div>
										<div class="d-flex justify-content-between align-items-end">
											<div class="text-white">
												<a class="text-white" href="tandp_applied_list">Applied
													Students</a>
											</div>
											<div class="resize-triggers">
												<div class="expand-trigger">
													<div style="width: 151px; height: 71px;"></div>
												</div>
												<div class="contract-trigger"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 mb-20">

								</div>

							</div>
						</div>
						<%@include file="modal_common.jsp" %>

					</div>












					</div>
					<%@include file="footer.jsp" %>
						</div>
						<input type="hidden" id="gif_file_path" value='<c:url value="/images/loading.gif"/>'>
						<c:if test="${role== ProjectConstants.hod_Role || role==ProjectConstants.dept_incharge_Role }">
							<input type="hidden" id="role" value="${role}" />
						</c:if>
						<c:if test="${log_type eq ProjectConstants.user_initials_student  }">
							<input type="hidden" id="student_log" value="${log_type}" />
						</c:if>
						<%@include file="modal_common.jsp" %>
							<%@include file="modal.jsp" %>
								<%@include file="modal_adv_schedule.jsp" %>
									<%@include file="comp_coll_details_modal.jsp" %>
										<!-- js -->
										<input type="hidden" id="role" value="${role}" />
										<input type="hidden" id="student_log" value="${log_type}" />

										<script
											src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
										<script
											src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.js"
											integrity="sha512-rmeGgGFs1GsDm4pB4vQNn7ZJLQv9s8gVlaEbn+u+k+nKU0UVyRcEsfrNXxOZ6Wznx4oOOYfUCWUhmsFuc2PAbw=="
											crossorigin="anonymous" referrerpolicy="no-referrer"></script>
										<script
											src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
										<script
											src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>

										<script
											src="${pageContext.request.contextPath}/style/dist/js/myjs/showmore_or_showless.js"></script>
										<script
											src="${pageContext.request.contextPath}/style/dist/js/myjs/internship_schedule.js"></script>
										<script
											src="${pageContext.request.contextPath}/style/dist/js/myjs/companyadvforcollege.js"></script>
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


										<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
										<script
											src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2${pageContext.request.contextPath}/style/dist/umd/popper.min.js"></script>
										<script
											src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
										<script type="text/javascript">

											$(document).ready(function () {
												getnextAdvertisement(0, 0);
											});

											function getAdvertisementStatus(tech, cmp, duration, id, companyName) {
												// Your function implementation here
												console.log("Technology: " + tech);
												console.log("Company ID: " + cmp);
												console.log("Duration: " + duration);
												console.log("ID: " + id);
												console.log("comoany Nme" + companyName);


												var technology = tech;
												var comp = cmp;
												var dur = duration;
												var avd_id = id;
												var companyName = companyName;
												console.log("Adver" + avd_id)

												$("#confirmAdvertisement").find('.modal-body span').html("You are applying for an internship in <strong>" + tech + "</strong> at <strong>" + companyName + "</strong> for <strong>" + dur + " weeks</strong>. Are you sure?");
												$('#hid').val(id); // Set advertisement ID in the hidden input field
												console.log("djdjdjdj" + avd_id)
												$.ajax({
													type: "GET",
													url: "${pageContext.request.contextPath}/getInternshipStatus?id=" + avd_id,
													success: function (response) {
														console.log("response" + response)
														if (response == "ongoing") {
															swal(already_have_ongoing_internship);

														} else if (response == "pending" || response == "1" || response == "2" || response == "T" || response == "D") {
															$('#internshipPending').modal('toggle');
														} else if (response == "A") {
															$('#internshipApproved').modal('toggle');
														} else if (response == "R") {
															alert("", "You have a rejected request for this industry which has not passed the industry's cooling period. " +
																"Please try again after somedays.", "error");
															/*alertMsg("You have a rejected request for this industry which has not passed the industry's cooling period. " +
															"Please try again after somedays.");*/
														} else if (response == "S") {
															alert("", "Already applied by Student.", "error");
															//alertMsg("Already applied by Student.");
														} else if (response == "c") {
															swal("", "Already applied by College.", "success");
															//alertMsg("Already applied by College.");
														} else {
															confirmAdversemnt(tech, comp, dur, avd_id);
														}
													},

												});
											}

											function confirmAdversemnt(tech, cmp, duration, id) {
												console.log("avd id")
												$('.modal-body #tech').text(tech);
												$('.modal-body #company').text($('#' + cmp).text());
												$('#hid').val(id);
												$('#redirect_page').val('stud_home');
												$('.modal-body #duration').text(duration);
												$('#confirmAdvertisement').modal('show');
											}




											function applyInternship(commonId, company_id, advertisement_id, companyName, description, location, duration, stipend, capacity, technology) {
												// Update the input fields in the modal with the selected data
												document.getElementById('commonId').value = commonId;
												document.getElementById('company_id').value = company_id;
												document.getElementById('advertisement_id').value = advertisement_id;
												document.getElementById('companyName').value = companyName;
												document.getElementById('internshipDescription').value = description;


												document.getElementById('location').value = location;
												document.getElementById('duration').value = duration;
												document.getElementById('stipend').value = stipend;
												document.getElementById('capacity').value = capacity;
												document.getElementById('technology').value = technology;
												var student_id = '${user.id}';
												document.getElementById('student_id').value = student_id;
												// Show the modal
												$('#confirmAdvertisement').modal('show');
											}
											function confirmApply() {


												document.getElementById('applyForm').submit();

												$('#confirmAdvertisement').modal('hide');
											}
										</script>

										<!-- working script for comented filter -->
										<script>
											function filterInternships() {
												const location = document.getElementById('locationFilter').value;
												const company = document.getElementById('companyFilter').value;
												const technology = document.getElementById('technologyFilter').value;
												const duration = document.getElementById('durationFilter').value;
												const stipend = document.getElementById('stipendFilter').value;

												const internshipItems = document.querySelectorAll('.internship-item');

												internshipItems.forEach(item => {
													const itemLocation = item.getAttribute('data-location');
													const itemCompany = item.getAttribute('data-company');
													const itemTechnology = item.getAttribute('data-technology');
													const itemDuration = item.getAttribute('data-duration');
													const itemStipend = item.getAttribute('data-stipend');

													let display = true;

													if (location && itemLocation !== location) {
														display = false;
													}
													if (company && itemCompany !== company) {
														display = false;
													}
													if (technology && itemTechnology !== technology) {
														display = false;
													}
													if (duration && parseInt(itemDuration) !== parseInt(duration)) {
														display = false;
													}
													if (stipend && parseFloat(itemStipend) !== parseFloat(stipend)) {
														display = false;
													}

													item.style.display = display ? '' : 'none';
												});
											}

											function clearFilter() {
												document.getElementById('locationFilter').value = '';
												document.getElementById('companyFilter').value = '';
												document.getElementById('technologyFilter').value = '';
												document.getElementById('durationFilter').value = '';
												document.getElementById('stipendFilter').value = '';
												filterInternships();
											}
										</script>
										<script>




											function filterInternships3() {
												const selectedLocations = document.querySelectorAll('input[name="location"]:checked');
												const selectedDepts = document.querySelectorAll('input[name="dept"]:checked');
												const selectedTechs = document.querySelectorAll('input[name="tech"]:checked');
												const selectedStipend = document.querySelector('input[name="stipend"]:checked');
												const selectedDurationOperator = document.querySelector('input[name="duration"]:checked');
												const durationValue = document.getElementById('duration_val').value.trim();

												const internshipItems = document.querySelectorAll('.internship-item');
												let anyDisplayed = false; // Flag to track if any item is displayed after filtering

												internshipItems.forEach(item => {
													const itemLocation = item.getAttribute('data-location');
													const itemDept = item.getAttribute('data-dept');
													const itemTech = item.getAttribute('data-tech');
													const itemStipend = item.getAttribute('data-stipend');
													const itemDuration = item.getAttribute('data-duration');

													let display = true;

													// Apply filters

													// Location Filter
													if (selectedLocations.length > 0) {
														const locationMatch = Array.from(selectedLocations).some(location => location.value === itemLocation);
														if (!locationMatch) {
															display = false;
														}
													}

													// Department Filter
													if (selectedDepts.length > 0) {
														const deptMatch = Array.from(selectedDepts).some(dept => dept.value === itemDept);
														if (!deptMatch) {
															display = false;
														}
													}

													// Technology Filter
													if (selectedTechs.length > 0) {
														const techMatch = Array.from(selectedTechs).some(tech => tech.value === itemTech);
														if (!techMatch) {
															display = false;
														}
													}

													// Stipend Filter
													if (selectedStipend) {
														const isPaid = selectedStipend.value === "1";
														const stipendValue = parseFloat(itemStipend);
														if ((isPaid && stipendValue === 0) || (!isPaid && stipendValue !== 0)) {
															display = false;
														}
													}

													// Duration Filter
													if (selectedDurationOperator && durationValue) {
														const durationOperator = selectedDurationOperator.value;
														const itemDurationValue = parseInt(itemDuration);
														if (durationOperator === ">=" && itemDurationValue < durationValue) {
															display = false;
														}
														if (durationOperator === "<=" && itemDurationValue > durationValue) {
															display = false;
														}
													}

													if (display) {
														anyDisplayed = true;
														item.style.display = '';
													} else {
														item.style.display = 'none';
													}
												});

												// Show message if no items match the filter criteria
												const messageElement = document.getElementById('filter-message');
												if (!anyDisplayed) {
													messageElement.innerText = "No items found matching the selected criteria.";
												} else {
													messageElement.innerText = "";
												}
											}


										</script>
										<script>
											function filterInternships2() {
												var searchValue = document.getElementById('search_location').value.toLowerCase();
												var checkboxes = document.querySelectorAll('#div_location .checkbox');
												checkboxes.forEach(function (checkbox) {
													var label = checkbox.querySelector('label').textContent.toLowerCase();
													if (label.includes(searchValue)) {
														checkbox.style.display = 'block';
													} else {
														checkbox.style.display = 'none';
													}
												});
											}
										</script>
										<script type="text/javascript">
											function fetchInternshipSchedule(advId) {
												console.log("Fetching schedule for advertisement ID:", advId);
												$.ajax({
													type: "GET",
													url: "getInternshipScheduleByAdv_id",
													data: { adv_id: advId },
													success: function (response) {
														console.log("Response receiveda:", response);
														response = JSON.parse(response); // Parse the JSON string

														if (!response.empty) {
															if (response.internshipSchedule && response.internshipSchedule.length > 0) {
																var schedules = response.internshipSchedule;



																console.log("Number of schedules:", schedules.length);

																var table = '<table border="1"><tr><th>ID</th><th>Schedule 1</th><th>Schedule 2</th><th>Schedule 3</th><th>Schedule 4</th></tr>';
																schedules.forEach(function (schedule) {
																	table += '<tr>';
																	table += '<td>' + schedule.schedule_id + '</td>';
																	table += '<td>' + schedule.schedule_1 + '</td>';
																	table += '<td>' + schedule.schedule_2 + '</td>';
																	table += '<td>' + schedule.schedule_3 + '</td>';
																	table += '<td>' + schedule.schedule_4 + '</td>';
																	table += '</tr>';
																});
																table += '</table>';
																document.getElementById('scheduleTable').innerHTML = table;
															} else {
																console.log("Internship schedules found, but no details are present.");
															}
														} else {
															console.log("No internship schedules found.");
															document.getElementById('scheduleTable').innerHTML = "No internship schedules found.";
														}
													},
													error: function (xhr, status, error) {
														console.error("Error fetching internship schedule:", error);
														document.getElementById('scheduleTable').innerHTML = "Error fetching internship schedule.";
													}
												});
											}
										</script>
										
			</body>

			</html>