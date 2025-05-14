<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="user_session.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>SkillPilots | Internship Advertisements</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico" />

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
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
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css"
	rel="stylesheet" />

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

.modal-bodys {
	max-height: 200px; /* Set a max height */
	overflow-y: auto;
	/* Enable vertical scrolling when content overflows */
}

.pagination {
	display: flex;
	justify-content: center; /* Centers the buttons horizontally */
	align-items: center; /* Aligns items vertically (if needed) */
	margin-top: 20px; /* Add space above the buttons */
	gap: 10px; /* Spacing between buttons */
}

.pagination a {
	margin: 0;
	padding: 8px 12px;
	text-decoration: none;
	color: #007bff;
	border: 1px solid #ddd;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.pagination a.active {
	font-weight: bold;
	background-color: #007bff;
	color: white;
	border-color: #007bff;
}

.pagination a.disabled {
	pointer-events: none;
	color: #ccc;
	border-color: #ddd;
}

.pagination a:hover:not(.active):not(.disabled) {
	background-color: #f0f0f0;
	color: #0056b3;
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
						class="btn btn-outline-primary header-white">White</a>
					<a href="javascript:void(0);"
						class="btn btn-outline-primary header-dark active">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-light">White</a>
					<a href="javascript:void(0);"
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

	<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="title pb-20 text-center">
				<h6 class="h4 mb-0">
					<c:if test="${user.role eq '6' or user.role eq '5'}">
						<div id="showfrm">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#placementModal"
								style="margin-left: 85%; padding: 2px 6px 2px 6px">
								Add Recruitment</button>
						</div>

						<!-- <div id="hidefrm">
                <button
                  class="btn btn-primary btn-sm"
                  onclick="hideForm()"
                  style="margin-left: 85%; padding: 2px 6px 2px 6px"
                >
                  Hide Form
                </button>
              </div> -->
					</c:if>
					<div id="showfrm">
						<a class="btn btn-info btn-sm"
							href="${pageContext.request.contextPath}/tandp_applied_list"
							style="margin-left: 85%; margin-top: 1%; color: aliceblue; padding: 2px 6px 2px 6px;">Go
							Placement Applied Student </a>
					</div>
				</h6>
			</div>
			<div class="card-box mb-30">
				<div class="pd-20">
					<table class="table table-striped table-hover" id="placementTable">
						<thead>
							<tr>
								<th></th>
								<th hidden>Placement ID</th>
								<th>Company Name</th>

								<th>Job Title</th>
								<th>Job Description</th>
								<th>Website</th>
								<th>CTC</th>
								<th>Departments</th>
								<th>Interview Start Date</th>
								<th>Interview End Date</th>
								<th>Criteria</th>
								<c:if test="${user.role eq '6'}">
									<th>Actions</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<input type="text" value="${cid}" name="collegeId" id="cid"
								hidden />
								<input type="text" value="${placement.placementId}" id="placementId" />
							<!-- Iterate over placements and populate table rows -->
							<c:forEach var="placement" items="${placements}">
								<tr>
									<td><button type="button" class="btn btn-warning"
											data-toggle="modal" data-target="#placementModal"
											title="Click here to edit Recruitment"
											onclick="openEdit('${placement.placementId}','${placement.companyName}','${placement.profile}',
    '${placement.placementDetails.website}','${placement.ctc}','${placement.departmentIds}',
    '${placement.placementDetails.interviewStartDate}','${placement.placementDetails.interviewEndDate}',
    '${placement.placementDetails.ssc}',' ${placement.placementDetails.hsc}','${placement.placementDetails.ug}',
    '${placement.email}','${placement.address}','${placement.contactNo}','${placement.placementDetails.jobDescription}',
    '${placement.placementDetails.contactName}','${placement.placementDetails.city}')"
											style="margin-left: 20%; padding: 2px 6px 2px 6px">
											<i class="fas fa-edit"></i>
										</button></td>
									<td hidden>${placement.placementId}</td>
									<td>${placement.companyName}</td>

									<td>${placement.profile}</td>

									<td style="max-width: 300px; overflow: hidden; color: blue;">
										<p style="cursor: pointer;" data-toggle="modal"
											data-target="#descriptionModal"
											onclick="showDescription('${placement.placementDetails.jobDescription}');">
											Read Description</p>
									</td>
									<td
										style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px;">
										<a href="${placement.placementDetails.website}"
										target="_blank" style="text-decoration: none">
											${placement.placementDetails.website} </a>
									</td>
									<td>${placement.ctc}</td>
									<td>${placement.departmentIds}</td>

									<td>${placement.placementDetails.interviewStartDate}</td>
									<td>${placement.placementDetails.interviewEndDate}</td>
									<td><span style="color: red"> SSC: </span>
										${placement.placementDetails.ssc}%, <span style="color: red">
											HSC: </span> ${placement.placementDetails.hsc}%, <span
										style="color: red"> UG: </span>
										${placement.placementDetails.ug}%</td>

									<c:if test="${user.role eq '6'}">
										<!-- <td>
													<button type="button" class="btn btn-primary" onclick="openModal(${placement.placementId})">
														View Students
													</button>
												</td> -->

										<td>
											<button type="button" class="btn btn-primary"
												onclick='searchStudents("${placement.placementId}", "${placement.placementDetails.ssc != null ? placement.placementDetails.ssc : 0}", 
	"${placement.placementDetails.hsc != null ? placement.placementDetails.hsc : 0}", 
	"${placement.placementDetails.ug != null ? placement.placementDetails.ug : 0}")'>
												Eligible Students</button> <!-- <button onclick="searchStudents()">click</button> -->
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="pagination">
						<!-- Previous Button -->
						<c:choose>
							<c:when test="${totalPages > 0}">
								<div class="pagination">
									<!-- Previous Button -->
									<a href="?page=${currentPage - 1}&size=${size}"
										class="${currentPage == 0 ? 'disabled' : ''}">Previous</a>

									<!-- Page Numbers -->
									<c:forEach var="i" begin="0" end="${totalPages - 1}">
										<a href="?page=${i}&size=${size}"
											class="${i == currentPage ? 'active' : ''}">${i + 1}</a>
									</c:forEach>

									<!-- Next Button -->
									<a href="?page=${currentPage + 1}&size=${size}"
										class="${currentPage == totalPages - 1 ? 'disabled' : ''}">Next</a>
								</div>
							</c:when>
							<c:otherwise>
								<p>No pages available.</p>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>

			<!-- Modal Structure -->
			<div id="studentsModal" class="modal" style="display: none">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Student List</h4>
							<select id="year" name="year" class="btn btn-light"
								style="margin-left: 10em" multiple
								onchange="searchStudents2(year)">
								<option value="">Select Year</option>
								<script>
            var currentYear = new Date().getFullYear();
            for (var i = currentYear; i >= 2000; i--) {
              document.write("<option value='" + i + "'>" + i + "</option>");
            }
          </script>
							</select>
							<button type="button" class="close" onclick="closeModal()">
								&times;</button>
						</div>
						<button type="button" id="selectAllButton"
							onclick="toggleSelectAll()">Select All</button>

						<div class="modal-bodys">
							<table id="studentsTable" class="table">
								<thead>
									<tr>
										<th>Select:</th>
										<th>Student Id</th>
										<th>Student Name</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody id="studentsListBody">
									<!-- Data will be dynamically inserted here -->
								</tbody>
							</table>
						</div>

						<div class="modal-footer">
							<button id="applyButton" class="btn btn-success"
								onclick="applyDrive()" readonly>Apply
								Selected</button>
							<button class="btn btn-secondary" onclick="closeModal()">
								Close</button>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="placementModal" tabindex="-1"
				aria-labelledby="placementModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="placementModalLabel">Recruitment
								Info:</h5>
							<button type="button" class="btn-close" data-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form id="placementForm" method="post">
								<!-- Placement Section -->
								<div class="row">
									<div class="col-md-6">
										<div hidden class="form-group">
											<label>placementId</label> <input id="placementId"
												name="placementId" class="form-control" type="text" />
										</div>
										<div class="form-group">
											<label>Company Name</label> <input id="companyName"
												name="companyName" class="form-control" type="text" required />
										</div>
										<div class="form-group">
											<label>Company Person Name</label> <input id="contactName"
												name="contactName" class="form-control" type="text" required />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="contactNo">Contact Person Number</label> <input
												id="contactNo" name="contactNo" class="form-control"
												type="text" maxlength="12" pattern="\d{10,12}"
												placeholder="Enter contact number" required /> <small
												id="contactNoError" class="text-danger"
												style="display: none;"> Please enter a valid contact
												number (10 to 12 digits). </small>
										</div>
										<div class="form-group">
											<label>Website Url</label> <input id="website" name="website"
												class="form-control" type="text"
												placeholder="https://www.example.com" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Email</label> <input id="email" name="email"
												class="form-control" type="email" required />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Address</label> <input id="address" name="address"
												class="form-control" type="text" required />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Profile</label> <input id="profile" name="profile"
												class="form-control" type="text" required />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>City</label> <input id="city" name="city"
												class="form-control" type="text" required />
										</div>
									</div>
								</div>

								<!-- Placement Details Section -->
								<div class="row">
									<div hidden class="col-md-6">
										<div class="form-group">
											<label>Job Title</label> <input id="jobTitle" name="jobTitle"
												class="form-control" type="text" />
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>Job Description</label>
											<textarea id="jobDescription" name="jobDescription"
												class="form-control" rows="3"
												style="resize: none; height: 80px; overflow-y: scroll;"
												required>
