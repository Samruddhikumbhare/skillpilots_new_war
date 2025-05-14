<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="user_session.jsp"%>

<!DOCTYPE html>
<html>

<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Student Dashboard</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
<link rel="icon" type="image/png" sizes="16x16"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
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
				<img
					src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg'
					alt="">
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
		<div class="xs-pd-20-10 pd-ltr-20 height-100-p">
			<div class="title pb-20 text-center">
				<h2 class="h3 mb-0"
					style="background: #0f2c7eeb; color: white; border-radius: 5px;">
					<span></span>

				</h2>
			</div>
			<div class="row">
				<div class="col-xl-4 mb-30" style="height: 440px;">
					<div class="card-box height-100-p pd-20 scrollbar force-overflow"
						id="style-3"
						style="position: relative; max-height: 100%; overflow: auto; border: 1px solid #d9d9d9; border-radius: 8px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);">
						<h6 class="h4 mb-0 text-center"
							style="font-weight: bold; margin-bottom: 15px; background: linear-gradient(45deg, #0f2c7e, #3b5998); color: white; border-radius: 6px; padding: 10px;">
							<i class="fa fa-list-ul"></i>&nbsp; Applied List
						</h6>
						<div id="appliedList">
							<ul class="list-group"
								style="margin: 0; padding: 0; list-style: none;">
								<!-- Dynamically populate the applied list -->
								<c:forEach var="applied" items="${appliedCompanies}">
									<li
										class="list-group-item d-flex justify-content-between align-items-center"
										style="padding: 15px; border-bottom: 1px solid #f0f0f0;">
										<div>
											<h6 class="mb-0 font-weight-bold" style="color: #0f2c7e;">${applied.companyName}</h6>
											<small class="text-secondary"><i
												class="fa fa-briefcase"></i>&nbsp;${applied.jobRole}</small><br>
											<small class="text-secondary"><i
												class="fa fa-calendar"></i>&nbsp;Applied On:
												${applied.appliedDate}</small>
										</div> <span class="badge badge-pill badge-primary"
										style="background: 
                                    ${applied.status == 'Applied' ? '#0f2c7e' : 
                                    applied.status == 'Pending' ? '#f7c10c' : 
                                    applied.status == 'REJECTED' ? '#dc3545' :
                                    applied.status == 'SELECTED' ? '#28a745' :
                                    applied.status == '1ST ROUND' ? '#17a2b8' :
                                    applied.status == '2ND ROUND' ? '#ffc107' :
                                    applied.status == '3RD ROUND' ? '#007bff' : '#6c757d'};
                                    color: white; font-size: 12px;">
											${applied.status} </span>

									</li>
								</c:forEach>
								<!-- Fallback message when the list is empty -->
								<c:if test="${empty appliedCompanies}">
									<p class="text-center text-secondary"
										style="margin-top: 20px; font-size: 14px;">
										<i class="fa fa-exclamation-circle"></i>&nbsp; No applications
										found.
									</p>
								</c:if>
							</ul>
						</div>
					</div>
				</div>


				<div class="col-xl-8 mb-30" style="height: 440px;">
					<div class="card shadow-lg border-0"
						style="max-height: 100%; overflow: auto; padding: 1em;">
						<div id="internshipList">
							<center>
								<p style="color: red; font-size: 1.5em; font-weight: bold;"
									id="filter-message"></p>
							</center>

							<c:forEach var="comp_add" items="${companyDrive}">
								<div class="mb-4 border rounded p-3 shadow-sm bg-light">
									<!-- Internship Description -->
									<div class="row mb-3">
										<div hidden>${comp_add.driveId}</div>
										<div hidden>${comp_add.companyId}</div>
										<div class="col-md-12">
											<h6 class="font-weight-bold text-secondary"
												data-toggle="tooltip" title="Description of internship">
												<details>
													<summary
														style="cursor: pointer; color: #007bff; font-weight: bold; font-size: 1em;">
														View Description </summary>
													<p class="mt-2"
														style="white-space: pre-wrap; overflow-wrap: break-word;">
														${comp_add.jobDescription != null ? 
                                        comp_add.jobDescription : "Description not provided"}
													</p>
												</details>
											</h6>
										</div>
										
										
									</div>

									<!-- Location and Company Name -->
									<div class="row mb-3">
										<div class="col-md-3 d-flex align-items-center">
											<h6 class="text-muted">
												<i class="fa fa-map-marker text-danger"></i>&nbsp;
												${comp_add.location != null ? comp_add.location : "Location not specified"}
											</h6>
										</div>
										<div class="col-md-3">
											<h6 class="text-muted">
												<i class="fa fa-circle"></i>
												${comp_add.jobType}
											</h6>
										</div>
										
										<div class="col-md-3">
											<h6 class="text-muted">
												<i class="fa fa-circle"></i>
												${comp_add.workingType}
											</h6>
										</div>
										
										<div class="col-md-12 text-right">
											<img src="get_logos?id=${comp_add.companyId}"
												class="img-thumbnail rounded-circle"
												style="max-width: 70px; max-height: 78px; margin-top: -56px;
												">
										</div>
										<div class="col-md-9">
											<a href="#" class="text-decoration-none"> <span
												class="text-primary font-weight-bold"
												onclick="getCompanyDetails('${comp_add.companyId}');">
													${comp_add.companyName != null ? 
                                    comp_add.companyName : "Company Name not available"}
											</span>
											</a>
										</div>
									</div>

									<!-- Job Details -->
									<div class="row text-center mb-3">
										<div class="col-md-2">
											<span class="text-secondary"><i
												class="fa fa-rupee-sign"></i>&nbsp;CTC</span>
											<div class="font-weight-bold">${comp_add.ctc != null ? comp_add.ctc : "Not disclosed"}
											</div>
										</div>
										<div class="col-md-2">
											<span class="text-secondary"><i
												class="fa fa-briefcase"></i>&nbsp;Job Role</span>
											<div class="font-weight-bold">${comp_add.jobRole != null ? comp_add.jobRole : "Role not specified"}
											</div>
										</div>
										<div class="col-md-2">
											<span class="text-secondary"><i
												class="fa fa-graduation-cap"></i>&nbsp;Criteria</span>
											<ul class="list-unstyled">
												<li>SSC: ${comp_add.ssc != null ? comp_add.ssc : "Not specified"}</li>
												<li>HSC: ${comp_add.hsc != null ? comp_add.hsc : "Not specified"}</li>
												<li>UG : ${comp_add.ug != null ? comp_add.ug : "Not specified"}</li>
											</ul>
										</div>
										<div class="col-md-2">
											<span class="text-secondary"><i class="fa fa-user"></i>&nbsp;Experience</span>
											<div class="font-weight-bold">${comp_add.experience != null ? comp_add.experience : "Fresher"}
											</div>
										</div>

										<div class="col-md-4">
											<span class="text-secondary"><i
												class="fa fa-calendar-alt"></i>&nbsp;Tentative Interview
												Date</span>
											<div class="font-weight-bold">${comp_add.interviewDate != null ? comp_add.interviewDate : "Not specified"}
											</div>
										</div>
									</div>

									<!-- Skills and Apply Button -->
									<div class="row align-items-center">
										<div class="col-md-6">
											<span class="text-secondary"><i class="fa fa-cogs"></i>&nbsp;Skills/Technology</span>
											<div class="font-weight-bold">${comp_add.skill != null ? comp_add.skill : "Skills not specified"}
											</div>
										</div>
										<div class="col-md-6 text-right">
											<button type="button" id="applyButton"
												class="btn btn-primary btn-sm px-4" data-toggle="modal"
												onclick="apply('${comp_add.jobRole}', '${comp_add.driveId}', '${comp_add.location}', '${comp_add.companyName}', '${comp_add.companyId}','${user.id}');">
												Apply</button>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>



			</div>
		</div>
	</div>





	<div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog"
		aria-labelledby="scheduleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="scheduleModalLabel">Internship
						Schedule</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" id="closeModalButton">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body" id="modalBodyContent">
					<!-- Schedule data will be populated here -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
	<input type="hidden" id="gif_file_path"
		value='<c:url value="/images/loading.gif"/>'>
	<c:if
		test="${role== ProjectConstants.hod_Role || role==ProjectConstants.dept_incharge_Role }">
		<input type="hidden" id="role" value="${role}" />
	</c:if>
	<c:if test="${log_type eq ProjectConstants.user_initials_student  }">
		<input type="hidden" id="student_log" value="${log_type}" />
	</c:if>
	<%@include file="modal_common.jsp"%>
	<%@include file="modal.jsp"%>
	<%@include file="modal_adv_schedule.jsp"%>
	<%@include file="comp_coll_details_modal.jsp"%>
	<!-- js -->
	<input type="hidden" id="role" value="${role}" />
	<input type="hidden" id="student_log" value="${log_type}" />
	<!-- Include SweetAlert2 CSS and JS -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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


	<script>

	function apply(jobRole, driveId, location, companyName, companyId, studentId) {
	    // First, check if the student has already applied for this drive
	    $.get("${pageContext.request.contextPath}/checkApplicationStatus", { studentId: studentId, driveId: driveId }, function(response) {
	        if (response) {
	            // If response is true, the student has already applied
	            Swal.fire({
	                title: 'Already Applied',
	                text: "You have already applied for the job role " + jobRole + " at " + companyName + ".",
	                icon: 'info',
	                confirmButtonText: 'OK'
	            });
	        } else {
	            // If response is false, proceed with the application process
	            Swal.fire({
	                title: 'Confirm Application',
	                html: "You are applying for the job role " + jobRole + " at " + companyName + ".",
	                icon: 'question',
	                showCancelButton: true,
	                confirmButtonText: 'Yes, Apply!',
	                cancelButtonText: 'Cancel',
	                reverseButtons: true,
	            }).then((result) => {
	                if (result.isConfirmed) {
	                    // Set the hidden input fields for the application process
	                    $('#rid').val(driveId);
	                    $('#cid').val(companyId);

	                    // Call the function to apply for the drive
	                    ApplyDrive(driveId, companyId, studentId);
	                }
	            });
	        }
	    });
	}


											function ApplyDrive(driveId,companyId,studentId) {
											   

											    $.ajax({
											        type: "POST",
											        url: "http://43.204.35.211:8000/newskill/applyCompDrive?companyId=" + companyId + "&driveId=" + driveId + "&studentId=" + studentId,
											        beforeSend: function () {
											            Swal.fire({
											                title: 'Loading...',
											                text: 'Please wait while we process your application.',
											                allowOutsideClick: false,
											                didOpen: () => {
											                    Swal.showLoading();
											                }
											            }).then(() => {
											                // Reload the page after the user closes the alert
											                location.reload();
											            });
											        },
											        success: function (response) {
											            Swal.close(); // Close the loader
											            Swal.fire({
											                icon: 'success',
											                title: 'Application Submitted',
											                text: 'Your application has been successfully submitted!',
											            });
											            console.log("Response received:", response);
											        },
											        error: function (xhr, status, error) {
											            Swal.close(); // Close the loader on error
											            console.error("Error submitting application:", error);
											            Swal.fire({
											                icon: 'success',
											                title: 'Application Submitted',
											                text: 'Your application has been successfully submitted!',
											            }).then(() => {
											                // Reload the page after the user closes the alert
											                location.reload();
											            });
											        }
											    });
											}

											</script>


</body>

</html>