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
<title>SkillPilots | Student Internship</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico" />

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

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

.card-header-tabs {
	margin-right: -0.625rem;
	margin-bottom: -0.75rem;
	margin-left: -0.625rem;
	border-bottom: inherit !important;
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

.table td {
	padding: 0.4rem !important;
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
			<div class="title pb-20">
				<h5 class="h4 mb-0 text-center"
					style="background: #0f2c7eeb; color: white; border-radius: 4px">
					Internship's Status</h5>
			</div>
			<div class="pd-20 card-boxcard card-box text-center">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs" role="tablist">
						<li hidden class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#pendingTab" role="tab"
							aria-selected="true">Pending Internships</a>
						</li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#ongoingTab" role="tab" aria-selected="false">Ongoing
								Internships</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#completedTab" role="tab" aria-selected="false">Completed
								Internships</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#canceledTab" role="tab" aria-selected="false">Canceled
								Internships</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="pendingTab"
							role="tabpanel" style="text-align: initial">
							<div class="pd-20">
								<c:if test="${not empty internship}">
									<table class="data-table table hover nowrap">
										<thead>
											<tr>
												<th class="table-plus datatable-nosort">Company Name</th>
												<th>Skill</th>
												<th>Duration (in weeks)</th>
												<th>Start Date</th>
												<th>Cancel Internship</th>
											</tr>
										</thead>

										<tbody id="tablist">
											<c:forEach items="${internship}" var="intern">
												<tr>
													<td><span>${intern.companyName}</span></td>
													<td><span>${intern.technology}</span></td>
													<td><span>${intern.duration}</span></td>
													<td><span>${intern.date_started}</span></td>

													<td><span title="Cancel Internship"
														class="pointer redHov actIcon"
														onclick="cancelMyInternship('${intern.internship_id}');"><i
															class="fa fa-ban" aria-hidden="true"></i></span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty internship}">
									<label>No Pending Internships</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="ongoingTab" role="tabpanel"
							style="text-align: initial">
							<div class="pd-20">
								<c:if test="${not empty internship2}">
									<table class="data-table table hover nowrap">
										<thead>
											<tr>
												<th>Company Name</th>
												<th>Skill</th>
												<th>Duration (in weeks)</th>
												<th>Date Started</th>
												<th>Feedback</th>
											</tr>
										</thead>
										<tbody id="tablist">
											<c:forEach var="comp" items="${internship2}">
												<tr>
													<td><span>${comp.companyName}</span></td>
													<td><span>${comp.technology}</span></td>
													<td><span>${comp.duration}</span></td>
													<td><span>${comp.date_started}</span></td>
													<td><span title="Feedback"
														class="pointer greenHov actIcon"
														onclick="viewFeedback('${comp.internship_id}');">
															<i class="fa fa-commenting"></i>
													</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty internship2}">
									<label>No Current Internships</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="completedTab" role="tabpanel"
							style="text-align: initial">
							<div class="pd-20">
								<c:if test="${not empty internship3}">
									<table class="data-table table hover nowrap">
										<thead>
											<tr>
												<th>Company Name</th>
												<th>Skill</th>
												<th>Duration (in weeks)</th>
												<th>Date Started</th>
												<th>Completion Date</th>
												<th>Feedback</th>
											</tr>
										</thead>

										<tbody id="tablist">
											<c:forEach var="comp" items="${internship3}">
												<tr>
													<td><span>${comp.companyName}</span></td>
													<td><span>${comp.technology}</span></td>
													<td><span>${comp.duration}</span></td>
													<td><c:set var="dateString"
															value="${comp.date_started}" /> <fmt:parseDate
															var="parsedDate" value="${dateString}"
															pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${parsedDate}" /></td>
													<td><c:set var="dateString"
															value="${comp.date_completed}" /> <fmt:parseDate
															var="parsedDate" value="${dateString}"
															pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${parsedDate}" /></td>
													<td><span title="Give feedback to company."
														class="pointer greenHov actIcon"
														onclick="showFeed('${comp.internship_id}','${comp.student_id}','${user.role}');"><i
															class="fa fa-commenting"></i></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span
														title="View Feedback From Company"
														class="pointer greenHov actIcon"
														onclick="viewFeedback('${comp.internship_id}');"><i
															class="fa fa-street-view fa-spin"></i></span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty internship3}">
									<label>No Past Internships</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="canceledTab" role="tabpanel"
							style="text-align: initial">
							<div class="pd-20">
								<c:if test="${not empty internship4}">
									<table class="data-table table hover nowrap">
										<tr>
											<th>Company Name</th>
											<th>Skill</th>
											<th>Duration (in weeks)</th>
											<th>Start Date</th>
											<th>Cancellation Date</th>
											<th>Cancellation Reason</th>
										</tr>

										<tbody id="tablist">
											<c:forEach items="${internship4}" var="internship">
												<tr>
													<td><span>${internship.companyName}</span></td>
													<td><span>${internship.technology}</span></td>
													<td><span>${internship.duration}</span></td>
													<td><c:set var="dateString"
															value="${internship.date_started}" /> <fmt:parseDate
															var="parsedDate" value="${dateString}"
															pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${parsedDate}" /></td>
													<td><c:set var="dateString"
															value="${internship.date_completed}" /> <fmt:parseDate
															var="parsedDate" value="${dateString}"
															pattern="yyyy-MM-dd" /> <fmt:formatDate
															value="${parsedDate}" /></td>
													<td>no intrested</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty internship4}">
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
			<%@include file="modal.jsp"%>
		</div>
	</div>

	<!-- js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/company_feedback.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/students_feedback_script.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
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
