x`x<%@include file="user_session.jsp" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
			<!DOCTYPE html>
			<html>

			<head>
				<!-- Basic Page Info -->
				<meta charset="utf-8">
				<title>SkillPilots | Industry List</title>

				<!-- Site favicon -->
				<link rel="apple-touch-icon" sizes="180x180"
					href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
				<link rel="icon" type="image/png" sizes="16x16"
					href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

				<!-- Mobile Specific Metas -->
				<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

				<!-- Google Font -->
				<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
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

					.table td {
						padding: 0.4rem !important;
					}

					.login-box .login-title {
						padding: 0 0 10px;
						margin-bottom: 2px;
					}

					.table-bordered {
						border: 0.5px solid #e9efee5c !important;
					}

					.table-bordered td,
					.table-bordered th {
						border: 0.5px solid #e9efee5c !important;
					}

					#companyDetailsModal {
						display: none;
						/* Hidden by default */
						position: fixed;
						z-index: 1;
						left: 0;
						top: 0;
						width: 100%;
						height: 100%;
						overflow: auto;
						background-color: rgba(0, 0, 0, 0.4);
						/* Black with opacity */
					}

					.modal-content {
						background-color: #fefefe;
						margin: 15% auto;
						padding: 20px;
						border: 1px solid #888;
						width: 80%;
					}

					.close-button {
						color: #aaa;
						float: right;
						font-size: 28px;
						font-weight: bold;
					}

					.close-button:hover,
					.close-button:focus {
						color: black;
						text-decoration: none;
						cursor: pointer;
					}

					/* Overlay for the Modal */
/* Overlay for the Modal */
.modal-overlay {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 1000;
  animation: fadeIn 0.3s ease-in-out;
}

/* Modal Container (Smaller Size) */
.modal-container {
  position: absolute;
  top: 20%;
  left: 50%;
  transform: translateX(-50%);
  background-color: white;
  padding: 15px;
  border-radius: 8px;
  width: 50%; /* Increased width to accommodate more fields */
  max-height: 80%;
  overflow-y: auto;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  animation: slideUp 0.3s ease-out;
}

/* Close Button */
.close-btn {
  font-size: 24px;
  color: #333;
  cursor: pointer;
  position: absolute;
  top: 5px;
  right: 5px;
  transition: color 0.3s;
}

.close-btn:hover {
  color: #ff0000;
}

/* Header Section */
.modal-header {
  text-align: center;
  border-bottom: 1px solid #ddd;
  padding-bottom: 10px;
}

/* Modal Title */
.modal-title {
  font-size: 1.3rem;
  color: #333;
  font-weight: bold;
  margin: 0;
}

/* Modal Body */
.modal-body {
  padding-top: 10px;
  color: #555;
  font-size: 0.9rem;
}

.modal-body p {
  margin-bottom: 10px;
}

.modal-body strong {
  color: #333;
}

/* Animations */
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes slideUp {
  from {
    transform: translateY(20px);
  }
  to {
    transform: translateY(0);
  }
}

				</style>
			</head>

			<body>
				<div class="pre-loader">
					<div class="pre-loader-box">
						<div class="loader-logo">
							<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
								alt="" />

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
									src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
									alt=" " class="dark-logo">
								<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg"
									alt=" " class="light-logo">
							</a>
							<div class="close-sidebar" data-toggle="left-sidebar-close">
								<i class="ion-close-round"></i>
							</div>
						</div>
						<%@include file="sidebar.jsp"%>
					</div>
					<div class="mobile-menu-overlay"></div>




					<!-- modal  -->

					<!-- Modal Structure -->
				<!-- Modal Structure -->
<div id="companyModal" style="display: none;" class="modal-overlay">
  <div class="modal-container">
    <span onclick="document.getElementById('companyModal').style.display='none'" class="close-btn">&times;</span>
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="companyModalLabel">Company Details</h5>
      </div>
      <div class="modal-body">
        <p><strong>Company Name:</strong> <span id="company_name"></span></p>
        <p><strong>City:</strong> <span id="city"></span></p>
        <p><strong>Established Date:</strong> <span id="estd_date"></span></p>
        <p><strong>Contact:</strong> <span id="contact_1"></span></p>
        <p><strong>Website:</strong> <span id="web_url"></span></p>
        <p><strong>Email:</strong> <span id="email_id"></span></p>
        <p><strong>Registration Number:</strong> <span id="registration_no"></span></p>
        <p><strong>Address Line 1:</strong> <span id="line_1"></span></p>
        <p><strong>Address Line 2:</strong> <span id="line_2"></span></p>
        <p><strong>State:</strong> <span id="state"></span></p>
        <p><strong>Country:</strong> <span id="country"></span></p>
        <p><strong>Pincode:</strong> <span id="pincode"></span></p>
      </div>
    </div>
  </div>
</div>





					<div class="main-container">
						<div class="xs-pd-20-10 pd-ltr-20">

							<div class="title pb-20">
								<h2 class="h3 mb-0 text-center"
									style="background: #0f2c7eeb;color: white;border-radius: 4px;">Industries</h2>
							</div>
							<div class="card-box mb-30">
								<div class="card-body">
									<input type="hidden" value="${user.id}" id="student_id">
									<table class="data-table table table-bordered hover">
										<thead class="thead-light">
											<tr>
												<th>Industry Name</th>
												<th>Location</th>
												<th class="text-center">Action</th>
											</tr>
										</thead>
										<tbody>
										
											<c:forEach var="comp" items="${companies}">
												<tr>
													<td style="color: #1b00ff" title="Click Here To View Company Details">
														<span class="compLink" 
															onclick="showCompanyDetails('${comp.key.city}', '${comp.key.company_name}',
															
															
															'${comp.key.estd_date}','${comp.key.contact_1}','${comp.key.web_url}','${comp.key.email_id}','${comp.key.registration_no}',
															'${comp.key.line_1}','${comp.key.line_2}','${comp.key.state}','${comp.key.country}','${comp.key.pincode}');">
															${comp.key.company_name}
														</span>
													</td>
													<td>${comp.key.city}</td>
													
													<c:set var="appliedByUser" value="false" />
													<c:set var="appliedByInstitute" value="false" />
													<c:forEach var="appliedCompany" items="${appliedCompanies}">
														<c:if test="${appliedCompany.key == comp.key.company_id}">
															<c:choose>
																<c:when test="${appliedCompany.value == 's'}">
																	<c:set var="appliedByUser" value="true" />
																</c:when>
																<c:when test="${appliedCompany.value == 'c'}">
																	<c:set var="appliedByInstitute" value="true" />
																</c:when>
															</c:choose>
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${appliedByUser}">
															<td><span class="action-label">Applied by you</span></td>
														</c:when>
														<c:when test="${appliedByInstitute}">
															<td><span class="action-label">Applied by Institute</span>
															</td>
														</c:when>
														<c:otherwise>
															<td class="text-center" style="width: 15%">
																<span type="" class=""
																	style="padding: 0px 10px 3px 10px;"></span>
															</td>
														</c:otherwise>
													</c:choose>
												</tr>
												<div class="modal fade show" id="details_modal" tabindex="-1"
													role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
													<div class="modal-dialog modal-dialog-centered">
														<div class="modal-content">
															<div class="panel-heading"
																style="font-size: 18px; background: #0f2c7eeb; color: whitesmoke; text-align: center;">
																<button type="button" class="close"
																	data-dismiss="modal">&times;</button>
																<span class="modal-title" id="det_title"></span>
															</div>
															<div class="modal-body comp_col_info_modal_body">
																<div id="div_logo" style="text-align: center">
																	<img id="item_logo" alt=" src="
																		style="max-height: 120px;">
																</div><br>
																<div class="row">
																	<div class="col-md-3" id="about_us_para">
																		<strong><span>About Us : </span><br></strong>
																	</div>
																	<div class="col-md-9">
																		<strong><span id="det_about_us"
																				style="font: status-bar; line-height: 1.5rem; font-size: 14px;"></span></strong>
																	</div>
																</div><br>
																<div class="row">
																	<div class="col-md-3">
																		<strong>Estd. Date : </strong>
																	</div>
																	<div class="col-md-9">
																		<strong><span id="det_est"></span></strong>
																	</div>
																</div><br>
																<div class="row" id="coll_details_dept"
																	style="display: none">
																	<div class="col-md-3">
																		<strong>Departments : </strong>
																	</div>
																	<div class="col-md-9">
																		<strong><span
																				id="deptDetailsBody"></span></strong>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-3">
																		<strong>Website : </strong>
																	</div>
																	<div class="col-md-9">
																		<strong><a id="det_weburl_link"
																				target="new"><span
																					id="det_weburl"></span></a></strong>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="modal fade" id="apply_to_comp_modal" tabindex="-1"
													role="dialog" aria-labelledby="myLargeModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered">
														<div class="modal-content">
															<div class="login-box bg-white box-shadow border-radius-10">
																<div class="login-title">
																	<h2 class="text-center text-primary">Apply To
																		Industry</h2>
																</div>

																<form action="viewCompAndApply1" method="post">
																	<input type="hidden" id="company_id"
																		name="company_id">
																	<input type="hidden" id="student_id"
																		value="${user.id}" name="student_id">
																	<div class="input-group custom">
																		<textarea class="form-control form-control-lg"
																			name="request_msg"
																			placeholder="Enter Description Here"
																			style="height: 50%"
																			required="required"></textarea>
																	</div>
																	<div class="form-group">
																		<select class="form-control"
																			name="technology_name"
																			style="width: 100%; height: 38px;"
																			required="required">
																			<option selected value=""
																				disabled="disabled">--
																				Select Skill --</option>
																			<c:forEach items="${techList}" var="tech">
																				<option value="${tech.technology_name}">
																					${tech.technology_name}</option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="input-group custom">
																		<input type="number"
																			class="form-control form-control-lg" min="0"
																			placeholder="Enter Duration (in Week)"
																			required="required" name="duration">
																	</div>
																	<div class="mb-0 text-center">
																		<input class="btn btn-success btn-sm"
																			type="submit" value="Submit">
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

							<%@include file="modal_common.jsp" %>
								<%@include file="footer.jsp" %>
						</div>
					</div>
					<!-- js -->
					<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
					<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
					<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
					<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
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
					<script
						src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
					<script
						src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
					<script
						src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
					<script
						src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js"></script>
					<script
						src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/advanced-components.js"></script>
					<script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
					<script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
					<script type="text/javascript">
						function applyToComp(companyid) {

							var student_id = $("#student_id").val();
							$.ajax({
								type: "GET",
								url: "is_any_ongoing_internship?student_id=" + student_id,
								data: { studentId: student_id },
								success: function (response) {
									if (response) {
										alert("Sorry! You have already ongoing internship.");
									} else {
										$("#company_id").val(companyid);
										$("#apply_to_comp_modal").modal("show");
									}
								},
								error: function () {
									$("#company_id").val(companyid);
									$("#apply_to_comp_modal").modal("show");
								}
							});
						}
						function updateButtonToApplied(buttonElement) {
							$(buttonElement)
								.removeClass("btn-success")
								.addClass("btn-secondary disabled")
								.attr("disabled", true)
								.text("Applied");
						}
						$("#modelSubmitButton").on("click", function () {
							// Assuming your model submission is successful
							// and you want to update the button status
							var buttonElement = $(this).closest("td").find(".btn");
							updateButtonToApplied(buttonElement);
						});
					</script>



<script>
	function showCompanyDetails(city,
    company_name,
    estd_date,
    contact_1,
    web_url,
    email_id,
    registration_no,
    line_1,
    line_2,
    state,
    country,
    pincode) {
		// Set city data in the modal
		document.getElementById('company_name').innerText = company_name;
		document.getElementById('city').innerText = city;
		document.getElementById('estd_date').innerText = estd_date;
		document.getElementById('contact_1').innerText = contact_1;
		document.getElementById('web_url').innerText = web_url;
		document.getElementById('email_id').innerText = email_id;
		document.getElementById('registration_no').innerText = registration_no;
		document.getElementById('line_1').innerText = line_1;
		document.getElementById('line_2').innerText = line_2;
		document.getElementById('state').innerText = state;
		document.getElementById('country').innerText = country;
		document.getElementById('pincode').innerText = pincode;

		// Display the modal
		const modal = document.getElementById('companyModal');
		modal.style.display = 'block';
	}

	// Close the modal when clicking outside
	window.onclick = function(event) {
		const modal = document.getElementById('companyModal');
		if (event.target === modal) {
			modal.style.display = 'none';
		}
	};
</script>

			</body>

			</html>