
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="user_session.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Internship Request</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
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
	font-family: 'Inter', sans-serif;
	border-radius: 1px;
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
					<c:if test="${not empty com_internal_req}">
						<div class="panel-heading text-center">
							<h5 class="panel-title" style="color: #1b00ff">
								Internship Requests</h5>
						</div>
						<div class="mb-15">
							<table class="data-table table hover">
								<thead class="thead-light">
									<tr>
										<th class="table-plus datatable-nosort">Request ID</th>
										<th>Requester</th>
										<th>Request</th>
										<th>Skill</th>
										<th style="width: 70px;">Duration</th>
										<th>Student Name</th>
										<th>Assigned Team</th>
										<th>Status</th>
										<th>Request Expires on</th>
									</tr>
								</thead>
								<tbody id="tablist">
									<c:forEach items="${com_internal_req}" var="com_internal_req">
										<tr>
											<td><span>${com_internal_req[0]}</span></td>

											<td><span class="pointer"
												onclick="getCollegeDetails('${com_internal_req[8]}',false);">
													<strong> ${empty com_internal_req[1] ? 'Student' : com_internal_req[1]}
												</strong>
											</span></td>

											<td><span>${com_internal_req[3]}</span></td>
											<td><span>${com_internal_req[4]}</span></td>
											<td><center>
													<span>${com_internal_req[5]}</span>
												</center></td>
											<td><c:choose>
													<c:when test="${com_internal_req[12] eq 'coll'}">
														<span class="pointer intrngrp"
															style="font-size: 14px !important; color: #1b00ff !important; cursor: pointer !important;"
															onclick="studentId(this);" data-toggle="modal"
															data-target="#all_interns_details"
															id="${com_internal_req[6]}"> <strong
															style="color: #1b00ff;">Group Details</strong>
														</span>
													</c:when>
													<c:otherwise>
														<span class="pointer intrngrp"
															style="font-size: 14px !important; color: #1b00ff !important; cursor: pointer !important;"
															onclick="dispStudentData('${com_internal_req[6]}');"
															data-toggle="modal" data-target="#studentDetailsModal"
															id="${com_internal_req[6]}"> <strong>${com_internal_req[12]}</strong>
														</span>
													</c:otherwise>
												</c:choose></td>

											<td><span>${com_internal_req[2]}</span></td>
											<td><c:if
													test="${user.role eq '3' && com_internal_req[7] eq '3'}">
													<c:forEach items="${compDeptLink}" var="deptlink">
														<c:if
															test="${deptlink.compDeptLinkId == com_internal_req[11]}">
															<c:if test="${ deptlink.internshipLeadId == null }">
																<a class="btn btn-warning" data-toggle="collapse"
																	data-target="#schedule${com_internal_req[0]}"
																	style="margin: 0px !important; font-size: 17px !important; padding: 0px !important;">
																	Schedule <i class="fa fa-sort-desc" aria-hidden="true"
																	style="vertical-align: 3px;"></i>
																</a>
																<div id="schedule${com_internal_req[0]}"
																	class="collapse">
																	<div class="col-sm-12"
																		style="width: 100%; border: 1px solid; border-color: #1974c3; background-color: #eeeeee; padding: 10px;">
																		<p>
																			<b>Start Date:</b> <input type="date"
																				id="datepicker${com_internal_req[0]}"
																				class="datepickers"
																				style="width: 95%; height: auto;">
																		</p>
																		<p>
																			<button class="btn btn-primary btn-xs"
																				style="float: right; border-radius: 10pc !important;"
																				onclick="scheduleInternships('${com_internal_req[0]}','${com_internal_req[2]}');">
																				Confirm</button>
																		</p>
																	</div>
																</div>
															</c:if>
															<c:if test="${ deptlink.internshipLeadId != null }">
																<a class="btn btn-warning " data-toggle="collapse"
																	data-target="#a${com_internal_req[0]}"
																	style="margin: 0px !important; font-size: 14px !important; padding: 0px !important;">
																	Assign to lead <i class="fa fa-sort-desc"
																	aria-hidden="true" style="vertical-align: 3px;"></i>
																</a>
																<%-- <button style="background-color: red; border-color: red; border-radius: 10px;"
																	class='btn-primary' data-toggle="modal" data-target="#rejectModelfor_External_req"
																	onclick="rejectReqId('${com_internal_req[0]}');">Reject</button> --%>
																<div id="a${com_internal_req[0]}" class="collapse">
																	<div class="col-sm-12"
																		style="width: 100%; border: 1px solid; border-color: #1974c3; background-color: #eeeeee; padding: 10px;">
																		<input type="hidden"
																			class="cmp_role_three_id cmp_role_three_id${deptlink.internshipLeadId}"
																			id="${deptlink.internshipLeadId}"
																			style="width: 50%; border-radius: 8px; margin-top: 3px;"
																			disabled="disabled">
																		<button class="btn btn-primary btn-xs"
																			style="margin-left: 3px !important; border-radius: 10pc !important; margin-top: 4px;"
																			onclick="approveReqId('${com_internal_req[0]}');">Confirm</button>
																	</div>
																</div>
															</c:if>
														</c:if>
													</c:forEach>
												</c:if> <c:if
													test="${user.role eq '4' && com_internal_req[7] eq '4' }">
													<a class="btn btn-warning " data-toggle="collapse"
														data-target="#schedule${com_internal_req[0]}"
														style="margin: 0px !important; font-size: 17px !important; padding: 0px !important;">
														Schedule <i class="fa fa-sort-desc" aria-hidden="true"
														style="vertical-align: 3px;"></i>
													</a>
													<%-- <button class='btn-primary' data-toggle="modal" data-target="#rejectModelfor_External_req"
															onclick="rejectReqId('${com_internal_req[0]}');">
															Reject</button> --%>
													<div id="schedule${com_internal_req[0]}" class="collapse">
														<div class="col-sm-12"
															style="width: 100%; border: 1px solid; border-color: #1974c3; background-color: #eeeeee; padding: 10px;">
															<p>
																<b>Start Date:</b> <input type="date"
																	id="datepicker${com_internal_req[0]}"
																	class="datepickers" style="width: 95%; height: auto;">
															</p>

															<p>
																<button class="btn btn-primary btn-xs"
																	style="float: right; border-radius: 10pc !important;"
																	onclick="scheduleInternships('${com_internal_req[0]}','${com_internal_req[2]}');">
																	Confirm</button>
															</p>
														</div>
													</div>
												</c:if> <c:if
													test="${(user.role eq '2' ||  user.role eq '3') && com_internal_req[7] eq '4' }">
													<!--  pendting at internship lead -->
													<i class="fa fa-clock-o fa-spin"></i>
													<span style="color: #ff0000c7;">Pending at Lead</span>
												</c:if> <c:if
													test="${(user.role eq '2' || user.role eq '4' || user.role eq '1') && com_internal_req[7] eq '3' }">
													<i class="fa fa-clock-o fa-spin"></i>
													<span style="color: #ff0000c7;">Pending at Manager</span>
												</c:if> <c:if test="${com_internal_req[7] eq 'A' }">
													<span>Scheduled</span>
												</c:if> <%-- <c:if test="${com_internal_req[7] eq ProjectConstants.comp_internal_req_approval_status_rejected }">
														<span>Rejected</span>
														<span onclick="rejectionReason(this);" id="${com_internal_req[0]}">
															<i class="fa fa-info-circle" aria-hidden="true" title="Rejection Reason"
																style="color:#0073b7; padding-left:3px;"></i>
													</c:if> --%> <c:if
													test="${com_internal_req[7] eq ProjectConstants.request_cancelled_by_system}">
													<span title="Internship started in some other company.">Cancelled
														by Admin</span>
												</c:if></td>
											<td><span>${com_internal_req[10]}</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
					<c:if test="${empty com_internal_req}">
						<div class="box text-center">
							<label class="text-center">${ empty_internal_request } </label>
						</div>
					</c:if>
				</div>
			</div>
			<%@include file="modal_common.jsp"%>
			<%@include file="modal.jsp"%>
			<%@include file="modal_adv_schedule.jsp"%>
			<%@include file="modalStudentDetails.jsp"%>

			<%@include file="footer.jsp"%>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Select an
						Option</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="myForm"
						action="${pageContext.request.contextPath}/assignteam"
						method="post">
						<div class="form-group">
							<label for="exampleFormControlSelect1">Example select</label> <select
								class="form-control" id="internshipLeadId"
								name="internshipLeadId">
								<option>Select an option</option>
								<option value="1">Option 1</option>
								<option value="2">Option 2</option>
								<option value="3">Option 3</option>
							</select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary" form="myForm">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>
	<script>
    function openModel() {
        $('#openModel').show();
    }
