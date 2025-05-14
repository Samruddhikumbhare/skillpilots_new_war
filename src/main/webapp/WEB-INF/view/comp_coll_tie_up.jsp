

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@include file="user_session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | College Tie Up</title>

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
    /* backgroun#0f2c7eebc9e; */
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
			<a href="#">
				<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg' alt="Deskapp Logo" class="dark-logo">
				<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg' alt="Skillpilot Logo" class="light-logo">
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
				<h4 class="h4 mb-0 text-center" style="color: white;background: #0f2c7eeb;border-radius: 5px;">Institute List</h4>
			</div>
			<div class="pd-20 card-box">
				<div class="tab">

					<ul class="nav nav-tabs customtab" role="tablist">
					
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#availableTab" role="tab"
								aria-selected="true">Institutes Available For Tie Up</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tieupTab" role="tab" aria-selected="false">Tied Up
									Institutes</a></li>
<!-- 					
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#receivedTab" role="tab"
								aria-selected="true">Received Requests</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#sentTab" role="tab" aria-selected="false">Sent
									Requests</a></li>
					 -->
					
							<li class="nav-item"><a class="nav-link"
								data-toggle="tab" href="#receivedTab" role="tab"
								aria-selected="true">Received Requests</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#sentTab" role="tab" aria-selected="false">Sent
									Requests</a></li>
					
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="availableTab"
							role="tabpanel">
							<div class="pd-20">
								<c:if test="${ not empty colleges }">
									<table
										class="data-table table hover">
										<thead class="thead-light">
											<tr>
												<th>Institute Name</th>
												<th>Established Date</th>
												<th>Web URL</th>
											
													<th></th>
												
											</tr>
										</thead>
									
										<tbody id="tablist">
											<c:forEach var="college" items="${colleges}">
												<tr>
												<td><span class="pointer compLink" style="color: #5417ff;"
														onclick="getCollegeDetails('${college.college_id}',true);">${college.college_name}</span></td>
													<td><span>${college.web_url}</span></td>
													<c:if test="${role eq ProjectConstants.hr_Role}">
														<td class="btn-td">
															<form:form modelAttribute="collCompTieUp" action="college_tieup_req" method="post" id="${college.college_id}">
																<form:hidden path="college.college_id" value="${college.college_id}" />
																<span class="label label-info pointer" style="background: #213c87;padding: 3px 7px 6px 7px;border-radius: 3px;color: white;" onclick="tieupTerms('${college.college_id}','${college.college_name}');">Apply</span>
															</form:form>
														</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
										
									</table>
								</c:if>
								<c:if test="${  empty colleges }">
									<label>No Institute Available For Tie Up</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="tieupTab" role="tabpanel">
							<div class="pd-20">
								
									<table
										class="data-table table hover">
										<thead class="thead-light">
											<tr>
												<th>Institute Name</th>
												<th>Tied up Date</th>
												<th>Valid Till</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody id="tablist">
											<c:forEach var="collcomptieup" items="${tiedupcolleges}">
												<tr>
													<td><span class="pointer compLink" style="color: #5417ff;">${collcomptieup.college_name}</span></td>
													<td><span>${collcomptieup.creation_date}</span></td>
													<td><span>${collcomptieup.creation_date}</span></td>
													<td class="btn-td"><span
														class="label label-info pointer" style="background: #19b3f9e6;padding: 4px 9px 5px 8px;border-radius: 3px;color: white;">
														
															<i class="fa fa-download"> Download</i> </span>
													</span> <%-- <a href="tieup_agreement?requester='${collcomptieup.college_id}'&approver='${collcomptieup.requested_by}'&tieup_date='${collcomptieup.updation_date}'">View</a> --%>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div
										class="alert alert-danger alert-dismissable fade in errorBox"
										id="errorBox1" style="display: none; width: 30%">
										<a href="#" class="close" aria-label="close">&times;</a> <span
											id="errorText1"></span>
									</div>
								
								<c:if test="${  empty tiedupcolleges }">
									<label> No Tied up Institutes</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="receivedTab" role="tabpanel">
							<div class="pd-20">
								<c:if test="${ not empty receivedRequest }">
									<table
										class="data-table table hover">
										<thead class="thead-light">
											<tr>
												<th>Request ID</th>
												<th>Institute Name</th>
												<th>Receive Request</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody id="tablist">
											<c:forEach var="rec_req" items="${receivedRequest}">
												<tr>
													<td>${rec_req.tieup_id}</td>
													<td><span class="pointer compLink" style="color: #5417ff;">${rec_req.college_name}
													</span></td>
													<td><span class="pointer compLink" >${rec_req.creation_date}
													</span></td>
													<td>
														<button class="btn btn-success" onclick="acceptRequest('${rec_req.tieup_id}')">Accept</button>
														<button class="btn btn-danger" onclick="deleteRequest('${rec_req.tieup_id}')">Reject</button>
													</td>
													
													
												
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${  empty receivedRequest }">
									<label>No Received Requests</label>
								</c:if>
							</div>
						</div>
						<div class="tab-pane fade" id="sentTab" role="tabpanel">
							<div class="pd-20">
							
								<c:if test="${ not empty sentRequest }">
									<table
										class="data-table table hover">
										<thead class="thead-light">
											<tr>
												<th>Request ID</th>
												<th>Institute Name</th>
												<th>Sent Date</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody id="tablist">
											<c:forEach var="sent_req" items="${sentRequest}">
												<tr>
													<td>${sent_req.tieup_id}</td>
													<td><span class="pointer compLink" style="color: #5417ff;">${sent_req.college_name}
													</span></td>
													<td><span class="pointer compLink" >${sent_req.creation_date}
													</span></td>
													<td class="btn-td">
														<span style="color: #8E75D2; font-weight: bold;"><i
															class="fa fa-clock-o"></i> ${sent_req.status}</span>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${  empty sentRequest }">
									<label>No Sent Requests</label>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<%@include file="modal_common.jsp"%>	
			<%@include file="modalFeedback.jsp"%>
		
			<%@include file="modal_tieup_terms_and_conditions.jsp"%>
			<%-- <%@include file="scriptfiles.jsp"%> --%>
			<%@include file="footer.jsp"%>
		</div>
	</div>
<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
   $(document).ready(function() {
    // Call tieupTerms function when the document is ready
    tieupTerms(formid, collegeName);
});
function tieupTerms(formid, collegeName) {
    $("#tieup_terms_and_condition").modal("show");
    $("#hidden_form_id").val(formid);
    $("#collegeName").val(collegeName);
}
function acceptRequest(tieupId) {
    var currentDate = new Date();
    updateStatus(tieupId, 'Accepted', currentDate);
}
    function rejectRequest(tieupId) {
        updateStatus(tieupId, 'Rejected');
    }
    function updateStatus(tieupId, status) {
    	console.log("workinh");
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/acceptRequest', // Adjust the URL based on your application setup
            data: {
                tieupId: tieupId,
                status: status
            },
            success: function (response) {
                // Handle the success response as needed
                console.log('Status updated successfully');
                location.reload();            },
            error: function (error) {
                // Handle the error response
                console.error('Error updating status:', error);
            }
        });
    }
</script>

	<!-- js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/jspdf/addimage.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/jspdf/png.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/jspdf/zlib.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/jspdf/png_support.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/coll_comp_tie_up.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/students_feedback_script.js"></script>
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
</body>
</html>