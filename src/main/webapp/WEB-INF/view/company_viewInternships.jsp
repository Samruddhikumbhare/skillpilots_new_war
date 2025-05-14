<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="user_session.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>SkillPilots | Internship's</title>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico" />

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet" />

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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.4/dist/sweetalert2.min.css"
	rel="stylesheet">

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

.pointer {
	cursor: pointer;
}

.greenHov:hover {
	color: green;
}

.redHov:hover {
	color: red;
}

.param-txt {
	width: 60px;
	text-align: center;
}

.nav-tabs .nav-link {
	cursor: pointer;
}

.modal-lg {
	max-width: 90%;
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
	padding: 0px 15px 1px 7px !important;
	min-height: 75px;
	color: #666;
	font-size: 13px;
	font-weight: 500;
	font-family: "Inter", sans-serif;
	border-radius: 1px;
}

.swal2-input {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
}

.swal2-popup {
	width: 400px !important; /* Controls the size of the modal */
}

.swal2-title {
	font-size: 18px;
	text-align: center;
	font-weight: bold;
}

.swal2-input:focus {
	border-color: #4caf50;
	box-shadow: 0 0 10px rgba(76, 175, 80, 0.4);
}

.swal2-button {
	font-weight: bold;
	background-color: #4caf50;
	color: #fff;
}

.swal2-button:hover {
	background-color: #45a049;
}

.swal2-cancel {
	background-color: #f44336;
	color: #fff;
}

.swal2-cancel:hover {
	background-color: #e53935;
}

/* Custom modal styles for better responsiveness */
.modal-dialog {
	max-width: 100%;
	width: 90%; /* Adjust modal width for mobile screens */
	margin: 1.75rem auto;
}

/* Ensuring the modal content is scrollable */
.modal-dialog-scrollable .modal-content {
	max-height: 80vh; /* Allow modal content to scroll on large content */
	overflow-y: auto;
}

.modal-header, .modal-footer {
	padding: 1rem;
}

#commentModal .modal-dialog {
	max-width: 400px;
	max-height: 400px; /* Adjust width as needed */
}

.modal-body {
	padding: 1rem 2rem; /* Adds space for better readability */
}

/* Adjust tab size on small screens */
@media ( max-width : 576px) {
	.modal-header h5 {
		font-size: 1.2rem; /* Smaller font size for mobile */
	}
	.modal-footer button {
		font-size: 0.9rem; /* Smaller footer button size */
	}
	.modal-body {
		padding: 1rem; /* Reduce padding on smaller screens */
	}
	.modal-dialog {
		width: 95%; /* Maximize modal size on smaller screens */
	}
}

/* Custom styling for tab buttons and content */
.nav-tabs {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-evenly;
}

.nav-tabs .nav-item {
	flex: 1;
	text-align: center;
}

.nav-link {
	font-size: 0.9rem;
}

.tab-content {
	padding: 1rem;
}

.custom-modal {
    max-width: 80%; /* Adjust width */
}
.custom-modal .modal-content {
    min-height: 300px; /* Adjust height */
}

#studentDetailsModal .modal-dialog {
    max-width: 60% !important; /* Ensures the modal does not shrink to 400px */
    width: auto !important;
    max-height: none !important;
</style>
</head>
<body>



	<div class="modal fade" id="feedbackModal" tabindex="-1"
		aria-labelledby="modalTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable modal-lg">
			<!-- Use modal-lg for larger size and modal-dialog-scrollable for scrolling content -->
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">Internship Feedback</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="hidden" id="txt_internship_id" value="${internshipId}" />
					<input type="hidden" id="total_weeks" value="${totalWeeks}" />

					<!-- Tabs for months -->
					<ul class="nav nav-tabs" id="monthTabs" role="tablist">
						<!-- Month tabs will be populated dynamically -->
					</ul>

					<!-- Tab content -->
					<div class="tab-content mt-3" id="feedbackContent">
						<!-- Tab content will be populated dynamically -->
					</div>


					<div class="mt-3" id="commentBox">
						<label for="modalComment" class="form-label fw-bold">
							Comments:</label> <input type="text" id="modalComment"
							class="form-control" name="comments" style="height: 30px;"
							placeholder="Add a comment...">
					</div>

				</div>
				<div class="modal-footer">
					<button id="btn" class="btn btn-danger"
						onclick="skipRemainingFeedback()">Skip All Remaining
						Feedback</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered custom-modal"> <!-- Increased size -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="commentModalLabel">Add Your Comments</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="finalComment" class="form-label fw-bold">Enter your comments:</label>
                <textarea id="modalComment1" class="form-control" name="comments" placeholder="Write your comments here..." rows="5"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="saveFinalComments()">Submit</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
	<!-- Optional: Add custom CSS for better mobile responsiveness -->

	<!-- Internship Feedback Modal -->
	<%-- <div class="modal fade" id="feedbackModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog modal-xl"> <!-- Use modal-xl for extra width -->
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Internship Feedback</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="txt_internship_id" value="${internshipId}" />
                <input type="hidden" id="total_weeks" value="${totalWeeks}" />
                
                <!-- Tabs for months -->
                <ul class="nav nav-tabs" id="monthTabs"></ul>
                
                <!-- Tab content -->
                <div class="tab-content mt-3" id="feedbackContent"></div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" onclick="skipRemainingFeedback()">Skip All Remaining Feedback</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div> --%>



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
			<a href="javascript:;"> 
			<img
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
				<h5 class="h4 mb-0">
					<span
						style="background: #13aef5; color: white; border-radius: 4px; padding: 4px 16px 4px 16px;">Internships</span>
				</h5>
			</div>
			<div class="pd-20 card-box">
				<div class="tab" >
					<ul class="nav nav-tabs customtab" role="tablist">
  <c:if test="${user.role eq '3' || user.role eq '4'}">
    <li class="nav-item">
      <a id="pendingTabLink" class="nav-link"
         data-toggle="tab" href="#pendingTab" role="tab" aria-selected="false">
        Pending Internships
      </a>
    </li>
  </c:if>
  <li class="nav-item">
    <a id="ongoingTabLink" class="nav-link"
       data-toggle="tab" href="#ongoingTab" role="tab" aria-selected="false">
      Ongoing Internships
    </a>
  </li>
  <li class="nav-item">
    <a id="completedTabLink" class="nav-link"
       data-toggle="tab" href="#completedTab" role="tab" aria-selected="false">
      Completed Internships
    </a>
  </li>
  <li class="nav-item">
    <a id="canceledTabLink" class="nav-link"
       data-toggle="tab" href="#canceledTab" role="tab" aria-selected="false">
      Cancelled Internships
    </a>
  </li>
