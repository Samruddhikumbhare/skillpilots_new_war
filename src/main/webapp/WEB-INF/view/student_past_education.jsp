<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>SkillPilots | Student Education</title>
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/dist/css/myCss/feedback_css.css">
	
	<style type="text/css">
		.mySelect {
			padding: 0px !important;
			cursor: pointer;
		}
		
		.clgnametext {
			display: none;
			padding: 4px;
		}
		
		.clgnamebox {
			margin-top: 0px !important;
			margin-bottom: 0px !important;
			display: none;
		}
		
		.finish-btn {
			float: right;
		}
		
		.panetabs {
			background-color: white;
			padding-bottom: 10px;
			min-height:250px;
		}
		.form-group {
			padding-top:10px;
		}
		.btn-info {
			color:white;
			float:right;
			margin-bottom:10px !important;
			background-color:#00c0ef !important;
			border-color:#00acd6 !important;
		}
		
		.educational_div{
			border: 2px solid #099a09;
		    padding: 10px;
		    margin-bottom: 10px;
		}
		
		.panel-heading{
			margin-bottom:5px;
		}
		
		.pr-5 {
			padding-right:5px;
		}
	</style>
</head>

<body>
		<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
					alt="">
			</div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">Loading...</div>
		</div>
	</div>

	<div class="header">
		<div class="header-left">
			<div class="menu-icon dw dw-menu"></div>
			<div class="search-toggle-icon dw dw-search2" data-toggle="header_search"></div>
		</div>
		<div class="header-right">
			<!-- <div style="padding: 19px 14px 0px 0px;">
				<button class="btn btn-primary btn-sm" style="background: yellowgreen;border-radius: 3px;border-color: yellowgreen;padding: 4px 9px 4px 9px;"
				data-toggle="modal" data-target="#help_tutorial"
									data-keyboard="false" data-backdrop="static"
									onclick="start_tutorial();">Start Tutorial</button>
			</div> -->
			<div class="dashboard-setting user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="javascript:;" data-toggle="right-sidebar">
						<i class="dw dw-settings2"></i>
					</a>
				</div>
			</div>
			<div class="user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="#" role="button" data-toggle="dropdown">
						<i class="icon-copy dw dw-notification"></i>
						<span class="badge notification-active">
						<c:if
							test="${notifResponse.urCount gt 0}">
							<span class="label label-warning" id="noOfNotif"
								style="font-size: 13px !important;color: #9ff711;">${notifResponse.urCount}</span>
						</c:if>
						</span>
					</a>
				<div class="dropdown-menu dropdown-menu-right">
					<div class="notification-list mx-h-350 customscroll">
						
					</div>
				</div>
			</div>
			</div>
			<div class="user-info-dropdown">
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
						<span class="user-icon">
							<img src="/get_logo" alt="" style="width: 100%;height: 100%;">
						</span>
						<span class="user-name">
						<c:if test="${empty user_data.username}">New User</c:if>
						<c:if test="${not empty user_data.username}">${user_data.username}</c:if>
						</span>
					</a>
					<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
						<a class="dropdown-item" href="logout"><i class="dw dw-logout"></i> Log Out</a>
					</div>
				</div>
			</div>
		</div>
	</div>

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
						class="btn btn-outline-primary header-white active">White</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary header-dark">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-light active">White</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-dark ">Dark</a>
				</div>

				<div class="reset-options pt-30 text-center">
					<button class="btn btn-danger" id="reset-settings">Reset
						Settings</button>
				</div>
			</div>
		</div>
	</div>
	<div class="">
		<div class="brand-logo">
			<a href="javascript:;"> <img
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg' alt=" class="dark-logo"> 
				<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg" alt=" " class="light-logo">
			</a>
		</div>
		<div class="main-container" style="padding: 0px 20px 2px 300px;">
		<div class="pd-ltr-20 xs-pd-20-10">
		<div class="title pb-20">
				<h4 class="h4 mb-0 text-center" style="color: white;background: #0f2c7eeb;border-radius: 5px;">Add Educational Details</h4>
			</div>
			<div class="container" style="padding: 20px;">
				<div class="panel-heading" style="background: #0f2c7eeb;padding: 2px 0 3px 6px;border-radius: 4px;color: white;text-align: center;"><strong>Educational Details</strong>
					<button type="button" class="btn btn-info" onclick="editeducation('0')"
						style="margin:-2px 0 0 0 !important;padding: 5px !important;" title="Add Educational Qualification">
						<span class="fa fa-plus-square addbtn"></span></button>
				</div>
				<div id="edu_info">
					<div class="educational_div">
						<table class="table table-bordered" id="edu_table">
							<thead>
								<tr>
									<th>Education</th>
									<th>Stream</th>
									<th>School/Institute</th>
									<th>Board/University</th>
									<th>Marks(%)</th>
									<th>Year of Passing</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${studentPast}" var="studPast">
									<tr id="tr_${studPast.category}">
										<td>${studPast.category}</td>
										<td>${studPast.department}</td>
										<td>${studPast.organization}</td>
										<td>${studPast.board}</td>
										<td>${studPast.description}</td>
										<td>${studPast.end_date}</td>
										<td>
											<c:if test="${studPast.stud_past_id!=student.studentPast.stud_past_id}">
												<i onclick="editeducation('${studPast.stud_past_id}','${studPast.category}','${studPast.department}'
													,'${studPast.organization}','${studPast.board}','${studPast.description}','${studPast.end_date}')" 
													class="fa fa-pencil pr-2" style="background: #0f2c7eeb;padding: 3px 9px 2px 8px;color: white;border-radius: 3px;"></i>
												<i class="fa fa-times" onclick="removeStudentEdu('${studPast.stud_past_id}')"
													id="rem${studPast.stud_past_id}" style="background: red;padding: 3px 9px 2px 8px;color: white;border-radius: 3px;"></i>
											</c:if>
											<c:if test="${studPast.stud_past_id==student.studentPast.stud_past_id}">
												<i class="fa fa-info-circle" title="Current Education cannot be edited/deleted!"></i>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<div id="empty_edu_div" style="text-align:center">
							<span>No Educational Details added yet!</span>
						</div>
					</div>
				</div>
				<c:if test="${category=='none'}">
					<div style="padding-right:50%;">
						<a href="/stud_home">
							<input type="button" class="btn btn-primary finish-btn" value="Finish" />
						</a>
					</div>
				</c:if>
				<c:if test="${category!='none'}">
					<div style="padding-right:50%;">
						<a href="${ProjectConstants.stu_reg_finish_college}">
							<input type="button" class="btn btn-primary finish-btn" value="Finish" />
						</a>
					</div>
				</c:if>
			</div>
			<div class="footer-wrap pd-20 mb-20 card-box" style="position: fixed; bottom: 0%; width: 77%;">
				<i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
				<script>
					document.write(new Date().getFullYear())
				</script>
				All Rights Reserved SkillPilots &reg; | Designed & Developed By <a
					href="https://www.cluematrix.com/" target="_blank"
					style="color: #2800b4;">Cluematrix</a> Technologies Pvt.Ltd.
			</div>
			
			<%@include file="modal_stud_past.jsp"%>
		</div>
	</div></div>
	<%@include file="scriptfiles.jsp"%>
	<!-- First, include external libraries and plugins -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
    <!-- Add other external libraries and plugins if needed -->

    <!-- Next, include your custom JavaScript files -->
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/student_past_edu.js"></script>
    <!-- Add other custom JavaScript files if needed -->

    <!-- Finally, include scripts that rely on the libraries and files above -->
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
    <script>
        $("#empty_edu_div").hide();
    </script>
</body>
</html>