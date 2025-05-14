<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="user_session.jsp"%>

<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>SkillPilots | Payment</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script>
      window.jsPDF = window.jspdf.jsPDF; // Fix for undefined issue
    </script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.14/jspdf.plugin.autotable.min.js"></script>

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- Google Font -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet" />
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css" />
<link
	href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css' />"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.css"
	integrity="sha512-qGaAtuKvSCWSaqGi3MX0T+h3SYcOUlrwpURUWgIgCsLQ92cBVzNCDtIvvB0/NDawwH2RcHAYvzEYS25+jzMTnQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>

<script src="https://sdk.cashfree.com/js/v3/cashfree.js"></script>
<script>
      window.dataLayer = window.dataLayer || [];
      function gtag() {
        dataLayer.push(arguments);
      }
      gtag("js", new Date());

      gtag("config", "UA-119386393-1");
    </script>
<style type="text/css">
.sidebar-menu .dropdown-toggle {
	padding: 15px 12px 15px 54px !important;
	font-size: 15px !important;
}

.header-right {
	display: -webkit-box;
	display: flex;
	-webkit-box-pack: end;
	justify-content: flex-end;
	height: 70px;
	width: 70%;
}

.header-left {
	display: -webkit-box;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	height: 100%;
	width: 10%;
}

.notification-icon-container {
	position: relative;
	display: inline-block;
}

.notification-icon-container .badge {
	position: absolute;
	top: -8px;
	right: -10px;
	background-color: red;
	color: white;
	font-size: 12px;
	border-radius: 50%;
	padding: 3px 6px;
}

.notification-icon-container i {
	font-size: 24px;
	color: #555;
	cursor: pointer;
	transition: color 0.3s ease;
}

.notification-icon-container i:hover {
	color: #000;
}

/* Example CSS for modal */
/* Modal Styling */
/* Modal Styling */
#notificationModal {
	margin-left: 1200px;
	margin-top: 100px;
	margin-bottom: 900px;
	bottom: 20px; /* Distance from the bottom of the screen */
	right: 20px; /* Distance from the right edge of the screen */
	width: 300px; /* Width of the modal */
	background-color: #fff;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	min-height: 200px;
	max-height: 400px;
	overflow: auto;
	display: none; /* Initially hidden */
	z-index: 1000; /* Ensure it appears above other elements */
	animation: fadeIn 0.3s ease-in-out;
}

/* Fade-In Animation */
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px); /* Slight slide-up effect */
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Modal Content */
#notificationModal .modal-content {
	padding: 10px;
	max-height: 400px; /* Limit height with scroll */
	overflow-y: auto;
	box-sizing: border-box;
}

/* Close Button */
.close {
	float: right;
	font-size: 16px;
	cursor: pointer;
	color: #333;
}