</textarea>
										</div>
									</div>

								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>SSC %</label> <input id="ssc" name="ssc"
												class="form-control" type="text" />
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>HSC %</label> <input id="hsc" name="sshscc"
												class="form-control" type="text" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>CTC</label> <input id="ctc" name="ctc"
												class="form-control" type="text" />
										</div>
									</div>




									<div class="col-md-6">
										<div class="form-group">
											<label>UG %</label> <input id="ug" name="ug"
												class="form-control" type="text" />
										</div>
									</div>

									<div hidden class="col-md-6">
										<div class="form-group">
											<label>Is Open</label> <input id="isOpen" name="isOpen"
												class="form-control" type="text" value="true" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Interview Start Date</label> <input type="date"
												name="interviewStartDate" id="interviewStartDate"
												class="form-control" />
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>Interview End Date</label> <input type="date"
												name="interviewEndDate" id="interviewEndDate"
												class="form-control" />
										</div>
									</div>
								</div>

								<!-- Department IDs Section -->
								<div class="form-group">
									<label>Departments</label> <select id="departmentDropdown"
										name="departmentIds" class="form-control" multiple required></select>
								</div>

								<!-- Submit Button -->

								<input type="" id="placementId" value="${placement.placementId}">
							</form>

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="submit" form="placementForm"
									class="btn btn-primary">Submit</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="modal_common.jsp"%>
		<%@include file="modal.jsp"%>
	</div>

	<div class="modal fade show" id="comp_advt_details_modal" role="dialog">
		<div class="modal-dialog modal-dialog-centered">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="panel-heading"
					style="background: #0f2c7eeb; padding: 4px 0px 4px 16px; color: white;">
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
					<span class="modal-title">Advertisement Description</span>
				</div>
				<div class="modal-body">
					<p id="advt_details"></p>
				</div>
			</div>
		</div>
	</div>
	</div>

	<div class="modal fade" id="descriptionModal" tabindex="-1"
		role="dialog" aria-labelledby="descriptionModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="descriptionModalLabel">Job
						Description</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modalDescriptionContent">
					<!-- Content will be dynamically inserted here -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>


		<!-- js -->
		<script>

  const contactNoInput = document.getElementById('contactNo');
  const contactNoError = document.getElementById('contactNoError');

  contactNoInput.addEventListener('input', function () {
    // Remove any non-numeric characters
    contactNoInput.value = contactNoInput.value.replace(/[^0-9]/g, '');

    // Hide the error message while typing
    contactNoError.style.display = 'none';

    // Enforce a maximum of 12 digits
    if (contactNoInput.value.length > 12) {
      contactNoInput.value = contactNoInput.value.slice(0, 12);
    }
  });

  contactNoInput.addEventListener('blur', function () {
    // Show error message if input is less than 10 digits
    if (contactNoInput.value.length < 10 || contactNoInput.value.length > 12) {
      contactNoError.style.display = 'block';
    } else {
      contactNoError.style.display = 'none';
    }
  });
