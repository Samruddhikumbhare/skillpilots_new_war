<%@include file="user_session.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Live Chat</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
<link href="${pageContext.request.contextPath}/style/dist/css/live_chat.css" rel="stylesheet" type="text/css" />
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
	.parameter {
    padding: 0;
}
.user-notification .dropdown-toggle .badge {
    position: absolute;
    right: 5px;
    top: 7px;
  /*   background: #0f2c7eeb; */
    width: 5px;
    height: 5px;
    display: block;
    padding: 0;
}
.notification-list ul li a {
    display: block;
    position: relative;
    padding: 0px 15px 1px 7px!important;
    min-height: 75px;
    color: #666;
    font-size: 13px;
    font-weight: 500;
    font-family: 'Inter', sans-serif;
    border-radius: 1px;
}
.bootstrap-select .dropdown-toggle {
    height: 35px;
    padding-right: 30px;
    font-size: 14px;
    font-weight: 400;
}
.form-group {
    margin-bottom: 1px;
}
.device-manage-progress-chart ul li, .mb-30 {
    margin-bottom: 38px;
}
#style-3::-webkit-scrollbar
{
	width: 6px;
	background-color: #F5F5F5;
}

#style-3::-webkit-scrollbar-thumb
{
	background-color: #0f2c7eeb;
}
.chat-box .chat-desc ul, .pd-ltr-20 {
    padding: 10px 20px 0;
}
</style>

