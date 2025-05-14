<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>SkillPilots | Job Advertisements</title>



<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico" />

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet" />
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css" />
"
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.14/css/bootstrap-multiselect.css"
	integrity="sha512-EvvoSMXERW4Pe9LjDN9XDzHd66p8Z49gcrB7LCUplh0GcEHiV816gXGwIhir6PJiwl0ew8GFM2QaIg2TW02B9A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
				window.dataLayer = window.dataLayer || [];
				function gtag() {
					dataLayer.push(arguments);
				}
				gtag("js", new Date());

				gtag("config", "UA-119386393-1");
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
	font-family: "Inter", sans-serif;
	border-radius: 1px;
}

.dataTable {
	white-space: nowrap;
}

.datepicker table tr td.redday, .datepicker table tr th.redday {
	background: none !important;
	background-color: red !important;
	background-image: none !important;
	color: White !important;
	font-weight: bold !important;
	font-size: 12pt;
}

#errmsg {
	color: red;
}

table.dataTable>tbody>tr.child ul li:first-child {
	padding-top: 0;
	display: block;
	width: 300px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

table.dataTable thead th {
	padding: 0px 0px;
	text-align: center !important;
}

table.dataTable tbody td {
	padding: 10px 0px;
	text-align: center !important;
}

table.dataTable tbody td.child {
	text-align: left !important;
}

.multiselect-container {
	overflow: auto;
	max-height: 150px;
	min-width: 250px;
}

.multiselect {
	margin: 0px !important;
}

.checkbox input[type="checkbox"], label.checkbox-inline input[type="checkbox"]
	{
	opacity: 1;
	position: absolute;
	margin: 0;
	z-index: 1000;
	width: 47px !important;
	height: 17px !important;
	overflow: hidden;
	left: 0;
	pointer-events: none;
}

.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover
	{
	background-color: white !important;
}

.checkbox {
	color: black !important;
}

.box .box-body .input-group {
	margin: 0px;
}

.wrapper {
	overflow-x: hidden;
	overflow-y: auto;
}

.page-link {
	height: 34px;
}

.datepicker table tr td.redday, .datepicker table tr th.redday {
	background: none !important;
	background-color: red !important;
	background-image: none !important;
	color: White !important;
	font-weight: bold !important;
	font-size: 12pt;
}

#errmsg {
	color: red;
}

table.dataTable>tbody>tr.child ul li:first-child {
	padding-top: 0;
	display: block;
	width: 300px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

table.dataTable thead th {
	padding: 0px 0px;
	text-align: center !important;
}

table.dataTable tbody td {
	padding: 10px 0px;
	text-align: center !important;
}

table.dataTable tbody td.child {
	text-align: left !important;
}

.multiselect-container {
	overflow: auto;
	max-height: 150px;
}

.multiselect-container {
	overflow: auto;
	max-height: 150px;
}

.checkbox input[type="checkbox"], label.checkbox-inline input[type="checkbox"]
	{
	opacity: 1;
	position: absolute;
	margin: 0;
	z-index: 1000;
	width: 47px !important;
	height: 17px !important;
	overflow: hidden;
	left: 0;
	pointer-events: none;
}

.multiselect {
	margin: 0px !important;
}

.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover
	{
	background-color: white !important;
}

.checkbox {
	color: black !important;
}

/* below css file for daily schedule scroll */
#test_daily {
	display: block;
	height: 300px;
	overflow: auto;
}

#daily_thead, #test_daily tr {
	display: table;
	width: 100%;
	table-layout: fixed;
}

#daily_thead {
	width: calc(100% - 1em);
}

/* below css file for weekly schedule scroll */
#test_weekly {
	display: block;
	height: 300px;
	overflow: auto;
}

#weekly_thead, #test_weekly tr {
	display: table;
	width: 100%;
	table-layout: fixed;
}

#weekly_thead {
	width: calc(71% - 1em);
}

.modal-dialog {
	width: 750px;
	/* Keeps the modal width fixed */
	max-width: 100%;
	/* Ensures it is responsive */
}

.modal-content {
	max-height: 80vh;
	/* Limits the height to 80% of the viewport */
	overflow-y: auto;
	/* Adds vertical scroll if content overflows */
}

.modal-body {
	word-wrap: break-word;
	/* Ensures long text wraps within the modal */
}


  #cursorLoader {
        display: none;
        position: absolute;
        z-index: 9999;
        width: 10px;
        height: 10px;