</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/company_internal_request.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/internship_schedule.js"></script>
	<script type="text/javascript"
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
	<!-- Datatable Setting js -->
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
	<!-- bootstrap-tagsinput js -->
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/advanced-components.js"></script>
	<script type="text/javascript">
	$(document).ready( function () {
	    $('#internal_internship_requests').DataTable({
	    "lengthMenu": [[100, 125, 150, -1], [100, 125, 150, "All"]]
	    });
	} );
	
	</script>
	<script type="text/javascript">
	//Date picker
	$(function () {
	  var datepicker_ids = [];
	  $('.mydatepicker').each(function () {
		  datepicker_ids.push(this.id);
	  });
	  for(var i=0;i<datepicker_ids.length;i++){
		  $('#'+datepicker_ids[i]).datepicker({
				autoclose: true,
				format: 'yyyy-mm-dd',
				todayHighlight: true,
				 language: 'en'
			});
	  }
	});
	</script>
	<script>
	function closeModal() {
	    // Find the modal element by its ID
	    var modal = document.getElementById('studentDetailsModal');

	    // Check if the modal element exists
	    if (modal) {
	        // Close the modal by removing the 'show' class
	        modal.classList.remove('show');
	        
	        // Hide the modal backdrop
	        var modalBackdrop = document.querySelector('.modal-backdrop');
	        if (modalBackdrop) {
	            modalBackdrop.style.display = 'none';
	        }
	    }
	}


