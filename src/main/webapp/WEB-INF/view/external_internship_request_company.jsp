
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="user_session.jsp"%>

<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Internship Requests</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
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

.dataTable {
	white-space: nowrap;
}
</style>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img
					src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
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
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
				alt="" class="dark-logo"> <img
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg"
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

			<div class="title pb-20 text-center">
				<h4 class="h4 mb-0 text-center"
					style="color: white; background: #0f2c7eeb; border-radius: 5px;">Internship
					Request</h4>
			</div>
			<div class="card-box mb-30">
				<div class="pd-20">
					<c:if test="${not empty external_requests}">
						<table class="data-table table hover">
							<thead class="thead-light">
								<tr>
									<th class="table-plus datatable-nosort">Request ID</th>
									<th>Institute Name</th>
									<th>Request Date</th>
									<th>Interns Group</th>
									<th>Status/Action</th>
									<th>Expiration Date</th>
									<th>Request Message</th>
								</tr>
							</thead>
							<tbody id="tablist">
								<!-- today Date -->
								<jsp:useBean id="now" class="java.util.Date" />
								<c:forEach items="${external_requests}" var="external_request">
									<tr>
										<td>${external_request[0]}</td>
										<td><span class="pointer" id="${external_request[2]}"
											onclick="getCollegeDetails('${external_request[2]}',false);">
												${external_request[14]}</span></td>
										<td><c:set var="dateString"
												value="${external_request[3]}" /> <fmt:parseDate
												var="parsedDate" value="${dateString}" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${parsedDate}" /></td>

										<td><span class="pointer intrngrp"
											onclick="studentId(this);" data-toggle="modal"
											data-target="#all_interns_details"
											id="${external_request[4]}"> <strong
												style="color: #1b00ff;">Group Details</strong>
										</span></td>
										<td><c:if test="${external_request[5] eq 'S'}">
												<b><span
													style="color: #ffffff; background: #13aef5; padding: 3px 7px 3px 7px; border-radius: 4px;"><i
														class="fa fa-check-circle" style="color: greenyellow;"></i>&nbsp;Team
														Assigned</span></b>
												<%-- <a class="btn btn-warning " onclick="assigned_test('${external_request[0]}','${external_request[1]}')" data-toggle="collapse" data-target="#collapse${student[0]}">Test Assigned <i class="fa fa-sort-desc" aria-hidden="true"></i>
														</a> --%>
											</c:if> <c:if test="${external_request[5] eq 'A'}">
												<b><span
													style="color: #ffffff; background: #0ea6ea; padding: 6px 7px 6px 5px; border-radius: 4px;">Approved</span></b>
												<a class="btn btn-primary mb-1" data-toggle="collapse"
													style="background: #5ac323c7; border-color: #7ed053; color: white; padding: 1px 6px 2px 6px;"
													data-target="#s${external_request[0]}"> Assign<i
													class="fa fa-sort-desc" aria-hidden="true"
													style="padding: 0 0px 4px 4px;"></i>
												</a>
												<div id="s${external_request[0]}" class="collapse">
													<div class="col-sm-12 form-inline"
														style="width: 100%; border: 1px solid; border-color: #1974c3; background-color: #317c9e40; padding: 10px;">
														<p class="form-inline" style="width: 100%">
															<b>Team :&nbsp;</b> <select
																class="selectteam form-control"
																id="teamToAssign${external_request[0]}"
																style="width: 180px; height: 33px; margin-left: 17px;">
																<option value="-1" selected="selected"
																	disabled="disabled">Select a Team</option>
																<c:forEach var="team" items="${listDept_name}">
																	<option id="${team.compDeptLinkId}"
																		value="${team.deptName}">${team.deptName}</option>
																</c:forEach>
															</select>
														</p>
														<p class="form-inline">
															<b>Skill: </b>
															<c:if test="${empty external_request[8]}">
																<select id="tech${external_request[0]}"
																	class="form-control"
																	style="padding: 4px; margin-left: 4px;">
																	<option value="-1">Select a Skill</option>
																	<c:forEach var="technology" items="${technologylist}">
																		<option value="${technology.technology_name}">
																			${technology.technology_name}</option>
																	</c:forEach>
																</select>
															</c:if>
															<c:if test="${not empty external_request[8] }">
																<input id="tech${external_request[0]}"
																	class="form-control"
																	style="width: 180px; margin-left: 34px; height: 33px;"
																	value='${external_request[8]}' disabled="disabled">
															</c:if>
														</p>
														<p class="form-inline">
															<b>Duration: </b>
															<c:if test="${external_request[9] eq 0}">
																<select id="duration${external_request[0]}"
																	class="form-control">
																	<option value="0" selected="selected"
																		disabled="disabled">Select Duration</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																	<option value="6">6</option>
																	<option value="7">7</option>
																	<option value="8">8</option>
																	<option value="9">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																	<option value="16">16</option>
																	<option value="20">20</option>
																	<option value="24">24</option>
																	<option value="32">32</option>
																	<option value="40">40</option>
																	<option value="52">52</option>
																</select>
																<span>&nbsp;Week's</span>
															</c:if>
															<c:if test="${external_request[9] ne 0}">
																<input id="duration${external_request[0]}"
																	class="form-control"
																	style="width: 50px; margin-left: 4px; height: 33px;"
																	value='${external_request[9]}' disabled="disabled"> week(s)
																</c:if>
														</p>
														<button class="btn btn-primary btn-sm"
															style="background: #5ac323c7; color: white; padding: 1px 6px 2px 6px; margin-left: 13px; margin-bottom: 16px;"
															style="margin: 0px !important; border-radius: 10pc !important; position: absolute; left: 75%; top: 60%;"
															onclick="checkAvailabiltyOfInterns('${external_request[0]}');">
															Assign</button>
													</div>
												</div>
											</c:if> <c:if
												test="${external_request[5] eq ProjectConstants.external_req_approval_status_cancelled}">
												<b><span class="Rcolor">Canceled</span></b>
											</c:if> <c:if
												test="${external_request[5] eq ProjectConstants.external_req_approval_status_rejected}">
												<span class="tooltip">Rejected <span
													class="tooltiptext">${external_request[7]}</span>
												</span>
												<span class="label label-success pointer"
													onclick="undoExtReqRejection('${external_request[0]}');"
													style="margin-right: 5%; float: right; padding: 5px; background: #317c9e96; color: white; border-radius: 5px;"><i
													class="fa fa-undo" aria-hidden="true"></i> UNDO</span>
											</c:if> <c:if
												test="${external_request[5] eq ProjectConstants.request_cancelled_by_system}">
												<b><span
													title="Internship started in some other company.">Cancelled</span></b>
											</c:if> <c:if test="${external_request[5] eq 'P'}">

												<c:if
													test="${external_request[5]  eq ProjectConstants.external_req_approval_status_pending && now gt external_request[11] }">
													<b><span class="Rcolor">Canceled Request </span></b>
												</c:if>
												<c:if
													test="${external_request[5]  eq 'P' && now le external_request[11] }">

													<span class="label label-success pointer"
														style="background: #0e9dde; color: white; padding: 3px 5px 7px 8px; border-radius: 3px;"
														onclick="viewTests1('${external_request[0]}','${external_request[5]}','${external_request[12]}');">
														Assign Test </span>


													<a class="btn btn-primary"
														style="background: #5ac323c7; color: white; padding: 2px 6px 2px 6px; border: aliceblue;"
														href="ext_req_status_change?status=A&req_id=${external_request[0]}&stud_list=">
														Approve</a>
													<button class='btn btn-danger' data-toggle="modal"
														style="background: red; color: white; padding: 1px 6px 1px 6px;"
														data-target="#rejectModelfor_External_req"
														onclick="rejectReqId('${external_request[0]}');">Reject</button>
												</c:if>
											</c:if> <c:if test="${external_request[5] eq 'T'}">

												<c:forEach items="${assigned_status}" var="status">
													<c:if test="${status.key eq external_request[0]}">
														<c:if test="${status.value eq 'P'}">
															<span class="label"
																style="background: green; padding: 3px 4px 7px 7px; border-radius: 3px;">Test
																Assigned&nbsp;</span>
															<i class="fa fa-pencil" aria-hidden="true"
																onclick="viewTests$('{external_request[0]}','${external_request[5]}');"></i>
														</c:if>
														<c:if test="${status.value eq 'AP'}">
															<span class="label label-info pointer"
																style="color: red;"
																onclick="viewResultsOfStud('${external_request[4]}','${external_request[0]}')">Check
																Test Status</span>
														</c:if>
														<c:if test="${status.value eq 'exp'}">
															<span class="label label-info pointer">Test
																Expired</span>
															<i class="fa fa-pencil" aria-hidden="true"
																onclick="viewTests('${external_request[0]}','exp_external');"></i>
														</c:if>
													</c:if>
												</c:forEach>

											</c:if></td>
										<td><c:set var="dateString"
												value="${external_request[11]}" /> <fmt:parseDate
												var="parsedDate" value="${dateString}" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${parsedDate}" /></td>

										<td>${external_request[6]}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
			<div class="card-box mb-30">
				<div class="pd-20">
				
					<c:if test="${not empty studentRequestList }">
						<table class="data-table table hover">

							<thead class="thead-light">
								<tr>
									<th>Request ID</th>
									<th>Student Info</th>
									<th>Job Type</th>
								    <th>Working Type</th>
									<th>Apply for Skill</th>
									<th>Apply To</th>
									<th>Expiration Date</th>
									<th>Status/Action</th>
									<th>Request Message</th>
									<th>Note from College</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach items="${studentRequestList}" var="student">
									<tr>
										<td>${student.request_id}</td>
										<td><a style="cursor: pointer; color: #1B00FF;"
											data-toggle="modal" data-target="#studentDetailsModal"
											onclick="dispStudentData('${student.student_id}')"
											> ${student.username}</a></td>

										<td>${student.jobType}</td>
											<td>${student.workingType}</td>
										<td id="${student.technology_name}">${student.technology_name}
										</td>
										<td><c:set var="dateString"
												value="${student.creation_date}" /> <fmt:parseDate
												var="parsedDate" value="${dateString}" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${parsedDate}" /></td>
										<td><c:set var="dateString"
												value="${student.expiration_date}" /> <fmt:parseDate
												var="parsedDate" value="${dateString}" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${parsedDate}" /></td>
										<td><c:if test="${student.approval_status eq 'pending'}">
												<!-- Button to assign test -->
												<span class="label label-success pointer"
													style="background: #10ea2b80; padding: 3px 5px 5px 4px; border-radius: 4px;"
													onclick="viewTests('${student.request_id}','${student.approval_status}');"><i
													class="fa fa-file-text" aria-hidden="true"></i> Assign Test</span>
												<!-- Button to approve -->
												<span class="label label-success pointer"
													style="background: #10ea2b80; padding: 3px 5px 5px 4px; border-radius: 4px;"
													onclick="approved('${student.request_id}');"><i
													class="fa fa-check" aria-hidden="true"></i> Approve</span>
												<!-- Button to reject -->
												<span type="submit" id="reject_btn"
													class="label label-danger pointer" data-toggle="modal"
													data-target="#student_req_reject"
													style="background: red; padding: 3px 5px 5px 4px; border-radius: 4px;"
													onclick="setRejection_id('${student.request_id}');"><i
													class="fa fa-times" aria-hidden="true"></i>Reject</span>
											</c:if> <c:if test="${student.approval_status eq 'R'}">
												<div class="label-wrapper"
													style="position: relative; z-index: 1;">
													<span class="label label-danger tooltip"
														style="opacity: 1; background: red; padding: 3px 5px; color: white; border-radius: 4px;">
														Rejected </span>
												</div>
												<span class="btn btn-primary btn-sm"
													onclick="undoRejection('${student.request_id}');"
													style="padding: 2px 6px 2px 6px; background: #1b00ff; color: white; border-radius: 4px; float: right;"><i
													class="fa fa-undo fa-spin" aria-hidden="true"
													style="color: #13fd13;"></i> UNDO</span>
											</c:if> <c:if test="${student.approval_status eq 'S'}">
												<span class="label label-success">Team Assigned</span>
											</c:if> <!-- -------------start of assign button code--------------- -->
											<c:if
												test="${student.approval_status eq 'A' || (empty student.creation_date && student.approval_status eq ProjectConstants.student_req_approval_status_pending)}">
												<a class="btn btn-success btn-sm" data-toggle="collapse"
													style="padding: 3px; color: white;"
													data-target="#collapse${student.request_id}">Assign <i
													class="fa fa-sort-desc" aria-hidden="true"></i>
												</a>
												<span id="reject_btn" class="label label-danger pointer"
													style="background: red; padding: 4px 3px 8px 3px; color: white; border-radius: 4px;"
													data-toggle="modal" data-target="#student_req_reject"
													onclick="setRejection_id('${student.request_id}');"><i
													class="fa fa-times" aria-hidden="true"></i> Reject</span>
												<div id="collapse${student.request_id}" class="collapse"
													style="padding-top: 4px;">
													<div class="col-sm-12 form-inline"
														style="width: 100%; border: 1px solid; border-color: #1974c3; background-color: #317c9e40; padding: 10px;">
														<p class="form-inline" style="width: 100%">
															<b>Team :&nbsp;</b> <select
																class="selectteam form-control"
																id="teamToAssign${student.request_id}"
																style="width: 150px; height: 33px;">
																<option value="-1" selected="selected"
																	disabled="disabled">Select a Team</option>
																<c:forEach var="team" items="${listDept_name}">
																	<option id="${team.compDeptLinkId}"
																		value="${team.deptName}">${team.deptName}</option>
																</c:forEach>
															</select>
														</p>
														<p class="form-inline">
															<b>Duration :&nbsp;</b>
															<c:if
																test="${empty student.duration || student.duration==0}">
																<select id="duration${student.request_id}"
																	class="form-control">
																	<option value="0" selected="selected"
																		disabled="disabled">Select Duration</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																	<option value="6">6</option>
																	<option value="7">7</option>
																	<option value="8">8</option>
																	<option value="9">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																	<option value="16">16</option>
																	<option value="20">20</option>
																	<option value="24">24</option>
																	<option value="32">32</option>
																	<option value="40">40</option>
																	<option value="52">52</option>
																</select>
																<span> week(s)</span>
															</c:if>
															<c:if test="${student.duration>0}">
																<input id="duration${student.request_id}"
																	class="form-control" value='${student.duration}'
																	disabled="disabled">&nbsp;week(s)
																</c:if>
														</p>
														<p class="form-inline">
															<b>Skill: </b>
															<c:if test="${empty student.technology_name}">
																<select id="tech${student.request_id}"
																	class="form-control"
																	style="padding: 4px; margin-left: 4px;">
																	<option value="-1">Select a Skill</option>
																	<c:forEach var="technology" items="${technologylist}">
																		<option value="${technology.technology_name}">${technology.technology_name}</option>
																	</c:forEach>
																</select>
															</c:if>
															<c:if test="${not empty student.technology_name }">
																<input id="tech${student.request_id}"
																	style="height: 1%;" class="form-control"
																	value='${student.technology_name}' disabled="disabled">
															</c:if>
														</p>
														<button class="btn btn-primary btn-xs"
															id="assignBtn${student.request_id}"
															style="margin: 0px !important; border-radius: 4px !important; position: absolute; padding: 0px 7px 3px 7px; left: 70%; top: 65%;"
															onclick="assignTeamToStudent('${student.request_id}');">Assign</button>
													</div>
												</div>
											</c:if> <!-- -------------end of assign button code--------------- -->
											<c:if
												test="{$approval_status eq ProjectConstants.student_req_approval_status_iii_approval && not empty student[7]}">
												<span class="label label-info">Pending At T&P</span>
											</c:if> <c:if
												test="{$approval_status eq ProjectConstants.student_req_approval_status_hod_approval && not empty student[7]}">
												<span class="label label-info"
													style="padding: 3px 3px 3px 3px; border-radius: 3px; color: white;">Pending
													At HOD</span>
											</c:if> <c:if
												test="$approval_status eq ProjectConstants.request_cancelled_by_system}">
												<span class="label label-info"
													title="Internship started in some other company.">Cancelled</span>
											</c:if> <c:if test="${student.approval_status eq 'T'}">

												<span class="label pointer"
													style="background: #0fea0b85; padding: 4px 4px 4px 4px; border-radius: 4px;">Test
													Assigned</span>
												<i class="fa fa-pencil" aria-hidden="true"
													onclick="viewTests('${student.request_id}','${student.approval_status}');"></i>

												<c:if test="${status.value eq 'exp'}">
													<span class="label label-info pointer"
														style="background: red; color: white; padding: 2px 4px 3px 4px; border-radius: 3px;">Test
														Expired</span>
													<i class="fa fa-pencil-square-o" aria-hidden="true"
														style="color: #1b00ff; font-size: 17px;"
														onclick="viewTests('${student.request_id}','exp_student');"></i>
												</c:if>
											</c:if> <c:if test="${student.approval_status eq 'D'}">
												<span class="label label-info pointer"
													style="padding: 3px 5px 3px 5px; border-radius: 3px; color: white;"
													onclick="view_testresult('${student.request_id}', '${student.student_id}', '${user.role}')">View
													Result</span>
											</c:if></td>
										<td>${student.request_msg}</td>
										<td>${student.college_req_msg}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
				<div class="modal fade show" id="details_modals" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="panel-heading"
								style="font-size: 18px; background: #0f2c7eeb; color: whitesmoke; text-align: center;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<span class="modal-title" id="det_title"></span>
							</div>
							<div class="modal-body comp_col_info_modal_body">
								<div id="div_logo" style="text-align: center">
									<img id="item_logo" alt=" src=" style="max-height: 120px;">
								</div>
								<br>
								<div class="row">
									<div class="col-md-3" id="about_us_para">
										<strong><span>About Us : </span><br></strong>
									</div>
									<div class="col-md-9">
										<strong><span id="det_about_us"
											style="font: status-bar; line-height: 1.5rem; font-size: 14px;"></span></strong>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-md-3">
										<strong>Estd. Date : </strong>
									</div>
									<div class="col-md-9">
										<strong><span id="det_est"></span></strong>
									</div>
								</div>
								<br>
								<div class="row" id="coll_details_dept" style="display: none">
									<div class="col-md-3">
										<strong>Departments : </strong>
									</div>
									<div class="col-md-9">
										<strong><span id="deptDetailsBody"></span></strong>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<strong>Website : </strong>
									</div>
									<div class="col-md-9">
										<strong><a id="det_weburl_link" target="new"><span
												id="det_weburl"></span></a></strong>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<!-- Modal -->
				<!-- Modal -->
				<div class="modal fade" id="uploadPdfModal" tabindex="-1"
					role="dialog" aria-labelledby="uploadPdfModalLabel"
					aria-hidden="true" style="background: rgba(0,0,0,0.7); z-index: 1100">
					<div class="modal-dialog" role="document">
						<div class="modal-content" id="uploadPdfModalContent">
							<div class="modal-header" id="uploadPdfModalHeader">
								<h5 class="modal-title" id="uploadPdfModalLabel">
									<i class="fas fa-user-check"></i> Approve Student
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form id="uploadPdfForm" enctype="multipart/form-data">
								<div class="modal-body" id="uploadPdfModalBody">
									<div class="form-group">
										<label for="pdfFile" id="uploadPdfLabel"
											class="font-weight-bold">Upload Offer Letter
											(Optional)</label>
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="pdfFile"
												name="pdfFile" accept="application/pdf"> <label
												class="custom-file-label" for="pdfFile"
												id="uploadPdfFileLabel">Choose file...</label>
										</div>
										<small class="form-text text-muted mt-2"> You can skip
											this step if the offer letter is not available. </small>
									</div>
								</div>
								<div class="modal-footer d-flex justify-content-between"
									id="uploadPdfModalFooter">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">
										<i class="fas fa-times"></i> Close
									</button>
									<button type="submit" class="btn btn-success">
										<i class="fas fa-check"></i> Approve
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
			<%@include file="modal_common.jsp"%>
			<%@include file="modal.jsp"%>
			<%@include file="modalStudentDetails.jsp"%>
			<%@include file="setTest.jsp"%>

			<%@include file="testResult.jsp"%>

			<%@include file="footer.jsp"%>
		</div>
	</div>

	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/companyCollegeExternalReq.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/student_internship_request_to_comapny.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/onlineTestScript.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
