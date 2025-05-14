
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Test History</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16"	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

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
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

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
	.parameter {
    padding: 0;
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
		<div class="xs-pd-20-10 pd-ltr-20">

			<div class="title pb-20 text-center">
				<h2 class="h3 mb-0" style="color: white;background: #0f2c7eeb;border-radius: 5px;">Test History</h2>
			</div>
			<div class="card-box mb-30">
				<div class="pd-20">
					<c:if test="${not empty testHistory}">
								<table class="data-table table hover nowrap">
									<thead class="thead-light">
										<tr>
											<th>Company Name</th>
											<th>Test Name</th>
											<th>Action/Result</th>
										</tr>
									</thead>
									<tbody id="tablist">
										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate var="now" value="${now}"
											pattern="${ProjectConstants.date_format}" />
										<fmt:parseDate var="now" value="${now}"
											pattern="${ProjectConstants.date_format}" />
										<c:forEach var="teH" items="${testHistory}">
											<tr>
												<td><span>${teH[6]}</span></td>
												<td><span>${teH[5]}</span></td>
												<c:if
													test="${teH[3] eq ProjectConstants.student_test_data_status_pending && now le teH[4]}">
													<td><a
														href="startTest?test_data_id=${teH[0]}&current_page=th"
														style="background: #1b00ff;padding: 4px 15px 4px 15px;color: white;border-radius: 3px;"> <i
															class="fa fa-play label label-success pointer"
															style="font-size: 16px !important;"> Start Test</i>
													</a></td>
												</c:if>
												<c:if
													test="${teH[3] eq ProjectConstants.student_test_data_status_pending && now gt teH[4]}">
													<td><span class="label label-danger" style="color: red;">Test
															expired.</span></td>
												</c:if>
												<c:if
													test="${teH[3] eq 'D'}">
													<td><span class="label label-danger" style="color: orange;">You were
															disqualified.</span></td>
												</c:if>
												<c:if
													test="${teH[3] eq 'F'}">
													<td><span class="label" style="color: red;"
														onclick="view_testresult('${teH[0]}','${teH[8]}')">You
															failed.</span></td>
												</c:if>
												<c:if
													test="${teH[3] eq 'C'}">
													<td><span class="label label-success pointer"
														onclick="view_testresult('${teH[0]}','${teH[8]}')">You
															passed.</span></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<div class="text-center">
								<c:if test="${empty testHistory}">
								<span style="font-size: 20px;" class="label label-info">No
									Test history.</span>
							</c:if>
							</div>
							
				</div>
			</div>
			<%@include file="footer.jsp"%>
			<%@include file="testResult.jsp"%>
			<%@include file="modal_common.jsp"%>
		</div>
	</div>
	<!-- js -->
	<script>
  function closeModel() {
    console.log("kcdjbjhbjbjhbhjv");
    window.location = "${pageContext.request.contextPath}/stud_testHistory"; // Corrected typo here
}

</script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/onlineTestScript.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
	<!-- bootstrap-tagsinput js -->
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
</body>
</html>