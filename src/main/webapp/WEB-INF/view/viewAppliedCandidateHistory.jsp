<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="user_session.jsp"%>
<!DOCTYPE html>
<html>

<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
<!-- Site favicon -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
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
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
			<div class="title pb-20">
				<h5 class="h4 mb-0"
					style="background: #0f2c7eeb; color: white; border-radius: 4px; text-align: center; padding: 4px 16px 4px 16px;">
					Campus Drive</h5>
			</div>
			<div class="pd-20 card-box">
				<div class="tab">

					<ul class="nav nav-tabs customtab" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#pendingTab" role="tab"
							aria-selected="true">Round 1 Students</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#ongoingTab" role="tab" aria-selected="false"> Round 2
								Students</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#completedTab" role="tab" aria-selected="false"> Round
								3 Students</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#canceledTab" role="tab" aria-selected="false"> Round 4
								Students</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#selectedTab" role="tab" aria-selected="false">
								Selected Students</a></li>
					</ul>
					<div class="tab-content">

						<div class="tab-pane fade show active" id="pendingTab"
							role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty stdListAppliedR1}">
									<table class="data-table table hover multiple-select-row">
										<tr>

											<th>Student Name</th>
											<th>Email</th>

											<th>Select For Round 2</th>
										</tr>
										<tbody id="tablist">

											<c:forEach items="${stdListAppliedR1}" var="round1">
												<tr>
													<td hidden><span>${round1.id}</span></td>
													<td><span>${round1.username}</span></td>
													<td><span>${round1.email}</span></td>
													<td hidden><span>${round1.status}</span></td>

													<td><input type="checkbox" name="selectStudent"
														value="${round1.id}" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty stdListAppliedR1}">
									<label>No Students Found</label>
								</c:if>
							</div>
							<c:if test="${not empty stdListAppliedR1}">


								<!-- <button class="btn btn-outline-primary" onclick="sendSelectedStudents()">>> Next Round</button> -->
								<button class="btn btn-outline-primary"
									onclick="initiateProcess()">Select Students and Set
									Date/Time
									</button>
							</c:if>
							<c:if test="${not empty stdListAppliedR1}">
								<button class="btn btn-success" onclick="downloadExcelPage()">Download CSV</button>
							</c:if>
						</div>
						<div class="tab-pane fade" id="ongoingTab" role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty stdListAppliedR2}">
									<table class="data-table table hover multiple-select-row">
										<tr>
											<th>Student Name</th>
											<th>Email</th>
											<th>Company Name</th>
											<th>Select For Round 2</th>

										</tr>
										<tbody id="tablist">
											<c:forEach items="${stdListAppliedR2}" var="round2">
												<tr>
													<td hidden><span>${round2.id}</span></td>
													<td><span>${round2.username}</span></td>
													<td><span>${round2.email}</span></td>
													<td><span> <c:choose>
																<c:when test="${not empty round2.companyName}">
																						${round2.companyName}
																					</c:when>
																<c:otherwise>
																						N/A
																					</c:otherwise>
															</c:choose>
													</span></td>

													<td><input type="checkbox" name="selectStudent"
														value="${round2.id}" /></span></td>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty stdListAppliedR2}">
									<label>No Students Found</label>
								</c:if>
							</div>
							<c:if test="${not empty stdListAppliedR2}">
								<button class="btn btn-outline-primary"
									onclick="initiateProcess2()">Select Students and Set
									Date/Time</button>
								<button class="btn btn-outline-success"
									onclick="initiateProcess4()">Completed</button>
							</c:if>
							<c:if test="${not empty stdListAppliedR2}">
								<button class="btn btn-success" onclick="downloadExcelPage()">Download
									CSV</button>

							</c:if>
						</div>
						<div class="tab-pane fade" id="completedTab" role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty stdListAppliedR3}">
									<table class="data-table table hover multiple-select-row">
										<tr>
											<th>Student Name</th>
											<th>Email</th>
											<th>Company Name</th>
											<th>Select For Round 2</th>

										</tr>
										<tbody id="tablist">
											<c:forEach items="${stdListAppliedR3}" var="round3">
												<tr>
													<td hidden><span>${round3.id}</span></td>
													<td><span>${round3.username}</span></td>
													<td><span>${round3.email}</span></td>
													<td><span> <c:choose>
																<c:when test="${not empty round3.companyName}">
																						${round3.companyName}
																					</c:when>
																<c:otherwise>
																						N/A
																					</c:otherwise>
															</c:choose>
													</span></td>

													<td><input type="checkbox" name="selectStudent"
														value="${round3.id}" /></span></td>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty stdListAppliedR3}">
									<label>No Students Found</label>
								</c:if>
							</div>
							<c:if test="${not empty stdListAppliedR3}">
								<button class="btn btn-outline-primary"
									onclick="initiateProcess3()">Select Students and Set
									Date/Time</button>
								<button class="btn btn-outline-success"
									onclick="initiateProcess4()">Completed</button>
							</c:if>
							<c:if test="${not empty stdListAppliedR3}">
								<button class="btn btn-success" onclick="downloadExcelPage()">Download
									CSV</button>

							</c:if>
	
						</div>



						<div class="tab-pane fade" id="canceledTab" role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty stdListAppliedR4}">
									<table class="data-table table hover multiple-select-row">
										<tr>
											<th>Student Name</th>
											<th>Email</th>
											<th>Company Name</th>
											<!-- <th>Select For Round 2</th> -->

										</tr>
										<tbody id="tablist">
											<c:forEach items="${stdListAppliedR4}" var="round4">
												<tr>
													<td hidden><span>${round4.id}</span></td>
													<td><span>${round4.username}</span></td>
													<td><span>${round4.email}</span></td>
													<td><span> <c:choose>
																<c:when test="${not empty round4.companyName}">
																						${round4.companyName}
																					</c:when>
																<c:otherwise>
																						N/A
																					</c:otherwise>
															</c:choose>
													</span></td>

													<td><input type="checkbox" name="selectStudent"
														value="${round4.id}" /></span></td>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty stdListAppliedR4}">
									<label>No Students Found</label>

								</c:if>
								<c:if test="${not empty stdListAppliedR4}">
									<button class="btn btn-outline-success"
										onclick="initiateProcess4()">Selected Students</button>

								</c:if>
								<c:if test="${not empty stdListAppliedR4}">
									<button class="btn btn-success" onclick="downloadExcelPage()">Download CSV</button>

								</c:if>
							</div>

						</div>
						<div class="tab-pane fade" id="selectedTab" role="tabpanel">
							<div class="pd-20">
								<c:if test="${not empty stdListSelected}">
									<table class="data-table table hover multiple-select-row">
										<tr>
											<th>Student Name</th>
											<th>Email</th>
											<th>Company Name</th>
											<!-- <th>Select For Round 2</th> -->

										</tr>
										<tbody id="tablist">
											<c:forEach items="${stdListSelected}" var="selected">
												<tr>
													<td hidden><span>${selected.id}</span></td>
													<td><span>${selected.username}</span></td>
													<td><span>${selected.email}</span></td>
													<td><span> <c:choose>
																<c:when test="${not empty selected.companyName}">
																						${selected.companyName}
																					</c:when>
																<c:otherwise>
																						N/A
												                </c:otherwise>
															</c:choose>
													</span></td>



												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty stdListSelected}">
									<label>No Students Found</label>

								</c:if>
								
								<c:if test="${not empty stdListSelected}">
									<button class="btn btn-success" onclick="downloadExcelPage()">Download CSV</button>
								</c:if>
							</div>

						</div>
					</div>
				</div>
				<!-- modal -->
				<div id="dateTimeModal"
					style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); align-items: center; justify-content: center;
					z-index: 1050;">
					<div class="form-group"
						style="background-color: white; padding: 20px; border-radius: 5px; width: 500px;">
						<center>
							<h3>Set Round Date and Time</h3>
						</center>
						<br>

						<center>
							<span style="color: cornflowerblue;">SELECTING STUDENTS
								FOR :</span>&nbsp;&nbsp;<span style="color: forestgreen;"
								id="modalStatus"></span>
						</center>

						<center>
							<h4 id="modaljdate"></h4>
						</center>
						<label for="roundDate">Date:</label> <input type="date"
							id="roundDateInput" class="form-control" required><br>

						<label for="roundTime">Time:</label> <input type="time"
							id="roundTimeInput" class="form-control" required><br>
						<c:forEach items="${RecruiterListSelected}" var="recruiter">
											console.log(${recruiter});
										</c:forEach>
						<label for="Select Interviewer">Select Interviewer:</label> <select
							class="form-control" name="interviewer" id="interviewer" multiple>

							<c:forEach var="interviewer" items="${selcRecrList}">
								<option value="${interviewer.manager_id}">${interviewer.manager_name}</option>
							</c:forEach>
						</select> <br> <label>Enter Meet Link:</label> <input type="text"
							id="meet" class="form-control" required><br>
						<br>
						<button class="btn btn-outline-success" onclick="submitDateTime()">Submit</button>
						<button class="btn btn-outline-danger" onclick="closeModal()">Cancel</button>
					</div>
				</div>
			</div>
			<br>
			<%@include file="modalFeedback.jsp"%>
			<!--End 2st model-->
			<%@include file="modalStudentDetails.jsp"%>
			<%-- <div class="footer-wrap1 pd-20 mb-20 card-box"
				style="bottom: 0%; width: 100%; margin-top:20px">
				<center><i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
				<script>
												document.write(new Date().getFullYear())
											</script>
				All Rights Reserved SkillPilots | Designed & Developed By <a
					href="https://www.cluematrix.com/" target="_blank"
					style="color: #2800b4;">Cluematrix</a> Technologies Pvt.Ltd.
		<center>	</div> --%>
		
		
		
		<div class="footer-wrap pd-20 mb-20 card-box"
			style="position: relative; bottom: 0%; width: 100%">
			<i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
			<script>
          document.write(new Date().getFullYear());
        </script>
			All Rights Reserved SkillPilots&reg; | Designed & Developed By
