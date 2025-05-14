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
					<span>Internship Portal</span>
				</h2>
			</div>

			<div class="row">
				<!-- Applied List Section -->
				<div class="col-xl-4 mb-30" style="height: 440px;">
					<div class="card-box height-100-p pd-20 scrollbar force-overflow"
						id="style-3"
						style="position: relative; max-height: 100%; overflow: auto; background: #f9f9f9; border-radius: 8px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
						<h6 class="h4 mb-0 text-center"
							style="font-weight: bold; margin-bottom: 10px; background: #0f2c7eeb; color: white; padding: 10px; border-radius: 6px;">
							Applied List</h6>
						<div id="appliedList">
							<!-- Dynamic Content Here -->

							<div id="appliedList"></div>
							<c:choose>
								<c:when test="${!empty appliedList}">
									<c:forEach var="application" items="${appliedList}">
										<div
											style="margin-bottom: 1em; padding: 1em; background: #ffffff; border: 1px solid #ddd; border-radius: 8px;">
											<h6 style="font-weight: bold; color: #333;">${application.companyName}</h6>
											<p style="color: #666; font-size: 14px;">
												<i class="fa fa-map-marker" style="color: red;"></i>
												${application.city} <br> <strong>Job Profile:</strong>
												${application.profile} <br> <strong>CTC:</strong>
												<c:choose>
													<c:when test="${application.ctc != null}">${application.ctc}</c:when>
													<c:otherwise>Not disclosed</c:otherwise>
												</c:choose>
											</p>
											<span style="font-size: 12px; color: gray;">Status:</span> <strong
												style="color: #007bff;">${application.status}</strong>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p style="text-align: center; color: gray;">No applications
										yet. Start applying now!</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<!-- Internship List Section -->
				<div class="col-xl-8 mb-30" style="height: 440px;">
					<div class="card-box" id="style-3"
						style="position: relative; max-height: 100%; overflow: auto; padding: 1em; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
						<div id="internshipList">
							<center>
								<p style="color: red; font-size: 1.5em; font-weight: bold;"
									id="filter-message"></p>
							</center>
							<c:forEach var="comp_add" items="${recruitmentList}">
								<div
									style="margin-bottom: 1.5em; padding: 1em; background: #ffffff; border: 1px solid #ddd; border-radius: 8px;">
									<div class="row">
										<div hidden>${comp_add.placementId}</div>
										<div class="col-md-12">
											<h6 style="font-weight: 600; color: #333;">
												<details>
													<summary
														style="cursor: pointer; color: #007bff; font-weight: bold;">Read
														Description</summary>
													<p
														style="white-space: pre-wrap; overflow-wrap: break-word; margin-top: 0.5em; color: #555;">${comp_add.description}</p>
												</details>
											</h6>
										</div>
									</div>
									
									<div class="row mt-3">
										<div class="col-md-4">
											<h6 style="font-weight: 500; color: #666;">
												<i class="fa fa-map-marker" style="color: red;"></i>
												${comp_add.city}
											</h6>
										</div>
										<div class="col-md-8">
											<a href="#" style="text-decoration: none;"> <span
												class="pointer cmpname cmp${comp_add.companyName}"
												onclick="getCompanyDetails('${comp_add.companyId}');"
												id="${comp_add.companyName}"
												style="color: #007bff; font-weight: bold;">
													${comp_add.companyName} </span>
											</a>
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-4">
											<span style="font-size: 14px; color: gray;">CTC</span><br>
											<strong><i class="fa fa-rupee"></i> <c:choose>
													<c:when test="${comp_add.ctc != null}">${comp_add.ctc}</c:when>
													<c:otherwise>Not disclosed</c:otherwise>
												</c:choose> </strong>
										</div>
										<div class="col-md-8">
											<span style="font-size: 14px; color: gray;">Job Profile</span><br>
											<strong>${comp_add.profile}</strong>
											${comp_add.skills}
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-12 text-end">
											<button type="button" id="applyButton"
												class="btn btn-primary btn-sm" data-toggle="modal"
												onclick="checkIfAppliedAndApply('${user.id}','${comp_add.placementId}','${user.college_id}')"
												style="padding: 5px 12px;">Apply</button>
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




	<div class="modal fade" id="confirmAdvertisement" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content   mydiv">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Are you sure
						you want to apply?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<span>You are applying for internship in <strong><span
								style="color: #1B00FF"></span></strong> at <strong> <span
								id="company" style="color: #1B00FF"></span>
						</strong> for <strong style="color: #1B00FF"><span
								style="color: #1B00FF"></span> weeks</strong> are you sure?
						</span>
					</div>


					<input type="hidden" name='sid' id="sid" value="${user.id}">
					<input type="hidden" name='rid' id="rid" value=""> <input
						type="hidden" name='cid' id="cid" value="${user.college_id}">
					<button type="submit" class="btn btn-success"
						onclick="ApplyDrive()">Submit</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>

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

	</div>
	<%@include file="footer.jsp"%>
	</div>
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


	<script type="text/javascript">

	function checkIfAppliedAndApply(studentId, placementId, collegeId) {
	    // API URL to check application status

	    const statusApiUrl = "http://43.204.35.211:8000/newskill/exists?studentId="+studentId+"&reqruitmentId="+placementId;

	    // Make an API call to check if the user has already applied
	    fetch(statusApiUrl)
	        .then(response => {
	            console.log('Response Status:', response.status); // Log status
	            console.log('Response Headers:', response.headers); // Log headers

	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }

	            // Check if the response is JSON
	            const contentType = response.headers.get("content-type");
	            if (contentType && contentType.includes("application/json")) {
	                return response.json(); // Parse JSON if content-type is JSON
	            } else {
	                throw new Error('Response is not in JSON format');
	            }
	        })
	        .then(data => {
	            console.log('API Response:', data); // Log the actual API response

	            // Check if the response indicates the user has already applied
	            if (data === true) {
	                // If already applied, show SweetAlert notification
	                Swal.fire({
	                    icon: 'info',
	                    title: 'Already Applied',
	                    text: 'You have already applied for this drive!',
	                    confirmButtonText: 'OK'
	                });
	            } else if (data === false) {
	                // If not applied, proceed to apply
	                applyForDrive(studentId, placementId, collegeId);
	            } else {
	                // Handle unexpected responses
	                throw new Error('Unexpected response format from API');
	            }
	        })
	        .catch(error => {
	            // Handle errors during fetch or API call
	            console.error('Error checking application status:', error);
	            Swal.fire({
	                icon: 'error',
	                title: 'Error',
	                text: 'Unable to check your application status. Please try again later.'
	            });
	        });
	}

	function applyForDrive(studentId, placementId, collegeId) {
	    // API URL to apply for a drive
	    var applyApiUrl = "http://43.204.35.211:8000/newskill/apply?studentId=" + studentId + "&recruitId=" + placementId + "&collegeId=" + collegeId;

	    // Create loader element
	    const loader = document.createElement('div');
	    loader.id = 'cursor-loader';
	    loader.style.position = 'absolute';
	    loader.style.width = '20px';
	    loader.style.height = '20px';
	    loader.style.border = '3px solid #f3f3f3';
	    loader.style.borderTop = '3px solid #3498db';
	    loader.style.borderRadius = '50%';
	    loader.style.animation = 'spin 1s linear infinite';
	    document.body.appendChild(loader);

	    // Update loader position to follow cursor
	    document.addEventListener('mousemove', function (e) {
	        loader.style.top = `${e.clientY + 5}px`;
	        loader.style.left = `${e.clientX + 5}px`;
	    });

	    // Show loader and make API call
	    loader.style.display = 'block';
	    fetch(applyApiUrl, { method: 'POST' })
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }
	            return response; // Assuming the response is JSON
	        })
	        .then(data => {
	            // Handle success response
	            Swal.fire({
	                icon: 'success',
	                title: 'Application Submitted',
	                text: 'You have successfully applied for this drive!',
	                confirmButtonText: 'OK'
	            }).then(() => {
	                location.reload(); // Reload the page after submission
	            });
	        })
	        .catch(error => {
	            console.error('Error submitting application:', error);
	            Swal.fire({
	                icon: 'error',
	                title: 'Error',
	                text: 'Unable to submit your application. Please try again later.'
	            });
	        })
	        .finally(() => {
	            // Remove loader after API call
	            loader.remove();
	        });
	}

	// Add CSS for the spinner
	const style = document.createElement('style');
	style.innerHTML = `
	    @keyframes spin {
	        0% { transform: rotate(0deg); }
	        100% { transform: rotate(360deg); }
	    }
	`;
	document.head.appendChild(style);


											</script>



</body>

</html>