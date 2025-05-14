
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		
		<%@include file="user_session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Internships</title>
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
<!-- Site favicon -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
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
		padding: 15px 12px 15px 54px!important;
		font-size: 15px!important;
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
    padding: 0px 15px 1px 7px!important;
    min-height: 75px;
    color: #666;
    font-size: 13px;
    font-weight: 500;
    font-family: 'Inter', sans-serif;
    border-radius: 1px;
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
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg" alt="" class="dark-logo"> 
				<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg" alt="" class="light-logo">
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
				<h5 class="h4 mb-0" style="background: #0f2c7eeb;color: white;border-radius: 4px;text-align:center; padding: 4px 16px 4px 16px;">Internship's</h5>
			</div>
			<div class="pd-20 card-box">
				<div class="tab">
				
					<ul class="nav nav-tabs customtab" role="tablist">
						<li hidden class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#pendingTab" role="tab"
							aria-selected="true">Pending Internships</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#ongoingTab" role="tab" aria-selected="false">Ongoing
								Internships</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#completedTab" role="tab" aria-selected="false">Completed
								Internships</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#canceledTab" role="tab" aria-selected="false">Canceled
								Internships</a></li>
								<div class="row mb-3">
    <div class="col-12 d-flex justify-content-right">
        <div class="d-flex align-items-center">
            <label for="internshipSearch" class="me-3 fw-bold">Search:</label>
            <input type="text" id="internshipSearch" class="form-control ml-3" placeholder="Search By Student Name..." onkeyup="filterInternships()">
        </div>
    </div>