</ul>

					<div class="tab-content">
						<div class="tab-pane fade show active" id="pendingTab"
							role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty pendingInternships}">
<table class="data-table table table-hover w-100">

										<thead class="thead-light">
											<tr>
												<th class="table-plus datatable-nosort">Student Name</th>
												<th>Institute Name</th>
												<th>Department</th>
												<c:if test="${user.role eq '1' || user.role eq '2' }">
													<th>Assigned Team</th>
												</c:if>
												<th>Skill</th>
												<th>Duration</th>
												<th>Start Date</th>
												<c:if test="${user.role eq '3' || user.role eq '4'}">
													<th nowrap="nowrap">Action</th>
												</c:if>
											</tr>
										</thead>

										<tbody id="tablist">

											<c:forEach items="${pendingInternships}" var="internship">
												<tr>
													<td><span style="cursor: pointer; color: blue"
														class="actionSpan" data-toggle="modal"
														data-target="#studentDetailsModal"
														onclick="dispStudentData('${internship[0]}');">${internship[8]}</span>
													</td>
													<td><c:if test="${not empty internship[9]}">
															<span>${internship[9]}</span>
														</c:if> <c:if test="${empty internship[9]}">
															<span>External Intern</span>
														</c:if></td>
													<td><c:if test="${not empty internship[10]}">
															<span>${internship[10]}</span>
														</c:if> <c:if test="${empty internship[10]}">-</c:if></td>
													<c:if test="${user.role eq '1' || user.role eq '2' }">
														<td><span>${internship[13]}</span></td>
													</c:if>
													<td><span>${internship[7]}</span></td>
													<td><span>${internship[3]}</span></td>
													<td><c:set var="dateString" value="${item[4]}" /> <fmt:parseDate
															var="parsedDate" value="${internship[4]}"
															pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${parsedDate}" /></td>
													<c:if test="${user.role eq '3' || user.role eq '4'}">
														<td style="white-space: nowrap"><span
															title="Start Internship" class="pointer greenHov actIcon"
															onclick="editInternship('${internship[6]}','ongoing','pending');"><i
																class="fa fa-play"></i></span> &nbsp;&nbsp;|&nbsp;&nbsp; <span
															title="Cancel Internship" class="pointer redHov actIcon"
															onclick="editInternship('${internship[6]}','cancelled','pending');"><i
																class="fa fa-ban" aria-hidden="true"></i></span> <!-- <span
                                  title="Cancel Internship"
                                  class="pointer redHov actIcon"
                                  onclick="cancelInternshipByComp('${internship[6]}','cancelled','pending');"
                                  ><i class="fa fa-ban" aria-hidden="true"></i
                                ></span> --></td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty pendingInternships}">
									<label>No Pending Internships</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="ongoingTab" role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty ongoingInternships}">
<table class="data-table table table-hover w-100">


										<thead class="thead-light">
											<tr>
												<th class="table-plus datatable-nosort">Student Name</th>
												<th>Institute Name</th>
												<th>Department</th>

												<c:if test="${user.role eq '1' || user.role eq '2' }">
													<th>Assigned Team</th>
												</c:if>

												<th>Skill</th>
												<th>Start Date</th>
												<th>Duration</th>
												<c:if test="${user.role eq '3' || user.role eq '4'}">
													<th nowrap="nowrap">Action</th>
												</c:if>
											</tr>
										</thead>

										<tbody id="tablist">
											<c:forEach items="${ongoingInternships}" var="internship">
												<tr>
													<td><span style="cursor: pointer; color: blue"
														class="actionSpan" data-toggle="modal"
														data-target="#studentDetailsModal"
														onclick="dispStudentData('${internship[0]}');">${internship[8]}</span>
													</td>
													<td><c:if test="${not empty internship[9]}">
															<span>${internship[9]}</span>
														</c:if> <c:if test="${empty internship[9]}">
															<span>External Intern</span>
														</c:if></td>
													<td><c:if test="${not empty internship[10]}">
															<span>${internship[10]}</span>
														</c:if> <c:if test="${empty internship[9]}">-</c:if></td>
													<c:if test="${user.role eq '1' || user.role eq '2' }">
														<td><span>${internship[13]}</span></td>
													</c:if>
													<td><span>${internship[7]}</span></td>
													<td><span><fmt:formatDate
																pattern="yyyy-MM-dd" value="${internship[4]}" /></span>
													</td>
													<td><span>${internship[3]}</span></td>
													<c:if test="${user.role eq '3'|| user.role eq '4'}">
														<td style="white-space: nowrap">
															<!-- Feedback Icon --> <%-- <span
  title="Feedback"
  class="pointer greenHov actIcon"
  onclick="showFeedback('${internship[3]}','${internship[6]}');"
  ><i class="fas fa-comments"></i
