
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Internship Certificate</title>

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

.table td {
	padding: 0.4rem;
}

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

.table-bordered {
	border: 0.5px solid #e9efee5c !important;
}

.table-bordered td, .table-bordered th {
	border: 0.5px solid #e9efee5c !important;
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
				src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg'
				alt="" class="dark-logo"> <img
				src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg'
				alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<!-- <div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li><a href="company_dashboard" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
					<li><a href="company_internships" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate"></span><span class="mtext">Internships</span>
					</a></li>
					<li><a href="company_posts" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer"></span><span class="mtext">Internship Advertisements</span>
					</a></li>
					<li><a href="external_internship_request_company" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer-1"></span><span class="mtext">External Request</span>
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
					<li><a href="company_online_test" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-personal-computer"></span><span class="mtext">Manage Test</span>
					</a></li>
					<li><a href="companyTransactions" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-money-2"></span><span class="mtext">Balances</span>
					</a></li>
					<li><a href="company_report" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-file3"></span><span class="mtext">Internship Reports</span>
					</a></li>
					<li><a href="certificate" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate-1"></span><span class="mtext">Certificates</span>
					</a></li>
				</ul>
			</div>
		</div> -->
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="mobile-menu-overlay"></div>


	<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			

			<div class="title pb-20 text-center">
				<h5 class="h4 mb-0"
					style="background: #0f2c7eeb; color: white; border-radius: 4px;">Internship
					Certificate</h5>
			</div>
			<div class="search-container">
 <div style="text-align: right; margin-bottom: 10px;">
            <input type="text" id="searchInput" onkeyup="searchFunction()" 
                   placeholder="Search..." 
                   style="width: 250px; padding: 5px; border: 1px solid #ccc; border-radius: 5px;" />
        </div>        </div>
			<div class="card-box mb-30">
				<div class="pd-20">
					<c:if test="${ not empty studentss }">
						<table id="dataTable"
							class="data-table table table-bordered hover">
							<thead class="thead-light">
								<tr class="data-row">
									<th>ID</th>
									<th hidden>Student_ID</th>
									<th>Technology</th>
									<th>Company_Name</th>
									<th>Student_Name</th>
									<th class="text-center">Action</th>
									<%-- <c:if test="${role eq 0 || role eq ProjectConstants.iii_Role || role eq ProjectConstants.hr_Role || role eq 2}">
												<th>Action</th>
											</c:if> --%>
								</tr>
							</thead>

							<tbody id="tablist">
								<c:forEach var="internship" items="${studentss}"
									varStatus="loop">
									<tr>
										<th scope="row">${loop.index+1}</th>
										<td hidden>${internship.studentId}</td>
										<td>${internship.technology}</td>
										<td>${internship.companyName}</td>
										<td>${internship.studentName}</td>
										<td hidden>${internship.dateStarted}</td>
										<td hidden>${internship.dateCompleted}</td>
										<td class="btn-td" style="white-space: nowrap; width: 1%">
											<a target="_blank"
											href="${pageContext.request.contextPath}/certificate2?studentId=${internship.studentId}&technology=${internship.technology}&companyName=${internship.companyName}&studentName=${internship.studentName}&dateStarted=${internship.dateStarted}&dateCompleted=${internship.dateCompleted}"
											class="btn btn-primary btn-sm"
											style="padding: 1px 7px 3px 6px; background: #213c87"> <i
												style="font: -webkit-small-control;">View</i>
										</a> <a hidden class="btn btn-primary btn-sm"
											style="padding: 1px 7px 3px 6px; background: #213c87"
											href="${internship.downloadUrl}" target="_blank">Download
												Certificate</a> <%-- <c:if test="${role eq ProjectConstants.iii_Role || role eq ProjectConstants.hr_Role || role eq 2}">
													<td class="btn-td">
														<span
														class="pointer label label-success"
														onclick="certificate('${internships.college_id}','${internships.company_id}','${internships.student_id}','${internships.technology}','${internships.duration}','${internships.date_started}','${internships.date_completed}');"><i class="fa fa-eye"> View</i></span>
														<span class="label label-info pointer"
														onclick="viewCertificate('${internships.college_id}','${internships.company_id}','${internships.student_id}','${internships.technology}','${internships.duration}','${internships.date_started}','${internships.date_completed}')">
															<i class="fa fa-download"> Download</i>
													</span>
													</td>
												</c:if> --%>
									</tr>
									<%-- </c:forTokens> --%>
								</c:forEach>
							</tbody>
						</table>
						 <div class="text-center mt-3">
                <ul id="pagination" class="pagination justify-content-center"></ul>
            </div>
					</c:if>
					<div class="text-center">
						<c:if test="${  empty studentss }">
							<label>Certificate Not Generated Yet</label>
						</c:if>
					</div>
				</div>
			</div>
			<%@include file="modal_common.jsp"%>
			<%@include file="footer.jsp"%>
			<%@include file="modal_certificate.jsp"%>
		</div>
	</div>
	<!-- js -->
	<script>
	 function searchFunction() {
         let input = document.getElementById("searchInput").value.toLowerCase();
         let rows = document.querySelectorAll("#tablist tr");
         let matchFound = false;

         rows.forEach(row => {
             let text = row.innerText.toLowerCase();
             if (input === "" || text.includes(input)) {
                 row.style.display = "";
                 matchFound = true;
             } else {
                 row.style.display = "none";
             }
         });

         // Show all rows if input is empty
         document.getElementById("dataTable").style.display = matchFound || input === "" ? "table" : "none";
     }
	 
	 

    </script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/jspdf/addimage.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/jspdf/png.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/jspdf/zlib.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/jspdf/png_support.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/certificate.js"></script>
	s
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js'></script>

	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.buttons.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.bootstrap4.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js'></script>
	<!-- Datatable Setting js -->
	<!-- bootstrap-tagsinput js -->
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js'></script>
	<script
		src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js'></script>
	<script type="text/javascript">
		var table = $('#mytable').DataTable({
			columns : [ null, null, {
				"render" : function(data, type, row) {
					return data.split(", ");
				}
			} ]
		});
		
		 function downloadCertificate() {
	            const certificateUrl = document.getElementById('certificateUrl').value;


	            window.location.href = `http://13.201.188.94:8081/newskill/downloadCertificate`;
	        }
	</script>
</body>
</html>