</div>
					</ul>
					
					<div class="tab-content">
					
						<div class="tab-pane fade show active" id="pendingTab"
							role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty pendingInternships}">
									<table class="data-table table hover multiple-select-row">
										<tr>
											<th>Student Name</th>
											<th>Company Name</th>
											<th>Skill</th>
											<th>Start Date</th>
											<th>Duration</th>
										</tr>
										<tbody id="tablist">
											<c:forEach items="${pendingInternships}" var="internship">
												<tr>
													<%-- <td><span >${internship[12]}</span></td> --%>
													<td><span class="pointer actionSpan"  style="cursor: pointer; color: blue;"
														data-toggle="modal" data-target="#studentDetailsModal"
														onclick="dispStudentData('${internship[0]}');">${internship[12]}</span></td>
													<td><span>${internship[13]}</span></td>
													<td><span>${internship[7]}</span></td>
													<td><span><fmt:formatDate pattern="yyyy-MM-dd" value="${internship[8]}" /></span></td>

													<td><span>${internship[5]}</span></td>
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
									<table
										class="data-table table hover multiple-select-row nowrap">
										<tr>
											<th>Student Name</th>
											<th>Company Name</th>
											<th>Skill</th>
											<th>Start Date</th>
											<th>Duration</th>
											<c:if test="${user.role eq '7' || user.role eq '8'}">
												<th>Feedback</th>
											</c:if>
										</tr>
										<tbody id="tablist">
											<c:forEach items="${ongoingInternships}" var="internship">
												<tr>
													<td><span class="pointer actionSpan"
														data-toggle="modal" data-target="#studentDetailsModal" style="cursor: pointer; color: blue;"
														onclick="dispStudentData('${internship[0]}');">${internship[12]}</span></td>
													<%-- <td><span>${internship[12]}</span></td> --%>
													<td><span>${internship[13]}</span></td>
													<td><span>${internship[7]}</span></td>
													<td><span><fmt:formatDate
																pattern="yyyy-MM-dd"
																value="${internship[8]}" /></span></td>
													<td><span>${internship[5]}</span></td>
													<c:if test="${user.role eq '7' || user.role eq '8'}">
														<td><span title="Feedback"
															class="pointer greenHov actIcon"
															onclick="viewFeedback('${internship[6]}');"> <i
																class="fa fa-commenting-o"></i></span></td>
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
									<table class="data-table table hover multiple-select-row">
										<tr>
											<th>Student Name</th>
											<th>Company Name</th>
											<th>Skill</th>
											<th>Start Date</th>
											<th>Date Of Completion</th>
											<th>Duration</th>
											<th>Action</th>
										</tr>
										<tbody id="tablist">
											<c:forEach items="${completedInternships}" var="internship">
												<tr>
													<td><span class="pointer actionSpan"  style="cursor: pointer; color: blue;"
														data-toggle="modal" data-target="#studentDetailsModal"
														onclick="dispStudentData('${internship[0]}');">${internship[12]}</span></td>
													<%-- <td><span>${internship[12]}</span></td> --%>
													<td><span>${internship[13]}</span></td>
													<td><span>${internship[7]}</span></td>
													<td><span><fmt:formatDate
																pattern="yyy-MM-dd"
																value="${internship[8]}" /></span></td>
													<td><span><fmt:formatDate
																pattern="yyy-MM-dd"
																value="${internship[9]}" /></span></td>
													<td><span>${internship[5]}</span></td>
													<td>
														<%-- <span title="Give feedback to company." class="pointer greenHov actIcon"
														onclick="showFeed('${internship[6]}','${internship[1]}','CL');"><i
															class="fa fa-commenting-o"></i></span>&nbsp;&nbsp; | &nbsp;&nbsp; --%>
														<span title="View Feedback From Company"
														class="pointer greenHov actIcon"
														onclick="viewFeedback('${internship[6]}');"><i
															class="fa fa-eye"></i></span>&nbsp;&nbsp; | &nbsp;&nbsp;<span
														title="View Feedback From Student"
														class="pointer greenHov actIcon"
														onclick="viewStudsFeedback('${internship[6]}','${internship[0]}');"><i
															class="fa fa-eye"></i></span>
													</td>
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
									<table class="data-table table hover multiple-select-row">
										<tr>
											<th>Student Name</th>
											<th>Company Name</th>
											<th>Skill</th>
											<th>Duration</th>
											<th>Start Date</th>
											<th>Cancellation Date</th>
											<th>Cancellation Reason</th>
										</tr>
										<tbody id="tablist">
											<c:forEach items="${canceledInternships}" var="internship">
												<tr>
													<td><span class="pointer actionSpan"  style="cursor: pointer; color: blue;"
														data-toggle="modal" data-target="#studentDetailsModal"
														onclick="dispStudentData('${internship[0]}');">${internship[12]}</span></td>
													<%-- <td><span>${internship[12]}</span></td> --%>
													<td><span>${internship[13]}</span></td>
													<td><span>${internship[7]}</span></td>
													<td><span>${internship[5]}</span></td>
													<td><span><fmt:formatDate
																pattern="yyyy-MM-dd"
																value="${internship[8]}" /></span></td>
													<td>${internship[10]}</td>
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
			<br>
			<%@include file="modalFeedback.jsp"%>
			<!--End 2st model-->
			<%@include file="modalStudentDetails.jsp"%>
			<div class="footer-wrap pd-20 mb-20 card-box" style="position: fixed; bottom: 0%; width: 76%;">
				<i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
				<script>
					document.write(new Date().getFullYear())
				</script>
				All Rights Reserved SkillPilots | Designed & Developed By <a
					href="https://www.cluematrix.com/" target="_blank"
					style="color: #2800b4;">Cluematrix</a> Technologies Pvt.Ltd.
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/company_feedback.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/students_feedback_script.js"></script>
	<script	src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/vfs_fonts.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>


	<script>
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
	  <script>
    function filterInternships() {
        var input = document.getElementById("internshipSearch");
        var filter = input.value.toLowerCase();
        var tabPanes = document.querySelectorAll(".tab-content .tab-pane");
        tabPanes.forEach(function(pane) {
            var rows = pane.querySelectorAll("tbody tr");
            rows.forEach(function(row) {
                var studentCell = row.querySelector("td span");
                if (studentCell) {
                    var txtValue = studentCell.textContent || studentCell.innerText;
                    if (txtValue.toLowerCase().indexOf(filter) > -1) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                }
            });
        });
    }
</script>





	  
</body>
</html>