</script>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
			rel="stylesheet">

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/style/dist/js/myjs/company_posts.js"></script>
		<script
			src="${pageContext.request.contextPath}/style/dist/js/bootstrap-multiselect.js"
			type="text/javascript"></script>
		<script>
     $(document).ready(function () {
  $.ajax({
    url: "${pageContext.request.contextPath}/findDept",
    type: "GET",
    data: { email: "${email}" },
    success: function (response) {
      var dropdown = $("#departmentDropdown");
      dropdown.empty();
      dropdown.append('<option value="" disabled selected>Select Department</option>'); // Ensure default option is not selectable

      $.each(response, function (index, department) {
        dropdown.append(
          $("<option></option>")
            .attr("value", department.deptName)
            .text(department.deptName)
        );
      });
    },
    error: function (xhr, status, error) {
      console.error("Error fetching departments: ", error);
    },
  });

  // Validate selection
  $("#departmentDropdown").on("change", function () {
    var selectedValue = $(this).val();
    if (!selectedValue) {
      alert("Please select a valid department.");
    }
  });
});

    </script>
		<!-- Font Awesome CDN for Icons -->
		<link
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
			rel="stylesheet">

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
      document
        .getElementById("placementForm")
        .addEventListener("submit", function (event) {
          
          event.preventDefault();
          const collegeId = document.getElementById("cid").value;
         const placementId= document.getElementById("placementId").value;
           const departmentIds = Array.from(document.getElementById("departmentDropdown").options)
    .filter((option) => option.selected)
    .map((option) => option.value) // Collect department names
    .join(","); // Join into a single string
const cleanedDepartmentIds = departmentIds.replace(/^,|,$/g, "");

          const formData = {
            placement: {
              companyName: document.getElementById("companyName").value,
              contactNo: document.getElementById("contactNo").value,
              email: document.getElementById("email").value,
              address: document.getElementById("address").value,
              profile: document.getElementById("profile").value,
              ctc: document.getElementById("ctc").value
            },
            placementDetails: {
              jobTitle: document.getElementById("jobTitle").value,
              contactName: document.getElementById("contactName").value,
              jobDescription: document.getElementById("jobDescription").value,
              ssc: document.getElementById("ssc").value,
              hsc: document.getElementById("hsc").value,
              ug: document.getElementById("ug").value,
              city: document.getElementById("city").value,
              website: document.getElementById("website").value,
              isOpen: document.getElementById("isOpen").value,
              interviewStartDate:
                document.getElementById("interviewStartDate").value,
              interviewEndDate:
                document.getElementById("interviewEndDate").value,
            },
     departmentIds: cleanedDepartmentIds, // Include department IDs in the request body

 
          };

   if (!departmentIds) {
    Swal.fire({
      title: "Error!",
      text: "Please select at least one department.",
      icon: "error",
      button: "OK",
    });
    return; // Prevent submission if no department is selected
  }
  console.log(formData);
          fetch(
            "http://43.204.35.211:8000/newskill/addPlacement?collegeId=" +
              collegeId+"&placementId="+placementId,
            {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
              },
              body: JSON.stringify(formData),
            }
          )
            .then((response) => response.json())
            .then((data) => {
              console.log("Success:", data);
              window.location.reload();
            })
            .catch((error) => {
              console.error("Error:", error);
            });
        });
    </script>

		<script>
      // acccept only number
      $(document).ready(function () {
        //called when key is pressed in textbox
        $("#duration").keypress(function (e) {
          //if the letter is not digit then display error and don't type anything
          if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            /* display error message */
            $("#errmsg").html("Number Only").show().fadeOut("slow");
            return false;
          }
        });

        $("#capacity").keypress(function (e) {
          //if the letter is not digit then display error and don't type anything
          if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            /* display error message */
            $("#errmsgcap").html("Number Only").show().fadeOut("slow");
            return false;
          }
        });
      });

      //set default drowp down first element blank
      document.getElementById("technology_name").selectedIndex = -1;

      $("#comp_schedule_form").hide();
      function showCompanyScheduleform(com_adv_id, duration) {
        $("#comp_adv_form").hide();
        get_schedule(com_adv_id, "INLINE");
        type_of_schedule(com_adv_id, duration);
        $("#comp_schedule_form").show();
      }

      function back() {
        $("#comp_schedule_form").hide();
        $("#comp_adv_form").show();
      }
      function testempty() {
        $("#sbtn").prop("disabled", false);
      }

      function getdataskip() {
        $("#getskipval").val("yes");
        $("#schedform").submit();
      }
    </script>

		<script>
      document.addEventListener("DOMContentLoaded", hideForm());

      function showForm() {
        document.getElementById("frm").hidden = false; // Show the form
        document.getElementById("hidefrm").hidden = false; // Show the hide button
        document.getElementById("showfrm").hidden = true; // Hide the show button
      }

      function hideForm() {
        document.getElementById("frm").hidden = true; // Hide the form
        document.getElementById("hidefrm").hidden = true; // Hide the hide button
        document.getElementById("showfrm").hidden = false; // Show the show button
      }
    </script>

		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>

		<script>
      function searchStudents(placementId, hsc, ssc, ug) {
        localStorage.setItem("placementId", placementId);
        localStorage.setItem("hsc", hsc);
        localStorage.setItem("ssc", ssc);
        localStorage.setItem("ug", ug);
        let years = 2025;
        fetch(
          "stdList?placementId=" +
            placementId +
            "&ssc=" +
            ssc +
            "&hsc=" +
            hsc +
            "&ug=" +
            ug +
            "&years=" +
            years
        )
          .then((response) => {
            if (!response.ok) {
              throw new Error(
                "Network response was not ok " + response.statusText
              );
            }
            return response.json(); // Fetch student data as JSON
          })
          .then((data) => {
            console.log(data);
            populateModal(data); // Call a function to populate the modal
            openModal(); // Open the modal
          })
          .catch((error) =>
            console.error("Error fetching student data:", error)
          );
      }

      function searchStudents2() {
        const placementId = localStorage.getItem("placementId");
        const hsc = localStorage.getItem("hsc");
        const ssc = localStorage.getItem("ssc");
        const ug = localStorage.getItem("ug");
        // Get the selected year(s) from the <select> element
        let selectedOptions = document.getElementById("year").selectedOptions;
        let selectedYears = Array.from(selectedOptions)
          .map((option) => option.value)
          .filter((year) => year !== ""); // Filter out any empty selections

        // If no year is selected, use the default year (2025)
        let years = selectedYears.length > 0 ? selectedYears.join(",") : "2025";

        fetch(
          "stdfilter?placementId=" +
            placementId +
            "&ssc=" +
            ssc +
            "&hsc=" +
            hsc +
            "&ug=" +
            ug +
            "&years=" +
            years
        )
          .then((response) => {
            if (!response.ok) {
              throw new Error(
                "Network response was not ok " + response.statusText
              );
            }
            return response.json(); // Fetch student data as JSON
          })
          .then((data) => {
            console.log(data);
            populateModal(data); // Call a function to populate the modal
            openModal(); // Open the modal
          })
          .catch((error) =>
            console.error("Error fetching student data:", error)
          );
      }

      function populateModal(studentsList) {
        const tableBody = document.getElementById("studentsListBody");
        tableBody.innerHTML = ""; // Clear any existing data

        studentsList.forEach((student) => {
          const row = document.createElement("tr");

          const checkboxCell = document.createElement("td");
          const checkbox = document.createElement("input");
          checkbox.type = "checkbox";
          checkbox.value = student.studentId;

          if (
            student.status === "Applied" ||
            student.status === "1ST ROUND" ||
            student.status === "2ND ROUND" ||
            student.status === "3RD ROUND" ||
            student.status === "SELECTED"
          ) {
            checkbox.disabled = true; // Disable the checkbox
          }

          checkboxCell.appendChild(checkbox);
          row.appendChild(checkboxCell);

          const studentId = document.createElement("td");
          studentId.textContent = student.studentId;
          row.appendChild(studentId);

          const nameCell = document.createElement("td");
          nameCell.textContent = student.studentName;
          row.appendChild(nameCell);

          const statusCell = document.createElement("td");
          statusCell.textContent = student.status;
          row.appendChild(statusCell);

          tableBody.appendChild(row);
        });
      }

      function openModal() {
        document.getElementById("studentsModal").style.display = "block";
      }

      function closeModal() {
        document.getElementById("studentsModal").style.display = "none";
      }

      function toggleSelectAll() {
        const tableBody = document.getElementById("studentsListBody");
        const checkboxes = tableBody.querySelectorAll('input[type="checkbox"]');
        const selectAllButton = document.getElementById("selectAllButton");

        const allChecked = Array.from(checkboxes).every(
          (checkbox) => checkbox.checked && !checkbox.disabled
        );

        checkboxes.forEach((checkbox) => {
          if (!checkbox.disabled) {
            checkbox.checked = allChecked ? false : true; // If all enabled are checked, uncheck them; otherwise, check all
          }
        });

        selectAllButton.textContent = allChecked
          ? "Deselect All"
          : "Select All";
      }

      function applyDrive() {
        const tableBody = document.getElementById("studentsListBody");
        const checkboxes = tableBody.querySelectorAll(
          'input[type="checkbox"]:checked'
        );
        const selectedIds = Array.from(checkboxes).map(
          (checkbox) => checkbox.value
        );
        const placementId = localStorage.getItem("placementId");
        const collegeId = document.getElementById("cid").value;

        if (selectedIds.length > 0) {
          // Send selected student IDs to the API
          // fetch('http://43.204.35.211:8000/newskill/send?studentIds=' + selectedIds.join(',') + '&recruitmentId=1' + '&collegeId=1', {
          // 	method: 'POST'
          // })
          // testing ip
          // fetch('http://43.204.35.211:8000/newskill/send?studentIds=' + selectedIds.join(',') + '&recruitmentId=1' + '&collegeId=1', {
          // 	method: 'POST'
          // })
          //  local ip
          fetch(
            "http://43.204.35.211:8000/newskill/send?studentIds=" +
              selectedIds.join(",") +
              "&recruitmentId=" +
              placementId +
              "&collegeId=" +
              collegeId,
            {
              method: "POST",
            }
          )
            .then((response) => response.json())
            .then((data) => {
              console.log("Applied:", data);
              Swal.fire({
                title: "Success!",
                text: "The students have been applied successfully.",
                icon: "success",
                confirmButtonText: "OK",
              });

              closeModal(); // Close the modal after the request is successful
              // setTimeout(() => {
              //     location.reload();  // Reload the page after a slight delay
              // }, 500);  // Delay of 500ms to ensure the modal closes properly
            })

            .catch((error) => console.error("Error applying:", error));
        }
      }
    </script>
		<script>
    function showDescription(description) {
        // Set the modal content dynamically
        document.getElementById('modalDescriptionContent').innerText = description;
    }
    
    </script>

		<script>

      function openEdit (
  placementId,
  companyName,
  profile,
  website,
  ctc,
  departmentIds,
  interviewStartDate,
  interviewEndDate,
  ssc,
  hsc,
  ug,email,address,contactNo,jobDescription,contactName,city
) {
  console.log("ddddddddddddddddddddddddddd")
  // Set the modal fields with the passed data
  document.getElementById("placementId").value = placementId;
  document.getElementById("companyName").value = companyName;
  document.getElementById("profile").value = profile;
  document.getElementById("website").value = website;
  document.getElementById("ctc").value = ctc;
  document.getElementById("email").value=email;
  document.getElementById("address").value=address;
  document.getElementById("contactNo").value=contactNo;
  // Set department IDs (multi-select dropdown)
  const departmentDropdown = document.getElementById("departmentDropdown");
  const departmentArray = departmentIds.split(","); // Assuming departmentIds is a comma-separated string
  for (let option of departmentDropdown.options) {
    option.selected = departmentArray.includes(option.value);
  }
  // Set the remaining placement details
  document.getElementById("interviewStartDate").value = interviewStartDate;
  document.getElementById("interviewEndDate").value = interviewEndDate;
  document.getElementById("ssc").value = ssc.trim();
  document.getElementById("hsc").value = hsc.trim();
  document.getElementById("ug").value = ug.trim();
  document.getElementById("jobDescription").value=jobDescription;
  document.getElementById("contactName").value=contactName;
  document.getElementById("city").value=city;
  // Open the modal (if using Bootstrap)
  $("#placementModal").modal("show");
}
    </script>
		<script>const rowsPerPage = 10; // Number of rows per page