/* Notification List */
.notification-list {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.notification-list li {
	padding: 12px;
	border-bottom: 1px solid #ccc;
	cursor: pointer;
	border-radius: 6px;
	transition: background-color 0.3s ease;
}

.notification-list li.unread {
	background-color: #f0f8ff; /* Light blue for unread */
	font-weight: bold;
}

.notification-list li.read {
	background-color: #fff; /* White for read */
	font-weight: normal;
}

.notification-list li:hover {
	background-color: #f5f5f5; /* Light gray on hover */
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
	font-family: "Inter", sans-serif;
	border-radius: 1px;
}

.pointer {
	cursor: pointer;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	display: absolute;
	justify-content: center;
	align-items: center;
	margin: 0;
}

.main-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.form-container {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	max-width: 400px;
	width: 100%;
	text-align: center;
}

h2 {
	color: #333;
}

label {
	display: block;
	margin-top: 10px;
	font-weight: bold;
	text-align: left;
}

input {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

button {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 12px;
	width: 100%;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin-top: 20px;
}

button:hover {
	background-color: #218838;
}

#response {
	margin-top: 20px;
	padding: 10px;
	background: #e9ecef;
	border-radius: 5px;
	text-align: left;
}

.left-side-bar {
	pointer-events: none;
	opacity: 0.7; /* Slightly dimmed to indicate it's disabled */
}

p {
	color: red;
	font-size: 14px;
	margin-bottom: 20px;
}

input {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	background-color: #f4f4f4;
	cursor: not-allowed;
}

input:disabled {
	background-color: #e9ecef;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	padding: 20px;
}

.container {
	max-width: 800px;
	margin: auto;
	background-color: white;
	padding: 20px;
	border: 1px solid green;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: green;
}

.details {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.details div {
	width: 48%;
}

.table-container {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

.table-container th, .table-container td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

.table-container th {
	background-color: #f0f0f0;
}

.download-btn {
	display: block;
	width: 100%;
	padding: 10px;
	background-color: blue;
	color: white;
	border: none;
	cursor: pointer;
	text-align: center;
	margin-top: 20px;
	font-size: 16px;
}
</style>
</head>

<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img
					src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
					alt="" />
			</div>
			<div class="loader-progress" id="progress_div">
				<div class="bar" id="bar1"></div>
			</div>
			<div class="percent" id="percent1">0%</div>
			<div class="loading-text">Loading...</div>
		</div>
	</div>

	<div class="header">
		<div class="header-left">
			<div class="menu-icon dw dw-menu"></div>
			<div class="search-toggle-icon dw dw-search2"
				data-toggle="header_search"></div>
		</div>
		<div class="header-right">

			<div class="dashboard-setting user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="javascript:;"
						data-toggle="right-sidebar"> <i class="dw dw-settings2"></i>
					</a>
				</div>
			</div>

			<!-- Notification Bell Icon Section -->
			<div class="user-notification">
				<div class="dropdown">
					<div class="notification-icon-container"
						style="position: relative; display: inline-; margin-right: 20px;">
						<!-- Bell Icon -->
						<i class="fas fa-bell"
							style="font-size: 24px; color: white; cursor: pointer;"
							onclick="toggleNotifications()"></i>

						<!-- Notification Count Badge -->
						<span id="notificationCount" class="badge"
							style="position: absolute; top: -5px; right: -10px; background-color: red; color: white; border-radius: 50%; padding: 3px 6px; font-size: 12px; display: none;">
							0 </span>
					</div>
				</div>
			</div>

			<!-- Notification Modal -->
			<div id="notificationModal" class="modal" style="display: none;">
				<div class="modal-content">
					<span class="close" onclick="toggleNotifications()">&times;</span>
					<ul id="notificationList" class="notification-list"></ul>
					<!-- Notification list will be populated here -->
				</div>
			</div>


			<%-- 	<div class="user-notification">
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
					<!-- Header Section -->

				</div>
			</div>
			</div> --%>
			<div class="user-info-dropdown">
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button"
						data-toggle="dropdown"> <span class="user-icon"> <img
							src="<c:url value='/get_logo'/>" alt="Custom Logo"
							style="width: 100%; height: 100%;">

					</span> <span class="user-name"> <c:if
								test="${not empty user.email}">${user.username}</c:if>
					</span>
					</a>

					<div
						class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">

						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/logout"><i
							class="dw dw-logout"></i> Log Out</a>
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
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
				alt="" class="dark-logo" /> <img
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg"
				alt="" class="light-logo" />
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li><a href="${pageContext.request.contextPath}/stud_home"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
					<li><a href="viewCompAndApply"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-list"></span><span class="mtext">Industry
								List</span>
					</a></li>
					<c:if test="${user.role eq 0}">
						<li><a href="campusDriveForStudentsDashboard"
							class="dropdown-toggle no-arrow"> <span
								class="micon dw dw-list"></span><span class="mtext">College
									Campus Drive </span>
						</a></li>
					</c:if>
					<c:if test="${user.role eq 10}">
						<li><a href="companyCampusDriveForStudentsDashboard"
							class="dropdown-toggle no-arrow"> <span
								class="micon dw dw-list"></span><span class="mtext">Company
									Campus Drive </span>
						</a></li>
					</c:if>
					<li><a href="studentinternships"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-certificate"></span><span class="mtext">Internships</span>
					</a></li>
					<li><a href="appliedCompanies"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-personal-computer"></span><span class="mtext">Requests
								Status</span>
					</a></li>
					<c:if test="${user.role eq 0}">
						<li class="dropdown"><a href="#"
							class="dropdown-toggle no-arrow" data-toggle="dropdown"> <span
								class="micon dw dw-edit2"></span> <span class="mtext">Study
									Material</span>
						</a>
							<ul class="submenu">
								<li><a href="study_material">Notes</a></li>
								<li><a href="viewAssignments">View Assignments</a></li>
								<li hidden><a href="downloadAssignments">Download
										Assignments</a></li>
							</ul></li>
					</c:if>
					<li><a href="stud_testHistory"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-file-411"></span><span class="mtext">Test
								History</span>
					</a></li>
					<c:if test="${user.role eq 10 || user.role eq 0}">
						<li><a href="live_chat" class="dropdown-toggle no-arrow">
								<span class="micon dw dw-chat3"></span><span class="mtext">Live
									Chat</span>
						</a></li>
					</c:if>
					<li><a href="cv" class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-certificate"></span><span class="mtext">Resume/CV</span>
					</a></li>

					<li><a href="assessment_test" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-file-26"></span><span class="mtext">Assessment
								Test </span>
					</a></li>
					<li><a href="certificate" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate-1"></span><span
							class="mtext">Internship Certificate</span>
					</a></li>
					<li><a href="meet" class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-chat3"></span><span class="mtext">SkillMeet</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="form-container">
			<p>You have to pay a one-time platform fee for using modules like
				internships, assessment tests, and job drives. Happy applying!</p>

			<form onsubmit="return submitPaymentForm();">
				<label>Order Amount:</label> <input type="number" id="orderAmount"
					name="orderAmount" value="${plan.amount}" disabled /> <input
					type="hidden" id="userId" value="${user.id}" /> <label hidden>Order
					ID:</label> <input type="hidden" id="orderId" name="orderId" disabled /> <label>
					Name:</label> <input type="text" id="customerName" name="customerName"
					value="${user.username}" disabled /> <label> Phone:</label> <input
					type="text" id="customerPhone" name="customerPhone"
					value="${user.contact_no}" disabled /> <label hidden>Return
					URL:</label> <input type="hidden" id="returnUrl" name="returnUrl"
					value="http://localhost.com/return" disabled /> <label hidden>Email:</label>
				<input type="hidden" id="email" name="email" value="${user.email}"
					disabled /> <label>GST (18%):</label> <input type="text"
					id="gstAmount" name="gstAmount" value="0.18" disabled /> <b>Total
					Payable Amount: <span id="totalAmount">1.18</span>
				</b>

				<button type="submit">Pay Now</button>
				<p style="margin-top: 10px; font-size: 14px; color: red;">
					If you face any issues while making the payment, contact us at <b>socialskillpilots@skillpilot.com</b>
					or call <b>+91-9422926439</b>.
				</p>
			</form>
		</div>
	</div>

	<div hidden class="container" id="receiptContent">
		<h2>Payment Receipt</h2>
		<p>
			<b>Receipt Number:</b> Clue/2023-24/<span id="rid"></span>
		</p>
		<p>
			<b>Date:</b> <span id="paidDate"></span>
		</p>
		<hr />

		<!-- Details Section -->
		<div class="details">
			<!-- Company Details -->
			<div>
				<h3>Company Details</h3>
				<p>
					<b>Name:</b> SkillPilot Pvt. Ltd.
				</p>
				<p>
					<b>Address:</b> 123, Tech Park, Mumbai, India
				</p>
				<p>
					<b>Phone:</b> +91 9422926439
				</p>
				<p>
					<b>Email:</b> socialskillpilots@skillpilot.com
				</p>
			</div>

			<!-- Student Details -->
			<div>
				<h3>Student Details</h3>
				<p>
					<b>Name:</b> <span id="studentName"></span>
				</p>
				<p>
					<b>Batch:</b> <span id="batchName"></span>
				</p>
				<p>
					<b>Email:</b> <span id="studentEmail"></span>
				</p>
				<p>
					<b>Fees:</b> ₹<span id="batchFees"></span> /-
				</p>
			</div>
		</div>
		<hr />

		<!-- Payment Breakdown Table -->
		<table class="table-container">
			<thead>
				<tr>
					<th>Description</th>
					<th>Amount</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Base Amount</td>
					<td>₹<span id="baseAmount"></span></td>
				</tr>
				<tr>
					<td>GST (18%)</td>
					<td>₹<span id="gstAmount"></span></td>
				</tr>
				<tr>
					<td><b>Total Paid</b></td>
					<td><b>₹<span id="totalAmount"></span></b></td>
				</tr>
			</tbody>
		</table>
		<hr />

		<p>
			<b>GST No:</b> 27AAGCC4957M1Z3
		</p>
		<p style="text-align: right; margin-top: 20px">
			<b>Authorized Signature</b>
		</p>
	</div>

	<!-- Download Button -->

	<script>
      // Calculate GST and update total amount dynamically
      document.addEventListener("DOMContentLoaded", function () {
        let orderAmount = parseFloat(
          document.getElementById("orderAmount").value
        );
        let gst = orderAmount * 0.18;
        let totalAmount = orderAmount + gst;

        document.getElementById("gstAmount").value = gst.toFixed(2);
        document.getElementById("totalAmount").innerText =
          totalAmount.toFixed(2);
      });
    </script>

	<input type="hidden" id="gif_file_path"
		value='<c:url value="/images/loading.gif"/>' />
	<c:if
		test="${role== ProjectConstants.hod_Role || role==ProjectConstants.dept_incharge_Role }">
		<input type="hidden" id="role" value="${role}" />
	</c:if>
	<c:if test="${log_type eq ProjectConstants.user_initials_student  }">
		<input type="hidden" id="student_log" value="${log_type}" />
	</c:if>
	<!-- js -->
	<input type="hidden" id="role" value="${role}" />
	<input type="hidden" id="student_log" value="${log_type}" />

	<div class="footer-wrap pd-20 mb-20 card-box"
		style="position: relative; left: 332px; bottom: 0%; width: 77%">
		<i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
		<script>
          document.write(new Date().getFullYear());
        </script>
		All Rights Reserved SkillPilots&reg; | Designed & Developed By <a
			href="https://www.cluematrix.com/" target="_blank"
			style="color: #2800b4;"> Cluematrix </a> Technologies Pvt. Ltd. |
		Contact: <b>+91-9422926439</b>

	</div>
	<!-- Include SweetAlert2 CSS and JS -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" />
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

           document.addEventListener("DOMContentLoaded", function () {                                                         
             if (window.jspdf && window.jspdf.jsPDF) {
               window.jsPDF = window.jspdf.jsPDF;
             }
           });

           function generateRandomOrderId() {
               return 'ord-' + Math.floor(Math.random() * 1e18); // Generates a large random number
           }

           document.addEventListener("DOMContentLoaded", function () {
               document.getElementById("orderId").value = generateRandomOrderId();
           });

     
           function submitPaymentForm() {
             let orderData = {
               orderAmount: document.getElementById("totalAmount").innerText,
               orderId: document.getElementById("orderId").value,
               customerName: document.getElementById("customerName").value,
               customerPhone: document.getElementById("customerPhone").value,
               returnUrl:
                 "https://jar.skillpilots.com/skillpilot/payment-success?order_id=" +
                 document.getElementById("orderId").value,
               email: document.getElementById("email").value,
             };

             fetch("https://jar.skillpilots.com/newskill/createOrder", {
               method: "POST",
               headers: {
                 "Content-Type": "application/json",
                 "x-api-version": "2025-01-01",
                 "x-client-id": "776689d42f191ff3e94d70f486986677",
                 "x-client-secret":
                   "cfsk_ma_prod_f15b6a714c430ac9172c4ce29d49dd1a_b3217ffd",
               },
              
               body: JSON.stringify(orderData),
             })
               .then((response) => response.json())
               .then((data) => {
            	   console.log("sssssssss",data); 
                 if (data.sessionId) {
                   const cashfree = Cashfree({ mode: "production" });

                   let checkoutOptions = {
                     paymentSessionId: data.sessionId,
                     redirectTarget: "_modal",
                   };

                   cashfree.checkout(checkoutOptions).then((result) => {
                     if (
                       result.paymentDetails &&
                       result.paymentDetails.paymentMessage ===
                         "Payment finished. Check status."
                     ) {
                       Swal.fire({
                         title: "Payment Successful!",
                         text: "Your payment has been completed successfully. Click OK to download the receipt.",
                         icon: "success",
                         confirmButtonText: "OK",
                       }).then(() => {
                         // Call API to update payment status
                         updatePaymentStatus(
                           orderData.orderId,
                           orderData.customerName,
                           orderData.customerPhone,
                           orderData.email,
                           orderData.orderAmount,
                           "${receiptNumber}"
                         );
                       });
                     } else {
                       Swal.fire("Payment Failed", "Please try again.", "error");
                     }
                   });
                 }
               })
               .catch((error) => {
                 console.error("Error:", error);
                 Swal.fire(
                   "Error",
                   "Payment processing failed. Please try again.",
                   "error"
                 );
               });

             return false; // Prevent form submission
           }
           function updatePaymentStatus(
             orderId,
             customerName,
             customerPhone,
             email,
             orderAmount,
             receiptNumber
           ) {
             let userId = document.getElementById("userId").value; // Assuming user ID is available

             fetch(
               "${pageContext.request.contextPath}/payment-success?userId=" + userId,
               {
                 method: "GET",
               }
             )
               .then((response) => response.json()) // Convert response to JSON
               .then((data) => {
                 if (data.status === "success") {
                   // Extract receipt number from response
                   let receiptNumber = data.receiptNumber;

                   // Generate the receipt PDF
                   generatePDFReceipt(
                     orderId,
                     customerName,
                     customerPhone,
                     email,
                     orderAmount,
                     receiptNumber
                   );
                 } else {
                   Swal.fire("Error", "Failed to update payment status.", "error");
                 }
               })
               .catch((error) => {
                 console.error("Error fetching payment success:", error);
                 Swal.fire("Error", "Something went wrong.", "error");
               });
           }
           function generatePDFReceipt(
             orderId,
             customerName,
             customerPhone,
             email,
             orderAmount,
             receiptNumber
           ) {
             const { jsPDF } = window.jspdf;
             const doc = new jsPDF();


             let baseAmt = parseFloat(orderAmount) / 1.18; // Base amount before GST
             baseAmt = baseAmt.toFixed(2);

             // Calculate GST (18% of Base Amount)
             let gstAmount = (baseAmt * 0.18).toFixed(2);

             // Calculate Total Amount (Base Amount + GST)
             let totalAmount = (parseFloat(baseAmt) + parseFloat(gstAmount)).toFixed(2);

             // Title
             doc.setFont("helvetica", "bold");
             doc.setFontSize(20);
             doc.text("INVOICE", 90, 20);

             // Company Details
             doc.setFontSize(12);
             doc.setFont("helvetica", "normal");
             doc.text("Cluematrix Technologies Private Limited", 20, 30);
             doc.text(" Plot No. 25, Vaishnavi Nagar", 20, 40);
             doc.text(" Vikasanand Mission Co, opp Society, ", 20, 47);
             doc.text(" Kharbi, Nagpur, Maharashtra 440034", 20, 54);
             doc.text("Phone: +91 9422926439", 20, 64);
             doc.text("Email: socialskillpilots@skillpilot.com", 20, 74);
             doc.text("GST No: 27AAGCC4957M1Z3", 20, 84);

             // Order Details
             doc.text("Receipt No: " + receiptNumber, 120, 30);

             doc.text("Date: " + new Date().toLocaleDateString(), 120, 40);
             doc.text("Payment Status: PAID", 120, 50);

             // Customer Details
             doc.setFont("helvetica", "bold");
             doc.text("Bill To:", 20, 94);
             doc.setFont("helvetica", "normal");
             doc.text("Name: " + customerName, 20, 104);
             doc.text("Phone: " + customerPhone, 20, 114);
             doc.text("Email: " + email, 20, 124);

             // Table Data
             const tableColumn = ["Description", "Amount"];
             const tableRows = [
               ["Base Amount", baseAmt],
               ["GST (18%)", gstAmount],
               ["Total Amount", orderAmount],
             ];

             // AutoTable Plugin (Creates a proper table)
             doc.autoTable({
               startY: 140,
               head: [tableColumn],
               body: tableRows,
               theme: "grid",
               styles: { halign: "center" },
               headStyles: { fillColor: [0, 128, 0] },
               alternateRowStyles: { fillColor: [240, 240, 240] },
             });
             doc.setFont("helvetica", "italic");
             doc.setFontSize(10);
             doc.text("Note: This is a system-generated receipt and does not require a signature.", 20, doc.internal.pageSize.height - 20);
             // Signature
             /*  doc.text("Authorized Signature", 140, 200);
          doc.line(140, 202, 190, 202); // Line for Signature
      */
             // Save the PDF
             doc.save("Invoice_" + orderId + ".pdf");

             // Redirect to student home after download
             window.location.href = "${pageContext.request.contextPath}/stud_home";
           }

 
    </script>
</body>
</html>