></span> --%> <span title="Feedback" class="pointer greenHov actIcon"
															onclick="openFeedback('${internship[3]}', '${internship[6]}');">
																<i class="fas fa-comments"></i>
														</span> &nbsp;&nbsp;|&nbsp;&nbsp; <span title="Cancel Internship"
															class="pointer redHov actIcon"
															onclick="editInternship('${internship[6]}','cancelled','ongoing');"><i
																class="fa fa-ban" aria-hidden="true"></i></span>
															&nbsp;&nbsp;|&nbsp;&nbsp; <span title="Upload Assignment"
															class="pointer blueHov actIcon"
															onclick="openUploadPopup('${internship[0]}','${companyId}');"><i
																class="fa fa-upload" aria-hidden="true"></i></span>
															&nbsp;&nbsp;|&nbsp;&nbsp; <span
															title="Download Solved Assignment"
															class="pointer orangeHov actIcon"
															onclick="fetchAndDownloadAssignment('${internship[0]}');">
																<i class="fa fa-download" aria-hidden="true"></i>
														</span>
														</td>

													</c:if>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty ongoingInternships}">
									<label>No Ongoing Internships</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="completedTab" role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty completedInternships}">
									<table class="data-table table table-hover w-100">

										<thead class="thead-light">
											<tr>
												<th class="table-plus datatable-nosort">Student Name</th>
												<th>Institute Name</th>
												<th>Department</th>
												<c:if test="${user.role eq '1' || user.role eq '2' }">
													<th>Assigned Team</th>
												</c:if>
												<th>Skill</th>
												<th>Start Date ${internship[7]}</th>
												<th>End Date</th>
												<th>Duration</th>
												<th nowrap="nowrap">Action</th>
										</thead>

										<tbody>
											<c:forEach items="${completedInternships}" var="internship">
												<tr>
													<td><span style="cursor: pointer; color: blue"
														class="actionSpan" data-toggle="modal"
														data-target="#studentDetailsModal"
														onclick="dispStudentData('${internship[0]}');">${internship[8]}</span>
													</td>
													<td><c:if test="${not empty internship[9]}">
															<span>${internship[9]}</span>
														</c:if> <c:if test="${empty internship[9]}">
															<span>External Intern</span>
														</c:if></td>
													<td><c:if test="${not empty internship[10]}">
															<span>${internship[10]}</span>
														</c:if> <c:if test="${empty internship[9]}">-</c:if></td>
													<c:if test="${user.role eq '1' || user.role eq '2' }">
														<td><span>${internship[13]}</span></td>
													</c:if>
													<td><span>${internship[7]}</span></td>

													<td><span><fmt:formatDate
																pattern="yyyy-MM-dd" value="${internship[4]}" /></span>
													</td>
													<td><span><fmt:formatDate
																pattern="yyyy-MM-dd" value="${internship[12]}" /></span>
													</td>
													<td><span>${internship[3]}</span></td>
													<td style="white-space: nowrap"><span
														title="View Feedback" class="pointer greenHov actIcon"
														onclick="viewFeedback('${internship[6]}','${internship[3]}');"><i
															class="fa fa-eye"></i></span> &nbsp;&nbsp; | &nbsp;&nbsp;<span
														title="View feedback from college."
														class="pointer greenHov actIcon"
														onclick="showFeed('${internship[6]}','${internship[1]}','CP');"><i
															class="fa fa-eye"></i></span>&nbsp;&nbsp; | &nbsp;&nbsp;<span
														title="View Feedback From Student"
														class="pointer greenHov actIcon"
														onclick="viewStudsFeedback('${internship[6]}','${internship[0]}');"><i
															class="fa fa-eye"></i></span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty completedInternships}">
									<label>No Completed Internships</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="canceledTab" role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty canceledInternships}">