</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img src="<c:url value="/dist/dash/vendors/images/deskapp-logos.svg"/>"
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
				src="<c:url value='/dist/dash/vendors/images/deskapp-logo.svg'/>" alt="" class="dark-logo"> 
				<img src="<c:url value='/dist/dash/vendors/images/skillpilot_white.svg'/>" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<c:if test="${user.role eq '1'}">
		
		<c:if test = "${fn:contains(theString, 'CL')}">
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li><a href="company_dashboard" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
					<li><a href="company_internships" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Internships</span>
					</a></li>
					<li><a href="company_internal_request" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Internship Request</span>
					</a></li>
					<li><a href="live_chat" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat-2"></span><span class="mtext">Live Chat</span>
					</a></li>
					<li><a href="college_tie_up" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Institute Tie-Ups</span>
					</a></li>
					<li><a href="add_company_member" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Manage Teams</span>
					</a></li>
				</ul>
			</div>
		</div></c:if></c:if>
		<c:if test="${user_data.role eq '2'}">
		<%-- <c:set var="theString" value="${user_data.institute_id }" />
			<c:if test="${fn:contains(theString, 'CP')}"> --%>
			<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li><a href="company_dashboard" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
					<li><a href="company_internships" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate"></span><span class="mtext">Internships</span>
					</a></li>
					<li><a href="company_internal_request" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer-1"></span><span class="mtext">Internal Request</span>
					</a></li>
					<li><a href="college_tie_up" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-repeat-1"></span><span class="mtext">Institute Tie-Ups</span>
					</a></li>
					<li><a href="add_company_member" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-user-11"></span><span class="mtext">Manage Teams</span>
					</a></li>
					<li><a href="live_chat" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat3"></span><span class="mtext">Live
								Chat</span>
					</a></li>
				</ul>
			</div>
		</div>
		</c:if>
		
		<c:if test="${user_data.role eq '3'}">
			<c:if test="${fn:contains(theString, 'CP')}">
			<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li><a href="company_dashboard" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
					<li><a href="company_internships" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate"></span><span class="mtext">Internships</span>
					</a></li>
					<li><a href="company_internal_request" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer-1"></span><span class="mtext">Internal Request</span>
					</a></li>
					<!-- <li><a href="college_tie_up" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-repeat-1"></span><span class="mtext">Institute Tie-Ups</span>
					</a></li>
					<li><a href="add_company_member" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-user-11"></span><span class="mtext">Manage Teams</span>
					</a></li> -->
					<li><a href="live_chat" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat3"></span><span class="mtext">Live
								Chat</span>
					</a></li>
				</ul>
			</div>
		</div>
		</c:if></c:if> 
		<c:if test="${user_data.role eq '1'}">
			<%-- <c:set var="theString" value="${user_data.user_id }" /> --%>
			<c:if test="${fn:contains(theString, 'US')}">
				
				<div class="menu-block customscroll">
					<div class="sidebar-menu">
						<ul id="accordion-menu">
							<li><a href="college_dashboard"
								class="dropdown-toggle no-arrow"> <span
									class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
							</a></li>
							<li><a href="collegeViewInternships"
								class="dropdown-toggle no-arrow"> <span
									class="micon dw dw-certificate"></span><span class="mtext">Internships</span>
							</a></li>
							<li><a href="external_internship_request_college"
								class="dropdown-toggle no-arrow"> <span
									class="micon dw dw-computer-1""></span><span class="mtext">External
										Requests</span>
							</a></li>
							<li><a href="college_internal_req"
								class="dropdown-toggle no-arrow"> <span
									class="micon dw dw-computer-1""></span><span class="mtext">Internal
										Requests</span>
							</a></li>
							<li><a href="getAppliedStudentsOfCollege"
								class="dropdown-toggle no-arrow"> <span
									class="micon dw dw-user3"></span><span class="mtext">Student
										Application</span>
							</a></li>
							<li><a href="comp_tie_up" class="dropdown-toggle no-arrow">
									<span class="micon dw dw-flow"></span><span class="mtext">Industry
										Tie-ups</span>
							</a></li>
							<!-- <li><a href="college_dept" class="dropdown-toggle no-arrow">
									<span class="micon dw dw-time-management"></span><span class="mtext">Manage
										Departments</span>
							</a></li> -->
							<li hidden><a href="collegeTransactions"
								class="dropdown-toggle no-arrow"> <span
									class="micon dw dw-balance"></span><span class="mtext">Balances</span>
							</a></li>
							<li><a href="college_report"
								class="dropdown-toggle no-arrow"> <span
									class="micon dw dw-edit-2"></span><span class="mtext">Internship
										Reports</span>
							</a></li>
							<li><a href="certificate" class="dropdown-toggle no-arrow">
									<span class="micon dw dw-certificate-1"></span><span class="mtext">View
										Certificate</span>
							</a></li>
							<li><a href="live_chat" class="dropdown-toggle no-arrow">
									<span class="micon dw dw-chat-2"></span><span class="mtext">Live
										Chat</span>
							</a></li>
						</ul>
					</div>
				</div>
			</c:if>
		</c:if>
		
		<c:if test="${user_data.role eq '2'}">
			<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li><a href="college_dashboard" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
					<li><a href="collegeViewInternships" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate"></span><span class="mtext">Internships</span>
					</a></li>
					<li><a href="college_internal_req" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer-1"></span><span class="mtext">Internal Requests</span>
					</a></li>
					<li><a href="student_list" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-user3"></span><span class="mtext">Enroll Students</span>
					</a></li>
					<li><a href="getAppliedStudentsOfCollege" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer-1"></span><span class="mtext">Students Request</span>
					</a></li>
					<li><a href="college_report" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-edit-2"></span><span class="mtext">Internship Report</span>
					</a></li>
					<li><a href="certificate" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate-1"></span><span class="mtext">View Certificate</span>
					</a></li>
					<li><a href="live_chat" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat3"></span><span class="mtext">Live Chat</span>
					</a></li>
				</ul>
			</div>
		</div>
		</c:if>
		<c:if test="${user_data.role eq '0'}">
			<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li><a href="stud_home" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
					<li><a href="viewCompAndApply"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-list"></span><span class="mtext">Industry
								List</span>
					</a></li>
					<li><a href="studentinternships"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-certificate"></span><span class="mtext">Internships</span>
					</a></li>
					<li><a href="appliedCompanies"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-personal-computer"></span><span class="mtext">Requests
								Status</span>
					</a></li>
					<li><a href="live_chat" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat3"></span><span class="mtext">Live
								Chat</span>
					</a></li>
					<li><a href="stud_testHistory" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-file-411"></span><span class="mtext">Test
								History</span>
					</a></li>
					<li><a href="certificate" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate-1"></span><span class="mtext">Internship
								Certificate</span>
					</a></li>
				</ul>
			</div>
		</div>
		</c:if>
		<c:if test="${user.role eq '10' or user.role eq 0}">
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li><a href="college_dashboard" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
					<li><a href="collegeViewInternships" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate"></span><span class="mtext">Internships</span>
					</a></li>
					<li><a href="college_internal_req" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer-1"></span><span class="mtext">Internal Requests</span>
					</a></li>
					<li><a href="student_list" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-user3"></span><span class="mtext">Enroll Students</span>
					</a></li>
					<li><a href="getAppliedStudentsOfCollege" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer-1"></span><span class="mtext">Students Request</span>
					</a></li>
					<li><a href="college_report" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-edit-2"></span><span class="mtext">Internship Report</span>
					</a></li>
					<li><a href="certificate" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate-1"></span><span class="mtext">View Certificate</span>
					</a></li>
					<li><a href="live_chat" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat3"></span><span class="mtext">Live Chat</span>
					</a></li>

				</ul>
			</div>
		</div>
		</c:if>
	</div>
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
		<div class="row">
						<c:if test="${not empty user and user.role eq 0 or user.role eq 8 or user.role eq 6}">
							
								<div class="col-md-4 col-sm-12">
									<div class="form-group parameter">
										<label>HOD</label>
										<div class="dropdown bootstrap-select form-control dropup">
											<select class="selectpicker form-control" id="select_hod"
												data-style="btn-outline-info" tabindex="-98">
												<option>Select Chat Agent</option>
												<c:forEach items="${hod}" var="comp">
												<option value="${comp.id}">${comp.username}</option>
											</c:forEach>
											</select>
										</div>
									</div>
								</div>
							
						</c:if>
						<c:if test="${not empty colleges}">
							<div class="col-md-4">
								<div class="parameter">
									<label>College List</label>
									<select class="selectpicker form-control" id="select_coll"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${colleges}" var="col">
											<option value="${col.college_id}">${col.college_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>HR</label>
									<select class="selectpicker form-control" id="select_hr"
												data-style="btn-outline-info" tabindex="-98">
												<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${HR}" var="comp">
											<option value="${comp.id}">${comp.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 8 or user.role eq 7 or user.role eq 6 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Student List</label>
										<select class="selectpicker form-control" id="select_student"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Students--</option>
										<c:forEach items="${students}" var="stud">
											<option value="${stud.id}">${stud.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 0 or user.role eq 7}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Dept.Incharge</label>
									<select class="selectpicker form-control" id="select_incharge"
									data-style="btn-outline-info" tabindex="-98">
									<option selected value="">--Select Chat Agent--</option>
									<c:forEach items="${incharge}" var="deptInch">
										<option value="${deptInch.id}">${deptInch.username}</option>
									</c:forEach>
										</select>
									</div>
								</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 0 or user.role eq 7}">
							<div class="col-md-4">
								<div class="parameter">
									<label>TPO</label>
									<select class="selectpicker form-control" id="select_tpo"
									data-style="btn-outline-info" tabindex="-98">
									<option selected value="">--Select Chat Agent--</option>
									<c:forEach items="${tpos}" var="tpo">
											<option value="${tpo.id}">${tpo.username}</option>
										</c:forEach>
										</select>
									</div>
								</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 4}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Comp.Manager</label>
									
									<select class="selectpicker form-control" id="select_manager"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${Manager}" var="manager">
											<option value="${manager.id}">${manager.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Internship Lead</label>
									<select class="selectpicker form-control" id="select_lead"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${Lead}" var="teamlead">
											<option value="${teamlead.id}">${teamlead.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
					</div><div class="row">
						<c:if test="${not empty user and user.role eq 0 or user.role eq 8 or user.role eq 6}">
							
								<div class="col-md-4 col-sm-12">
									<div class="form-group parameter">
										<label>HOD</label>
										<div class="dropdown bootstrap-select form-control dropup">
											<select class="selectpicker form-control" id="select_hod"
												data-style="btn-outline-info" tabindex="-98">
												<option>Select Chat Agent</option>
												<c:forEach items="${hod}" var="comp">
												<option value="${comp.id}">${comp.username}</option>
											</c:forEach>
											</select>
										</div>
									</div>
								</div>
							
						</c:if>
						<c:if test="${not empty colleges}">
							<div class="col-md-4">
								<div class="parameter">
									<label>College List</label>
									<select class="selectpicker form-control" id="select_coll"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${colleges}" var="col">
											<option value="${col.college_id}">${col.college_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>HR</label>
									<select class="selectpicker form-control" id="select_hr"
												data-style="btn-outline-info" tabindex="-98">
												<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${HR}" var="comp">
											<option value="${comp.id}">${comp.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 8 or user.role eq 7 or user.role eq 6 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Student List</label>
										<select class="selectpicker form-control" id="select_student"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Students--</option>
										<c:forEach items="${students}" var="stud">
											<option value="${stud.id}">${stud.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 0 or user.role eq 7}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Dept.Incharge</label>
									<select class="selectpicker form-control" id="select_incharge"
									data-style="btn-outline-info" tabindex="-98">
									<option selected value="">--Select Chat Agent--</option>
									<c:forEach items="${incharge}" var="deptInch">
										<option value="${deptInch.id}">${deptInch.username}</option>
									</c:forEach>
										</select>
									</div>
								</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 0 or user.role eq 7}">
							<div class="col-md-4">
								<div class="parameter">
									<label>TPO</label>
									<select class="selectpicker form-control" id="select_tpo"
									data-style="btn-outline-info" tabindex="-98">
									<option selected value="">--Select Chat Agent--</option>
									<c:forEach items="${tpos}" var="tpo">
											<option value="${tpo.id}">${tpo.username}</option>
										</c:forEach>
										</select>
									</div>
								</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 4}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Comp.Manager</label>
									
									<select class="selectpicker form-control" id="select_manager"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${Manager}" var="manager">
											<option value="${manager.id}">${manager.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Internship Lead</label>
									<select class="selectpicker form-control" id="select_lead"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${Lead}" var="teamlead">
											<option value="${teamlead.id}">${teamlead.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
					</div>
				
					<div class="parameter" style="text-align: center">
						<span class="btn"><i class="fa fa-comments" style="background: #3610b9;padding: 1px 2px 0px 7px; color: white;border-radius: 4px;"><input type="button" class="btn" value="Chat Now" id="chtbtn" disabled="disabled" onclick="showChat()" style="padding: 2px 8px 2px 8px;color: white;"></i>
						</span>
					</div>
				</form:form>
					</div>
					<div class="col-sm-12 col-md-6">
					</div>
					<div class="col-sm-12 col-md-6 mb-20" id="chatWindow" style="display: none; padding-left: 0;">
    <div class="card card-box" id="chtbox">
        <div class="card-header form-inline" style="background: #0f2c7eeb;">
            <div class="chat-profile-photo">
                <!-- <img src="../SkillPilots/dist/dash/vendors/images/profile-photo.jpg" style="max-height: 39px;" alt=""> -->
            </div>
            <div class="chat-profile-name" style="width: 100%;">
                <span id="chatagent" style="color: white;"></span> 
                <span style="color: white; float: right;" id="endchat" data-toggle="tooltip" data-placement="top" title="Click On Close Icon To End Chat">
                    <i class="fa fa-times-circle"></i>
                </span>
            </div>
        </div>
        <div class="card-body">
            <div class="height3" id="style-3" style="overflow: auto; height: 174px;">
                <!-- Chat messages will appear here -->
            </div>
            <div class="mt-3">
                <textarea class="form-control" placeholder="Type Here To Send Message..." id="btninput" style="height: 38px;"></textarea>
                <span class="input-group-text send_btn" id="chatbtn1" style="float: right; margin-top: 10px; margin-right: 8px;">
                    <i class="fa fa-send-o"></i>
                </span>
            </div>
        </div>
    </div>
</div>

			<%@include file="modal_common.jsp"%>
			<div class="footer-wrap pd-20 mb-20 card-box" style="position: fixed; bottom: 0%; width: 77%;">
				<i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
				<script>
					document.write(new Date().getFullYear())
				</script>
				All Rights Reserved SkillPilots &reg; | Designed & Developed By <a
					href="https://www.cluematrix.com/" target="_blank"
					style="color: #2800b4;">Cluematrix</a> Technologies Pvt.Ltd.
			</div>
		</div>
	</div>
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<script src="<c:url value="/dist/js/myjs/common.js"/>"></script>
	<script src="<c:url value="/dist/js/myjs/projectConstants.js"/>"></script>
	<script src="<c:url value="/dist/dash/vendors/scripts/core.js"/>"></script>
	<script src="<c:url value="/dist/dash/vendors/scripts/script.min.js"/>"></script>
	<script src="<c:url value="/dist/dash/vendors/scripts/process.js"/>"></script>
	<script src="<c:url value="/dist/dash/vendors/scripts/layout-settings.js"/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input[type="radio"]').click(function() {
				var inputValue = $(this).attr("value");
				var targetBoxx = $("." + inputValue);
				$(".boxx").not(targetBoxx).hide();
				$(targetBoxx).show();
			});
		});
		
		$(document).ready(
				function myFunction() {
					$("#select_student").change(
							function() {
								var stud_id = $("#select_student option:selected").val();
								var stud_name = $("#select_student option:selected").text();
								$("#chatagent").text(stud_name);
								$("#chtbtn").prop('disabled', false);
								$("#rec_name").text(stud_name);
								$("#rec_id").text(stud_id);
								var i = $("#rec_id").text();
								$("#select_hod").text("");
								$("#select_coll").val("");
								$("#select_hr").val("");
								$("#select_incharge").val("");
								$("#select_tpo").val("");
								$("#select_manager").val("");
								$("#select_lead").val("");
								$("#chatWindow").hide();
								if(i==null || i==""){
									$("#chtbtn").prop('disabled', true);
								}
							});
					$("#select_hod").change(function() {
						var hod_id = $("#select_hod option:selected").val();
						var hod_name = $("#select_hod option:selected").text();
						$("#chatagent").text(hod_name);
						$("#chtbtn").prop('disabled', false);
						$("#rec_id").text(hod_id);
						$("#rec_name").text(hod_name);
						var i = $("#rec_id").text();
						$("#select_student").val("");
						$("#select_coll").val("");
						$("#select_hr").val("");
						$("#select_incharge").val("");
						$("#select_tpo").val("");
						$("#select_manager").val("");
						$("#select_lead").val("");
						$("#chatWindow").hide();
						if(i==null || i==""){
							$("#chtbtn").prop('disabled', true);
						}
					});
					$("#select_coll").change(function() {
						var coll_id = $("#select_coll option:selected").val();
						var coll_name = $("#select_coll option:selected").text();
						$("#chatagent").text(coll_name);
						$("#chtbtn").prop('disabled', false);
						$("#rec_name").text(coll_name);
						$("#rec_id").text(coll_id);
						var i = $("#rec_id").text();
						$("#select_hod").val("");
						$("#select_student").val("");
						$("#select_hr").val("");
						$("#select_incharge").val("");
						$("#select_tpo").val("");
						$("#select_manager").val("");
						$("#select_lead").val("");
						$("#chatWindow").hide();
						if(i==null || i==""){
							$("#chtbtn").prop('disabled', true);
						}
					});
					$("#select_hr").change(function() {
						var hr_id = $("#select_hr option:selected").val();
						var hr_name = $("#select_hr option:selected").text();
						$("#chatagent").text(hr_name);
						$("#chtbtn").prop('disabled', false);
						$("#rec_name").text(hr_name);
						$("#rec_id").text(hr_id);
						var i = $("#rec_id").text();
						$("#select_hod").val("");
						$("#select_coll").val("");
						$("#select_student").val("");
						$("#select_incharge").val("");
						$("#select_tpo").val("");
						$("#select_manager").val("");
						$("#select_lead").val("");
						$("#chatWindow").hide();
						if(i==null || i==""){
							$("#chtbtn").prop('disabled', true);
						}
					});
					$("#select_incharge").change(
							function() {
								var incharge_id = $(
										"#select_incharge option:selected")
										.val();
								var incharge_name = $("#select_incharge option:selected").text();
								$("#chatagent").text(incharge_name);
								$("#chtbtn").prop('disabled', false);
								$("#rec_name").text(incharge_name);
								$("#rec_id").text(incharge_id);
								var i = $("#rec_id").text();
								$("#select_hod").val("");
								$("#select_coll").val("");
								$("#select_hr").val("");
								$("#select_student").val("");
								$("#select_tpo").val("");
								$("#select_manager").val("");
								$("#select_lead").val("");
								$("#chatWindow").hide();
								if(i==null || i==""){
									$("#chtbtn").prop('disabled', true);
								}
							});
					$("#select_tpo").change(function() {
						var tpo_id = $("#select_tpo option:selected").val();
						var tpo_name = $("#select_tpo option:selected").text();
						$("#chatagent").text(tpo_name);
						$("#chtbtn").prop('disabled', false);
						$("#rec_name").text(tpo_name);
						$("#rec_id").text(tpo_id);
						var i = $("#rec_id").text();
						$("#select_hod").val("");
						$("#select_coll").val("");
						$("#select_hr").val("");
						$("#select_incharge").val("");
						$("#select_student").val("");
						$("#select_manager").val("");
						$("#select_lead").val("");
						if(i==null || i==""){
							$("#chtbtn").prop('disabled', true);
						}
					});
					$("#select_manager").change(
							function() {
								var manager_id = $("#select_manager option:selected").val();
								var manager_name = $("#select_manager option:selected").text();
								$("#chatagent").text(manager_name);
								$("#chtbtn").prop('disabled', false);
								$("#rec_name").text(manager_name);
								$("#rec_id").text(manager_id);
								var i = $("#rec_id").text();
								$("#select_hod").val("");
								$("#select_coll").val("");
								$("#select_hr").val("");
								$("#select_incharge").val("");
								$("#select_tpo").val("");
								$("#select_student").val("");
								$("#select_lead").val("");
								$("#chatWindow").hide();
								if(i==null || i==""){
									$("#chtbtn").prop('disabled', true);
								}
							});
					$("#select_lead").change(function() {
						var lead_id = $("#select_lead option:selected").val();
						var lead_name = $("#select_manager option:selected").text();
						$("#chatagent").text(lead_name);
						$("#chtbtn").prop('disabled', false);
						$("#rec_name").text(lead_name);
						$("#rec_id").text(lead_id);
						var i = $("#rec_id").text();
						$("#select_hod").val("");
						$("#select_coll").val("");
						$("#select_hr").val("");
						$("#select_incharge").val("");
						$("#select_tpo").val("");
						$("#select_manager").val("");
						$("#select_student").val("");
						$("#chatWindow").hide();
						if(i==null || i==""){
							$("#chtbtn").prop('disabled', true);
						}
					});
					$('#chatbtn1').click(
							function(e) {
								e.preventDefault();
								var message = $("#btninput").val();
								if(message==null || message==""){
									alert("Can't Send A Blank Message.");
								}else{
									var receiver_id = $("#rec_id").text();
									var sender_id = $("#user_id").val();
									if(sender_id==null || sender_id==null || sender_id=="" || sender_id==""){
										alert("Please Select Atlest One Memeber");
									}else{
										$.ajax({
											url : "saveChat?message=" + message
													+ "&sender_id=" + sender_id
													+ "&receiver_id=" + receiver_id,
											context : document.body,
											cache : false,
											async : true,
											success : function(data) {
												$("#btninput").val("");
												myFunction1();
											}
										});
									}
								}
							});
				});

		function myFunction1() {
			var sender_id = $("#user_id").val();
			var receiver_id = $("#rec_id").text();
			var receiver_name = $("#rec_name").text();
			$("#chatagent").text(receiver_name);
			//alert("new receiver id = " + receiver_id);
			$.ajax({
				url : "getUserChat?sender_id=" + sender_id + "&receiver_id="
						+ receiver_id,
				cache : false,
				async : true,
				success : function(data) {
					$('div.height3').empty();
					for (i = 0; i < data.length; i++) {
						if (data[i].sender_id == sender_id) {
							$('div.height3').append(
									"<div class='cobine'><div class='username'>"
											+ "</div>"
											+ "<div class='senderMsg'>" + "<p>"
											+ data[i].message + "</p>"
											+ "</div>"
											+ "<span class='time_datesend'>"
											+ data[i].timestamp
											+ "</span></div>"

							);
						} else {
							
							$('div.height3').append(
									"<div class='cobine1'> <div class='username1'>"
											+ "<strong>" + receiver_name
											+ "</strong>" + "</div>"
											+ "<div class='reciveMsg'>"+"<p>"  
											+ data[i].message + "</p>"
											+ "</div>"
											+ "<span class='time_date'>"
											+ data[i].timestamp
											+ "</span></div>");
						}

					}
				}
			});
		}

		$(document).keypress(function (e) {
		    if(e.keyCode == 13) {
					var message = $("#btninput").val();
					if(message==null || message==''){
						alert("Can't Send A Blank Message.");
					}else{
						var sender_id = $("#user_id").val();
						var receiver_id = $("#rec_id").text();
						$.ajax({
							url : "saveChat?message=" + message
									+ "&sender_id=" + sender_id
									+ "&receiver_id="+receiver_id,
							context : document.body,
							cache : false,
							async : true,
							success : function(data) {
								$("#btninput").val("");
								myFunction1();
							}
						});
					}
		    }
		});
		
		function showChat() {
			$("#chatWindow").show();
			$('.card').fadeIn();
			myFunction1();
			setFocus();
		}

		function setFocus() {
			$("#btninput").focus();
		}
		
		$('.close-icon').on('click',function() {
			  $(this).closest('.card').fadeOut();
			})
			
			
		$(document).ready(function() {
			function refresh() {
				var div = $('.height3'), divHtml = div.html();

				div.html(divHtml);
			}
			setInterval(function() {
				myFunction1();
				refresh()
			}, 2000);

			//300000 is 5minutes in ms
		})

		//End Chat Button
		$('#endchat').on('click', function() {
			$('#chtbox').hide();
		})
		/* $(document).ready(function(){
			 setInterval(,1000);
			}); */
	</script>
</body>
</html>