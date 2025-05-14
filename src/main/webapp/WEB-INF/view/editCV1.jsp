<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | CV History</title>

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
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<style>
body {
	background: #f5f7fa;
	font-family: 'Segoe UI', sans-serif;
}

.cv-wrapper {
	max-width: 950px;
	margin: 30px auto;
	background: #fff;
	border-radius: 16px;
	box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	padding: 30px;
}

.cv-header {
	background: linear-gradient(to right, #0d6efd, #3b82f6);
	color: white;
	padding: 40px 30px;
	text-align: center;
}

.cv-header h1 {
	font-size: 2.8rem;
	margin-bottom: 10px;
	text-transform: uppercase;
	color: white;
}

.cv-header p {
	font-size: 1rem;
	margin-bottom: 5px;
}

.cv-header i {
	margin-right: 6px;
}

.section-title {
	font-size: 1.5rem;
	font-weight: 600;
	color: #0d6efd;
	border-left: 6px solid #0d6efd;
	padding-left: 15px;
	margin-bottom: 20px;
}

.cv-body {
	padding: 40px 30px;
}

.cv-body p {
	font-size: 1rem;
	margin-bottom: 12px;
	color: #333;
}

.cv-body strong {
	color: #0d6efd;
}

.badge {
	font-size: 0.9rem;
	padding: 6px 12px;
	margin: 5px 5px 5px 0;
}

.float-end {
	font-size: 0.9rem;
	color: #6c757d;
}

.divider {
	height: 1px;
	background-color: #dee2e6;
	margin: 40px 0;
}

.footer {
	text-align: center;
	font-size: 0.9rem;
	color: #6c757d;
	padding: 20px 0 30px;
	background-color: #f8f9fa;
}

.template-card {
	width: 200px;
	height: 280px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	border-radius: 12px;
	overflow: hidden;
}

.template-card img {
	height: 200px;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	transition: transform 0.3s ease;
}

.template-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.template-card:hover img {
	transform: scale(1.05);
}

.template-button {
	border-top: 1px solid #dee2e6;
	border-radius: 0 0 12px 12px;
	padding-top: 10px;
}

.download-btn {
	background: linear-gradient(45deg, #ff416c, #ff4b2b, #ff6a00);
	background-size: 300% 300%;
	border: none;
	color: #fff;
	font-weight: bold;
	padding: 12px 30px;
	font-size: 18px;
	border-radius: 50px;
	box-shadow: 0 5px 15px rgba(255, 91, 15, 0.4);
	transition: all 0.3s ease-in-out;
	animation: glowing 3s ease-in-out infinite;
}

.download-btn:hover {
	background-position: right center;
	transform: scale(1.05);
	box-shadow: 0 8px 20px rgba(255, 91, 15, 0.6);
}

@
keyframes glowing { 0% {
	background-position: 0% 50%;
}
50
%
{
background-position
:
100%
50%;
}
100
%
{
background-position
:
0%
50%;
}
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
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="mobile-menu-overlay"></div>

	<form action="updateResume" method="post">
		<div class="container-fluid mt-5">
			<div class="row justify-content-center">
				<div class="col-12 col-xl-11">

					<!--  <div class="text-end mb-3">
        <a href="editCV1" class="btn btn-warning">
          <i class="fas fa-edit"></i> Edit CV
        </a>
      </div> -->

					<div class="cv-wrapper">




						<div class="cv-header">
							<h1>${student.student_name.toUpperCase()}</h1>
							<label for="student_name" class="form-label">Full Name</label> <input
								type="text" name="student_name" id="student_name"
								class="form-control" value="${student.student_name}"> <label
								for="contact" class="form-label">Contact Number</label> <input
								type="text" name="contact" id="contact" class="form-control"
								value="${student.contact}">
							<p>
								<i class="fas fa-envelope"></i> Email:
							</p>
							 <input
								type="email" name="email_id" id="email_id" class="form-control"
								value="${student.email_id}">
							<p>
								<i class="fas fa-map-marker-alt"></i> CITY
							</p>
							<input
								type="text" name="curr_city" id="curr_city" class="form-control"
								value="${student.curr_city}">

						</div>

						<div class="cv-body">

							<!-- Career Objective -->
							<div>
								<div class="section-title">Career Objective</div>
								<p>
									Hello! I'm <strong>${student.student_name}</strong>, an
									enthusiastic and motivated individual with a strong interest in
									software development and real-world problem solving.
								</p>
								<p>
									I have hands-on expertise in technologies like <strong>${student.skills}</strong>
									and experience in front-end and back-end development through
									various internships.
								</p>
								<p>I aim to continuously grow as a developer, contribute to
									impactful projects, and stay up to date with emerging trends.</p>
							</div>

							<div class="divider"></div>

							<!-- Education -->
							<div>
								<div class="section-title">Education</div>
								 <c:forEach var="studentPast" items="${student.studentPast}"
									varStatus="status">
									<li class="list-item">
										<div>

											<input type="hidden" class="form-control d-inline-block w-75 mb-2"
												name="studentPast[${status.index}].stud_past_id"
												value="${studentPast.stud_past_id != null ? studentPast.stud_past_id : ''}"
 />
										</div>

										<div>
										<strong><label for="category">Qualification:</label></strong>
											 <input
												type="text" name="studentPast[${status.index}].category"
												class="form-control d-inline-block w-75 mb-2"
												value="${studentPast.category}" />
										</div>

										<div>
										<strong><label for="organization">Organization Name:</label> </strong>
											<input
												type="text"
												name="studentPast[${status.index}].organization"
												class="form-control d-inline-block w-75 mb-2"
												value="${studentPast.organization}" />
										</div>

										<div>
										<strong><label for="board">Board/University</label></strong>
											 <input
												type="text" name="studentPast[${status.index}].board"
												class="form-control d-inline-block w-75 mb-2"
												value="${studentPast.board}" />
										</div>

										<div>
										<strong><label for="description">Description</label></strong>
										 <input
												type="text" name="studentPast[${status.index}].description"
												class="form-control d-inline-block w-75 mb-2"
												value="${studentPast.description}" />
										</div>
									</li>
								</c:forEach> 
								
										<c:forEach var="studentPasts" items="${studentPast}">
										<li class="list-item">
											<h4 class="list-item__title">
												Qualification :
												<c:out value="${studentPasts.category}" />
											</h4> <span class="list-item__date">Organization Name : <c:out
													value="${studentPasts.organization}" />
										</span>
											<p class="list-item__text">
												Board/University :
												<c:out value="${studentPasts.board}" />
											</p>
											<p class="list-item__text">
												Percentage :
												<c:out value="${studentPasts.description}" />
												%
											</p>
										</li>
									</c:forEach>
							</div>

							<div class="divider"></div>

							<!-- Projects -->
							<div>
								<div class="section-title">Projects</div>
								<c:forEach var="proj" items="${projects}">
									<p>
										<strong>${proj.projectTitle}</strong><br>
										${proj.projectDescription}
									</p>
								</c:forEach>
							</div>

							<div class="divider"></div>

							<!-- Technical Strengths -->
							<div>
								<div class="section-title">Technical Strengths</div>
								<p>
									<c:forEach var="skill" items="${student.skills.split(',')}">
										<li><input type="text" name="skills"
											class="form-control d-inline-block w-75 mb-2"
											value="${skill.trim()}" /></li>
									</c:forEach>
								</p>
							</div>

							<div class="divider"></div>

							<!-- Work Experience -->
							<div>
								<div class="section-title">Work Experience</div>
								<c:forEach var="internship" items="${internship3}">
									<div class="internship">
										<input type="hidden" name="internship_id"
											value="${internship.internship_id}" />

										<div>
											<strong><label for="companyName">Company Name :</label></strong> <input
												type="text" name="companyName" class="form-control d-inline-block w-75 mb-2"
												value="${internship.companyName}" />
										</div>

										<div>
											<strong><label for="technology">Technology :</label> </strong><input type="text"
												name="technology" class="form-control d-inline-block w-75 mb-2" value="${internship.technology}" />
										</div>

										<div>
											<strong><label for="duration">Duration (Weeks) :</label> </strong><input
												type="number" class="form-control d-inline-block w-75 mb-2" name="duration" value="${internship.duration}" />
										</div>


										<div>
										<strong><label for="dateStarted">Start Date :</label></strong>
											 <input
												type="date"
												name="internships[${internship.internship_id}].date_started" class="form-control d-inline-block w-75 mb-2"
												value="${internship.date_started}" />
										</div>

										<div>
										<strong><label for="dateCompleted">End Date :</label> </strong>
											<input
												type="date"
												class="form-control d-inline-block w-75 mb-2"
												name="internships[${internship.internship_id}].date_completed"
												value="${internship.date_completed}" />
										</div>

										<hr />
									</div>
								</c:forEach>
							</div>
						</div>


					</div>
				</div>
			</div>

			<div class="text-center my-4">
				<button type="submit" class="btn btn-success px-4 py-2">
					<i class="fas fa-save"></i> Save
				</button>
			</div>

		</div>
	</form>



	<div
		class="text-center my-5 d-flex justify-content-center flex-wrap gap-4">

		<div class="template-card bg-white shadow-sm mx-2 mb-4">
			<a href="cv1"> <img src="images/cv1.png" alt="Template 1"
				class="w-100">
			</a>
			<div class="template-button">
				<a href="cv1" class="btn btn-outline-primary btn-sm mt-2"> View
					Template 1 </a>
			</div>
		</div>

		<div class="template-card bg-white shadow-sm mx-2 mb-4">
			<a href="cv2"> <img src="images/cv2.png" alt="Template 2"
				class="w-100">
			</a>
			<div class="template-button">
				<a href="cv2" class="btn btn-outline-success btn-sm mt-2"> View
					Template 2 </a>
			</div>
		</div>

		<div class="template-card bg-white shadow-sm mx-2 mb-4">
			<a href="cv3"> <img src="images/cv3.png" alt="Template 3"
				class="w-100">
			</a>
			<div class="template-button">
				<a href="cv3" class="btn btn-outline-danger btn-sm mt-2"> View
					Template 3 </a>
			</div>
		</div>

	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/onlineTestScript.js"></script>
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


	<!-- Optional: Add html2canvas and jsPDF script if you're using downloadCV3 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
	<script>
    async function downloadCV1(format) {
        if (format === 'pdf') {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            const element = document.querySelector('.cv-wrapper');
            const canvas = await html2canvas(element, { scale: 2 });
            const imgData = canvas.toDataURL('image/png');
            const imgProps = doc.getImageProperties(imgData);
            const pdfWidth = doc.internal.pageSize.getWidth();
            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
            doc.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
            doc.save('CV1.pdf');
        }
    }
</script>

</body>
</html>