function approved(request_id) {
    // Open the modal for offer letter upload
    $('#uploadPdfModal').modal('show');

    // Handle form submission
    $('#uploadPdfForm').off('submit').on('submit', function(e) {
      e.preventDefault(); // Prevent default form submission

      // Show SweetAlert loader
      swal({
        title: 'Processing...',
        text: 'Please wait while the approval is being processed.',
        icon: 'info',
        buttons: false,
        closeOnClickOutside: false,
        closeOnEsc: false,
        content: {
          element: "div",
          attributes: {
            innerHTML: `<div class="swal-loader"><i class="fa fa-spinner fa-spin"></i> Loading...</div>`
          }
        }
      });

      // Create a FormData object to hold the uploaded file and request ID
      var formData = new FormData(this);
      formData.append('request_id', request_id);

      // Make API call to upload offer letter and process approval
      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/api/approve-student", // Update this URL based on your endpoint
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
          swal.close(); // Close SweetAlert
          swal('Success', 'Student approved successfully.', 'success')
            .then(() => location.reload()); // Reload page on confirmation
        },
        error: function() {
          swal.close(); // Close SweetAlert
          swal('Error', 'Failed to approve student.', 'error');
        }
      });
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


function getCollegeDetails(elem,show_dept){
	 $("#details_modals").modal();
		$.ajax({
		type : "GET",
		url : "getCollegeDetails?college_id=" + elem,
		success : function(response) {

			/*getting college details along with departments table data*/
			var collegeDetails = response.college;
			var deptDetails;
			if(show_dept){
				$("#deptDetailsBody").empty();
				if(response.department=="none")
				{
					$("#deptDetailsBody").append("This College hasn't registered any department yet.");
				}else{
					deptDetails=response.department;
					for(var i = 0 ; i < deptDetails.length; i++)
					{
						var tableRow = "<tr><td>" +deptDetails[i]+"</td></tr>";
						$("#deptDetailsBody").append(tableRow);
					}
					$("#deptDetailsBody").show();
				}
				$("#coll_details_dept").show();
				 $("#details_modals").modal();
			} else{
			$("#coll_details_dept").hide();
			$("#det_title").text(collegeDetails.college_name);
			$("#det_est").text(collegeDetails.estd_date);
			$("#det_contact1").text(collegeDetails.contact_1);
			$("#det_contact2").text(collegeDetails.contact_2);
			$("#det_email").text(collegeDetails.email_id);
			$("#det_weburl").text(collegeDetails.web_url);
			$("#about_us_para").hide();
			$('#item_logo').attr('src', 'data:image/png;base64,'+collegeDetails.logo);
			$("#details_modals").modal("show");
			}
			
		},
		error : function() {
			alert('Error occured');
		}
	});
}


</script>

	<script type="text/javascript">
		//set id on model
		function setRejection_id(id) {
			$('#txt_request_id').val(id);
		}
		function rejectReqId(req_id) {
			$('#rejection_id').val(req_id);
		}

		function assigned_test(request_id, student_id) {
			console.log("Req Id :" + request_id);
			console.log("Instu Id :" + student_id);
			$.ajax({
				type : "GET",
				url : "getAssignedTestName?request_id=" + request_id,
				success : function(response) {
					$("#student_test_id").val(response[0]);
					$("#test_name_" + student_id).text(response[1]);
					$(".assigned_test_name" + request_id).tooltip({
						title : response[1]
					});
				},
				error : function() {
					alert('not assigned');
				}
			});
		}
	</script>
</body>
</html>