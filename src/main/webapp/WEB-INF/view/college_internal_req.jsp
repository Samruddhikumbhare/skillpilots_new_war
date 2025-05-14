
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="user_session.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>SkillPilots | Internal Internship Requests</title>

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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">


	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
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

   .modal-content {
        width: 600px; /* Adjust the width as needed */
        margin: auto; /* Center the modal horizontally */
    }

    #msg_send {
        width: 100%; /* Make the textarea fill the modal width */
        height: 150px; /* Adjust the height as needed */
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
						class="btn btn-outline-primary sidebar-light">White</a> <a
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
				src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg' alt="" class="dark-logo"> 
				<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg' alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="title pb-20 text-center">
				<h5 class="h4 mb-0 text-center" style="background: #0f2c7eeb;color: white;border-radius: 4px;padding: 4px 16px 4px 16px;">Internal Request</h5>
			</div>
			<div class="min-height-200px">
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
					<c:if test="${empty internal_req_Role3}">
						<div class="box-header with-border">
							<h5 class="text_center">No Internship requests raised yet</h5>
						</div>
					</c:if>
					<c:if test="${not empty internal_req_Role3}">
							<table class="data-table table hover nowrap">
								<thead class="thead-light">
									<tr>
										<th></th>
										<th>Request ID</th>
										<th>Request By</th>
										<th>Request Date</th>
										<th>Company Name</th>
										<th>Interns Group</th>
										<th>Expiration Date</th>
										<th>Status</th>
										<th>Request Message</th>
									</tr>
								</thead>
								<tbody id="tablist">
									<c:forEach items="${internal_req_Role3}" var="item">
										<c:if test="${user.role eq 7 || user.role eq 8}">
											<tr>
												<td></td>
												<td>${item[9]}</td>
												<td><span><c:if test="${user.id eq item[0] }">${self}</c:if>
														<c:if test="${user.id ne item[0] }">${coordinator}</c:if></span>
												</td>
												<td>
<c:set var="dateString" value="${item[10]}" />
<fmt:parseDate var="parsedDate" value="${dateString}" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${parsedDate}" /></td>
												<td><span class="cmpname cmp${item[13]} ">${item[13]}</span></td>
												<td><span class="pointer intrngrp" onclick="studentId(this);" data-toggle="modal"
														data-target="#all_interns_details" id="${item[7]}">
														<strong>Group Details</strong>
													</span></td>
												<td><span>
													<fmt:formatDate value="${item[12]}" pattern="${ProjectConstants.date_format}"/>
													</span></td>
												<td>
													<c:if test="${item[5] eq '7'}">
														<c:if test="${user.role eq'7'}">
															<button class='btn-success' style="padding: 2px 4px 3px 3px;border-radius: 4px;" onclick="approveReqId('${item[9]}');">
																Approve</button>
															<button class='btn-primary ${item[9]}' data-toggle="modal" style="padding: 2px 4px 3px 3px;border-radius: 4px;"
																data-target="#rejectionModal" onclick="rejectReqId('${item[9]}');">
																Reject</button>
														</c:if>
														<c:if test="${item[5] eq '7'}">
															<b><span>Pending for HOD</span></b>
														</c:if>
													</c:if>
													<c:if test="${item[5] eq '6'}">
														<b><span>Pending at III Cell</span></b>
													</c:if>
													<c:if test="${item[5] eq 'A'}">
														<b><span class="Acolor">Approved & Sent to Company</span></b>
													</c:if>
													<c:if test="${item[5] eq 'R'}">
														<b><span class="Rcolor">Rejected</span></b>
														<span onclick="rejectionReason(this);" id="${item[9]}">
															<i class="fa fa-info-circle" aria-hidden="true" title="Rejection Reason"
																style="color:#0073b7; padding-left:3px;"></i>
														</span>
													</c:if>
													<c:if test="${item[5] eq ProjectConstants.request_cancelled_by_system}">
														<span title="Internship started in some other company.">Cancelled</span>
													</c:if>
												</td>
												<td>${item[1]}
													<c:if test="${item[5] eq ProjectConstants.coll_internal_req_approval_status_HOD}">
														<span class="pointer" onclick="changeRequestMessage('${item[9]}','${item[1]}')"
															style="color: green;">
															<i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
													</c:if>
												</td>
											</tr>
										</c:if>

										<c:if test="${user.role eq '5' || user.role eq '6'}">
											<tr>
												<td></td>
											<td>${item[1]}</td>
												<td><span class="dept${item[10]}" id="${item[10]}">${item[10]}
													</span></td>
						<td>
<c:set var="dateString" value="${item[4]}" />
<fmt:parseDate var="parsedDate" value="${dateString}" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${parsedDate}" /></td>
												<td><span id="${item[1]}">${item[2]}</span></td>
												<td><span class="pointer intrngrp open_pop_up" onclick="studentId(this);" 
													data-toggle="modal" data-target="#all_interns_details" id="${item[7]}">
														<strong>Group Details</strong>
													</span></td>
																		<td>