<table class="data-table table table-hover w-100">

										<thead class="thead-light">
											<tr>
												<th></th>
												<th class="table-plus datatable-nosort">Student Name</th>
												<th>Institute Name</th>
												<th>Department</th>
												<c:if test="${user.role eq '1' || user.role eq '2' }">
													<th>Assigned Team</th>
												</c:if>
												<th>Skill</th>
												<th>Duration</th>
												<th>Start Date</th>
												<th>Cancellation Date</th>
												<th>Cancellation Reason</th>
											</tr>
										</thead>

										<tbody id="tablist">
											<c:forEach items="${canceledInternships}" var="internship">
												<tr>
													<td></td>
													<td><span style="cursor: pointer; color: blue"
														class="actionSpan" data-toggle="modal"
														data-target="#studentDetailsModal"
														onclick="dispStudentData('${internship[0]}');">${internship[8]}</span>
													</td>
													<td><c:if test="${not empty internship[9]}">
															<span>${internship[9]}</span>
														</c:if> <c:if test="${empty internship[9]}">
															<span>External Intern</span>
														</c:if></td>
													<td><c:if test="${not empty internship[10]}">
															<span>${internship[10]}</span>
														</c:if> <c:if test="${empty internship[10]}">-</c:if></td>
													<c:if test="${user.role eq '1'}">
														<td><span>${internship[13]}</span></td>
													</c:if>
													<td><span>${internship[7]}</span></td>
													<td><span>${internship[3]}</span></td>
													<td><c:set var="dateString" value="${internship[4]}" />
														<fmt:parseDate var="parsedDate" value="${dateString}"
															pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${parsedDate}" /></td>

													<td><c:set var="dateString" value="${internship[11]}" />
														<fmt:parseDate var="parsedDate" value="${dateString}"
															pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${parsedDate}" /></td>

													<td><span>${internship[14]}</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty canceledInternships}">
									<label>No Canceled Internships</label>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br />
			<%@include file="modal_common.jsp"%>
			<%@include file="modalFeedback.jsp"%>
			<%@include file="footer.jsp"%>
			<%@include file="user_session.jsp"%>
			<%@include file="modal.jsp"%>
			<%@include file="modalStudentDetails.jsp"%>
		</div>
		<div class="modal fade" id="rejectModelfor_External_reqs"
			role="dialog" style="z-index: 1060">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content modelfix">
					<div class="panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							&times;</button>
						<h4 class="modal-title">Rejection Message</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="rejection_id" />
						<textarea class="form-control" rows="5" id="rejection_msg"
							placeholder="enter reason here"></textarea>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="internship_id_modal" /> <a type="submit"
							class="btn btn-primary"
							onclick="cancelInternshipByComp('${activeclass}',${internship[6]});">Confirm</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    
    
    function openFeedback(duration,internshipId) {
    	console.log("ddddddddddddddddddd"+ duration + internshipId)
        var months = duration; // Passed from backend
        var internship_id = internshipId; // Passed from backend
        showFeedback(months, internship_id);
        getFeedbackData(internship_id);
        
    }

    function showFeedback(months, internship_id) {
    	
    	
    	
    	
    	$(document).on("input", ".param-txt", function () {
    	    var row = $(this).closest("tr"); // Find the row where input is changed
    	    var sum = 0;
    	    var count = 0;
    	    var invalidInput = false;

    	    // Loop through only the first 8 parameter fields (ignore "Average" field)
    	    row.find("td input.param-txt:not([readonly])").each(function () {
    	        var val = parseFloat($(this).val()); // Convert to number
    	        if (!isNaN(val)) {
    	            if (val > 10) {
    	                // If value is greater than 10, reset the input and show alert
    	                $(this).val(""); // Clear the input
    	                invalidInput = true;
    	            } else {
    	                sum += val; // Add only valid numbers
    	                count++;
    	            }
    	        }
    	    });

    	    // If an invalid input was found (greater than 10), show the alert
    	    if (invalidInput) {
    	        alert("You cannot enter a value greater than 10.");
    	    }

    	    // Calculate average (if at least one valid number is entered)
    	    var avg = count > 0 ? (sum / count).toFixed(2) : "";
    	    
    	    // Update the "Average" column's input field
    	    row.find("td input[readonly]").val(avg);
    	});

    	
    	
    	
    	$("#btn").show(); 
        var totalWeeks = months * 4; // Total number of weeks (4 weeks per month)
        $("#total_weeks").val(totalWeeks);
        $("#txt_internship_id").val(internship_id);
        $("#monthTabs").empty();
        $("#feedbackContent").empty();
        
        // Initialize week count globally
        var weekNumber = 1;

        for (var month = 1; month <= months; month++) {
            let activeClass = month === 1 ? "active" : "";
            
            // Add month tab
            $("#monthTabs").append(
                "<li class='nav-item'>" +
                    "<a class='nav-link " + activeClass + "' data-toggle='tab' href='#month_" + month + "'>Month " + month + "</a>" +
                "</li>"
            );

            // Add corresponding content section for each month
            let content = "<div class='tab-pane fade " + (activeClass ? "show active" : "") + "' id='month_" + month + "'>" +
                "<table class='table table-bordered'>" +
                    "<thead class='table-light'>" +
                        "<tr>" +
                            "<th>Week</th>" +

                            "<th>Interest</th>"+
							"<th>Punctuality</th>"+
							"<th>Problem Solving</th>"+
							"<th>Communication Skills</th>"+
							"<th>Professionalism</th>"+
							"<th>Team Work / Leadership</th>"+
							"<th>Knowledge</th>"+
							"<th>Quality</th>"+
                            "<th>Average</th>" +
                            "<th>Action</th>"  +
                        "</tr>" +
                    "</thead>" +
                    "<tbody id='feedbackBody_" + month + "'></tbody>" +
                "</table>" +
            "</div>";
            $("#feedbackContent").append(content);

            // Generate 4 weeks for this month
            for (var week = 1; week <= 4; week++) {
                var row = "<tr id='row_" + weekNumber + "'><td>Week " + weekNumber + "</td>";
                
                for (var param_cnt = 1; param_cnt <= 8; param_cnt++) {
                    row += "<td><input id='param" + param_cnt + "_" + weekNumber + "' class='param-txt' type='text'></td>";
                }

                // Add Average field
                row += "<td><input id='avgParam_" + weekNumber + "' class='param-txt' type='text' readonly></td>"; 

                // ✅ Corrected: Added Save button properly
                row += "<td><button class='btn btn-success' onclick='saveWeekFeedback(" + weekNumber + ")'>"
     + "<i class='fas fa-check'></i></button></td></tr>";

                $("#feedbackBody_" + month).append(row);
                weekNumber++; // Increment the global week counter
            }
        }
        $("#feedbackModal").modal("show");
    }
    
    // ✅ Corrected Average Calculation
    $(document).on("input", ".param-txt", function () {
        var row = $(this).closest("tr"); // Find the row where input is changed
        var sum = 0;
        var count = 0;

        // Loop through only the first 8 parameter fields (ignore "Average" field)
        row.find("td input.param-txt:not([readonly])").each(function () {
            var val = parseFloat($(this).val()); // Convert to number
            if (!isNaN(val)) {
                sum += val; // Add only valid numbers
                count++;
            }
        });

        // Calculate average (if at least one valid number is entered)
        var avg = count > 0 ? (sum / count).toFixed(2) : "";
        
        // Update the "Average" column's input field
        row.find("td input[readonly]").val(avg);
    });

    function saveWeekFeedback(weekNumber) {
        var params = {};
        var sum = 0;
        var count = 0;
        var comments = $("#modalComment").val();

        // Loop through each parameter (1 to 8)
        for (var i = 1; i <= 8; i++) {
            var paramValue = $("#param" + i + "_" + weekNumber).val();
            params["parameter_" + i] = "w" + weekNumber + "-" + paramValue;
            var numericValue = parseFloat(paramValue);

            if (!isNaN(numericValue)) {
                sum += numericValue;
                count++;
            }
        }

        // Calculate the average (only if there are valid values)
        var avg = count > 0 ? (sum / count).toFixed(2) : "N/A";
        params["overall"] = "w" + weekNumber + "-" + avg;

        var internshipId = $("#txt_internship_id").val();
        var totalWeeks = parseInt($("#total_weeks").val()); // Get total weeks from hidden field
        var feedbakData = JSON.stringify(params);

        Swal.fire({
            title: "Confirm Save",
            text: "Are you sure you want to save this feedback?",
            icon: "question",
            showCancelButton: true,
            confirmButtonText: "Yes, Save it",
            cancelButtonText: "Cancel",
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: "saveFeedbackData",
                    data: { 
                        feedbakData: feedbakData,
                        internship_id: internshipId,
                        comments : comments 
                    },
                    success: function(response) {
                        Swal.fire("Saved!", "Feedback for Week " + weekNumber + " has been saved.", "success").then(() => {
                            // Check if this is the last feedback entry
                            if (weekNumber === totalWeeks) {
                                location.reload(); // Reload the page when last feedback is saved
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire("Error!", "There was an error saving the feedback. Please try again.", "error");
                    }
                });
            }
        });
    }



    function getFeedbackData(internshipId) {
        $.ajax({
            url: "feedbackFromCompany",
            type: "GET",
            data: { internship_id: internshipId },
            success: function(response) {
                // Log the response for debugging
                console.log(response);

                if (response.feedback) {
                    // Loop through the feedback list and fill in the parameters
                    var feedbackData = response.feedback;
                    var weekNumber = 1;

                    feedbackData.forEach(function(feed){
                        var params = feed.split("-");

                        // Loop through each parameter for the week
                        for (var i = 0; i < params.length; i++) {
                            var paramValue = params[i];
                            var paramField = $("#param" + (i + 1) + "_" + weekNumber);

                            if (paramField.length > 0) {
                                paramField.val(paramValue); // Fill parameters
                                paramField.prop("readonly", true); // Disable editing
                            }
                        }

                        // Update the average field
                        var sum = params.slice(0, params.length - 1) // Exclude last value for avg calculation
                            .reduce(function(acc, val) {
                                return acc + parseFloat(val);
                            }, 0);

                        var avg = (sum / (params.length - 1)).toFixed(2); // Average of first 8 parameters
                        $("#avgParam_" + weekNumber).val(avg); // Update average field

                        weekNumber++; // Move to the next week
                    });
                }

                // Set the comment
                if (response.comment) {
                    $("#feedback_comment").val(response.comment); // Set comment (ensure this ID exists in the form)
                }

                // Set the feedback week
                if (response.feedWeed) {
                    $("#feedWeek").val(response.feedWeed); // Set feedback week (ensure this ID exists in the form)
                }
            },
            error: function(error) {
                console.error("Error fetching feedback data: ", error);
            }
        });
    }


    $(document).ready(function() {
        var internshipId = $("#internshipId").val(); // Assuming you have the internship_id field in your HTML
        getFeedbackData(internshipId); // Call the function to load feedback data
    }); 
    
    
   /*  function skipRemainingFeedback() {
        var internship_id = $("#txt_internship_id").val();
        var fd = "SKIP"; // Example feedback data
        var commentsend = "No comments"; // If needed, else remove it
        

        // Create FormData object
        var formData = new FormData();
        formData.append("feedbakData", fd);
        formData.append("internship_id", internship_id);
        formData.append("comment", commentsend);
        
        
        
        

        Swal.fire({
            title: "Are you sure?",
            text: "This will mark the internship as completed and skip all remaining feedback!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#d33",
            cancelButtonColor: "#3085D6",
            confirmButtonText: "Yes, complete it!",
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: "saveFeedbackData",
                    data: formData,
                    processData: false,  
                    contentType: false,  
                    success: function () {
                        Swal.fire(
                            "Success!",
                            "Internship marked as completed.",
                            "success"
                        ).then(() => {
                            location.reload();
                        });
                    },
                    error: function () {
                        Swal.fire("Error!", "Error skipping feedback!", "error");
                    },
                });
            }
        });
    }
 */
 
 
 function skipRemainingFeedback() {
	    // First, show the comment modal
	    $("#commentModal").modal("show");
	   
	}
	function saveFinalComments() {
		 var internship_id = $("#txt_internship_id").val();
	        var fd = "SKIP"; // Example feedback data
	        var commentsend = document.getElementById("modalComment1").value;
	        console.log("sdddhdhdhdhd",commentsend);

	        // Create FormData object
	        var formData = new FormData();
	        formData.append("feedbakData", fd);
	        formData.append("internship_id", internship_id);
	        formData.append("comments", commentsend);    

	        Swal.fire({
	            title: "Are you sure?",
	            text: "This will mark the internship as completed and skip all remaining feedback!",
	            icon: "warning",
	            showCancelButton: true,
	            confirmButtonColor: "#d33",
	            cancelButtonColor: "#3085D6",
	            confirmButtonText: "Yes, complete it!",
	        }).then((result) => {
	            if (result.isConfirmed) {
	                $.ajax({
	                    type: "POST",
	                    url: "saveFeedbackData",
	                    data: formData,
	                    processData: false,  
	                    contentType: false,  
	                    success: function () {
	                        Swal.fire(
	                            "Success!",
	                            "Internship marked as completed.",
	                            "success"
	                        ).then(() => {
	                            location.reload();
	                        });
	                    },
	                    error: function () {
	                        Swal.fire("Error!", "Error skipping feedback!", "error");
	                    },
	                });
	            }
	        });
	}

    
    
    
    
    
    $(document).ready(function () {
        function toggleCommentBox() {
            var totalMonths = $("#monthTabs li").length; // Get total months
            var activeMonth = $("#monthTabs li a.active").parent().index() + 1; // Get active month index (1-based)
            if (activeMonth === totalMonths) {
                $("#commentBox").show();  // Show comment box only for the last month
            } else {
                $("#commentBox").hide();  // Hide for all other months
            }
        }
        // Detect when tabs are clicked
        $("#monthTabs").on("click", "a", function () {
            setTimeout(toggleCommentBox, 100); // Delay to allow the tab to activate
        });
        // Initially hide the comment box
        $("#commentBox").hide();
    });

    
    
    
    function fetchAndDownloadAssignment(studentId) {
        // Step 1: Fetch the solved assignment details
        fetch(`${pageContext.request.contextPath}/solved-assignments/`+studentId )
            .then((response) => {
                if (!response.ok) {
                    throw new Error(`Failed to fetch assignment: ${response.statusText}`);
                }
                return response.json();
            })
            .then((data) => {
                if (data.fileName) {
                    // Step 2: Call the download API with the retrieved filename
                    const downloadUrl = `${pageContext.request.contextPath}/download/`+data.fileName;
                    window.open(downloadUrl, '_blank'); // Open file in a new tab or trigger download
                } else {
                    Swal.fire('Error!', 'No file found for this assignment.', 'error');
                }
            })
            .catch((error) => {
                console.error('Error fetching assignment:', error);
                Swal.fire('Error!', 'Failed to fetch the assignment. Please try again.', 'error');
            });
    }

    
    //for upload assignment
    function openUploadPopup(studentId,companyId) {
    	  Swal.fire({
    	    title: 'Upload Assignment',
    	    html: `
    	      <input type="text" id="assignmentTitle" class="swal2-input" placeholder="Enter title" required>
    	      <textarea id="assignmentDescription" class="swal2-input" placeholder="Enter description" rows="3" required></textarea>
    	      <input type="file" id="assignmentFile" class="swal2-input" required>
    	    `,
    	    showCancelButton: true,
    	    confirmButtonText: 'Submit',
    	    cancelButtonText: 'Cancel',
    	    focusCancel: true,
    	    preConfirm: () => {
    	      const title = document.getElementById('assignmentTitle').value;
    	      const description = document.getElementById('assignmentDescription').value;
    	      const file = document.getElementById('assignmentFile').files[0];

    	      if (!title || !description || !file) {
    	        Swal.showValidationMessage('Please fill out all fields');
    	        return false;
    	      }

    	      // Create FormData for file upload
    	      const formData = new FormData();
    	      formData.append('studentId', studentId);
    	      formData.append('title', title);
    	      formData.append('description', description);
    	      formData.append('assignmentFile', file);
    	      formData.append('companyId',companyId)

    	      // Perform the AJAX upload request
    	      return fetch('${pageContext.request.contextPath}/uploadAssignment', {
    	        method: 'POST',
    	        body: formData,
    	      })
    	        .then(response => {
    	          if (!response.ok) {
    	            throw new Error('Upload failed');
    	          }
    	          return response.text();
    	        })
    	        .then(responseText => {
    	          Swal.fire('Success!', 'Assignment uploaded successfully', 'success');
    	        })
    	        .catch(error => {
    	          Swal.fire('Oops...', 'Something went wrong, please try again!', 'error');
    	        });
    	    }
    	  });
    	}

    function getFeedback(internship_id, callback) {
        $.ajax({
            type: 'GET',
            url: 'feedbackFromCompany',  // Make sure this is the correct URL
            data: { internship_id: internship_id },
            success: function(response) {
                console.log(response);  // Check what you get in the response
                callback(response);
            },
            error: function(xhr, status, error) {
                console.error('Error fetching feedback data:', error);
                swal("Error!", "Failed to fetch feedback.", "error");
            }
        });
    }


   /*  function viewFeedback(internship_id) {
        $("#feedbackBody").empty();
        if ($("#cmtLabel").length) {
            $("#cmtLabel").remove();
        }

        // ✅ Hide the "Skip All Remaining Feedback" button
        $("#btn").hide();  

        // Fetch feedback data
        getFeedback(internship_id, function(data) {
            var feed = data.feedback;
            var a = [];  
            var feedlength = feed.length;

            var fieldNames = [
                "Interest",
                "Punctuality",
                "Problem Solving",
                "Communication Skills",
                "Professionalism",
                "Team Work / Leadership",
                "Knowledge",
                "Quality"
            ];

            if (feedlength > 0) {
                var params = feed[0].split("-");
                for (var i = 0; i < fieldNames.length; i++) {
                    a[i] = 0;
                }

                var monthTabs = "";
                var feedbackByMonth = {};
                var totalMonths = Math.ceil(feedlength / 4);
    
                
                
                
                // ✅ Ensure only 3 months are considered
                var maxMonths = Math.min(totalMonths, 3);  

                for (var week = 1; week <= feedlength; week++) {
                    var month = Math.ceil(week / 4);
                    if (month > maxMonths) break; // ✅ Stop processing after 3 months

                    if (!feedbackByMonth[month]) {
                        feedbackByMonth[month] = [];
                    }
                    feedbackByMonth[month].push(feed[week - 1]);
                }

                // Create tabs dynamically for up to 3 months
                for (var month in feedbackByMonth) {
                    var activeClass = month == 1 ? "active" : "";
                    monthTabs += "<li class='nav-item'>" +
                        "<a class='nav-link " + activeClass + "' data-bs-toggle='tab' href='#month_" + month + "'>Month " + month + "</a>" +
                    "</li>";
                }
                $("#monthTabs").html(monthTabs);

                var monthContent = "";
                for (var month in feedbackByMonth) {
                    var monthContentHtml = "<div class='tab-pane fade " + (month == 1 ? "show active" : "") + "' id='month_" + month + "'>" +
                        "<table class='table table-bordered'>" +
                            "<thead class='table-light'>" +
                                "<tr><th>Week</th>";

                    for (var i = 0; i < fieldNames.length; i++) {
                        monthContentHtml += "<th>" + fieldNames[i] + "</th>";
                    }
                    monthContentHtml += "<th>Average</th></tr></thead><tbody>";

                    var monthFeedback = feedbackByMonth[month];
                    for (var week = 0; week < monthFeedback.length; week++) {
                        var params = monthFeedback[week].split("-");
                        var row = "<tr><td>Week " + (week + 1) + "</td>";

                        for (var prm_cnt = 0; prm_cnt < params.length; prm_cnt++) {
                            row += "<td>" + params[prm_cnt] + "</td>";
                            a[prm_cnt] += parseInt(params[prm_cnt]) / feedlength;
                        }

                        var weekAvg = (params.reduce((acc, val) => acc + parseInt(val), 0) / params.length).toFixed(2);
                        monthContentHtml += row;
                    }

                    monthContentHtml += "</tbody></table></div>";
                    monthContent += monthContentHtml;
                }

                $("#feedbackContent").html(monthContent);

                if (data.comment) {
                    var commentLabel = "<label id='cmtLabel'><strong>Comment : </strong>" + data.comment + "</label>";
                    $("#feedbackContentDiv").append(commentLabel);
                }

                $("#feedbackModal").modal("show");
            } else {
                swal("Feedback not given yet.");
            }
        });
    } */
    
    function viewFeedback(internship_id,duration) {
        $("#feedbackBody").empty();
        if ($("#cmtLabel").length) {
            $("#cmtLabel").remove();
        }

        // ✅ Hide the "Skip All Remaining Feedback" button
        $("#btn").hide();  

        getFeedback(internship_id, function(data) {
            console.log("📌 API Response:", data); // ✅ Debug API Response

            var feed = data.feedback;
            
           // var comment = data.comment;
            
            
          //  document.getElementbyId().value = 
          //  console.log("rishik", comment);
/*             var duration = data.duration;
 */          
 console.log("📌 Internship Duration:", duration); // ✅ Debug Duration

            var fieldNames = [
                "Interest",
                "Punctuality",
                "Problem Solving",
                "Communication Skills",
                "Professionalism",
                "Team Work / Leadership",
                "Knowledge",
                "Quality"
            ];

            var feedlength = feed.length;

            if (feedlength > 0) {
                var feedbackByMonth = {};
                var monthTabs = "";
                var maxMonths = Math.min(Math.ceil(feedlength / 4), duration);  // ✅ Limit to `duration`

                for (var week = 1; week <= feedlength; week++) {
                    var month = Math.ceil(week / 4);
                    if (month > maxMonths) break;  // ✅ Stop processing after `duration` months

                    if (!feedbackByMonth[month]) {
                        feedbackByMonth[month] = [];
                    }
                    feedbackByMonth[month].push(feed[week - 1]);
                }

                // ✅ Create tabs dynamically for fetched duration
                for (var month in feedbackByMonth) {
                    var activeClass = month == 1 ? "active" : "";
                    monthTabs += "<li class='nav-item'>" +
                        "<a class='nav-link " + activeClass + "' data-bs-toggle='tab' href='#month_" + month + "'>Month " + month + "</a>" +
                    "</li>";
                }
                $("#monthTabs").html(monthTabs);

                var monthContent = "";
                for (var month in feedbackByMonth) {
                    var monthContentHtml = "<div class='tab-pane fade " + (month == 1 ? "show active" : "") + "' id='month_" + month + "'>" +
                        "<table class='table table-bordered'>" +
                            "<thead class='table-light'>" +
                                "<tr><th>Week</th>";

                    for (var i = 0; i < fieldNames.length; i++) {
                        monthContentHtml += "<th>" + fieldNames[i] + "</th>";
                    }
                    monthContentHtml += "<th>Average</th></tr></thead><tbody>";

                    var monthFeedback = feedbackByMonth[month];
                    for (var week = 0; week < monthFeedback.length; week++) {
                        var params = monthFeedback[week].split("-");
                        var row = "<tr><td>Week " + (week + 1) + "</td>";

                        for (var prm_cnt = 0; prm_cnt < params.length; prm_cnt++) {
                            row += "<td>" + params[prm_cnt] + "</td>";
                        }

                        var weekAvg = (params.reduce((acc, val) => acc + parseInt(val), 0) / params.length).toFixed(2);
                       // row += "<td>" + weekAvg + "</td></tr>";
                        monthContentHtml += row;
                    }

                    monthContentHtml += "</tbody></table></div>";
                    monthContent += monthContentHtml;
                }

                $("#feedbackContent").html(monthContent);

                if (data.comment) {
                    $("#modalComment").val(data.comment).prop("disabled", true);
                    var commentLabel = "<label id='cmtLabel' class='mt-2'><strong>Comment : </strong>" + data.comment + "</label>";
                    $("#feedbackContentDiv").append(commentLabel);
                } else {
                    $("#modalComment").prop("disabled", false).val("");
                }
                $("#feedbackModal").modal("show");

            } else {
                swal("Feedback not given yet.");
            }
        });
    }

   
    
    function editInternship(internship_id, action, activeclass) {
        var title, msg;

        if (action == 'ongoing') {
            title = 'Start Internship';
            msg = 'Do you really want to start this internship?';
        } else if (action == 'cancelled') {
            title = 'Cancel Internship';
            msg = 'Do you really want to cancel this internship?';
        }

        // Display SweetAlert confirmation dialog
        swal({
            title: title,
            text: msg,
            icon: 'info',
            buttons: true,
         
        }).then((confirmed) => {
            if (confirmed) {
                $("#divLoading").show();
                $.ajax({
                    type: 'get',
                    url: 'editInternship?internship_id=' + internship_id
                        + "&action=" + action + "&activeclass="
                        + activeclass,
                    success: function(response) {
                        if (response != "success") {
                            $("#divLoading").hide();
                            swal(response);
                        } else {
                            $("#divLoading").hide();
                            location.reload(true);
                        }
                    },
                    error: function() {
                        $("#divLoading").hide();
                        alert(error_fetch);
                    }
                });
            }
        });
    }




    function dispStudentData(studentId) {
	    $("#divLoading").show();

	    $.ajax({
	        type: "GET",
	        url: "${pageContext.request.contextPath}/getStudentDetails?student_id=" + studentId,
	        async: false,
	        success: function(response) {
	            $('#scrollDiv').scrollTop(0);

	            var studentDetails = response.student;
	            var project = response.lastProject;

	            // Basic Info
	            $("#name").text(studentDetails.student_name || "");
	            $("#email").text(studentDetails.email_id || "");
	            $("#contact").text(studentDetails.contact || "");
	            $("#curr_city").text(studentDetails.curr_city || "");
	            $("#home_city").text(studentDetails.home_city || "");
	            $("#skills").text(studentDetails.skills || "");
	            $("#dob").text(studentDetails.d_o_b || "");
	            $("#interest").text(studentDetails.interest || "");
	            $("#achievements").text(studentDetails.achievements || "");

	            // Profile Picture
	            if (studentDetails.photo && studentDetails.photo !== "") {
	                $("#studentPic").attr("src", "data:image/png;base64," + studentDetails.photo);
	            } else {
	                $("#studentPic").attr("src", "default-profile.png"); // fallback if no image
	            }

	            // Resume Section
	            if (studentDetails.resume && studentDetails.resume.trim() !== "") {
	                $("#resumeSection").show();
	                const fileName = studentDetails.resume.split('/').pop();
	                $("#resumeName").text(fileName);
	                $("#resumeLink").attr("href", "${pageContext.request.contextPath}/viewFile/" + encodeURIComponent(studentDetails.resume));
	            } else {
	                $("#resumeSection").hide();
	            }

	            // LinkedIn Section
	            if (studentDetails.linkedIn && studentDetails.linkedIn.trim() !== "") {
	                $("#linkedinSection").show();
	                $("#linkedinLink").attr("href", studentDetails.linkedIn);
	            } else {
	                $("#linkedinSection").hide();
	            }

	            // Last Project Section
	            if (project) {
	                $("#projectTitle").text(project.title || "Untitled");
	                $("#projectDescription").text(project.description || "");
	                $("#projectGithub").attr("href", project.githubLink || "#");
	                $("#projectDate").text(project.createdAt || "");
	                $("#projectSection").show();
	            } else {
	                $("#projectSection").hide();
	            }

	            $('#studentDetailsModal').modal('show');
	            $("#divLoading").hide();
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching student details:", error);
	            $("#divLoading").hide();
	        }
	    });
	}
    </script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/jquery-confirm.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<%--     <script src="${pageContext.request.contextPath}/style/dist/js/myjs/company_feedback.js"></script>
 --%>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/students_feedback_script.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
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
</body>
</html>