/*         background-color: black; /* Black dot */
 */        border-radius: 50%; /* Make it circular */
    }
@keyframes spin {
    from {
        transform: rotate(0deg);
    }
    to {
        transform: rotate(360deg);
    }
}
.d-flex {
    gap: 10px; /* Space between buttons */
}

.applied-students-btn, .add-recruitment-btn {
    min-width: 150px; /* Ensures proper width */
    text-align: center;
}

@media (max-width: 768px) {
    .d-flex {
        flex-direction: column;
        align-items: center;
        gap: 10px;
    }
    
    .applied-students-btn, .add-recruitment-btn {
        width: 90%; 
    }
}

</style>
</head>

<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img
					src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
					alt="" />
			</div>
			<div class="loader-progress" id="progress_div">
				<div class="bar" id="bar1"></div>
			</div>
			<div class="percent" id="percent1">0%</div>
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
						class="btn btn-outline-primary sidebar-light">White</a> <a
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
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
				alt="" class="dark-logo" /> <img
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg"
				alt="" class="light-logo" />
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="mobile-menu-overlay"></div>
	
	
	<div id="cursorLoader" style="display: none; position: absolute; z-index: 9999;">
    <div class="spinner"></div>
</div>
	

	<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">


<%-- <div class="title pb-20 text-center" style="display:flex; justify-content: flex-end; flex-direction: row; align-items: center">
				<h4 class="h4 mb-0" style="margin-right:10px">
					<a href="${pageContext.request.contextPath}/studentDriveRequest"
						class="btn btn-primary btn-sm"
						>Applied Students </a>
					<!-- <button class="btn btn-primary btn-sm" onclick="showAdversementForm()"
									style="margin-left: 85%;">Add
									Advertisements</button> -->
				</h4>
				<button type="button" class="btn btn-primary" data-toggle="modal"
					onclick="showAdversementForm()">Add Recruitment</button>
			</div> --%>

			<div class="title pb-20 text-center">
    <div class="d-flex justify-content-end flex-wrap gap-2">
        <a href="${pageContext.request.contextPath}/studentDriveRequest"
            class="btn btn-primary btn-sm applied-students-btn">Applied Students</a>
        
        <button type="button" class="btn btn-primary add-recruitment-btn"
            data-toggle="modal" data-target="#placement"
            onclick="showAdversementForm()">Add Recruitment</button>
    </div>