let currentPage = 1;

// Function to display a subset of data in the table
function displayTableData(data, tableBody, rowsPerPage, page) {
  tableBody.innerHTML = ''; // Clear the table body

  const start = (page - 1) * rowsPerPage;
  const end = start + rowsPerPage;
  const paginatedItems = data.slice(start, end);

  paginatedItems.forEach((item, index) => {
    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${start + index + 1}</td>
      <td>${item.companyName}</td>
      <td>${item.profile}</td>
      <td>
        <button 
          type="button" 
          class="btn btn-warning"
          data-toggle="modal"
          data-target="#placementModal"
          onclick="openEdit('${item.placementId}', '${item.companyName}', '${item.profile}')">
          <i class="fas fa-edit"></i>
        </button>
      </td>
    `;
    tableBody.appendChild(row);
  });

  // Disable the "Next" button if there are no more items to show
  const nextBtn = document.getElementById('next-btn');
  if (end >= data.length) {
    nextBtn.disabled = true;
  } else {
    nextBtn.disabled = false;
  }
}

// Initial Render
document.addEventListener('DOMContentLoaded', () => {
  const tableBody = document.getElementById('table-body');
  displayTableData(placements, tableBody, rowsPerPage, currentPage);

  // Handle "Next" button click
  const nextBtn = document.getElementById('next-btn');
  nextBtn.addEventListener('click', () => {
    currentPage++;
    displayTableData(placements, tableBody, rowsPerPage, currentPage);
  });
});</script>
</body>
</html>