<a href="https://www.cluematrix.com/" target="_blank" style="color: #2800B4;">
    Cluematrix
</a> Technologies Pvt. Ltd. | Contact: <b>+91-9422926439</b>
		</div>
		
		
		</div>
		
	</div>

	<script>
							// Function to open the modal
							function openModal(status,jdate) {
								document.getElementById('dateTimeModal').style.display = 'flex';
								document.getElementById('modalStatus').innerText = status;
							
								document.getElementById('modaljdate').innerText = jdate ? jdate : ' ';

							}

							// Function to close the modal
							function closeModal() {
								document.getElementById('dateTimeModal').style.display = 'none';
							}

							// Function to handle the form submission in the modal
							function submitDateTime() {
								const roundDate = document.getElementById('roundDateInput').value;
								const roundTime = document.getElementById('roundTimeInput').value;
								const interviewerSelect = document.getElementById('interviewer');
								
								const selectedInterviewers = Array.from(document.getElementById('interviewer').selectedOptions)
								.map(option => option.value.trim());
								const meet = document.getElementById('meet').value;
								const roundStatus = document.getElementById('modalStatus').textContent;
								const urlParams = new URLSearchParams(window.location.search);
								const driveId = urlParams.get('drive_id');

								if (!roundDate || !roundTime ||!driveId ||!meet ||!selectedInterviewers) {


									Swal.fire({
										icon: 'warning', // Warning icon
										title: 'Missing Information',
										text: 'Please enter  Missing Information .',
										confirmButtonText: 'OK' // Button text
									});
									return;
								}

								// Close the modal and proceed to send selected students
								closeModal();
								sendSelectedStudents(roundDate, roundTime, roundStatus,driveId,meet,selectedInterviewers);
							}

							// Function to send the selected students with date and time
							function sendSelectedStudents(roundDate, roundTime, roundStatus, driveId, meet, selectedInterviewers) {
	// Collect selected student IDs as an array of numbers
	const selectedIds = Array.from(document.querySelectorAll('input[name="selectStudent"]:checked'))
		.map(checkbox => parseInt(checkbox.value));  // Convert each ID to a number

	// Check if any students are selected
	if (selectedIds.length === 0) {
		// Use SweetAlert to show an alert if no students are selected
		Swal.fire({
			icon: 'warning',          // Warning icon
			title: 'No Students Selected',
			text: 'Please select at least one student.',
			confirmButtonText: 'OK'   // Button text
		});
		return;
	}

	const interviewers = selectedInterviewers.map(interviewer => parseInt(interviewer.trim()));  // .trim() to be sure

	// Construct the URL with query parameters
	const url = new URL('http://43.204.35.211:8000/newskill/update-company-drive');
	url.searchParams.append('studentIds', selectedIds.join(','));  // Join IDs with commas
	url.searchParams.append('driveId', driveId);
	url.searchParams.append('round', roundStatus);
	url.searchParams.append('roundTime', roundTime);
	url.searchParams.append('roundDate', roundDate);
	url.searchParams.append('meetLink', meet);
	url.searchParams.append('id', interviewers.join(','));  // Join IDs with commas

	// Make a PUT request using fetch
	fetch(url, {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json'
		}
	})
		.then(response => {
			if (response.ok) {
				return response.json();
			} else {
				throw new Error('Failed to update round');
			}
		})
		.then(data => {
			Swal.fire({
				icon: 'success',
				title: 'Success',
				text: 'Round updated successfully!',
			});
			location.reload();
			console.log('Response:', data); // For debugging

			// Close the modal after successful submission
			// closeModal(location.reload());
		})
		.catch(error => {
			console.error('Error:', error);
			alert('An error occurred while updating the round.');
		});
}


							// Initial function to open the modal for date and time input
							function initiateProcess() {
								let status = "2ND ROUND";
								openModal(status);
							}
							function initiateProcess2() {
								let status = "3RD ROUND";
								openModal(status);
							}
							function initiateProcess3() {
								let status = "4TH ROUND";
								openModal(status);
							}
							function initiateProcess4() {
								let status = "SELECTED";
								let jdate = "JOINING DATE"
								openModal(status , jdate);

							}
							
							//Ajay Javascript function for Download Excel sheet 19/02/2025
							
							 function downloadExcelPage()
							 {

							        var activeTab = document.querySelector(".tab-pane.fade.show.active");
							        if (!activeTab)
							        {
							            alert("No active tab found!");
							            return;
							        }

							        // Find the table inside the active tab
							        var table = activeTab.querySelector("table");
							        if (!table) 
							        {
							            alert("No data found to export!");
							            return;
							        }

							        // Get the tab ID or a custom name for the file
							        var tabId = activeTab.id; 

							        // Map tab IDs to proper names
							        var fileNames = 
							        {
							            "pendingTab": "Round1",
							            "ongoingTab": "Round2",
							            "completedTab": "Round3",
							            "canceledTab": "Round4",
							            "selectedTab": "Selected_Students"
							        };

							        // Use mapped name, or fallback to "Data"
							        var fileName = fileNames[tabId] ? fileNames[tabId] + ".xlsx" : "Data.xlsx";

							        // Convert table to a worksheet
							        var ws = XLSX.utils.table_to_sheet(table);

							        // Create a new workbook and add the worksheet
							        var wb = XLSX.utils.book_new();
							        XLSX.utils.book_append_sheet(wb, ws, "Student Data");

							        // Save the Excel file with the correct name
							        XLSX.writeFile(wb, fileName);
							    }
						</script>




	<!-- js -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/company_feedback.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/students_feedback_script.js"></script>
	<script
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
</body>

</html>