</div>

			<div class="card-box mb-30">
				<div class="pd-20">
					<table id=" " class="data-table table hover">
						<thead class="thead-light" style="height: 34px">
							<tr>
								<th></th>
								<th hidden>driveId</th>
								<th>Actions</th>
								<th>Job Type</th>
								<th>Working Type</th>
								<th>Company Name</th>
								<th>Skill</th>
								<th>Job Role</th>
								<th>Experience</th>
								<th>Criteria</th>
								<th>Department
								<th>
								<th>CTC</th>
								<th>Interview Date</th>
								<th>Job Description</th>
								<th>Location</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${drive}" var="item">
								<tr>
									<td></td>
									<td hidden><span>${item.driveId}</span></td>
									<td>
										<!-- Edit Button --> <span class="pointer"
										style="background: #1b00ff; color: white; padding: 2px 5px; margin-right: 4px; border-radius: 4px;"
										data-toggle="modal" data-target="#placement"
										data-placement="top"
										title="Click Here To Edit Your Advertisement"
										onclick="edit('${item.companyName}', '${item.skill}', '${item.jobRole}', '${item.ctc}', '${item.interviewDate}', 
                       '${item.jobDescription}', '${item.location}', '${item.driveId}', '${item.ssc}', '${item.hsc}', 
                       '${item.ug}', '${item.experience}','${item.jobType}','${item.workingType}')">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
									</span> <!-- Delete Button --> <a
										href="deleteRecruitment?driveId=${item.driveId}"
										style="background: #e4350d; padding: 2px 5px; border-radius: 4px;"
										data-toggle="tooltip" data-placement="top"
										title="Click Here To Delete Your Advertisement"> <i
											style="color: white" class="fa fa-trash"></i>
									</a>
									</td>
									<td>${item.jobType}</td>
									<td>${item.workingType}</td>

									<%-- <td><span>${item.id}</span></td> --%>
									<td>${string2}${item.companyName}</td>

									<td><span>${item.skill}</span></td>
									<td><span>${item.jobRole}</span></td>
									<td><span>${item.experience}</span></td>
									<td><span style="color: red;"> SSC: </span> ${item.ssc}%,
										<span style="color: red;"> HSC: </span> ${item.hsc}%, <span
										style="color: red;"> UG: </span> ${item.ug}%</td>
									<td><span>${item.deptName}</span></td>
									<td></td>
									<td><span>${item.ctc}</span></td>
									<td><span>${item.interviewDate}</span></td>
									<td><c:if test="${fn:length(item.jobDescription) > 25}">
											<c:set var="shortJobDescription"
												value="${fn:substring(item.jobDescription, 0, 15)}" />
															${shortJobDescription}
															<a href="javascript:void(0);"
												onclick="readmore('${item.jobDescription}');"
												style="font-size: 11px"> read more.. </a>
										</c:if> <c:if test="${fn:length(item.jobDescription) <= 25}">
											<span>${item.jobDescription}</span>
										</c:if></td>

									<td><span>${item.location}</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal fade" id="placement" tabindex="-1"
				aria-labelledby="placementModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="placementModalLabel">Recruitment
								Info:</h5>
							<button type="button" class="btn-close" data-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="card-box mb-30">
							<div class="pd-20">
								<%-- <form id="schedform" action="${pageContext.request.contextPath}/addRecruitment"
									method="post">
									--%>
								<div class="col-xs-12" id="comp_adv_form">
									<div class="box">
										<div class="box-body">
											<span class="glyphicon glyphicon-remove panel-title"
												style="margin: 5px; float: right; cursor: pointer"
												onclick="closeForm();"> </span>
										</div>
										<div class="box-body">
											<input id="driveId" name="driveId" type="hidden"
												value="${item.driveId}" /> <input id="company_id"
												name="companyId" class="form-control" type="hidden"
												value="${user.id}" /> <input id="companyNames"
												name="companyNamea" class="form-control" type="hidden"
												value="${user.username}" />

											<!-- Start data table -->
											<div class="row">
												<!-- Company Name Field -->
												<div class="col-md-4">
													<div class="form-group">
														<label>* Company Name</label> <input id="companyName"
															name="companyName" class="form-control" readonly="true"
															type="text" value="${companyName}" maxlength="50"
															style="height: 35px" required />
													</div>
												</div>

												<!-- Skill Selection Field -->
												<div class="col-md-4">
													<div class="form-group">
														<label>* Skill</label> <select id="skill" name="skill"
															required style="padding: 0px !important; height: 76px"
															class="form-control" multiple="multiple">
															<c:forEach var="tech" items="${allTechnology}">
																<option value="${tech}">${tech}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<!-- Location Field -->
												<div class="col-md-4">
													<div class="form-group">
														<label>Location</label> <input id="location"
															name="location" required class="form-control" type="text"
															placeholder="Enter Location" style="height: 35px" />
													</div>
												</div>
											</div>

											<div class="row">
												<!-- Interview Date Field -->
												<div class="col-md-4">
													<div class="form-group">
														<label>Interview Date</label> <input type="interviewDate"
															required name="interviewDate"
															placeholder="Enter Interview Date" id="interviewDate"
															class="form-control date-picker" readonly="true"
															style="height: 35px" />
													</div>
												</div>

												<!-- CTC Field -->
												<div class="col-md-4">
													<div class="form-group">
														<label>CTC</label> <input id="ctc" name="ctc" required
															class="form-control" type="text" value="0.0"
															placeholder="Enter CTC" style="height: 35px" />
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label>Job Role</label> <input id="jobRole" name="jobRole"
															required class="form-control" type="text"
															placeholder="Enter Job Role" style="height: 35px" />
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label>Experience</label> <input id="experience" required
															name="experience" class="form-control" type="text"
															placeholder="Experience Required" style="height: 35px" />
													</div>
												</div>

												<div class="col-md-4">
													<div class="form-group">
														<label>SSC %</label> <input id="ssc" name="ssc"
															class="form-control" type="text"
															placeholder="Enter SSC %" style="height: 35px" />
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label>HSC/Equivalent %</label> <input id="hsc" name="hsc"
															class="form-control" type="text"
															placeholder="Enter HSC/Equivalent %" style="height: 35px" />
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group">
														<label>UG %</label> <input id="ug" name="ug"
															class="form-control" type="text" placeholder="Enter UG %"
															style="height: 35px" />
													</div>
												</div>
											</div>

											<div class="row">
												<!-- Job Description Field -->
												<div class="col-md-6">
													<div class="form-group">
														<label>* Job Description</label>
														<textarea id="description" name="jobDescription" required
															class="form-control" rows="3"
															placeholder="Description for the Job"></textarea>
													</div>
												</div>

											</div>
											<div class="col-md-4"
												style="position: absolute; right: 248px; top: 23em;">
												<div class="form-group">
													<label>* Departments</label> <select id="department"
														name="deptName" class="form-control" multiple="multiple"
														style="height: 76px;" required="true">
														<option value="Any">Any</option>
														<c:forEach var="deptName" items="${deptName}">
															<option value="${deptName}">${deptName}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<!-- Job Type Dropdown -->
											<div class="form-group">
												<label for="jobType">Select Job Type</label> <select
													class="form-control" name="jobType" id="jobType" required>
													<option value="" disabled selected>-- Select JobType
														--</option>
													
													<option value ="Part Time">Part Time</option>
													<option value ="Full Time">Full Time</option>
												</select>
											</div>
											
											
											<div class="form-group">
												<label for="jobType">Select Working Type</label> <select
													class="form-control" name="workingType" id="workingType" required>
													<option value="" disabled selected>-- Select Working Types
														--</option>
													
													<option value="Work From Home">Work From Home</option>
													<option value="Hybrid">Hybrid</option>
													<option value="On Site">On Site</option>
												</select>
											</div>

											<!-- Questions Section -->
											<div class="form-group">
												<label for="question1">Question 1</label> <input type="text"
													class="form-control" id="question1" name="question1"
													placeholder="Enter first question" >
											</div>

											<div class="form-group">
												<label for="question2">Question 2</label> <input type="text"
													class="form-control" id="question2" name="question2"
													placeholder="Enter second question" >
											</div>

											<div class="form-group">
												<label for="question3">Question 3</label> <input type="text"
													class="form-control" id="question3" name="question3"
													placeholder="Enter third question">
											</div>


											<div class="row">
												<div class="col-md-4">
													<button type="submit" id="save" class="btn btn-primary"
														style="height: 35px; margin-top: 10px;">Submit</button>
												</div>
												<div class="col-md-4">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal"
														style="height: 35px; margin-top: 10px; position: absolute; left: -87px;">Close</button>
												</div>
											</div>
											<!-- End data table -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="modal_common.jsp"%>
	<%@include file="modal.jsp"%>
	
	<div class="modal fade" id="comp_advt_details_modal" role="dialog">
		<div class="modal-dialog" style="width: 750px">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
					<span class="modal-title">Recruitment Description</span>
				</div>
				<div class="modal-body">
					<p id="advt_details"></p>
				</div>
			</div>
		</div>
	</div>

		<!-- <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
	
	<script>
    // Replace the `textarea` with CKEditor
  document.addEventListener('DOMContentLoaded', function () {
            CKEDITOR.replace('description', {
            	
            	  removePlugins: "scayt,wsc", // Disable spellcheck if not needed
            	  extraAllowedContent: "*",   // Allow all content
            	  ignoreVersion: true,     
            	
                height: 200,
                toolbar: [
                    { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline'] },
                    { name: 'paragraph', items: ['NumberedList', 'BulletedList'] },
                    { name: 'insert', items: ['Link', 'Image'] },
                    { name: 'styles', items: ['Format', 'Font', 'FontSize'] },
                    { name: 'colors', items: ['TextColor', 'BGColor'] }
                ]
            });
        });
</script> -->
	
	<!-- js -->
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/company_posts.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/bootstrap-multiselect.js"
		type="text/javascript"></script>

	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/internship_schedule.js"></script>
	<script
		src="https://unpkg.com/sweetalert${pageContext.request.contextPath}/style/dist/sweetalert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
	

	<script>
							function edit(companyName, skill, jobRole, ctc, interviewDate, jobDescription, location, driveId, ssc, hsc, ug, experience,jobType,workingType) {
								// Set the values in the modal's input fields
								document.getElementById("companyName").value = companyName;
								document.getElementById("skill").value = skill;
								document.getElementById("jobRole").value = jobRole;
								document.getElementById("ctc").value = ctc;
								document.getElementById("interviewDate").value = interviewDate;
								document.getElementById("description").value = jobDescription;
								document.getElementById("location").value = location;
								document.getElementById("driveId").value = driveId;
								document.getElementById("ssc").value = ssc;
								document.getElementById("hsc").value = hsc;
								document.getElementById("ug").value = ug;
								document.getElementById("experience").value= experience;
								document.getElementById("jobType").value = jobType;
								document.getElementById("workingType").value = workingType;
								// document.getElementById("department").value = ug;


								var selectedTechnologies = skill.split(","); // Assuming technology is a comma-separated string
								var technologySelect = document.getElementById("skill");

								// Iterate through the options in the 'technology_name' select box and mark the selected ones
								for (var i = 0; i < technologySelect.options.length; i++) {
									technologySelect.options[i].selected = selectedTechnologies.includes(
										technologySelect.options[i].value
									);
								}

								
								console.log("companyName:", companyName);

								// Show the modal (assuming you're using jQuery to display it)
								$("#comp_adv_form").show();

							}
							$(document).ready(function () {
							    // Initialize loader to hidden
							    $("#cursorLoader").hide();

							    // On Save Button Click
							    $("#save").click(function () {
							        // Show loader beside the cursor
							        $("body").css("cursor", "wait");
							        $("#cursorLoader").show();

							        // Collect data from the modal form
							        var companyDrive = {
							            companyName: $("#companyName").val(),
							            skill: $("#skill").val(),
							            jobRole: $("#jobRole").val(),
							            ctc: $("#ctc").val(),
							            interviewDate: $("#interviewDate").val(),
							            jobDescription: $("#description").val(),
							            location: $("#location").val(),
							            driveId: $("#driveId").val(), // driveId will determine if it's an update
							      
							            
							            ssc: $('#ssc').val(),
							            hsc: $('#hsc').val(),
							            ug: $('#ug').val(),
							            experience: $('#experience').val(),
							            deptName: $('#department').val(),
							            jobType : $('#jobType').val(),
							            workingType : $('#workingType').val(),
							            question1: $('#question1').val(),
							            question2: $('#question2').val(),
							            question1: $('#question1').val(),
							            question3: $('#question3').val(),
							        };

							        // Perform the AJAX request
							        $.ajax({
							            type: "POST",
							            url: "${pageContext.request.contextPath}/addRecruitment",
							            data: companyDrive,
							            success: function (response) {
							                // Hide the cursor loader
							                $("body").css("cursor", "default");
							                $("#cursorLoader").hide();

							                $("#comp_adv_form").hide();

							                // Redirect or refresh the page
							                window.location.href = "${pageContext.request.contextPath}/recruitment_campus";
							            },
							            error: function (xhr, status, error) {
							                // Hide the cursor loader
							                $("body").css("cursor", "default");
							                $("#cursorLoader").hide();

							                console.error("Error occurred while updating the drive: ", error);
							            }
							        });
							    });

							    // Track mouse movements to position the loader near the cursor
							    $(document).mousemove(function (e) {
							        $("#cursorLoader").css({
							            top: e.pageY + 10, // 10px below the cursor
							            left: e.pageX + 10 // 10px to the right of the cursor
							        });
							    });
							});




						</script>





	<script>
							function editAdvertisement(
								id,
								advTitle,
								technology,
								capacity,
								duration,
								stipend,
								startDate,
								description,
								requirement,
								location
							) {
								// Set values for the fields in the hidden form
								document.getElementById("advertisement_id").value = id;
								document.getElementById("company_id").value = "CP0000000002"; // Change this to the actual company ID
								document.getElementById("adv_title").value = advTitle;
								document.getElementById("technology_name").value = technology;
								document.getElementById("capacity").value = capacity;
								document.getElementById("duration").value = duration;
								document.getElementById("startdate").value = startDate;
								document.getElementById("stipend").value = stipend;
								document.getElementById("description").value = description;

								// For multi-select box (requirements)
								var selectedRequirements = requirement.split(","); // Assuming requirement is a comma-separated string
								var selectRequirements = document.getElementById("select_requirements");
								for (var i = 0; i < selectRequirements.options.length; i++) {
									selectRequirements.options[i].selected =
										selectedRequirements.includes(selectRequirements.options[i].value);
								}

								// Show the hidden form
								document.getElementById("comp_adv_form").style.display = "block";
								$.ajax({
									type: "GET",
									url: "editCompAdvertisement?adv_id=" + id,
									async: false, // Note: "asynch" corrected to "async"
									success: function (response) {
										// Handle the response here
										console.log("Success! Response:", response);
										// Do something with the response
									},
									error: function (xhr, status, error) {
										// Handle errors here
										console.error("Error:", error);
									},
								});
							}
							function setSkipValue() {

								document.getElementById("getskipval").value = "no";
							}
						</script>
</body>

</html>