</script>
	<script>
    function scheduleInternship() {
		console.log("sgstsbsg")
        var requestId = $('#request_id').text(); // Get the request ID
		var requestIdInt = parseInt(requestId, 10);
        var selectedDate = $('#datepicker${com_internal_req[0]}').val(); // Get the selected date
        
        // Make AJAX request
        $.ajax({
            url: '/scheduleInternshipByCompany_Team', // Replace 'your_controller_url' with the actual URL of your controller
            method: 'POST', // or 'GET' depending on your server-side setup
            data: {
                request_id: requestIdInt,
                selected_date: selectedDate
            },
            success: function(response) {
                // Handle success response if needed
                console.log(response);
                console.log("workingnnnnnnnnnnnnnnnnnngggg");
				
            },
            error: function(xhr, status, error) {
				// Handle error if needed
                console.error(xhr.responseText);
				//console.log("workingnnnnnnnnnnnnnnnnnngggg");
            }
        });
    }

function scheduleInternships(requested_id, team_name) {
    console.log("Starting scheduleInternships function");

    var sdate = $('#datepicker' + requested_id).val();
    if (sdate === "") {
        Swal.fire({
            icon: 'warning',
            title: 'Oops...',
            text: 'Please select a date.'
        });
    } else {
        var request_id = requested_id;

        $.ajax({
            type: "GET",
            url: "scheduleInternshipByCompany_Teams",
            data: {
                sdate: sdate,
                request_id: request_id,
                team_name: team_name
            },
            success: function(response) {
                var str = null;
                var schd_status = null;

                $.each(response, function(key, val) {
                    if (key !== null && val !== null) {
                        str = key;
                        schd_status = val;
                    }
                });

                if (str !== null) {
                    var arr = str.split(",");
                }

                var confirmMessage = "Schedule Internship?";

                if (schd_status === 'weekly_schedule_internship') {
                    Swal.fire({
                        title: confirmMessage,
                        text: "Press OK to schedule or Cancel to reload.",
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonText: 'OK',
                        cancelButtonText: 'Cancel'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Uncomment and implement the following lines based on your logic
                            // $('#adv_id').val(arr[0]);
                            // show_schedule_modal(arr[0], arr[1], "CIR");
                        } else {
                            // location.reload();
                        }
                    });
                } else {
                    var adv_id;
                    if (schd_status === 'no-schedule') {
                        // Uncomment and implement the following lines based on your logic
                        // $('#adv_id').val(arr[0]);
                        // adv_id = arr[0];
                    } else {
                        // Uncomment and implement the following lines based on your logic
                        // $('#group_id').val(arr[0]);
                    }
                    Swal.fire({
                        title: confirmMessage,
                        text: "Press OK to schedule or Cancel to reload.",
                        icon: 'question',
                        showCancelButton: true,
                        confirmButtonText: 'OK',
                        cancelButtonText: 'Cancel'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Uncomment and implement the following line based on your logic
                            // show_schedule_modal(adv_id, arr[1], "CIR");
                            location.reload();
                        } else {
                            // location.reload();
                        }
                    });
                }
            },
            error: function() {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Error fetching data.'
                });
            }
        });
    }
}



  
   

