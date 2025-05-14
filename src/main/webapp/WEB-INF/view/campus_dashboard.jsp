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
												<li class="breadcrumb-item"><a href="company_dashboard">Home</a></li>
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

										<div class="d-flex justify-content-between align-items-end">
											<div class="text-white">
												<div class="font-14 ">

													<a class="text-white" href="recruitment_campus">Create/View
														Recrutment</a>
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
												<i class="icon-copy fa fa-university" aria-hidden="true"></i>
											</div>
											<div class="font-14 text-right">
											</div>
										</div>
										<div class="d-flex justify-content-between align-items-end">
											<div class="text-white">
												<a class="text-white"
													href="${pageContext.request.contextPath}/studentDriveRequest">Placement
													Applied
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






			</body>

			</html>