<c:set var="dateString" value="${item[9]}" />
<fmt:parseDate var="parsedDate" value="${dateString}" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${parsedDate}" /></td>
												<td>
													<c:if test="${item[8] eq '6'}">
														<button class='btn-success' style="padding: 2px 4px 3px 3px;border-radius: 4px;" onclick="approveReqId('${item[1]}');">
															Approve</button>
														<button class='btn-primary ${item[1]}' data-toggle='modal' style="padding: 2px 4px 3px 3px;border-radius: 4px;"
															data-target='#rejectionModal' onclick="rejectReqId('${item[1]}');">
															Reject</button>
													</c:if>
													<c:if test="${item[8] eq 'A'}">
														<b style="padding: 1px 5px 3px 5px;background: #3eacdec9; color: white;border-radius: 2px;">Request Send to Company</b>
													</c:if>
													<c:if test="${item[8] eq 'R'}">
															<b><span class="Rcolor">Rejected</span></b>
															<span onclick="rejectionReason(this);" id="${item[1]}">
																<i class="fa fa-info-circle" aria-hidden="true" title="Rejection Reason"
																	style="color:#0073b7; padding-left:3px;"></i>
													</c:if>
													<c:if test="${item[8] eq ProjectConstants.request_cancelled_by_system}">
														<span title="Internship started in some other company.">Cancelled</span>
													</c:if>
												</td>
												<td>${item[0]}
													<c:if test="${item[8] eq '6'}">
														<span class="pointer" style="color: green;" 
															onclick="changeRequestMessage('${item[1]}','${item[6]}')">
														<i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
													</c:if>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</c:if>

						<c:if test="${user.role eq 8 || user.role eq 7}">
							<button type="button" class="btn btn-primary btn-sm raised" data-toggle="modal" data-target="#raised_Modal"
								style="background-color: #00c0ef !important; border-color: #00acd6 !important; margin-top: 5px;">
								Raise Request &nbsp <span class="fa fa-plus-square addbtn"></span></button>
						</c:if>
				</div>
				<div class="modal fade" id="balanceDataModal" role="dialog">
				<div class="modal-dialog" style="width: 750px;">
					Modal content
					<div class="modal-content">
						<div class="panel-heading">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" id="table_heading"></h4>
						</div>
						<div class="modal-body">
							<input type="hidden" id="renew_coll_dept_link_id">
							<div id="balance_table_div">
								<table class="table table-striped">
									<tr>
										<th></th>
										<th>No of Internship</th>
										<th>Expiration Date</th>
									</tr>
									<tbody id="balance_departments"></tbody>
								</table>
								<button type="button" id="renew_dept_button" class="btn btn-success" style="width: 100%;">RENEW</button>
							</div>

							<div id="package_table_div">
								<table class="table table-striped">
									<tr>
										<th></th>
										<th>Package Name</th>
										<th>No of Internships</th>
										<th>Validity</th>
										<th>Amount</th>
									</tr>
									<tbody id="package_avail"></tbody>
								</table>
								<div class="modal-footer">
									<button type="button" id="btn-payAndRecharge" class="btn btn-success">PAY AND RE-CHARGE</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div id="editReqMsgModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="panel-heading">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4 class="modal-title">Edit Request Message</h4>
					</div>
					<c:url value="/editInternalRequestMessage" var="editFormAction"></c:url>
					<form action="${editFormAction}" method="post">
						<div class="modal-body">
							<input type="text" class="form-control" id="txtRequestMessage" name="requestMessage" maxlength="450">
							<input type="hidden" id="txtInternalReqId" name="internalReqId">
						</div>
						<div class="modal-footer">
							<input type="submit" value="Submit" class="btn btn-success">
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--End Content Wrapper. Contains page content-->
		<%@include file="modal.jsp"%>
		<%@include file="modalStudentDetails.jsp"%>
			<%@include file="footer.jsp"%>
		</div>
	</div>
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/sendinternshipGroup.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/request_for_internship.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<!-- buttons for Export datatable -->
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
	<script type="text/javascript">
		function changeRequestMessage(request_id,request_message){
			$("#txtRequestMessage").val(request_message);
			$("#txtInternalReqId").val(request_id);
			$("#editReqMsgModal").modal("show");
		}
	</script>
	<script>
    $(document).ready(function() {
    	console.log("jdjdjdj")
        // Assuming the button has class 'raised' as per your code
        $('.raised').click(function() {
            $('#raised_Modal').modal('show');
        });
    });
    
    
    function dispStudentData(studentId) {
			    $("#divLoading").show();
			    $.ajax({
			        type: "GET",
			        url: "${pageContext.request.contextPath}/getStudentDetails?student_id=" + studentId,
			        async: false,
			        success: function(response) {
			            $('#scrollDiv').scrollTop(0);
			            // setting personal details
			            var studentDetails = response; // Access the response directly
			            $("#name").text(studentDetails.student_name);
			            $("#email").text(studentDetails.email_id);
			            $("#contact").text(studentDetails.contact);
						
			            $("#curr_city").text(studentDetails.curr_city);
			            $("#home_city").text(studentDetails.home_city);
			            $("#skills").text(studentDetails.skills);
			            $("#dob").text(studentDetails.d_o_b);
			            $("#interest").text(studentDetails.interest);
			            $("#hobbies").text(studentDetails.hobbies);
			            $("#achievements").text(studentDetails.achievements);
			            if (studentDetails.photo != null && studentDetails.photo != "") {
			                document.getElementById("studentPic").src = "data:image/png;base64," + studentDetails.photo;
			            } else {
			                document.getElementById("studentPic").src = "data:image/png;base64," + blank_pro_image;
			            }

			        },
			        error: function(xhr, status, error) {
			            console.log("Error:", error);
			            // Handle error here
			        }
			    });
			}
</script>
</body>
</html>