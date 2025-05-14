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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>


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

.quotes-container {
  overflow: hidden;
  white-space: nowrap;
  width: 100%;
  background: #f4f4f4;
  padding: 10px 0;
}

.quotes {
  display: inline-block;
  animation: moveQuotes 20s linear infinite;
}

.quotes span {
  display: inline-block;
  padding-right: 50px;
  font-size: 18px;
  color: #0f2c7e;
  font-weight: bold;
}

@keyframes moveQuotes {
  from {
    transform: translateX(100%);
  }
  to {
    transform: translateX(-100%);
  }
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
					<span>Available Internships</span>

				</h2>
			</div>
			<div class="quotes-container">
				<div class="quotes">
					<span>"The only way to do great work is to love what you
						do." - Steve Jobs</span> <span>"Success is not the key to
						happiness. Happiness is the key to success." - Albert Schweitzer</span> <span>"Opportunities
						don't happen, you create them." - Chris Grosser</span>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 mb-30" style="height: 440px;">
					<div class="card-box height-100-p pd-20 scrollbar force-overflow"
						id="style-3"
						style="position: relative; max-height: 100%; overflow: auto;">
						<h6 class="h4 mb-0"
							style="text-align: center; font-weight: 100; margin-bottom: 0px; background: #0f2c7eeb; color: white; border-radius: 6px;">
							Filters</h6>
						<hr style="border-top-width: medium; background: #0f2c7eeb;">
						<h6 class="h6"
							style="font-weight: 100; background: #0f2c7eeb; padding: 3px 6px 3px 5px; color: white; border-radius: 3px;">
							<i class="fa fa-filter" style="color: white;"></i>&nbsp;Filter by
							location <span id="location_reset" title="Reset filter"
								style="float: right; color: white;" class="pointer"
								onclick="clearFilter()"> <i class="fa fa-refresh"></i></span>
						</h6>
						<div class="row">
							<div class="col-md-10">
								<input type="text" name="table_search" id="search_location"
									oninput="filterInternships2()"
									class="form-control search_control"
									style="height: 100%; width: 105%;">
							</div>
							<div class="col-md-2" style="padding-left: 0;">
								<button class="btn btn-sm btn-primary" id="location"
									style="padding: 4px 10px 4px 10px;"
									onclick="filterInternships3()">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>

						<div class="form-group scroll scrollbar force-overflow"
							id="div_location" style="overflow: auto; height: 100px;">
							<c:forEach items="${cities}" var="location">
								<div class="checkbox">
									<label id="lbl_${location}"> <input type="checkbox"
										class="filter_checkbox" name="location" value="${location}">&nbsp;${location}
									</label>
								</div>
							</c:forEach>
						</div>



						<hr>
						<h6 class="h6"
							style="font-weight: 100; background: #0f2c7eeb; padding: 3px 6px 3px 5px; color: white; border-radius: 3px;">
							<i class="fa fa-briefcase" style="color: white;"></i>&nbsp;Filter
							by skill <span title="Reset" id="tech_reset"
								style="float: right; color: white;" class="pointer"
								onclick="filterInternships3()"> <i class="fa fa-refresh"></i></span>
						</h6>

						<div class="col-md-2" style="margin-bottom: 10px;">
							<select id="technologyFilter" class="form-control"
								onchange="filterInternships()"
								style="height: 30px; margin-left: -14px; width: fit-content;">
								<option value="">Select Skill</option>
								<c:forEach items="${tech_names}" var="tech_name">
									<option value="${tech_name}">${tech_name}</option>
								</c:forEach>
							</select>
						</div>

						<hr>


						<h6 class="h6"
							style="font-weight: 100; background: #0f2c7eeb; padding: 3px 6px 3px 5px; color: white; border-radius: 3px;">
							<i class="fa fa-briefcase" style="color: white;"></i>&nbsp;Filter
							by Jobtype <span title="Reset" id="tech_reset"
								style="float: right; color: white;" class="pointer"
								onclick="filterInternships3()"> <i class="fa fa-refresh"></i></span>
						</h6>

						<div class="col-md-2" style="margin-bottom: 10px;">
							<select id="jobTypeFilter" class="form-control"
								onchange="filterInternships()"
								style="height: 30px; margin-left: -14px; width: fit-content;">
								<option value="">Select JobType</option>
								<c:forEach items="${jobTypes}" var="jobType">
									<option value="${jobType}">${jobType}</option>
								</c:forEach>


							</select>
						</div>


						<hr>



						<h6 class="h6"
							style="font-weight: 100; background: #0f2c7eeb; padding: 3px 6px 3px 5px; color: white; border-radius: 3px;">
							<i class="fa fa-briefcase" style="color: white;"></i>&nbsp;Filter
							by Working Type <span title="Reset" id="tech_reset"
								style="float: right; color: white;" class="pointer"
								onclick="filterInternships3()"> <i class="fa fa-refresh"></i></span>
						</h6>

						<div class="col-md-2" style="margin-bottom: 10px;">
							<select id="workingTypeFilter" class="form-control"
								onchange="filterInternships()"
								style="height: 30px; margin-left: -14px; width: fit-content;">
								<option value="">Select Working Type</option>
								<c:forEach items="${workingTypes}" var="workingType">
									<option value="${workingType}">${workingType}</option>
								</c:forEach>
							</select>
						</div>
						<hr>


						<h6 class="h6"
							style="font-weight: 100; background: #0f2c7eeb; padding: 3px 6px 3px 5px; color: white; border-radius: 3px;">
							<i class="fa fa-rupee" style="color: white;"></i>&nbsp;Filter by
							Stipend <span id="sti_reset" title="Reset"
								style="float: right; color: white;" class="pointer"
								onclick="clearFilter()"> <i class="fa fa-refresh"></i>
							</span>
						</h6>
						<div class="form-group" style="margin: 0px !important;">
							<div class="input-group input-group-sm"
								style="margin-bottom: 0px;">
								<div class="form-group is-empty">
									<div class="radio">
										<label><input type="radio" class="sti_check"
											name="stipend" value="1"> Paid</label>
									</div>
									<div class="radio">
										<label><input type="radio" class="sti_check"
											name="stipend" value="0"> Unpaid</label>
									</div>
								</div>
								<div class="input-group-btn">
									<button class="btn btn-sm btn-primary"
										onclick="filterInternships3()"
										style="padding: 4px 10px 4px 10px; position: relative; left: 172px;">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
						<hr>
						<h6 class="h6"
	style="font-weight: 100; background: #0f2c7eeb; padding: 3px 6px 3px 5px; color: white; border-radius: 3px;">
	<i class="fa fa-clock-o" style="color: white;"></i>&nbsp;Filter
	by Duration
	<span id="duration_reset" title="Reset"
		style="float: right; color: white;" class="pointer"
		onclick="filterInternships3()"> 
		<i class="fa fa-refresh"></i>
	</span>
</h6>

<div class="form-group">
	<div class="radio mb-2">
		<label>
			<input type="radio" class="duration_check" name="duration" value=">="> Greater Than
		</label>
		<label style="margin-left: 15px;">
			<input type="radio" class="duration_check" name="duration" value="<="> Less Than
		</label>
	</div>
	<div class="row">
		<div class="col-md-10">
			<select id="duration_val" required="true"
				class="form-control search_control" style="    height: 30px;
    margin-left: 2px;
    
    width: 50%;">
				<option value="">Select Duration</option>
				<c:forEach var="i" begin="1" end="12">
					<option value="${i}">${i} <c:if test="${i != 1}"></c:if></option>
				</c:forEach>
			</select>
		</div>
		<div class="col-md-2" style="padding-left: 0;">
			<button class="btn btn-sm btn-primary"
				style="padding: 4px 10px;" onclick="filterInternships3()">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
</div>

					</div>
				</div>
				<div class="col-xl-8 mb-30" style="height: 440px;">
					<div class="card-box  " id="style-3"
						style="position: relative; max-height: 100%; overflow: auto; padding: 1em;">
						<!-- Filter Section -->

						<!-- working filter optional  belowe screept comented for this filter use -->
						<div class="row mb-3" hidden>
							<div class="col-md-2">
								<select id="locationFilter" class="form-control">
									<option value="">Select Location</option>
									<option value="Nagpur">Nagpur</option>
									<option value="Pune">Pune</option>

								</select>
							</div>
							<div class="col-md-2">
								<select id="companyFilter" class="form-control">
									<option value="">Select Company</option>
									<option value="vigo">Vigo</option>

								</select>
							</div>
							<div class="col-md-2">
								<select id="technologyFilter" class="form-control">
									<option value="">Select Technology</option>
									<c:forEach items="${tech_names}" var="tech_name">
										<option value="${tech_name}">${tech_name}</option>
									</c:forEach>
								</select>
							</div>

							<div class="col-md-2">
								<input type="number" id="durationFilter" class="form-control"
									placeholder="Duration (weeks)">
							</div>
							<div class="col-md-2">
								<input type="number" id="stipendFilter" class="form-control"
									placeholder="Stipend">
							</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-primary"
									onclick="filterInternships()">Filter</button>
							</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-secondary"
									onclick="clearFilter()">Clear</button>
							</div>
						</div>

						<div id="internshipList">
							<center>
								<p style="color: red; font-size: 2em;" id="filter-message"></p>
							</center>

							<c:forEach items="${adv}" var="comp_add">
								<div class="internship-item"
									data-location="${comp_add.location}"
									data-company="${comp_add.companyName}"
									data-technology="${comp_add.technology}"
									data-duration="${comp_add.duration}"
									data-stipend="${comp_add.stipend}"
									data-jobtype="${fn:trim(comp_add.jobType)}"
									data-workingtype="${fn:trim(comp_add.workingType)}">

                                         <%--   <div class="col-md-12">
											<h6 class="font-weight-bold text-secondary"
												data-toggle="tooltip" title="Description of internship">
												<details>
													<summary
														style="cursor: pointer; color: #007bff; font-weight: bold; font-size: 1em;">
														View Description </summary>
													<p class="mt-2"
														style="white-space: pre-wrap; overflow-wrap: break-word;">
														${comp_add.description != null ? 
                                        comp_add.description : "Description not provided"}
													</p>
												</details>
											</h6>
											<div class="col-md-3 text-center">
											<img src="get_logos?id=${comp_add.companyId}"
												class="img-thumbnail rounded-circle"
												style="max-width: 70px; max-height: 78px;">
										</div>
										</div> --%>
									<div class="row">
										<div class="col-md-9">
											<h6 class="h5 mb-2" data-toggle="tooltip"
												data-placement="top" title="Description of internship"
												style="font-weight: 100; background: #e9edf1cc; padding-left: 9px; color: #0C0C0C; font-weight: 400; border-radius: 12px;">
												${companyDrive} <span>
													${fn:substring(comp_add.description, 0, 57)}... <a
													data-toggle="collapse"
													href="#moreDesc${comp_add.companyId}" role="button"
													aria-expanded="false"
													aria-controls="moreDesc${comp_add.companyId}"> Read
														more </a>
												</span>
											</h6>
											<div class="collapse" id="moreDesc${comp_add.companyId}">
												<div class="card card-body"
													style="background-color: #f8f9fa; border: none;">
													${comp_add.description}</div>
											</div>
										</div>

										<div class="col-md-3 text-center">
											<img src="get_logos?id=${comp_add.companyId}"
												class="img-thumbnail rounded-circle"
												style="max-width: 70px; max-height: 78px;">
										</div>
									</div>

									<div class="row">
										<div class="col-md-3">
											<h6 class="h6 mb-20" style="font-weight: 200;  ">
												<i class="fa fa-map-marker" style="color: red"></i>&nbsp;
												<b>${comp_add.location}</b>
											</h6>
										</div>


										<div class="col-md-3">
											<h6 class="h6 mb-20" style="font-weight: 100;">
												<i class="fa fa-circle" style="color: blue"></i>&nbsp;
												<b>${comp_add.jobType}</b>
											</h6>
										</div>

										<div class="col-md-3">
											<h6 class="h6 mb-20" style="font-weight: 100;">
												<i class="fa fa-circle" style="color: lightgreen"></i>&nbsp;
												<b>${comp_add.workingType}</b>
											</h6>
										</div>

										<div class="col-md-9 truncate-normal">
											<a href="javascript:void(0);"> <span
												class="pointer cmpname cmp${comp_add.companyId}"
												onclick="getCompanyDetails('${comp_add.companyId}');"
												id="${comp_add.companyId}" style="color: #33A6F8;">
												<b>${comp_add.companyName}</b></span>
											</a>
										</div>
										<%-- <div class="col-md-9 truncate-normal">
															<a href="">
																<span class="pointer cmpname cmp${comp_add.companyName}"
																	onclick="getCompanyDetails('${comp_add.companyId}');"
																	id="${comp_add.companyName}"
																	style="color: #33A6F8;">${comp_add.companyName}</span>
															</a>
														</div> --%>
									</div>
									<div class="row">
										<div hidden class="col-md-3">
											<span style="font-size: 12px; color: gray;"><i
												class="fa fa-play-circle-o"></i>&nbsp;START DATE</span><br>${comp_add.start_date}


										</div>
										<div class="col-md-3 text-center">
											<span style="font-size: 12px; color: gray;"><i
												class="fa fa-clock-o"></i>&nbsp;<b>DURATION</b></span><br>${comp_add.duration}&nbsp;Month
										</div>
										<div class="col-md-3 text-center">
											<span style="font-size: 12px; color: gray;"><i
												class="fa-solid fa-indian-rupee-sign"></i>&nbsp;<b>STIPEND</b></span><br>
											<i class="fa-solid fa-indian-rupee-sign"></i>&nbsp;${comp_add.stipend}
										</div>
										<div class="col-md-3 text-center">
											<span style="font-size: 12px; color: gray;"><i
												class="fa fa-users"></i>&nbsp;<b>CAPACITY</b></span><br>${comp_add.capacity}
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6">
											<span style="font-size: 12px; color: gray;"><i
												class="fa fa-briefcase"></i>&nbsp;<b>SKILL/TECHNOLOGY</b></span><br>${comp_add.technology}
										</div>
										<div class="col-md-3 text-center">
											<br>
											<button hidden type="button" id="s_skill_wise"
												onclick="show_schedule_modal('${comp_add.id}','${comp_add.duration}','ADV');"
												class="btn btn-sm testme"
												style="background: #0090f7cc; padding: 2px 6px 3px 6px; color: white;">
												View Schedule&nbsp;<i class="fa fa-angle-double-right"></i>
											</button>
										</div>
										<div class="col-md-3 text-center">
											<br>
											<button type="button" id="applyButton"
												class="btn btn-sm margin" data-toggle="modal"
												data-target="#confirmAdvertisement"
												onclick="checkPaymentAndProceed('${comp_add.technology}','${comp_add.companyId}','${comp_add.duration}','${comp_add.id}','${comp_add.companyName}');"
												style="background: #0090f7cc; padding: 2px 6px; color: white;">
												Apply
												<div class="ripple-container"></div>
											</button>
										</div>
									</div>
									<hr style="border: solid 1px;">
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="chat_support.jsp"%>
	</div>














	<!-- <c:if
				test="${dept_validity eq ProjectConstants.reg_user_expiration_rsn_dept_del}">
				<h1 style="text-align: center">
					Oops!<br> Looks like your Institute's Department Validity has
					expired.<br> Please Contact your Head of Department for
					further details.
				</h1>
			</c:if> -->
	<%-- <div class="modal fade" id="confirmAdvertisement" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content   mydiv">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Are you sure you want to apply?</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="modal-body">
										<span>You are applying for internship in <strong><span
													style="color: #1B00FF"></span></strong> at <strong>
												<span id="company" style="color: #1B00FF"></span>
											</strong> for <strong style="color: #1B00FF"><span
													style="color: #1B00FF"></span> weeks</strong> are you sure?
										</span>
									</div>
									<form id="paymentForm" action="${pageContext.request.contextPath}/viewCompAndApply" method="post">

										<input type="hidden" name='hid' id="hid" value="">
										<input type="hidden" id="studentId" value="${student.student_id}">

						<!-- <div class="form-group mt-3">
							<label for="cvTemplate">Select CV Template:</label> <select
								class="form-control" name="cvTemplate" id="cvTemplate" required>
								<option value="">-- Select CV Template --</option>
								<option value="cv1">CV1 Template</option>
								<option value="cv2">CV2 Template</option>
								<option value="cv3">CV3 Template</option>
								Future if you add more templates, add options here
							</select>
						</div> -->

						<button type="submit" class="btn btn-success">Submit</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Cancel</button>
									</form>
								</div>

							</div>
						</div>
					</div> --%>

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

	<div class="footer-wrap pd-20 mb-20 card-box"
		style="position: relative; left: 332px; bottom: 0%; width: 77%">
		<i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
		<script>
          document.write(new Date().getFullYear());
        </script>
		All Rights Reserved SkillPilots&reg; | Designed & Developed By <a
			href="https://www.cluematrix.com/" target="_blank"
			style="color: #2800b4;"> Cluematrix </a> Technologies Pvt. Ltd. |
		Contact: <b>+91-9422926439 </b>

	</div>
	<%-- <%@include file="footer.jsp" %> --%>

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

											$(document).ready(function () {
												getnextAdvertisement(0, 0);
											});
											
											
											
											


											function getAdvertisementStatus(tech, cmp, duration, id, companyName,jobType,workingType) {
												// Your function implementation here
												console.log("Technology: " + tech);
												console.log("Company ID: " + cmp);
												console.log("Duration: " + duration);
												console.log("ID: " + id);
												console.log("comoany Nme" + companyName);
												console.log("JJJJJJJJ" + jobType);
												console.log("wwwwww",workingType);

												var technology = tech;
												var comp = cmp;
												var dur = duration;
												var avd_id = id;
												var companyName = companyName;
												var jobType = jobType;
												var workingType = workingType;
												console.log("Adver" + avd_id)

												$("#confirmAdvertisement").find('.modal-body span').html("You are applying for an internship in <strong>" + tech + "</strong> at <strong>" + companyName + "</strong> for <strong>" + dur + " weeks</strong>. Are you sure?");
												$('#hid').val(id); // Set advertisement ID in the hidden input field
												console.log("djdjdjdj" + avd_id)
												$.ajax({
													type: "GET",
													url: "${pageContext.request.contextPath}/getInternshipStatus?avdId=" + avd_id 
,
													success: function (response) {
    console.log("response" + response);
 if (response == "ongoing") {
    Swal.fire({
        title: "Ongoing Internship Detected",
        text: "You already have an ongoing internship and cannot apply for another one at this time.",
        icon: "warning",
        confirmButtonText: "OK"
    }).then((result) => {
        if (result.isConfirmed) {
            location.reload(); 
			 $('.mydiv').hide(); 
			// Reload the page when "OK" is clicked
        }
    });
}
 else if (response == "pending" || response == "1" || response == "2" || response == "T" || response == "D") {
        $('#internshipPending').on('shown.bs.modal', function () {
            $('.mydiv').hide(); // Hide the div with class 'mydiv' when '#internshipPending' modal is shown
        });
        $('#internshipPending').modal('toggle');
    } else if (response == "A") {
        $('#internshipApproved').modal('toggle');
        $("#confirmAdvertisement").hide();
        location.reload();
    } else if (response == "R") {
        // Show a SweetAlert with the option to reapply
      Swal.fire({
    title: "Request Rejected",
    text: "You have a rejected request for this industry that hasn't passed the cooling period. Would you like to reapply once the period is over?",
    icon: "warning",
    showCancelButton: true,
    confirmButtonText: "Reapply",
    cancelButtonText: "Cancel"
}).then((result) => {
    if (result.isConfirmed) {
        // Add your logic here for reapplying
        confirmAdversemnt(tech, comp, dur, avd_id);
    }
});
;
    } else if (response == "S") {
        Swal.fire("", "Already applied by Student.", "error");
       $("#confirmAdvertisement").hide();
        location.reload();
    } else if (response == "c") {
        Swal.fire("", "Already applied by College.", "success");
    } else {
        confirmAdversemnt(tech, comp, dur, avd_id);
    }
}
,

												});
											}

											function confirmAdversemnt(tech, cmp, duration, id) {
												console.log("avd id")
												$('.modal-body #tech').text(tech);
												$('.modal-body #company').text($('#' + cmp).text());
												$('#hid').val(id);
												$('#redirect_page').val('stud_home');
												$('.modal-body #duration').text(duration);
												$('#s').modal('show');
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
        const jobType = document.getElementById('jobTypeFilter')?.value || '';
        const workingType = document.getElementById('workingTypeFilter')?.value || '';

        const internshipItems = document.querySelectorAll('.internship-item');

        internshipItems.forEach(item => {
            const itemLocation = item.getAttribute('data-location');
            const itemCompany = item.getAttribute('data-company');
            const itemTechnology = item.getAttribute('data-technology');
            const itemDuration = item.getAttribute('data-duration');
            const itemStipend = item.getAttribute('data-stipend');
            const itemJobType = item.getAttribute('data-jobtype');
            const itemWorkingType = item.getAttribute('data-workingType');
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
            
            if (jobType && itemJobType !== jobType) {
                display = false;
            }
            if (workingType && itemWorkingType !== workingType) {
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
        document.getElementById('jobTypeFilter').value = '';
        document.getElementById('workingTypeFilter').value = '';
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
												
												 const selectedJobTypes = document.querySelectorAll('input[name="jobType"]:checked');
												    const selectedWorkingTypes = document.querySelectorAll('input[name="workingType"]:checked');

												const internshipItems = document.querySelectorAll('.internship-item');
												let anyDisplayed = false; // Flag to track if any item is displayed after filtering

												internshipItems.forEach(item => {
													const itemLocation = item.getAttribute('data-location');
													const itemDept = item.getAttribute('data-dept');
													const itemTech = item.getAttribute('data-tech');
													const itemStipend = item.getAttribute('data-stipend');
													const itemDuration = item.getAttribute('data-duration');
													
													 const selectedJobTypes = document.querySelectorAll('input[name="jobType"]:checked');
													    const selectedWorkingTypes = document.querySelectorAll('input[name="workingType"]:checked');

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
													// Duration Filter using dropdown
if (selectedDurationOperator && durationValue !== "") {
	const durationOperator = selectedDurationOperator.value;
	const itemDurationValue = parseInt(itemDuration);
	const selectedDuration = parseInt(durationValue); // convert to number

	if (durationOperator === ">=" && itemDurationValue < selectedDuration) {
		display = false;
	}
	if (durationOperator === "<=" && itemDurationValue > selectedDuration) {
		display = false;
	}
}

													
													  // Job Type Filter (new)
											        if (selectedJobTypes.length > 0) {
											            const jobTypeMatch = Array.from(selectedJobTypes).some(jobType => jobType.value === itemJobType);
											            if (!jobTypeMatch) {
											                display = false;
											            }
											        }

											        // Working Type Filter (new)
											        if (selectedWorkingTypes.length > 0) {
											            const workingTypeMatch = Array.from(selectedWorkingTypes).some(workingType => workingType.value === itemWorkingType);
											            if (!workingTypeMatch) {
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
											  checkboxes.forEach(function(checkbox) {
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
												success: function(response) {
													console.log("Response receiveda:", response);
													response = JSON.parse(response); // Parse the JSON string
								
													if (!response.empty) {
														if (response.internshipSchedule && response.internshipSchedule.length > 0) {
															var schedules = response.internshipSchedule;


															
															console.log("Number of schedules:", schedules.length);
								
															var table = '<table border="1"><tr><th>ID</th><th>Schedule 1</th><th>Schedule 2</th><th>Schedule 3</th><th>Schedule 4</th></tr>';
															schedules.forEach(function(schedule) {
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
												error: function(xhr, status, error) {
													console.error("Error fetching internship schedule:", error);
													document.getElementById('scheduleTable').innerHTML = "Error fetching internship schedule.";
												}
											});
										}




										if (response == "A") {
  $('#internshipApproved').modal('toggle');
  $('#confirmAdvertisement').modal('hide');

  // Check if #internshipApproved is open, then reload the page
  $('#internshipApproved').on('shown.bs.modal', function () {
   
  });
}

									</script>


	<script>

	document.getElementById("paymentForm").addEventListener("submit", function (event) {
    // Prevent the form from submitting immediately
    event.preventDefault();

    // Display the loading SweetAlert
    Swal.fire({
        title: 'Please wait...',
        text: 'Submitting your data...',
        allowOutsideClick: false, // Prevent clicking outside to close the alert
        didOpen: () => {
            Swal.showLoading(); // Show loading spinner

            // Now submit the form
            this.submit();
        }
    });
});
</script>

	<script>
    document.getElementById('payButton').addEventListener('click', function () {
        // Define necessary payment details
        const orderId = "order_" + new Date().getTime(); // Unique order ID
        const orderAmount = 100.00; // Amount to be paid
        const customerName = "John Doe"; // Customer name
        const customerEmail = "john.doe@example.com"; // Customer email

        // Create payment request object
        const paymentData = {
            "appId": "776689d42f191ff3e94d70f486986677", // Your Cashfree App ID
            "orderId": orderId, // Unique order ID
            "orderAmount": orderAmount, // Amount to be paid
            "orderCurrency": "INR", // Currency
            "customerName": customerName, // Customer name
            "customerEmail": customerEmail, // Customer email
            "returnUrl": "${pageContext.request.contextPath}/paymentResponse", // Callback URL after payment
            "notifyUrl": "${pageContext.request.contextPath}/paymentNotification", // Optional: URL for payment notifications
        };

        // Call Cashfree payment SDK
        cashfree.initPayment(paymentData, function (response) {
            if (response.txStatus === 'SUCCESS') {
                // Set the hidden field value to the order ID if needed
                document.getElementById('hid').value = response.orderId;

                // Redirect to your desired page upon successful payment
                window.location.href = "${pageContext.request.contextPath}/viewCompAndApply"; 
            } else {
                alert("Payment failed: " + response.txStatus);
                // Handle payment failure here
            }
        });
    });
    
    
    
    
    
    
    
    
    
</script>

	<script>

function getAdvertisementStatus(tech, cmp, duration, id, companyName, jobType,workingType) {
    console.log("Technology: " + tech);
    console.log("Company ID: " + cmp);
    console.log("Duration: " + duration);
    console.log("ID: " + id);
    console.log("Company Name: " + companyName);
    var avd_id = id;
    var jobType = jobType;
	var workingType = workingType;
    $.ajax({
        type: "GET",
        url: "${pageContext.request.contextPath}/getInternshipStatus?avdId=" + avd_id,
        success: function (response) {
            console.log("response: " + response);
            if (response == "ongoing") {
                Swal.fire({
                    title: "Ongoing Internship Detected",
                    text: "You already have an ongoing internship and cannot apply for another one at this time.",
                    icon: "warning",
                    confirmButtonText: "OK"
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.reload();
                    }
                });
            } else if (response == "pending" || response == "1" || response == "2" || response == "T" || response == "D") {
                $('#internshipPending').on('shown.bs.modal', function () {
                    $('.mydiv').hide();
                });
                $('#internshipPending').modal('toggle');
            } else if (response == "A") {
                $('#internshipApproved').modal('toggle');
                location.reload();
            } else if (response == "R") {
                Swal.fire({
                    title: "Request Rejected",
                    text: "You have a rejected request for this company that hasn't passed the cooling period. Would you like to reapply once the period is over?",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Reapply",
                    cancelButtonText: "Cancel"
                }).then((result) => {
                    if (result.isConfirmed) {
                        confirmAdversemnt(tech, cmp, duration, id);
                    }
                });
            } else if (response == "S") {
                Swal.fire("Already Applied", "You have already applied as a student.", "error");
                location.reload();
            } else if (response == "c") {
                Swal.fire("Already Applied", "College has already applied on your behalf.", "info");
            } else {
                // :white_check_mark: Instead of Bootstrap modal, show SweetAlert confirmation
                Swal.fire({
                    title: "Confirm Application",
                    html: "You are applying for an internship in <strong>" + tech + "</strong> at <strong>" + companyName + "</strong> for <strong>" + duration + " weeks</strong>. Are you sure you want to proceed?",
                    icon: "question",
                    showCancelButton: true,
                    confirmButtonColor: "#28A745",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, Apply",
                    cancelButtonText: "Cancel"
                }).then((result) => {
                    if (result.isConfirmed) {
                        submitInternshipApplication(id);
                    }
                });
            }
        }
    });
}
function submitInternshipApplication(advertisementId) {
    document.body.style.cursor = 'wait';
    const form = document.createElement("form");
    form.method = "POST";
    form.action = "${pageContext.request.contextPath}/viewCompAndApply";
    const hiddenInput = document.createElement("input");
    hiddenInput.type = "hidden";
    hiddenInput.name = "hid";
    hiddenInput.value = advertisementId;
    form.appendChild(hiddenInput);
    document.body.appendChild(form);
    setTimeout(() => {
        form.submit();
    }, 200);
}

function checkPaymentAndProceed(technology, companyId, duration, id, companyName) {
const userId = "${user.id}"; // Make sure this is correctly set from your server-side
fetch("check?userId=" + userId)
.then(response => response.json())
.then(data => {
if (data.success) {
getAdvertisementStatus(technology, companyId, duration, id, companyName);
} else {
Swal.fire({
title: "Payment Required",
text: "You need to complete the payment before applying.",
icon: "warning",
showCancelButton: true,
confirmButtonColor: "#3085D6",
cancelButtonColor: "#d33",
confirmButtonText: "Go to Payment",
cancelButtonText: "Cancel"
}).then((result) => {
if (result.isConfirmed) {
window.location.href = "${pageContext.request.contextPath}/paymentpage";
}
});
}
})
.catch(error => {
console.error("Error checking payment status:", error);
Swal.fire({
title: "Error",
text: "There was an error checking your payment status. Please try again.",
icon: "error",
confirmButtonText: "OK"
});
});
}

</script>


</body>

</html>