</script>
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
    		$("#projectDate").text(project.createdAt || "");

    		// GitHub link
   			if (project.githubLink && project.githubLink.trim() !== "") {
        	$("#projectGithub").attr("href", project.githubLink);
        	$("#projectGithub").show();
    		} else {
        	$("#projectGithub").hide();
    			}

    		if (project.filePath && project.filePath.trim() !== "") {
        const fileUrl = "${pageContext.request.contextPath}/viewFile/" + encodeURIComponent(project.filePath);
        $("#projectFile").attr("href", fileUrl);
        $("#projectFile").show();
    } else {
        $("#projectFile").hide();
    }

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
	function getCollegeDetails(elem, show_dept) {
		$("#details_modals").modal();
		$.ajax({
			type: "GET",
			url: "getCollegeDetails?college_id=" + elem,
			success: function(response) {
				var collegeDetails = response.college;
				var deptDetails;
	
				if (show_dept) {
					$("#deptDetailsBody").empty();
					if (response.department === "none") {
						$("#deptDetailsBody").append("This College hasn't registered any department yet.");
					} else {
						deptDetails = response.department;
						deptDetails.forEach(dept => {
							var tableRow = `<tr><td>${dept}</td></tr>`;
							$("#deptDetailsBody").append(tableRow);
						});
						$("#deptDetailsBody").show();
					}
					$("#coll_details_dept").show();
				} else {
					$("#coll_details_dept").hide();
				}
	
				$("#det_title").text(collegeDetails.college_name);
				$("#det_est").text(collegeDetails.estd_date);
				$("#det_contact1").text(collegeDetails.contact_1);
				$("#det_contact2").text(collegeDetails.contact_2);
				$("#det_email").text(collegeDetails.email_id);
				$("#det_weburl").text(collegeDetails.web_url);
				$("#about_us_para").hide();
				$('#item_logo').attr('src', 'data:image/png;base64,' + collegeDetails.logo);
				$("#details_modals").modal("show");
			},
			error: function() {
				alert('Error occurred');
			}
		});
	}
	</script>
	<script>
		// Wait until the DOM is fully loaded
		document.addEventListener('DOMContentLoaded', () => {
			// Select all elements with the 'datepicker' class
			const datepickers = document.querySelectorAll('.datepickers');
			const today = new Date();
			const formattedDate = today.toISOString().split('T')[0]; // Format as YYYY-MM-DD
	
			// Loop through each date picker and set the minimum date
			datepickers.forEach(datepicker => {
				datepicker.min = formattedDate;
			});
		});
	</script>
</body>
</html>