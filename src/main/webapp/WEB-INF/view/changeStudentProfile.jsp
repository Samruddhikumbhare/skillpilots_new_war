<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="user_session.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>SkillPilot | Edit Profile</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap 4 JS (with jQuery and Popper.js) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js" type="text/javascript"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" type="text/javascript"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
	crossorigin="anonymous" type="text/javascript"></script>
<!-- Font Awesome (for icons) -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet">


<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico" />

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Bootstrap & Font Awesome -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<!-- Bootstrap Bundle with Popper (required for tabs to work) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap"
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
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" type="text/javascript"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1" type="text/javascript"></script>
<script type="text/javascript">
      window.dataLayer = window.dataLayer || [];
      function gtag() {
        dataLayer.push(arguments);
      }
      gtag("js", new Date());

      gtag("config", "UA-119386393-1");
    </script>
<style type="text/css">

/* SCROLL ENABLED WHEN NO CERTIFICATIONS EXIST */
#certificationListContainer {
	max-height: 400px;
	overflow-y: auto;
	padding-right: 10px;
}

.profile-avatar {
	width: 200px;
	height: 200px;
	object-fit: cover;
	border-radius: 50%;
	border: 5px solid #0d6efd;
}

.nav-tabs .nav-link.active {
	background-color: #007bff;
	color: #fff !important;
	border-radius: 5px;
	font-weight: bold;
}

.profile-avatar:hover {
	transform: scale(1.05);
	transition: all 0.3s ease;
}

.tab-pane {
	padding-top: 20px;
}

.form-control-lg {
	font-size: 1rem;
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
	font-family: "Inter", sans-serif;
	border-radius: 1px;
}

.modal-header {
	padding: 5px 2px 7px 18px;
}

.custom-file-input, .custom-file-label, .custom-select, .form-control {
	font-family: "Inter", sans-serif;
	color: #131e22;
	font-weight: 400;
	height: 40px;
	border-color: #d4d4d4;
	letter-spacing: 0.035em;
	-webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.profile-img-hover:hover {
	transform: scale(1.05);
	transition: 0.3s ease-in-out;
}

.profile-img-container {
	position: relative;
	display: inline-block;
	cursor: pointer;
}

.profile-img-container .overlay {
	position: absolute;
	top: 0;
	left: 100px;
    width: 48%;
    height: 100%;
	background: rgba(0, 123, 255, 0.6);
	color: #fff;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0;
	border-radius: 50%;
	transition: opacity 0.2s ease-in-out;
}

.profile-img-container:hover .overlay {
	opacity: 1;
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
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
				alt="" class="dark-logo" /> <img
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg"
				alt="" class="light-logo" />
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="container-fluid mt-4">
			<div class="text-center mb-4">
				<h3 class="header-dark sidebar-dark">Edit Your Profile
					Information</h3>
			</div>

			<div class="row g-4">
				<!-- 🌟 Profile Card Left Side -->
				<div class="col-md-4">
					<div class="card shadow-lg border-0" style="border-radius: 20px;">
						<div class="card-body text-center py-5">

							<div class="profile-img-container mb-3" data-toggle="modal"
								data-target="#profilePicModal11">
								<img src="<c:url value='/get_logo'/>" alt="Student Photo"
									class="rounded-circle shadow-lg"
									style="width: 180px; height: 180px; object-fit: cover; border: 6px solid #007BFF;">
								<div class="overlay">Change Photo</div>
							</div>

							<!-- Greeting & Name -->
							<h5 class="text-muted mb-1" id="greetingMsg">Welcome</h5>
							<h3 class="fw-bold text-dark">${student.student_name}</h3>

							<!-- Sub-greeting -->
							<p class="text-muted">
								<i class="fa fa-hand-paper-o me-2 text-warning"
									aria-hidden="true"></i> Hello <strong>${student.student_name}</strong>,
								keep pushing forward your future is built by what you do today!
							</p>

							<!-- Info -->
							<ul class="list-group list-group-flush text-start mt-4 px-4 fs-6">
  <li class="list-group-item border-0 px-0">
    <i class="fa fa-envelope me-2 text-primary"></i> ${student.email_id}
  </li>
  <li class="list-group-item border-0 px-0">
    <i class="fa fa-phone me-2 text-success"></i> ${student.contact}
  </li>
  <li class="list-group-item border-0 px-0">
    <i class="fa fa-calendar-alt me-2 text-warning"></i> ${student.d_o_b}
  </li>
  <li class="list-group-item border-0 px-0">
    <i class="fa fa-map-marker-alt me-2 text-danger"></i> ${student.curr_city}
  </li>
   <li class="list-group-item border-0 px-0">
<i class="fas fa-graduation-cap me-2 text-primary"></i> ${student.curr_year}

  </li>
  <c:if test="${not empty student.linkedIn}">
    <li class="list-group-item border-0 px-0">
      <i class="fab fa-linkedin me-2 text-info"></i>
      <a href="${student.linkedIn}" target="_blank">View LinkedIn Profile</a>
    </li>
  </c:if>
</ul>



							<!-- Edit Button -->
							<button class="btn btn-outline-primary mt-4 px-4"
								data-toggle="modal" data-target="#editModal">
								<i class="fa fa-edit me-1"></i> Edit Profile
							</button>
						</div>
					</div>

				</div>

				<!-- 🧾 Tabs + Form Section -->
				<div class="col-md-8">
					<div class="card shadow">
						<div class="card-body">
							<ul class="nav nav-tabs mb-3" id="profileTab" role="tablist">
								<li class="nav-item">
									<button class="nav-link active mx-2" data-bs-toggle="tab"
										data-bs-target="#personalTab" type="button" role="tab"
										onclick="document.getElementById('projectsTab').style.display = 'none';">
										Personal Information</button>
								</li>
								<li class="nav-item">
									<button class="nav-link mx-2" id="educationTabBtn"
										data-bs-toggle="tab" data-bs-target="#educationTab"
										type="button" role="tab"
										onclick="document.getElementById('projectsTab').style.display = 'none';">
										Education</button>
								</li>
								<li class="nav-item">
									<button class="nav-link mx-2" id="certificationTabBtn"
										data-bs-toggle="tab" data-bs-target="#certification"
										type="button" role="tab" onclick="fetchCertifications()">
										Certifications</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" id="projectsTabBtn"
										data-bs-toggle="tab" data-bs-target="#projectsTab"
										type="button" role="tab">Projects</button>
								</li>

							</ul>



							<!-- Add Project Modal -->
							<div class="modal fade" id="addProjectModal" tabindex="-1"
								aria-labelledby="addProjectLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content rounded-4 shadow">

										<!-- Modal Header -->
										<div class="modal-header bg-light border-bottom">
											<h5 class="modal-title d-flex align-items-center gap-2"
												id="addProjectLabel">
												<i class="fas fa-folder-plus"></i> Add New Project
											</h5>
											<button type="button" class="btn-close"
												data-dismiss="modal" aria-label="Close"></button>

										</div>

										<!-- Modal Body -->
										<div class="modal-body px-4 py-3">
											<form id="projectForm" action="">

												<div class="mb-3">
													<label for="projectTitle" class="form-label"> <i
														class="fas fa-heading me-1"></i> Project Title
													</label> <input type="text" class="form-control" id="projectTitle"
														required>
												</div>

												<div class="mb-3">
													<label for="projectDescription" class="form-label">
														<i class="fas fa-align-left me-1"></i> Description
													</label>
													<textarea class="form-control" id="projectDescription"
														rows="3" required cols=""></textarea>
												</div>

												<div class="mb-3">
													<label for="projectFiles" class="form-label"> <i
														class="fas fa-upload me-1"></i> Upload Files <small
														class="text-muted">(PPT, DOC, PDF)</small>
													</label> <input type="file" class="form-control" id="projectFiles"
														accept=".ppt,.pptx,.doc,.docx,.pdf" multiple>
												</div>

												<div class="mb-3">
													<label for="githubLink" class="form-label"> <i
														class="fab fa-github me-1"></i> GitHub Link
													</label> <input type="url" class="form-control" id="githubLink"
														placeholder="https://github.com/username/repository">
												</div>

												<button type="submit" class="btn btn-primary w-100 py-2">
													<i class="fas fa-save me-1"></i> Save Project
												</button>

											</form>
										</div>
									</div>
								</div>
							</div>



							<div class="tab-content">
								<!-- Personal Tab -->
								<div class="tab-pane fade show active" id="personalTab"
									role="tabpanel">
									<div class="card shadow-sm p-4"
										style="max-height: 80vh; overflow-y: auto;">
										<!-- Personal Details Form -->
										<form action="${addAction}" method="post"
											enctype="multipart/form-data" modelAttribute="student">
											<input type="hidden" name="student_id"
												value="${student.student_id}" /> <input type="hidden"
												name="contact" value="${student.contact}" /> <input
												type="hidden" name="curr_city" value="${student.curr_city}" />
											<input type="hidden" name="email_id"
												value="${student.email_id}" /> <input type="hidden"
												name="linkedIn" value="${student.linkedIn}" />

											<div class="row g-3">
												<!-- Full Name -->
												<div class="col-md-6">
													<label class="form-label mb-1">Full Name</label> <input
														type="text" name="student_name" class="form-control"
														value="${student.student_name}" required>
												</div>

												<!-- Enrollment Number -->
												<div class="col-md-6">
													<label class="form-label mb-1">Enrollment Number</label> <input
														type="text" name="curr_enroll_no" class="form-control"
														value="${student.curr_enroll_no}" required>
												</div>

												<!-- dob -->
                                               

												<%-- <div class="col-md-6">
													<label class="form-label">Skills</label>
													<div
														class="form-control d-flex justify-content-between align-items-center"
														onclick="toggleSkillPanel()" style="cursor: pointer;">
														<span>Select Skills</span> <i class="bi bi-chevron-down"></i>
														<!-- Optional: use Bootstrap Icons -->
													</div>

													<!-- Hidden Panel -->
													<div id="skillPanel"
														class="form-check-group border p-3 rounded"
														style="max-height: 200px; overflow-y: auto; display: none;">
														<c:forEach var="tech" items="${allTechnology}">
															<c:set var="skillName" value="${tech.technology_name}" />
															<div class="form-check">
																<input type="checkbox" class="form-check-input"
																	name="skills" value="${skillName}"
																	id="skill_${skillName}"
																	<c:if test="${fn:contains(student.skills, skillName)}">checked</c:if>>
																<label class="form-check-label" for="skill_${skillName}">${skillName}</label>
															</div>
														</c:forEach>
													</div>
													<!-- Display selected skills as badges -->
													<c:if test="${not empty student.skills}">
														<div class="mt-2">
															
															<div class="d-flex gap-2">
																<c:forEach var="skill"
																	items="${fn:split(student.skills, ',')}">
																	<span
																		class="badge bg-secondary text-light rounded-pill px-3 py-2">
																		${fn:trim(skill)} </span>
																</c:forEach>
															</div>
														</div>
													</c:if>

												</div> --%>



                                                   <div class="col-md-6">
													<label class="form-label">Skills</label>
													<div
														class="form-control d-flex justify-content-between align-items-center"
														onclick="toggleSkillPanel()" style="cursor: pointer;">
														<input type="text"
															class="form-control border-0 p-3 mt-3 m-0 bg-transparent w-100"
															id="skillSearch" placeholder="Search skills..."
															oninput="filterSkills()" style="box-shadow: none;" /> <i
															class="bi bi-chevron-down ms-2"></i>
													</div>
													<!-- Hidden Panel -->
													<div id="skillPanel"
														class="form-check-group border p-3 rounded"
														style="max-height: 300px; overflow-y: auto; display: none;">
														<!-- Search input for filtering skills -->
														<!-- Skill checkboxes -->
														<div id="skillList">
															<c:forEach var="tech" items="${allTechnology}">
																<c:set var="skillName" value="${tech.technology_name}" />
																<div class="form-check skill-item">
																	<input type="checkbox" class="form-check-input"
																		name="skills" value="${skillName}"
																		id="skill_${skillName}"
																		<c:if test="${fn:contains(student.skills, skillName)}">checked</c:if>>
																	<label class="form-check-label"
																		for="skill_${skillName}">${skillName}</label>
																</div>
															</c:forEach>
														</div>
														<!-- Other option -->
														<div class="mt-3">
															<input type="text" class="form-control" name="skills"
																id="otherSkillInput" placeholder="Add other skill..." />
															<!-- <button type="button" class="btn btn-sm btn-primary mt-2"
																onclick="addOtherSkill()">Add Skill</button> -->
														</div>
													</div>
													<!-- Display selected skills as badges -->
													<c:if test="${not empty student.skills}">
														<div class="mt-2">
															<div class="d-flex gap-2 flex-wrap">
																<c:forEach var="skill"
																	items="${fn:split(student.skills, ',')}">
																	<span
																		class="badge bg-secondary text-light rounded-pill px-3 py-2">
																		${fn:trim(skill)} </span>
																</c:forEach>
															</div>
														</div>
													</c:if>
												</div>
												<!-- Gender -->
												<div class="col-md-6">
													<label class="form-label mb-1">Gender</label>
													<div class="d-flex gap-4 mt-2">
														<div class="form-check">
															<input class="form-check-input" type="radio"
																name="gender" value="M" id="male"
																${user.gender == 'M' ? 'checked="checked"' : ''}>
															<label class="form-check-label" for="male">Male</label>
														</div>
														<div class="form-check">
															<input class="form-check-input" type="radio"
																name="gender" value="F" id="female"
																${user.gender == 'F' ? 'checked="checked"' : ''}>
															<label class="form-check-label" for="female">Female</label>
														</div>
													</div>
												</div>

												<!-- Home City -->
												<div class="col-md-6">
													<label class="form-label mb-1">Home City</label> <input
														type="text" name="home_city" class="form-control"
														value="${student.home_city}" required>
													
												</div>

												<!-- Interest -->
												<div class="col-md-6">
													<label class="form-label mb-1">Interest</label> <input
														type="text" name="interest" class="form-control"
														value="${student.interest}">
												</div>

												<!-- Achievements -->
												<div class="col-md-12">
													<label class="form-label mb-1">Achievements</label> <input
														type="text" name="achievements" class="form-control"
														value="${student.achievements}">
												</div>

												<div class="d-flex justify-content-end mt-3">
													<button type="submit" class="btn btn-success btn-sm px-4">Save</button>
												</div>
												<c:if test="${not empty student.resume}">
													<div class="d-flex align-items-center gap-2 mt-2" >
														<strong>Current Resume:</strong> <a
															href="<c:url value='/uploads/${student.resume}'/>"
															target="_blank">${student.resume}</a>
														<button class="btn btn-sm btn-danger" type="button"
															
															onclick="deleteResume('${student.student_id}')"
															title="Delete Resume">
															<i class="fa fa-trash"></i>
														</button>
													</div>
												</c:if>
											</div>
										</form>

										<!-- Resume Upload Section -->
										<hr class="mt-4 mb-3">
										<h5 class="fw-bold mb-3">Resume</h5>
										<div class="row g-3 align-items-center">
											<!-- File input - takes more space on larger screens -->
											<div class="col-12 col-md-8 col-lg-9">
												<input type="file" id="resume" name="resume"
													class="form-control" />
											</div>

											<!-- Upload button - takes remaining space, stacks on smaller screens -->
											<div class="col-12 col-md-4 col-lg-3">
												<button class="btn btn-primary w-100" type="button"
													onclick="uploadResumeAPI()">Upload</button>
											</div>
										</div>

									</div>
								</div>



								<!-- Education Tab -->
								<div class="tab-pane fade" id="educationTab" role="tabpanel"
									aria-labelledby="educationTabBtn">
									<p class="text-muted">Add your educational details like
										SSC, HSC, Diploma, UG, PG etc.</p>

									<!-- Add Education Form -->
									<form id="educationForm" class="mb-4" action="saveStudentPast"
										method="post">
										<input type="hidden" value="0" name="stud_past_id"
											id="edu_stud_past_id" /> <input type="hidden"
											value="${user.id}" name="student_id" /> <input type="hidden"
											name="category" id="edu_category" />

										<!-- Row 1 -->
										<div class="row">
											<div class="col-md-3">
												<label>Education</label> <select name="category"
													id="educationCategory" class="form-control" required>
													<option value="">Select</option>
													<option value="SSC">SSC</option>
													<option value="HSC">HSC</option>
													<option value="Diploma">Diploma</option>
													<option value="UG">UG</option>
													<option value="PG">PG</option>
												</select>
											</div>

											<div class="col-md-3">
												<label for="existing_colleges">Board/University</label> <select
													class="form-control mb-2" id="existing_colleges"
													name="board" required
													onchange="toggleCustomInput(this)">
													<option selected disabled value="">-- Select
														Board/University --</option>
													<c:forEach items="${allUniversities}" var="university">
														<option value="${university.boardName}">${university.boardName}</option>
													</c:forEach>
													<option value="other">Other</option>
												</select>
												<!-- Input box that appears just below the dropdown -->
												<input type="text" class="form-control mt-2"
													name="board" id="customUniversity"
													style="display: none;" placeholder="Enter University Name">
											</div>

											<div class="col-md-3">
												<label>Start Year</label> <input type="text"
													name="start_date" class="form-control"
													placeholder="e.g., 2018">
											</div>

											<div class="col-md-3">
												<label>End Year</label> <input type="text" name="end_date"
													class="form-control" placeholder="e.g., 2022" required>
											</div>
										</div>

										<!-- Row 2 -->
										<div class="row mt-3">
											<!-- School/Institute -->
											<div class="col-md-6">
												<label for="existing_colleges">School/Institute</label>

												<!-- Dropdown -->
												<select class="form-control mb-2" id="existing_colleges"
													name="organization" required
													onchange="toggleCustomInput(this)">
													<option selected disabled value="">--Select an
														Institute--</option>
													<c:forEach items="${allColleges}" var="college">
														<option value="${college.college_name}">${college.college_name}</option>
													</c:forEach>
													<option value="other">Other</option>
												</select>

												<!-- Custom Input -->
												<input type="text" name="organization" class="form-control"
													id="customInstitute" style="display: none;"
													placeholder="Enter Institute Name">
											</div>

											<!-- Stream/Degree -->
											<div class="col-md-6" id="edu_department_div">
												<div class="form-group">
													<label>Stream/Degree</label> <select
														class="form-control mySelect" name="department"
														id="edu_departments">
														<option selected value="" disabled="disabled">
															--Select a Stream/Degree--</option>
														<option value="1">CSE & DS</option>
														<option value="2">Electronics & Communication</option>
														<option value="3">Civil Eng.</option>
														<option value="4">B.E./B.Tech - Computer Science
															and Engineering</option>
														<option value="5">B.E./B.Tech - Information
															Technology</option>
														<option value="6">B.E./B.Tech - Electronics and
															Communication Engineering</option>
														<option value="7">B.E./B.Tech - Electrical
															Engineering</option>
														<option value="8">B.E./B.Tech - Mechanical
															Engineering</option>
														<option value="9">B.E./B.Tech - Civil Engineering</option>
														<option value="10">B.E./B.Tech - Chemical
															Engineering</option>
														<option value="11">B.E./B.Tech - Aerospace
															Engineering</option>
														<option value="12">B.E./B.Tech - Biomedical
															Engineering</option>
														<option value="13">B.E./B.Tech - Environmental
															Engineering</option>
														<option value="14">B.E./B.Tech - Biotechnology
															Engineering</option>
														<option value="15">B.A. - English Literature</option>
														<option value="16">B.A. - History</option>
														<option value="17">B.A. - Political Science</option>
														<option value="18">B.A. - Sociology</option>
														<option value="19">B.A. - Psychology</option>
														<option value="20">B.A. - Philosophy</option>
														<option value="21">B.A. - Economics</option>
														<option value="22">B.A. - Journalism and Mass
															Communication</option>
														<option value="23">B.Sc. - Physics</option>
														<option value="24">B.Sc. - Chemistry</option>
														<option value="25">B.Sc. - Mathematics</option>
														<option value="26">B.Sc. - Biology</option>
														<option value="27">B.Sc. - Computer Science</option>
														<option value="28">B.Sc. - Biotechnology</option>
														<option value="29">B.Sc. - Environmental Science</option>
														<option value="30">B.Sc. - Microbiology</option>
														<option value="31">B.Sc. - Zoology</option>
														<option value="32">B.Sc. - Botany</option>
														<option value="33">B.Com. - Accounting and
															Finance</option>
														<option value="34">B.Com. - Banking and Insurance</option>
														<option value="35">B.Com. - Business Economics</option>
														<option value="36">B.Com. - Marketing Management</option>
														<option value="37">B.Com. - Business Analytics</option>
														<option value="38">BCA - General</option>
														<option value="39">BCA - Data Science</option>
														<option value="40">BCA - Artificial Intelligence</option>
														<option value="41">BBA - General</option>
														<option value="42">BBA - Finance</option>
														<option value="43">BBA - Marketing</option>
														<option value="44">BBA - Human Resource
															Management</option>
														<option value="45">B.Ed - Bachelor of Education</option>
														<option value="46">LLB - Bachelor of Laws</option>
														<option value="47">MBBS - Bachelor of Medicine
															and Bachelor of Surgery</option>
														<option value="48">BDS - Bachelor of Dental
															Surgery</option>
														<option value="49">BAMS - Bachelor of Ayurvedic
															Medicine and Surgery</option>
														<option value="50">BHMS - Bachelor of Homeopathic
															Medicine and Surgery</option>
														<option value="51">BPT - Bachelor of
															Physiotherapy</option>
														<option value="52">M.E./M.Tech - Artificial
															Intelligence</option>
														<option value="53">M.E./M.Tech - Data Science</option>
														<option value="54">M.E./M.Tech - Cybersecurity</option>
														<option value="55">M.E./M.Tech - Robotics</option>
														<option value="56">M.E./M.Tech - VLSI Design</option>
														<option value="57">M.A. - International Relations</option>
														<option value="58">M.A. - Public Administration</option>
														<option value="59">M.A. - Social Work</option>
														<option value="60">M.A. - Cultural Studies</option>
														<option value="61">M.Sc. - Applied Physics</option>
														<option value="62">M.Sc. - Organic Chemistry</option>
														<option value="63">M.Sc. - Bioinformatics</option>
														<option value="64">M.Com. - Corporate Governance</option>
														<option value="65">M.Com. - Financial Management</option>
														<option value="66">M.Com. - International
															Business</option>
														<option value="67">MCA - General</option>
														<option value="68">MCA - Data Science</option>
														<option value="69">MCA - Artificial Intelligence</option>
														<option value="70">MBA - General</option>
														<option value="71">MBA - Finance</option>
														<option value="72">MBA - Marketing</option>
														<option value="73">MBA - Human Resource
															Management</option>
														<option value="74">MBA - Operations Management</option>
														<option value="75">MBA - Information Technology</option>
														<option value="76">M.Ed - Master of Education</option>
														<option value="77">LLM - Master of Laws</option>
														<option value="78">MD/MS - Doctor of
															Medicine/Master of Surgery</option>
														<option value="79">MDS - Master of Dental Surgery</option>
														<option value="80">MPT - Master of Physiotherapy</option>
														<option value="81">PhD - Engineering</option>
														<option value="82">PhD - Arts</option>
														<option value="83">PhD - Commerce</option>
														<option value="84">PhD - Computer Applications</option>
														<option value="85">PhD - Business Administration</option>
														<option value="86">PhD - Education</option>
														<option value="87">PhD - Law</option>
														<option value="88">PhD - Medicine</option>
													</select>
												</div>
											</div>

										</div>

										<!-- Row 3 -->
										<div class="row mt-3">
											<div class="col-md-3">
												<label>Marks (%)</label> <input type="number" step="0.01"
													name="description" class="form-control" required>
											</div>

											<div
												class="col-md-9 d-flex align-items-end justify-content-end">
												<button type="submit" class="btn btn-success w-25">
													Save</button>
											</div>
										</div>
									</form>

${studentPast}
									<!-- Education Records Table -->
									<div class="table-responsive">
										<table class="table table-bordered table-striped">
											<thead class="thead-dark">
												<tr>
													<th>Education</th>
													<th>Stream</th>
													<th>Current Year</th>
													<th>School/Institute</th>
													<th>Board/University</th>
													<th>Marks(%)</th>
													<th>Year of Passing</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${studentPast}" var="studPast">
													<c:set var="past" value="${studPast.studentPast}" />
													<tr id="tr_${past.category}">
														<td>${past.category}</td>
														<td>${studPast.departmentName}</td>
														<td><c:if
																test="${past.category eq 'UG' || studPast.category eq 'PG'}">
                                                            ${student.curr_year}
                                                         </c:if></td>
														<td>${past.organization}</td>
														<td>${past.board}</td>
														<td>${past.description}</td>
														<td>${past.end_date}</td>
														<td><i class="fa fa-pencil text-primary"
															style="cursor: pointer;"
															onclick="editeducation('${past.stud_past_id}', '${past.category}', '${past.department}', '${past.organization}', '${past.board}', '${past.description}', '${past.end_date}')"></i>
															&nbsp; <i class="fa fa-times text-danger"
															style="cursor: pointer;"
															onclick="removeStudentEdu('${past.stud_past_id}')"></i></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>

								<div class="tab-pane fade" id="certification" role="tabpanel"
									aria-labelledby="certificationTabBtn">
									<h5 class="mb-3">Certificates</h5>
									<button class="btn btn-success mt-4 w-100" data-toggle="modal"
										data-target="#addCertificationModal">
										<i class="fas fa-plus"></i> Add New Certification
									</button>


									<div id="certificationList" class="row"
										style="max-height: 400px; overflow-y: auto;"></div>
									<p id="noCertificationsMessage"
										class="text-muted text-center w-100">No certifications
										available.</p>
								</div>


							</div>

							<!-- Modal -->
							<div class="modal fade" id="addCertificationModal" tabindex="-1"
								aria-labelledby="addCertificationLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content rounded-4 shadow">

										<!-- Header -->
										<div class="modal-header bg-light border-bottom">
											<h5 class="modal-title d-flex align-items-center gap-2"
												id="addCertificationLabel">
												<i class="fas fa-upload"></i> Add Certification
											</h5>
											<button type="button" class="btn-close"
												data-dismiss="modal" aria-label="Close"></button>
										</div>

										<!-- Body -->
										<div class="modal-body px-4 py-3">
											<form id="certificationForm" action="">
												<div class="row g-3">
													<div class="col-md-6">
														<label class="form-label"><i
															class="fas fa-certificate me-1"></i>Certification Name</label> <input
															type="text" class="form-control" id="certificationName"
															required>
													</div>

													<div class="col-md-6">
														<label class="form-label"><i
															class="fas fa-building me-1"></i>Issuing Organization</label> <input
															type="text" class="form-control" id="issuingOrganization"
															required>
													</div>

													<div class="col-md-6">
														<label class="form-label"><i
															class="fas fa-calendar-alt me-1"></i>Issued Date</label> <input
															type="date" class="form-control" id="issueDate" required>
													</div>

													<div class="col-md-6">
														<label class="form-label"><i
															class="fas fa-calendar-times me-1"></i>Expiry Date <small
															class="text-muted">(optional)</small></label> <input type="date"
															class="form-control" id="expiryDate">
													</div>

													<div class="col-md-6">
														<label class="form-label"><i
															class="fas fa-file-upload me-1"></i>Upload Certificate
															Image</label> <input type="file" class="form-control"
															id="certificateImage" accept="image/*">
													</div>

													<div class="col-md-6">
														<label class="form-label"><i
															class="fas fa-link me-1"></i>Google Drive Link <small
															class="text-muted">(optional)</small></label> <input type="url"
															class="form-control" id="certificateLink">
													</div>
												</div>

												<div class="mt-4">
													<button type="button" class="btn btn-primary w-100 py-2"
														onclick="uploadCertification()">
														<i class="fas fa-save me-1"></i> Save Certification
													</button>
												</div>
											</form>
										</div>

									</div>
								</div>
							</div>



							<div class="modal fade" id="viewCertificateModal" tabindex="-1"
								aria-labelledby="viewCertificateModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-xl modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="viewCertificateModalLabel">View
												Certificate</h5>
											<button type="button" class="btn-close"
												data-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<iframe id="certificateIframe" src="" width="100%"
												height="600px" frameborder="0"></iframe>
										</div>
									</div>
								</div>
							</div>


							<div class="tab-pane fade" id="projectsTab" role="tabpanel"
								aria-labelledby="projectsTabBtn" style="display: none;">

								<div
									class="d-flex justify-content-between align-items-center mt-3">
									<h4>Projects</h4>
									<button class="btn btn-success" onclick="openProjectModal()">
										<i class="fas fa-plus"></i> Add Project
									</button>
								</div>

								<!-- Scrollable project list -->
								<div id="projectList" class="row mt-3"
									style="max-height: 400px; overflow-y: auto; overflow-x: hidden; padding-right: 10px;">

									<p id="noProjectsMessage" class="text-muted text-center w-100">
										No projects available.</p>
									<!-- Project cards will be dynamically inserted here -->
								</div>
							</div>
							<div class="modal fade" id="profilePicModal11" tabindex="-1"
								role="dialog" aria-labelledby="profilePicModalLabel11"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<form action="update-photo" method="post"
											enctype="multipart/form-data">
											<div class="modal-header">
												<h5 class="modal-title" id="profilePicModalLabel11">Update
													Profile Photo</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body text-center">
												<!-- Display current photo in larger size -->
												<img src="<c:url value='/get_logo'/>" alt="Current Photo"
													class="rounded mb-3"
													style="width: 300px; height: 300px; object-fit: cover; border: 4px solid #007BFF;">
												<div class="mb-3">
													<label for="newPhoto" class="form-label">Select New
														Photo</label> <input class="form-control" type="file"
														name="newPhoto" id="newPhoto" accept="image/*" required>
												</div>
											</div>
											<div class="modal-footer justify-content-between">
												<button type="button" class="btn btn-outline-danger"
													onclick="removeProfilePhoto()">Remove Photo</button>
												<div>
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Cancel</button>
													<button type="submit" class="btn btn-primary">Change
														Photo</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>


							<%-- <!-- Tasks Tab start -->
							<div class="tab-pane fade" id="tasks" role="tabpanel">
								<div class="pd-20 profile-task-wrap">
									<div class="container pd-0">
										<!-- Open Task start -->
										<div class="task-title row align-items-center">
											<div class="col-md-8 col-sm-12">
												<h5></h5>
											</div>
											<div class="col-md-4 col-sm-12 text-right">
												<a href="task-add" data-toggle="modal"
													data-target="#task-add"
													class="bg-light-blue btn text-blue weight-500"><i
													class="ion-plus-round"></i> Add</a>
											</div>
										</div>
										<div class="profile-task-list pb-30">
											<table id="edu_table"
												class="table table-bordered nowrap table-responsive">
												<thead class="thead-light">
													<tr>
														<th>Education</th>
														<th>Stream</th>
														<th>Current Year</th>
														<th>School/Institute</th>
														<th>Board/University</th>
														<th>Marks(%)</th>
														<th>Year of Passing</th>
														<th></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${studentPast}" var="studPast">
														<tr id="tr_${studPast.category}">
															<td>${studPast.category}</td>
															<td><c:choose>
																	<c:when test="${studPast.department == 1}">CSE & DS</c:when>
																	<c:when test="${studPast.department == 2}">Electronics & Communication</c:when>
																	<c:when test="${studPast.department == 3}">Civil Eng.</c:when>
																	<c:when test="${studPast.department == 4}">B.E./B.Tech - Computer Science and
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 5}">B.E./B.Tech - Information
                                            Technology</c:when>
																	<c:when test="${studPast.department == 6}">B.E./B.Tech - Electronics and
                                            Communication Engineering</c:when>
																	<c:when test="${studPast.department == 7}">B.E./B.Tech - Electrical
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 8}">B.E./B.Tech - Mechanical
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 9}">B.E./B.Tech - Civil
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 10}">B.E./B.Tech - Chemical
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 11}">B.E./B.Tech - Aerospace
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 12}">B.E./B.Tech - Biomedical
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 13}">B.E./B.Tech - Environmental
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 14}">B.E./B.Tech - Biotechnology
                                            Engineering</c:when>
																	<c:when test="${studPast.department == 15}">B.A. - English Literature</c:when>
																	<c:when test="${studPast.department == 16}">B.A. - History</c:when>
																	<c:when test="${studPast.department == 17}">B.A. - Political Science</c:when>
																	<c:when test="${studPast.department == 18}">B.A. - Sociology</c:when>
																	<c:when test="${studPast.department == 19}">B.A. - Psychology</c:when>
																	<c:when test="${studPast.department == 20}">B.A. - Philosophy</c:when>
																	<c:when test="${studPast.department == 21}">B.A. - Economics</c:when>
																	<c:when test="${studPast.department == 22}">B.A. - Journalism and Mass
                                            Communication</c:when>
																	<c:when test="${studPast.department == 23}">B.Sc. - Physics</c:when>
																	<c:when test="${studPast.department == 24}">B.Sc. - Chemistry</c:when>
																	<c:when test="${studPast.department == 25}">B.Sc. - Mathematics</c:when>
																	<c:when test="${studPast.department == 26}">B.Sc. - Biology</c:when>
																	<c:when test="${studPast.department == 27}">B.Sc. - Computer Science</c:when>
																	<c:when test="${studPast.department == 28}">B.Sc. - Biotechnology</c:when>
																	<c:when test="${studPast.department == 29}">B.Sc. - Environmental
                                            Science</c:when>
																	<c:when test="${studPast.department == 30}">B.Sc. - Microbiology</c:when>
																	<c:when test="${studPast.department == 31}">B.Sc. - Zoology</c:when>
																	<c:when test="${studPast.department == 32}">B.Sc. - Botany</c:when>
																	<c:when test="${studPast.department == 33}">B.Com. - Accounting and
                                            Finance</c:when>
																	<c:when test="${studPast.department == 34}">B.Com. - Banking and
                                            Insurance</c:when>
																	<c:when test="${studPast.department == 35}">B.Com. - Business Economics</c:when>
																	<c:when test="${studPast.department == 36}">B.Com. - Marketing
                                            Management</c:when>
																	<c:when test="${studPast.department == 37}">B.Com. - Business Analytics</c:when>
																	<c:when test="${studPast.department == 38}">BCA - General</c:when>
																	<c:when test="${studPast.department == 39}">BCA - Data Science</c:when>
																	<c:when test="${studPast.department == 40}">BCA - Artificial
                                            Intelligence</c:when>
																	<c:when test="${studPast.department == 41}">BBA - General</c:when>
																	<c:when test="${studPast.department == 42}">BBA - Finance</c:when>
																	<c:when test="${studPast.department == 43}">BBA - Marketing</c:when>
																	<c:when test="${studPast.department == 44}">BBA - Human Resource
                                            Management</c:when>
																	<c:when test="${studPast.department == 45}">B.Ed - Bachelor of
                                            Education</c:when>
																	<c:when test="${studPast.department == 46}">LLB - Bachelor of Laws</c:when>
																	<c:when test="${studPast.department == 47}">MBBS - Bachelor of Medicine and
                                            Bachelor of Surgery</c:when>
																	<c:when test="${studPast.department == 48}">BDS - Bachelor of Dental
                                            Surgery</c:when>
																	<c:when test="${studPast.department == 49}">BAMS - Bachelor of Ayurvedic
                                            Medicine and Surgery</c:when>
																	<c:when test="${studPast.department == 50}">BHMS - Bachelor of Homeopathic
                                            Medicine and Surgery</c:when>
																	<c:when test="${studPast.department == 51}">BPT - Bachelor of
                                            Physiotherapy</c:when>
																	<c:when test="${studPast.department == 52}">M.E./M.Tech - Artificial
                                            Intelligence</c:when>
																	<c:when test="${studPast.department == 53}">M.E./M.Tech - Data Science</c:when>
																	<c:when test="${studPast.department == 54}">M.E./M.Tech - Cybersecurity</c:when>
																	<c:when test="${studPast.department == 55}">M.E./M.Tech - Robotics</c:when>
																	<c:when test="${studPast.department == 56}">M.E./M.Tech - VLSI Design</c:when>
																	<c:when test="${studPast.department == 57}">M.A. - International
                                            Relations</c:when>
																	<c:when test="${studPast.department == 58}">M.A. - Public
                                            Administration</c:when>
																	<c:when test="${studPast.department == 59}">M.A. - Social Work</c:when>
																	<c:when test="${studPast.department == 60}">M.A. - Cultural Studies</c:when>
																	<c:when test="${studPast.department == 61}">M.Sc. - Applied Physics</c:when>
																	<c:when test="${studPast.department == 62}">M.Sc. - Organic Chemistry</c:when>
																	<c:when test="${studPast.department == 63}">M.Sc. - Bioinformatics</c:when>
																	<c:when test="${studPast.department == 64}">M.Com. - Corporate
                                            Governance</c:when>
																	<c:when test="${studPast.department == 65}">M.Com. - Financial
                                            Management</c:when>
																	<c:when test="${studPast.department == 66}">M.Com. - International
                                            Business</c:when>
																	<c:when test="${studPast.department == 67}">MCA - General</c:when>
																	<c:when test="${studPast.department == 68}">MCA - Data Science</c:when>
																	<c:when test="${studPast.department == 69}">MCA - Artificial
                                            Intelligence</c:when>
																	<c:when test="${studPast.department == 70}">MBA - General</c:when>
																	<c:when test="${studPast.department == 71}">MBA - Finance</c:when>
																	<c:when test="${studPast.department == 72}">MBA - Marketing</c:when>
																	<c:when test="${studPast.department == 73}">MBA - Human Resource
                                            Management</c:when>
																	<c:when test="${studPast.department == 74}">MBA - Operations Management</c:when>
																	<c:when test="${studPast.department == 75}">MBA - Information
                                            Technology</c:when>
																	<c:when test="${studPast.department == 76}">M.Ed - Master of Education</c:when>

																	<c:when test="${studPast.department == 77}">LLM - Master of Laws</c:when>
																	<c:when test="${studPast.department == 78}">MD/MS - Doctor of Medicine/Master
                                            of Surgery</c:when>
																	<c:when test="${studPast.department == 79}">MDS - Master of Dental
                                            Surgery</c:when>
																	<c:when test="${studPast.department == 80}">MPT - Master of
                                            Physiotherapy</c:when>
																	<c:when test="${studPast.department == 81}">PhD - Engineering</c:when>
																	<c:when test="${studPast.department == 82}">PhD - Arts</c:when>
																	<c:when test="${studPast.department == 83}">PhD - Commerce</c:when>
																	<c:when test="${studPast.department == 84}">PhD - Computer Applications</c:when>
																	<c:when test="${studPast.department == 85}">PhD - Business
                                            Administration</c:when>
																	<c:when test="${studPast.department == 86}">PhD - Education</c:when>
																	<c:when test="${studPast.department == 87}">PhD - Law</c:when>
																	<c:when test="${studPast.department == 88}">PhD - Medicine</c:when>
																	<c:when test="${studPast.department == 2001}">Arts</c:when>

																	<c:when test="${studPast.department == 2002}">Science</c:when>

																	<c:when test="${studPast.department == 2003}">Commerce</c:when>

																	<c:otherwise> NA </c:otherwise>
																</c:choose></td>
															<c:choose>
																<c:when
																	test="${studPast.category eq 'UG' || studPast.category eq 'PG'}">
																	<td>${student.curr_year}</td>
																</c:when>
																<c:otherwise>
																	<td>&nbsp;</td>
																	<!-- Blank space -->
																</c:otherwise>
															</c:choose>

															<td>${studPast.organization}</td>
															<td>${studPast.board}</td>
															<td>${studPast.description}</td>
															<td>${studPast.end_date}</td>
															<td style="white-space: nowrap; padding-left: 13px;"><c:if
																	test="${studPast.stud_past_id!=student.studentPast.stud_past_id}">
																	<i
																		style="background: #0da0e2; color: white; padding: 3px 0 3px 7px; border-radius: 3px;"
																		onclick="editeducation('${studPast.stud_past_id}','${studPast.category}','${studPast.department}','${studPast.organization}','${studPast.board}','${studPast.description}','${studPast.end_date}')"
																		class="fa fa-pencil pr-2"></i>
																	<i class="fa fa-times"
																		style="background: red; color: white; padding: 3px 7px 3px 7px; border-radius: 3px;"
																		onclick="removeStudentEdu('${studPast.stud_past_id}')"
																		id="rem${studPast.stud_past_id}"></i>
																</c:if> <c:if
																	test="${studPast.stud_past_id==student.studentPast.stud_past_id}">
																	<i class="fa fa-info-circle"
																		style="background: #0da0e2; padding: 3px 8px 3px 7px; border-radius: 3px;"
																		title="Current Education cannot be edited/deleted!"></i>
																</c:if></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

										<div class="modal fade" id="profilePicModal11" tabindex="-1"
											aria-labelledby="profilePicModalLabel11" aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<form action="${changePhotoAction}" method="post"
														enctype="multipart/form-data">
														<div class="modal-header">
															<h5 class="modal-title" id="profilePicModalLabel11">Update
																Profile Photo</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal"></button>
														</div>
														<div class="modal-body text-center">
															<img src="<c:url value='/get_logo'/>" alt="Current Photo"
																class="rounded-circle mb-3"
																style="width: 120px; height: 120px; object-fit: cover; border: 4px solid #007bff;">
															<div class="mb-3">
																<label for="newPhoto" class="form-label">Select
																	new photo</label> <input class="form-control" type="file"
																	name="newPhoto" id="newPhoto" accept="image/*" required>
															</div>
														</div>
														<div class="modal-footer justify-content-between">
															<!-- Remove button posts to a delete endpoint -->
															<button type="button" class="btn btn-outline-danger"
																onclick="removeProfilePhoto()">Remove Photo</button>
															<div>
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Cancel</button>
																<button type="submit" class="btn btn-primary">Change
																	Photo</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- add task popup start -->
										<div class="modal fade customscroll" id="task-add"
											tabindex="-1" role="dialog">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLongTitle">Add
															Educational Qualification</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close" data-toggle="tooltip"
															data-placement="bottom" title=""
															data-original-title="Close Modal">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body pd-0">
														<div class="task-list-form">
															<ul>
																<li>
																	<div class="form-group row">
																		<label class="col-md-4">Select Category</label>
																		<div class="col-md-8">
																			<select id="degreeSelector" class="form-control"
																				style="display: inline; height: 100%;">
																				<option disabled="disabled" selected="selected">
																					--Select Category--</option>
																				<option value="SSC">SSC</option>
																				<option value="HSC">HSC</option>
																				<c:if test="${category!='DIPLOMA'}">
																					<option value="DIPLOMA">DIPLOMA</option>
																				</c:if>
																				<c:if
																					test="${category=='PG'||category=='PHD'||category=='none'||category==null}">
																					<option value="UG">UG</option>
																				</c:if>
																				<c:if
																					test="${category=='PHD'||category=='none'||category==null}">
																					<option value="PG">PG</option>
																				</c:if>
																				<c:if test="${category=='none'||category==null}">
																					<option value="PHD">PHD</option>
																				</c:if>
																			</select>
																		</div>
																	</div>
																	<div id="edu_div" style="display: none">
																		<form id="edu_form2" action="saveStudentPast"
																			method="post">
																			<input type="hidden" value="0" name="stud_past_id"
																				id="edu_stud_past_id" /> <input type="hidden"
																				value="${user.id}" name="student_id" /> <input
																				type="hidden" name="category" id="edu_category" />
																			<div class="row">
																				<div class="col-md-6">
																					<div class="form-group">
																						<label id="edu_organization_label">School
																							Name</label>
																						<div id="existing_organization">
																							<select class="form-control"
																								id="existing_colleges">
																								<option selected value="" disabled="disabled">
																									--Select a Institute--</option>
																								<c:forEach items="${allColleges}" var="college">
																									<option value="other">Other</option>
																									<option value="${college.college_name}">
																										${college.college_name}</option>
																								</c:forEach>
																							</select>
																						</div>
																						<br />
																						<div id="organization_text">
																							<input type="text" name="organization"
																								class="form-control" id="edu_organization"
																								maxlength="100" />
																						</div>
																					</div>
																				</div>
																				<div class="col-md-6">
																					<div class="form-group">
																						<label>Year of Passing</label> <input
																							type="number" name="end_date"
																							class="form-control" id="edu_enddate" min="1900"
																							max="${ProjectConstants.current_year}" required />
																					</div>
																				</div>
																				<div class="col-md-6">
																					<div class="form-group">
																						<label id="edu_board_label">Board/University</label>
																						<input type="text" name="board"
																							class="form-control" id="edu_board"
																							maxlength="80" required />
																					</div>
																				</div>
																				<div class="col-md-6" id="edu_department_div">
																					<div class="form-group">
																						<label>Stream/Degree</label> <select
																							class="form-control mySelect" name="department"
																							id="edu_departments">
																							<option selected value="" disabled="disabled">
																								--Select a Stream/Degree--</option>
																							<option value="1">CSE & DS</option>
																							<option value="2">Electronics &
																								Communication</option>
																							<option value="3">Civil Eng.</option>
																							<option value="4">B.E./B.Tech - Computer
																								Science and Engineering</option>
																							<option value="5">B.E./B.Tech -
																								Information Technology</option>
																							<option value="6">B.E./B.Tech -
																								Electronics and Communication Engineering</option>
																							<option value="7">B.E./B.Tech -
																								Electrical Engineering</option>
																							<option value="8">B.E./B.Tech -
																								Mechanical Engineering</option>
																							<option value="9">B.E./B.Tech - Civil
																								Engineering</option>
																							<option value="10">B.E./B.Tech -
																								Chemical Engineering</option>
																							<option value="11">B.E./B.Tech -
																								Aerospace Engineering</option>
																							<option value="12">B.E./B.Tech -
																								Biomedical Engineering</option>
																							<option value="13">B.E./B.Tech -
																								Environmental Engineering</option>
																							<option value="14">B.E./B.Tech -
																								Biotechnology Engineering</option>
																							<option value="15">B.A. - English
																								Literature</option>
																							<option value="16">B.A. - History</option>
																							<option value="17">B.A. - Political
																								Science</option>
																							<option value="18">B.A. - Sociology</option>
																							<option value="19">B.A. - Psychology</option>
																							<option value="20">B.A. - Philosophy</option>
																							<option value="21">B.A. - Economics</option>
																							<option value="22">B.A. - Journalism and
																								Mass Communication</option>
																							<option value="23">B.Sc. - Physics</option>
																							<option value="24">B.Sc. - Chemistry</option>
																							<option value="25">B.Sc. - Mathematics</option>
																							<option value="26">B.Sc. - Biology</option>
																							<option value="27">B.Sc. - Computer
																								Science</option>
																							<option value="28">B.Sc. - Biotechnology</option>
																							<option value="29">B.Sc. - Environmental
																								Science</option>
																							<option value="30">B.Sc. - Microbiology</option>
																							<option value="31">B.Sc. - Zoology</option>
																							<option value="32">B.Sc. - Botany</option>
																							<option value="33">B.Com. - Accounting
																								and Finance</option>
																							<option value="34">B.Com. - Banking and
																								Insurance</option>
																							<option value="35">B.Com. - Business
																								Economics</option>
																							<option value="36">B.Com. - Marketing
																								Management</option>
																							<option value="37">B.Com. - Business
																								Analytics</option>
																							<option value="38">BCA - General</option>
																							<option value="39">BCA - Data Science</option>
																							<option value="40">BCA - Artificial
																								Intelligence</option>
																							<option value="41">BBA - General</option>
																							<option value="42">BBA - Finance</option>
																							<option value="43">BBA - Marketing</option>
																							<option value="44">BBA - Human Resource
																								Management</option>
																							<option value="45">B.Ed - Bachelor of
																								Education</option>
																							<option value="46">LLB - Bachelor of
																								Laws</option>
																							<option value="47">MBBS - Bachelor of
																								Medicine and Bachelor of Surgery</option>
																							<option value="48">BDS - Bachelor of
																								Dental Surgery</option>
																							<option value="49">BAMS - Bachelor of
																								Ayurvedic Medicine and Surgery</option>
																							<option value="50">BHMS - Bachelor of
																								Homeopathic Medicine and Surgery</option>
																							<option value="51">BPT - Bachelor of
																								Physiotherapy</option>
																							<option value="52">M.E./M.Tech -
																								Artificial Intelligence</option>
																							<option value="53">M.E./M.Tech - Data
																								Science</option>
																							<option value="54">M.E./M.Tech -
																								Cybersecurity</option>
																							<option value="55">M.E./M.Tech -
																								Robotics</option>
																							<option value="56">M.E./M.Tech - VLSI
																								Design</option>
																							<option value="57">M.A. - International
																								Relations</option>
																							<option value="58">M.A. - Public
																								Administration</option>
																							<option value="59">M.A. - Social Work</option>
																							<option value="60">M.A. - Cultural
																								Studies</option>
																							<option value="61">M.Sc. - Applied
																								Physics</option>
																							<option value="62">M.Sc. - Organic
																								Chemistry</option>
																							<option value="63">M.Sc. -
																								Bioinformatics</option>
																							<option value="64">M.Com. - Corporate
																								Governance</option>
																							<option value="65">M.Com. - Financial
																								Management</option>
																							<option value="66">M.Com. -
																								International Business</option>
																							<option value="67">MCA - General</option>
																							<option value="68">MCA - Data Science</option>
																							<option value="69">MCA - Artificial
																								Intelligence</option>
																							<option value="70">MBA - General</option>
																							<option value="71">MBA - Finance</option>
																							<option value="72">MBA - Marketing</option>
																							<option value="73">MBA - Human Resource
																								Management</option>
																							<option value="74">MBA - Operations
																								Management</option>
																							<option value="75">MBA - Information
																								Technology</option>
																							<option value="76">M.Ed - Master of
																								Education</option>
																							<option value="77">LLM - Master of Laws</option>
																							<option value="78">MD/MS - Doctor of
																								Medicine/Master of Surgery</option>
																							<option value="79">MDS - Master of
																								Dental Surgery</option>
																							<option value="80">MPT - Master of
																								Physiotherapy</option>
																							<option value="81">PhD - Engineering</option>
																							<option value="82">PhD - Arts</option>
																							<option value="83">PhD - Commerce</option>
																							<option value="84">PhD - Computer
																								Applications</option>
																							<option value="85">PhD - Business
																								Administration</option>
																							<option value="86">PhD - Education</option>
																							<option value="87">PhD - Law</option>
																							<option value="88">PhD - Medicine</option>
																						</select>
																					</div>
																				</div>

																				<div class="col-md-6">
																					<div class="form-group">
																						<label>Marks(%)</label> <input type="text"
																							name="description" class="form-control"
																							id="edu_description"
																							pattern="[0-9]{1,2}([\.][0-9]{0,2})?" required />
																					</div>
																				</div>
																			</div>
																			<div class="pull-right form-group">
																				<input type="submit" class="btn btn-primary"
																					value="Save" />
																			</div>
																		</form>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- add task popup End -->
									</div>
								</div>
							</div>
							<!-- Tasks Tab End -->
							<!-- Setting Tab start -->
							<div class="tab-pane fade" id="tasks" role="tabpanel"> --%>
							<%-- <div class="pd-20 profile-task-wrap">
									<div class="container pd-0">
										<!-- Open Task start -->
										<div class="task-title row align-items-center">
											<div class="col-md-8 col-sm-12">
												<h5></h5>
											</div>
											<div class="col-md-4 col-sm-12 text-right">
												<a href="task-add" data-toggle="modal"
													data-target="#task-add"
													class="bg-light-blue btn text-blue weight-500"><i
													class="ion-plus-round"></i> Add</a>
											</div>
										</div>
										<div class="profile-task-list pb-30">
											<table id="edu_table"
												class="table table-bordered nowrap table-responsive">
												<thead class="thead-light">
													<tr>
														<th>Education</th>
														<th>Stream</th>
														<th>School/Institute</th>
														<th>Board/University</th>
														<th>Marks(%)</th>
														<th>Year of Passing</th>
														<th></th>
													</tr>
												</thead>
												<tbody>${studentPast}
													<c:forEach items="${studentPast}" var="studPast">
														<c:set var="past" value="${studPast.studentPast}" />
														<tr id="tr_${past.category}">
															<td>${past.category}</td>
															<td>${departmentName}</td>
															<td>${past.organization}</td>
															<td>${past.board}</td>
															<td>${past.description}</td>
															<td>${past.end_date}</td>
															<td style="white-space: nowrap; padding-left: 13px;"><c:if
																	test="${studPast.stud_past_id!=student.studentPast.stud_past_id}">
																	<i
																		onclick="editeducation('${studPast.stud_past_id}','${studPast.category}','${studPast.department}','${studPast.organization}','${studPast.board}','${studPast.description}','${studPast.end_date}')"
																		class="fa fa-pencil pr-2"
																		style="background: #0da0e2; color: white; padding: 3px 0 3px 7px; border-radius: 3px;"></i>
																	<i class="fa fa-times"
																		style="background: red; color: white; padding: 3px 0 3px 7px; border-radius: 3px;"
																		onclick="removeStudentEdu('${studPast.stud_past_id}')"
																		id="rem${studPast.stud_past_id}"></i>
																</c:if> <c:if
																	test="${studPast.stud_past_id==student.studentPast.stud_past_id}">
																	<i class="fa fa-info-circle"
																		style="background: #0da0e2; color: white; padding: 3px 7px 3px 7px; border-radius: 3px;"
																		title="Current Education cannot be edited/deleted!"></i>
																</c:if></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- Open Task End -->
										<!-- add task popup start -->
										<div class="modal fade customscroll" id="task-add"
											tabindex="-1" role="dialog">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLongTitle">Add
															Educational Qualification</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close" data-toggle="tooltip"
															data-placement="bottom" title=""
															data-original-title="Close Modal">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body pd-0">
														<div class="task-list-form">
															<ul>
																<li>
																	<div class="form-group row">
																		<label class="col-md-4">Select Category</label>
																		<div class="col-md-8">
																			<select id="degreeSelector" class="form-control"
																				style="display: inline; height: 100%;">
																				<option disabled="disabled" selected="selected">
																					--Select Category--</option>
																				<option value="SSC">SSC</option>
																				<option value="HSC">HSC</option>
																				<c:if test="${category eq 'DIPLOMA'}">
																					<option value="DIPLOMA">DIPLOMA</option>
																				</c:if>
																				<c:if
																					test="${category=='PG'||category=='PHD'||category=='none'||category==null}">
																					<option value="UG">UG</option>
																				</c:if>
																				<c:if
																					test="${category=='PHD'||category=='none'||category==null}">
																					<option value="PG">PG</option>
																				</c:if>
																				<c:if test="${category=='none'||category==null}">
																					<option value="PHD">PHD</option>
																				</c:if>
																			</select>
																		</div>
																	</div>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- add task popup End -->
									</div>
								</div>
							</div> --%>

							<div class="tab-pane fade height-100-p" id="setting"
								role="tabpanel">
								<div class="pd-20 profile-task-wrap">
									<div class="container pd-0">
										<!-- Open Task start -->
										<!-- <div class="task-title row align-items-center">
											<div class="col-md-8 col-sm-12">
												<h5></h5>
											</div>
											<div class="col-md-4 col-sm-12 text-right">
												<a href="prof-add1" data-toggle="modal"
													data-target="#prof-add1"
													class="bg-light-blue btn text-blue weight-500"><i
													class="ion-plus-round"></i> Add</a>
											</div>
										</div> -->
										<!-- <div class="profile-task-list pb-30">
											<table id="training_table"
												class="table table-bordered nowrap table-responsive">
												<thead class="thead-light">
													<tr>
														<th>Institute Name</th>
														<th>Training Program</th>
														<th>Skill</th>
														<th>Location</th>
														<th>Start Date</th>
														<th>End Date</th>
														<th style="width: 12px">Action</th>
													</tr>
												</thead>
												<tbody></tbody>
											</table>
										</div> -->
										<!-- <div id="project_div" class="professional_div">
											<legend>Project(s)</legend>
											<table id="project_table"
												class="table table-bordered nowrap table-responsive">
												<thead class="thead-light">
													<tr>
														<th>Project Title</th>
														<th>Role</th>
														<th>Skill</th>
														<th>Start Date</th>
														<th>End Date</th>
														<th>Project Link</th>
														<th>Description</th>
														<th style="width: 12px"></th>
													</tr>
												</thead>
												<tbody></tbody>
											</table>
										</div> -->



									</div>
								</div>
							</div>
							<!-- Setting Tab End -->
						</div>


						<!-- Edit Modal -->

						<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
							aria-labelledby="editModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg"
								role="document">
								<div class="modal-content rounded-4 shadow">

									<!-- Form -->
									<form action="updateStudentProfile" method="post">

										<!-- Modal Header -->
										<div class="modal-header bg-light border-bottom">
											<h5 class="modal-title d-flex align-items-center"
												id="editModalLabel">
												<i class="fas fa-user-edit mr-2 text-dark"></i> Edit Profile
												Info
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>

										<!-- Modal Body -->
										<div class="modal-body px-4 py-3">
											<input type="hidden" name="student_id"
												value="${student.student_id}" />

											<div class="form-group mb-3">
												<label><i class="fa fa-envelope mr-2 text-primary"></i>
													Email</label> <input type="email" name="email_id"
													class="form-control" value="${student.email_id}" required>
											</div>

											<div class="form-group mb-3">
												<label><i class="fa fa-phone mr-2 text-success"></i>
													Phone Number</label> <input type="text" name="contact"
													class="form-control" value="${student.contact}" required>
											</div>

											<div class="form-group mb-3">
												<label><i
													class="fa fa-map-marker-alt mr-2 text-danger"></i> Current
													City</label> <input type="text" name="curr_city"
													class="form-control" value="${student.curr_city}" required>
											</div>
											<div class="form-group mb-3">
												<label><i
													class="fa fa-calendar-alt mr-2 text-warning"></i> Date of
													Birth</label> <input type="date" name="d_o_b" class="form-control"
													value="${student.d_o_b}" required>
											</div>

											<div class="form-group mb-0">
												<label><i class="fab fa-linkedin mr-2 text-info"></i>
													LinkedIn</label> <input type="url" name="linkedIn"
													class="form-control" value="${student.linkedIn}">
											</div>
											<div class="form-group mb-0">
												<label><i class="fas fa-graduation-cap me-2 text-primary"></i> 

													Year</label> <input type="text" name="curr_year"
													class="form-control" value="${student.curr_year}">
											</div>
										</div>

										<!-- Modal Footer -->
										<div class="modal-footer bg-light">
											<button type="button" class="btn btn-outline-secondary"
												data-dismiss="modal">
												<i class="fas fa-times mr-1"></i> Cancel
											</button>
											<button type="submit" class="btn btn-dark">
												<i class="fas fa-save mr-1"></i> Save Changes
											</button>
										</div>

									</form>
								</div>
							</div>
						</div>



						<!-- Modal to Show List of Certifications -->
						<div class="modal fade" id="certificationsListModal" tabindex="-1"
							role="dialog" aria-labelledby="certificationsListLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header bg-primary text-white">
										<h5 class="modal-title">
											<i class="fas fa-certificate"></i> Your Certifications
										</h5>
										<button type="button" class="close text-white"
											data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div id="certificationList" class="row"
											style="max-height: 400px; overflow-y: auto;">
											<p id="noCertificationsMessage"
												class="text-muted text-center w-100">No certifications
												available.</p>
											<!-- Certifications will be dynamically added here -->

										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal to Add & Upload Certification -->


					</div>



					<!-- Modal to View Certificate -->
					<div class="modal fade" id="certificationsListModal" tabindex="-1"
						role="dialog" aria-labelledby="certificationsListLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="fas fa-certificate"></i> Your Certifications
									</h5>
									<button type="button" class="close text-white"
										data-bs-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div id="certificationList" class="row"
										style="max-height: 400px; overflow-y: auto;">
										<p id="noCertificationsMessage"
											class="text-muted text-center w-100">No certifications
											available.</p>
										<!-- Certifications will be dynamically added here -->
									</div>
									<!-- <button class="btn btn-primary mt-3" data-bs-toggle="modal"
											data-bs-target="#certificationModal">
											<i class="fas fa-plus-circle"></i> Add Another Certification
										</button>
 -->

								</div>
							</div>
						</div>
					</div>

					<!-- Edit Certification -->
					<div class="modal fade" id="editCertificationModal" tabindex="-1"
						aria-labelledby="editCertificationModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content rounded-4 shadow">

								<!-- Modal Header -->
								<div class="modal-header bg-light border-bottom">
									<h5 class="modal-title d-flex align-items-center gap-2"
										id="editCertificationModalLabel">
										<i class="fas fa-pen-to-square"></i> Edit Certification
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>

								<!-- Modal Body -->
								<div class="modal-body px-4 py-3">
									<input type="hidden" id="editCertId">

									<div class="mb-3">
										<label class="form-label"><i class="fas fa-award me-1"></i>
											Certification Name</label> <input type="text" class="form-control"
											id="editCertName">
									</div>

									<div class="mb-3">
										<label class="form-label"><i
											class="fas fa-building me-1"></i> Issued By</label> <input
											type="text" class="form-control" id="editCertIssuer">
									</div>

									<div class="mb-3">
										<label class="form-label"><i
											class="fas fa-calendar-alt me-1"></i> Issued Date</label> <input
											type="date" class="form-control" id="editCertDate">
									</div>

									<div class="mb-3">
										<label class="form-label"><i class="fas fa-link me-1"></i>
											Certificate Link</label>
										<!-- URL Input Field -->
										<input type="url" class="form-control" id="editCertUrl"
											placeholder="Enter certificate link">
									</div>

									<div class="mb-3">
										<label class="form-label"><i
											class="fas fa-upload me-1"></i> Upload Certificate</label>
										<!-- File Upload Input Field -->
										<input type="file" class="form-control" id="editCertFile"
											accept="application/pdf, .jpg, .png, .jpeg">
									</div>

								</div>

								<!-- Modal Footer -->
								<div class="modal-footer bg-light">
									<button type="button" class="btn btn-outline-danger me-auto"
										onclick="deleteCertification()">
										<i class="fas fa-trash-alt"></i> Delete
									</button>
									<button type="button" class="btn btn-outline-secondary"
										data-bs-dismiss="modal">
										<i class="fas fa-times"></i> Cancel
									</button>
									<button type="button" class="btn btn-primary"
										onclick="saveCertificationChanges()">
										<i class="fas fa-save"></i> Save Changes
									</button>
								</div>

							</div>
						</div>
					</div>


					<!-- Edit Project Modal -->
					<div class="modal fade" id="editProjectModal" tabindex="-1"
						aria-labelledby="editProjectModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content rounded-4 shadow">

								<!-- Modal Header -->
								<div class="modal-header bg-light border-bottom">
									<h5 class="modal-title d-flex align-items-center gap-2"
										id="editProjectModalLabel">
										<i class="fas fa-pen-to-square"></i> Edit Project
									</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>

								<!-- Modal Body -->
								<div class="modal-body px-4 py-3">
									<input type="hidden" id="editProjectId">

									<div class="mb-3">
										<label class="form-label"><i
											class="fas fa-heading me-1"></i> Title</label> <input type="text"
											class="form-control" id="editTitle">
									</div>

									<div class="mb-3">
										<label class="form-label"><i
											class="fas fa-align-left me-1"></i> Description</label>
										<textarea class="form-control" id="editDescription" rows="3" cols=""></textarea>
									</div>

									<div class="mb-3">
										<label class="form-label"><i
											class="fab fa-github me-1"></i> GitHub Link</label> <input type="url"
											class="form-control" id="editGithub">
									</div>
									<div class="mb-3">
										<label class="form-label"><i
											class="fas fa-file-alt me-1"></i> File Path</label>

										<!-- Display current file path if available -->
										<input type="text" class="form-control" id="editFilePath"
											value="current-file-path.pdf" readonly>

										<!-- Option to view the existing file (if a link is provided) -->
										<a id="viewFileLink" href="#" target="_blank"
											class="d-block mt-2" style="display: none;">View Current
											File</a>
									</div>

									<div class="mb-3">
										<label class="form-label"><i
											class="fas fa-upload me-1"></i> Upload New File</label>
										<!-- File Upload Input Field -->
										<input type="file" class="form-control" id="editCertFile"
											accept="application/pdf, .jpg, .png, .jpeg">
									</div>

								</div>

								<!-- Modal Footer -->
								<div class="modal-footer bg-light">
									<!-- Delete Button -->
									<button type="button" class="btn btn-outline-danger me-auto"
										onclick="deleteProject()">
										<i class="fas fa-trash-alt"></i> Delete
									</button>
									<button type="button" class="btn btn-outline-secondary"
										data-bs-dismiss="modal">
										<i class="fas fa-times"></i> Cancel
									</button>
									<button type="button" class="btn btn-primary" id="saveEditBtn">
										<i class="fas fa-save"></i> Save Changes
									</button>
								</div>

							</div>
						</div>
					</div>





					<input type="hidden" value="${user_data.email_id}"
						id="existing_emailid" /> <input type="hidden"
						value="${user_data.contact_no}" id="existing_contact" />


				</div>
			</div>
			<%@include file="modal_common.jsp"%>
			<%@include file="footer.jsp"%>



<script type="text/javascript">
			 function toggleSkillPanel() {
			        const panel = document.getElementById('skillPanel');
			        panel.style.display = (panel.style.display === 'none' || panel.style.display === '') ? 'block' : 'none';
			    }
			    function filterSkills() {
			        const searchQuery = document.getElementById('skillSearch').value.toLowerCase();
			        const skillItems = document.querySelectorAll('.skill-item');
			        skillItems.forEach(item => {
			            const skillLabel = item.querySelector('label').textContent.toLowerCase();
			            item.style.display = skillLabel.includes(searchQuery) ? 'block' : 'none';
			        });
			    }
			    function addOtherSkill() {
			        const otherSkill = document.getElementById('otherSkillInput').value.trim();
			        if (otherSkill !== '') {
			            const skillList = document.getElementById('skillList');
			            // Check if already added
			            const existing = document.getElementById('skill_' + otherSkill);
			            if (existing) {
			                existing.checked = true;
			                alert('Skill already added.');
			                return;
			            }
			            // Create checkbox for new skill
			            const div = document.createElement('div');
			            div.classList.add('form-check', 'skill-item');
			            div.innerHTML = `
			                <input type="checkbox" class="form-check-input" name="skills" value="${otherSkill}" id="skill_${otherSkill}" checked>
			                <label class="form-check-label" for="skill_${otherSkill}">${otherSkill}</label>
			            `;
			            skillList.appendChild(div);
			            document.getElementById('otherSkillInput').value = '';
			        }
			    }
</script>

			<script type="text/javascript">
  function deleteProject() {
    const id = document.getElementById("editProjectId").value;

    Swal.fire({
      title: 'Are you sure?',
      text: "This will delete the project permanently.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'Cancel',
    }).then((result) => {
      if (result.isConfirmed) {
        fetch("api/deleteProject/"+ id, { method: 'DELETE' })
          .then(res => {
            if (res.ok) {
              Swal.fire('Deleted!', 'Project has been deleted.', 'success')
                .then(() => location.reload());
            } else {
              Swal.fire('Error', 'Failed to delete project.', 'error');
            }
          })
          .catch(() => Swal.fire('Error', 'Something went wrong.', 'error'));
      }
    });
  }
</script>
			<script type="text/javascript">

			
			
			
			
function removeProfilePhoto() {
	 const studentId = "${user.id}"; /* Retrieve the studentId from a hidden field or other method */;

   fetch('remove-photo?studentId=' + studentId, {
       method: 'POST'
   })
   .then(response => response.json())
   .then(data => {
       if (data.success) {
    	   location.reload();
           alert("Profile photo removed successfully.");
       } else {
           alert("Error removing profile photo.");
       }
   })
   .catch(error => console.error('Error:', error));
}

</script>


			<script type="text/javascript">
//When the Edit button is clicked
$('.editProjectBtn').on('click', function () {
  const projectId = $(this).data('id');  // Get the project ID from the button's data attribute
  
  // Make an AJAX GET request to fetch project details
  $.ajax({
    url: 'api/projects/' + projectId, // Replace with your correct endpoint for getting project details
    type: 'GET',
    success: function (project) {
      // Pre-fill the modal with the current project data
      $('#editProjectId').val(project.id);
      $('#editTitle').val(project.title);
      $('#editDescription').val(project.description);
      $('#editGithub').val(project.githubLink);
      
      // If a file path exists, display the file link
      if (project.filePath) {
        $('#editFilePath').val(project.filePath);
        $('#viewFileLink').attr('href', '/path/to/file/' + project.filePath).show();
      } else {
        $('#viewFileLink').hide();
      }

      // Show the modal
      $('#editProjectModal').modal('show');
    },
    error: function () {
      alert('Error fetching project details');
    }
  });
});

// Save the changes when the "Save Changes" button is clicked
$('#saveEditBtn').on('click', function (e) {
  e.preventDefault(); // Prevent form submission
  
  const projectId = $('#editProjectId').val();
  
  // Create a FormData object to handle file upload
  const formData = new FormData();
  formData.append('title', $('#editTitle').val());
  formData.append('description', $('#editDescription').val());
  formData.append('githubLink', $('#editGithub').val());

  // Check if a new file is uploaded
  const fileInput = $('#editCertFile')[0].files[0];
  if (fileInput) {
    formData.append('file', fileInput); // Append the file to the FormData
  }

  // Make an AJAX PUT request to update the project
  $.ajax({
    url: 'api/projects/edit/' + projectId,
    type: 'PUT',
    data: formData,
    processData: false, // Don't process the data (important for file upload)
    contentType: false, // Let the browser set the correct content type
    success: function (response) {
      alert('Project updated successfully!');
      $('#editProjectModal').modal('hide');
      $('#projectsTabBtn').click(); // Reload the project list (or refresh the page)
    },
    error: function () {
      alert('Error updating project.');
    }
  });
});


</script>
			<script type="text/javascript">
			
						 const studentId = "${user.id}";
						
						// Function to update the profile photo
						function updateProfilePhoto(event) {
						    const formData = new FormData();
						    const fileInput = document.getElementById('newPhoto');
						    const studentId = /* Retrieve the studentId from a hidden field or other method */;

						    formData.append('newPhoto', fileInput.files[0]);
						    formData.append('studentId', studentId);

						    fetch('/update-photo', {
						        method: 'POST',
						        body: formData
						    })
						    .then(response => response.json())
						    .then(data => {
						        if (data.success) {
						            alert("Profile photo updated successfully.");
						            // Optionally, refresh the image on the page
						            document.getElementById('profileImage').src = '/api/profile/photo/' + studentId;
						        } else {
						            alert("Error updating profile photo.");
						        }
						    })
						    .catch(error => console.error('Error:', error));

						    event.preventDefault(); // Prevent the form from submitting normally
						}

						// Function to remove the profile photo
						

						
						</script>


			<script type="text/javascript">
						
						  document.getElementById('projectForm').addEventListener('submit', function(event) {
						    event.preventDefault();

						    const formData = new FormData();
						    formData.append('title', document.getElementById('projectTitle').value);
						    formData.append('description', document.getElementById('projectDescription').value);
						    formData.append('githubLink', document.getElementById('githubLink').value);

						    const files = document.getElementById('projectFiles').files;
						    if (files.length > 0) {
						      formData.append('file', files[0]); // Assuming only one file is handled server-side
						    }

						    fetch('api/projects', {
						      method: 'POST',
						      body: formData
						    })
						    .then(response => {
						      if (response.ok) {
						        Swal.fire({
						          icon: 'success',
						          title: 'Project submitted!',
						          showConfirmButton: false,
						          timer: 1500,
						          width: '300px'
						        }).then(() => {
						          location.reload();
						        });
						      } else {
						        Swal.fire({
						          icon: 'error',
						          title: 'Submission failed',
						          text: 'Please try again.',
						          width: '300px'
						        });
						      }
						    })
						    .catch(error => {
						      console.error('Error:', error);
						      Swal.fire({
						        icon: 'error',
						        title: 'An error occurred',
						        text: 'Please try again later.',
						        width: '300px'
						      });
						    });
						  });

</script>




			<script type="text/javascript">
$(document).ready(function() {
    // Add new certification to the list
    $("#certificationForm").submit(function(e) {
        e.preventDefault();
        
        let certName = $("#certificationName").val();
        let certId = "cert-" + new Date().getTime();
        
        let listItem = `<li class="list-group-item d-flex justify-content-between align-items-center">
            <span>${certName}</span>
            <button class="btn btn-sm btn-info upload-btn" data-id="${certId}" data-name="${certName}">Upload</button>
        </li>`;
        
        $("#certificationList").append(listItem);
        $("#addCertificationModal").modal("hide");
        $("#certificationForm")[0].reset();
    });
	
    // Open upload modal when "Upload" button is clicked
    $(document).on("click", ".upload-btn", function() {
        let certId = $(this).data("id");
        let certName = $(this).data("name");

        $("#uploadCertId").val(certId);
        $("#uploadCertificateLabel").text(`Upload Certificate for ${certName}`);
        
        $("#uploadCertificateModal").modal("show");
    });

    // Upload certificate
    $("#uploadCertificateForm").submit(function(e) {
        e.preventDefault();
        
        let certId = $("#uploadCertId").val();
        let certImage = $("#certificateImage")[0].files[0];
        let certLink = $("#certificateLink").val();
        
        let listItem = $(`[data-id="${certId}"]`).closest("li");
        
        if (certImage) {
            let imgURL = URL.createObjectURL(certImage);
            listItem.append(`<a href="#" class="ml-2 badge badge-success view-cert" data-image="${imgURL}">View</a>`);
        } else if (certLink) {
            listItem.append(`<a href="${certLink}" target="_blank" class="ml-2 badge badge-primary">Drive Link</a>`);
        }


        $("#uploadCertificateModal").modal("hide");
        $("#uploadCertificateForm")[0].reset();
    });

    // View certificate image
    $(document).on("click", ".view-cert", function() {
        let imgUrl = $(this).data("image");

        let modalBody = `
            <div class="text-center">
                <img src="${imgUrl}" class="img-fluid" alt="Certificate Image">
            </div>
        `;

        $("#uploadCertificateModal .modal-body").html(modalBody);
        $("#uploadCertificateModal").modal("show");
    });
});
    </script>
			<script type="text/javascript">
    
      function updateFileNameLabel(input) {
        var label = document.getElementById("profile_photo_label");
        if (input.files.length > 0) {
          label.innerText = input.files[0].name;
        } else {
          label.innerText = "Choose file";
        }
      }
    </script>
			<script type="text/javascript">
			 function toggleSkillPanel() {
			        const panel = document.getElementById('skillPanel');
			        panel.style.display = (panel.style.display === 'none' || panel.style.display === '') ? 'block' : 'none';
			    }
			    function filterSkills() {
			        const searchQuery = document.getElementById('skillSearch').value.toLowerCase();
			        const skillItems = document.querySelectorAll('.skill-item');
			        skillItems.forEach(item => {
			            const skillLabel = item.querySelector('label').textContent.toLowerCase();
			            item.style.display = skillLabel.includes(searchQuery) ? 'block' : 'none';
			        });
			    }
			    function addOtherSkill() {
			        const otherSkill = document.getElementById('otherSkillInput').value.trim();
			        if (otherSkill !== '') {
			            const skillList = document.getElementById('skillList');
			            // Check if already added
			            const existing = document.getElementById('skill_' + otherSkill);
			            if (existing) {
			                existing.checked = true;
			                alert('Skill already added.');
			                return;
			            }
			            // Create checkbox for new skill
			            const div = document.createElement('div');
			            div.classList.add('form-check', 'skill-item');
			            div.innerHTML = `
			                <input type="checkbox" class="form-check-input" name="skills" value="${otherSkill}" id="skill_${otherSkill}" checked>
			                <label class="form-check-label" for="skill_${otherSkill}">${otherSkill}</label>
			            `;
			            skillList.appendChild(div);
			            document.getElementById('otherSkillInput').value = '';
			        }
			    }
</script>
			<script type="text/javascript">
      document.addEventListener("DOMContentLoaded", function () {
        const avatarImage = document.getElementById("avatar-image");
        const modalPhoto = document.getElementById("modal-photo");

        avatarImage.addEventListener("click", function () {
          modalPhoto.src = avatarImage.src; 
          $("#photoModal").modal("show"); 
        });
      });
      
      
      
      </script>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" type="text/javascript"></script>

			<script type="text/javascript">
				$(document).ready(function () {
					  $('#projectsTabBtn').on('click', function () {
					    const ele = document.getElementById('projectsTab');
					    ele.style.display = "block";
					    const studentId = "${user.id}"; // Replace with actual user ID

					    $.ajax({
					      url: 'api/projectlist/' + studentId,
					      method: 'GET',
					      dataType: 'json',
					      success: function (projects) {
					        var projectList = $('#projectList');
					        var noProjectsMessage = $('#noProjectsMessage');

					        projectList.empty();
					        noProjectsMessage.hide();

					        if (projects.length === 0) {
					          noProjectsMessage.show();
					        } else {
					          projects.forEach(function (project) {
					            var fullDesc = project.description || '';
					            var shortDesc = fullDesc.length > 100 ? fullDesc.substring(0, 100) + '...' : fullDesc;
					            var showToggle = fullDesc.length > 100;

					            var descParagraph = $('<p>', { class: 'card-text mb-2' }).html(shortDesc);

					            var toggleLink = $('<a>', {
					              href: '#',
					              class: 'read-more-link text-primary d-block mb-2',
					              style: showToggle ? '' : 'display: none;',
					              text: 'Read More'
					            }).on('click', function (e) {
					              e.preventDefault();
					              if ($(this).text() === 'Read More') {
					                descParagraph.html(fullDesc);
					                $(this).text('Read Less');
					              } else {
					                descParagraph.html(shortDesc);
					                $(this).text('Read More');
					              }
					            });

					            // Pencil edit icon
					            var editIcon = $('<button>', {
					              class: 'btn btn-sm btn-light position-absolute top-0 end-0 m-2',
					              html: '<i class="bi bi-pencil-square text-primary"></i>',
					              click: function () {
					                $('#editProjectId').val(project.id);
					                $('#editTitle').val(project.title);
					                $('#editDescription').val(project.description);
					                $('#editGithub').val(project.githubLink);
					                $('#editFilePath').val(project.filePath);
					                $('#editProjectModal').modal('show');
					              }
					            });

					            var cardBody = $('<div>', { class: 'card-body position-relative' }).append(
					              $('<h5>', { class: 'card-title fw-bold mb-2 text-primary' }).text(project.title),
					              descParagraph,
					              toggleLink,
					              editIcon
					            );

					            // GitHub and Download buttons in one line
					            var buttonsDiv = $('<div>', { class: 'd-flex justify-content-start mt-3' });

					            if (project.githubLink) {
					              buttonsDiv.append(
					                $('<a>', {
					                  href: project.githubLink,
					                  target: '_blank',
					                  class: 'btn btn-sm btn-outline-primary me-2'
					                }).text('GitHub')
					              );
					            }

					            if (project.filePath) {
					              buttonsDiv.append(
					                $('<a>', {
					                  href: '/uploads/' + project.filePath,
					                  target: '_blank',
					                  class: 'btn btn-sm btn-outline-secondary'
					                }).text('Download File')
					              );
					            }

					            cardBody.append(buttonsDiv);

					            var projectCard = $('<div>', { class: 'col-md-4 mb-3' }).append(
					              $('<div>', { class: 'card h-100 shadow-sm position-relative' }).append(cardBody)
					            );

					            projectList.append(projectCard);
					          });
					        }
					      },
					      error: function () {
					        alert('Error loading projects. Please try again later.');
					      }
					    });
					  });
					});


</script>



			<script type="text/javascript">


    const studentId = "${user.id}"; // Replace with logged-in student ID

    
    
    function fetchCertifications() {
        console.log("Fetching certifications...");
        const ele = document.getElementById('projectsTab');
        ele.style.display = "none";

        $.ajax({
            url: "http://43.204.35.211:8080/skillpilots/certifications/" + studentId,
            type: "GET",
            success: function (data) {
                const certificationList = $("#certificationList");
                certificationList.empty();

                const noCertificationsMessage = $("#noCertificationsMessage");

                if (data.length === 0) {
                    if (noCertificationsMessage.length) {
                        noCertificationsMessage.show();
                    }
                } else {
                    if (noCertificationsMessage.length) {
                        noCertificationsMessage.hide();
                    }

                    data.forEach(cert => {
                        const certCard = $('<div>', { class: 'col-md-6' }).append(
                            $('<div>', { class: 'card shadow-lg p-3 mb-3 position-relative' }).append(

                                // Edit Button
                                $('<button>', {
                                    class: 'btn btn-sm btn-light position-absolute top-0 end-0 m-2',
                                    html: '<i class="bi bi-pencil-square text-primary"></i>',
                                    click: function () {
                                        // Populate modal fields with cert data
                                        $('#editCertificationModalLabel').html('<i class="fas fa-pen-to-square"></i> Edit Certification');
                                        $('#editCertId').val(cert.id);
                                        $('#editCertName').val(cert.name);
                                        $('#editCertIssuer').val(cert.companyName);
                                        $('#editCertDate').val(cert.issuueDate);
                                        $('#editCertUrl').val(cert.url);
                                        $('#editCertificationModal').modal('show');
                                    }
                                }),

                                $('<div>', { class: 'card-body pt-4' }).append(
                                    $('<h5>', {
                                        class: 'card-title',
                                        html: '<i class="fas fa-award me-1"></i> ' + cert.name
                                    }),
                                    $('<p>', {
                                        class: 'text-muted mb-1',
                                        html: '<strong>Issued By:</strong> ' + cert.companyName
                                    }),
                                    $('<p>', {
                                        html: '<strong>Issued Date:</strong> ' + cert.issuueDate
                                    }),
                                    cert.url ? $('<a>', {
                                        href: '#',
                                        class: 'btn btn-outline-primary btn-sm',
                                        html: '<i class="fas fa-eye"></i> View',
                                        click: function () {
                                            showPdf(cert.url);
                                        }
                                    }) : ''
                                )
                            )
                        );

                        certificationList.append(certCard);
                    });
                }
            },
            error: function () {
                alert("Error fetching certifications.");
            }
        });
    }



    function deleteCertification() {
        const certId = $('#editCertId').val();

        Swal.fire({
            title: 'Are you sure?',
            text: "This will permanently delete the certification.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "http://43.204.35.211:8080/skillpilots/deleteCertificate/"+certId,
                    type: "DELETE",
                    success: function () {
                        Swal.fire("Deleted!", "Certification has been removed.", "success");
                        $('#editCertificationModal').modal('hide');
                        fetchCertifications();
                    },
                    error: function () {
                        Swal.fire("Error", "Could not delete certification.", "error");
                    }
                });
            }
        });
    }
    function saveCertificationChanges() {
        const updatedCert = {
            name: $('#editCertName').val(),
            companyName: $('#editCertIssuer').val(),
            issuueDate: $('#editCertDate').val(),
            url: $('#editCertUrl').val()
        };
        const certId = $('#editCertId').val();

        $.ajax({
            url: "http://43.204.35.211:8080/skillpilots/updateCertificate/"+ certId,
            type: "PUT",
            contentType: "application/json",
            data: JSON.stringify(updatedCert),
            success: function () {
                Swal.fire("Updated!", "Certification updated successfully.", "success");
                $('#editCertificationModal').modal('hide');
                fetchCertifications();
            },
            error: function () {
                Swal.fire("Error", "Could not update certification.", "error");
            }
        });
    }


    function uploadCertification() {
        const formData = new FormData();
        formData.append("studentId", studentId);
        formData.append("name", $("#certificationName").val());
        formData.append("issueDate", $("#issueDate").val());
        formData.append("companyName", $("#issuingOrganization").val());
        formData.append("expiryDate", $("#expiryDate").val());

        const file = $("#certificateImage")[0].files[0];
        if (file) {
            formData.append("certificateFile", file);
        } else {
            formData.append("certificateUrl", $("#certificateLink").val());
        }

        $.ajax({
            url: "http://43.204.35.211:8080/skillpilots/addCertificate",
            type: "POST",
            processData: false,
            contentType: false,
            data: formData,
            success: function () {
/*                 alert("Certification uploaded successfully!");
 */                
                $("#addCertificationModal").modal("hide");
 location.reload();
                fetchCertifications();
            },
            error: function () {
                alert("Error uploading certification.");
            }
        });
    }
</script>



			<script type="text/javascript">
  function openProjectModal() {
    const projectModal = new bootstrap.Modal(document.getElementById('addProjectModal'));
    projectModal.show();
  }

</script>


			<script type="text/javascript">

function updateFileNameLabel(input, labelId) {
    var fileName = input.files.length > 0 ? input.files[0].name : "Choose file";
    document.getElementById(labelId).innerText = fileName;
  }




</script>

			<script type="text/javascript">
  window.addEventListener('DOMContentLoaded', function () {
    var greetingEl = document.getElementById('greetingMsg');
    var hour = new Date().getHours();

    var emoji = '';
    var greeting = '';

    if (hour >= 5 && hour < 12) {
      greeting = 'Good Morning';
      emoji = String.fromCodePoint(0x2600); // ☀️
    } else if (hour >= 12 && hour < 17) {
      greeting = 'Good Afternoon';
      emoji = String.fromCodePoint(0x1F324); // 🌤️
    } else if (hour >= 17 && hour < 21) {
      greeting = 'Good Evening';
      emoji = String.fromCodePoint(0x1F319); // 🌙
    } else {
      greeting = 'Good Night';
      emoji = String.fromCodePoint(0x1F303); // 🌃
    }

    greetingEl.textContent = emoji + ' ' + greeting;
  });
</script>


			<script type="text/javascript">

function uploadResumeAPI() {
    console.log("Uploading resume...");

    const fileInput = document.getElementById("resume");
    const file = fileInput.files[0];

    if (!file) {
        alert("Please select a file.");
        return;
    }

   

    const formData = new FormData();
    formData.append("file", file); // Append the file

    fetch("resume", {
        method: "POST",
        body: formData // ✅ Ensure body contains FormData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.text();
    })
    .then(data => {
        //alert(data);
        location.reload(); // ✅ Refresh to show updated resume link
    })
    .catch(error => {
        console.error("Upload failed:", error);
        alert("Upload failed. Please try again.");
    });
}

function showAlert(message, type = 'success') {
    const alertBox = document.getElementById('alertBox');
    const alertMessage = document.getElementById('alertMessage');

    alertMessage.textContent = message;
    alertBox.className = `alert alert-${type} alert-dismissible fade show small`;
    alertBox.classList.remove('d-none');

    setTimeout(() => {
        hideAlert();
    }, 3000);
}

function hideAlert() {
    document.getElementById('alertBox').classList.add('d-none');
}
function deleteResume(studentId) {
    Swal.fire({
        title: "Are you sure?",
        text: "Do you really want to delete your resume?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            fetch("/skillpilot/deleteResume?studentId=" + studentId, {
                method: "DELETE"
            })
            .then(res => {
                if (res.ok) {
                    Swal.fire({
                        title: "Deleted!",
                        text: "Your resume has been deleted.",
                        icon: "success",
                        timer: 1500,
                        showConfirmButton: false
                    });
                    setTimeout(() => location.reload(), 1600);
                } else {
                    return res.text().then(msg => { throw new Error(msg); });
                }
            })
            .catch(err => {
                console.error(err);
                Swal.fire("Error", "Delete failed. Please try again.", "error");
            });
        }
    });
}


</script>



			<script type="text/javascript">

			function showPdf(fileName) {
				console.log("sssssssss",fileName);
			    const iframe = document.getElementById("certificateIframe");
			    // If file is external (e.g., Google Drive or Microsoft), open in new tab
			    if (fileName.includes("drive.google.com") || fileName.includes("microsoft.com") || fileName.startsWith("http")) {
			        window.open(fileName, '_blank');
			    } else {
			        iframe.src = '${pageContext.request.contextPath}/viewFile/' + fileName;
			        // Open modal only for local/internal files
			        const modal = new bootstrap.Modal(document.getElementById('viewCertificateModal'));
			        modal.show();
			    }
			}


			</script>


			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" type="text/javascript"></script>

			<%@include file="modal_stud_past.jsp"%>
			<%@include file="scriptfiles.jsp"%>
			<script
				src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js" type="text/javascript"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility.js"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/js/myjs/student_past_edu.js" type="text/javascript"></script>
			<script
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUlCQ6MBRc_JIpz68S5-7prwYjevo1s1M&amp;libraries=places&amp;callback=initAutocomplete"
				async defer type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/js/myjs/geolocation2.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/apexcharts/apexcharts.min.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
			<script
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js" type="text/javascript"></script>
			<script type="text/javascript">
      $("
		#homeCityCheck").change(function () {
        if
		($(this).is(":checked")) {
          var returnVal=$(
					"#address-autocomplete").val();
          $("#address-autocomplete2").val(returnVal);
        } else {
          $("#address-autocomplete2").val("");
        }
      });

      var
					project_table=$( "#project_table").DataTable({
        searching:
					false,
        paging: false,
        info:
					false,
      });
      var training_table=$(
					"#training_table").DataTable({
        searching:
					false,
        paging: false,
        info:
					false,
      });
      var worksample_table=$(
					"#worksample_table").DataTable({
        searching:
					false,
        paging: false,
        info:
					false,
      });
      var internship_table=$(
					"#internship_table").DataTable({
        searching:
					false,
        paging: false,
        info:
					false,
      });
      var job_table=$(
					"#job_table").DataTable({
        searching:
					false,
        paging: false,
        info:
					false,
      });
      $(document).ready(function
					() {
        $.ajax({
          type: "get",
          url: "getStudentPastProfessions",
          success:
					function (studentPastProfession) {
            if
					(studentPastProfession.length> 0) {
              $("#empty_professional_div").hide();
              for (i = 0; i < studentPastProfession.length; i++) {
                addStudentProfRow(studentPastProfession[i]);
              }
              if (project_table.rows().any()) $("#project_div").show();
              else $("#project_div").hide();

              if (training_table.rows().any()) $("#training_div").show();
              else $("#training_div").hide();

              if (worksample_table.rows().any()) $("#worksample_div").show();
              else $("#worksample_div").hide();

              if (internship_table.rows().any()) $("#internship_div").show();
              else $("#internship_div").hide();

              if (job_table.rows().any()) $("#job_div").show();
              else $("#job_div").hide();
            } else {
              $("#project_div").hide();
              $("#training_div").hide();
              $("#worksample_div").hide();
              $("#internship_div").hide();
              $("#job_div").hide();
              $("#empty_professional_div").show();
            }
          },
          error: function (error) {
            alert(error);
          },
        });

        //this code checkbox address is same checkbox already checked
        if (
          $("#address-autocomplete").val() == $("#address-autocomplete2").val()
        ) {
          $("#homeCityCheck").prop("checked", true);
        }
      });

      function clear_prof_form() {
        $("#prof_stud_past_id").val("0");
        $("#prof_category").val("");
        $("#professionSelector").prop("disabled", false);
        $("#professionSelector1").prop("disabled", false);
        document.getElementById("prof_div").style.display = "none";
        document.getElementById("prof_div1").style.display = "none";
        $("#prof_organization").val("");
        $("#prof_profile").val("");
        $("#prof_description").val("");
        $("#prof_location").val("");
        $("#prof_department").val("");
        $("#prof_link").val("");
        $("#prof_start_date").val("");
        $("#prof_end_date").val("");
        $("#prof_stud_past_id1").val("0");
        $("#prof_category1").val("");

        $("#prof_organization1").val("");
        $("#prof_profile1").val("");
        $("#prof_description1").val("");
        $("#prof_location1").val("");
        $("#prof_department1").val("");
        $("#prof_link1").val("");
        $("#prof_start_date1").val("");
        $("#prof_end_date1").val("");
      }

      function editprofession(
        stud_past_id,
        category,
        organization,
        location,
        profile,
        department,
        start_date,
        end_date,
        link,
        description
      ) {
        clear_prof_form();
        console.log(stud_past_id);
        if (stud_past_id != "0") {
          $("#prof_stud_past_id").val(stud_past_id);
          $("#prof_category").val(category);
          $("#professionSelector").val(category);
          $("#professionSelector").prop("disabled", true);
          $("#professionSelector").change();
          $("#prof_organization").val(organization);
          $("#prof_location").val(location);
          $("#prof_profile").val(profile);
          $("#prof_department").val(department);
          $("#prof_start_date").val(start_date);
          $("#prof_end_date").val(end_date);
          $("#prof_link").val(link);
          $("#prof_description").val(description);
        } else $("#professionSelector").val("");
        $("#addMoreProfession").modal("show");
        document.getElementById("prof_div").style.display = "block";
      }

      $("#professionSelector").change(function () {
        if ($("#prof_stud_past_id").val() == "0") clear_prof_form();
        $("#prof_category").val($(this).val());
        if ($(this).val() != "W") {
          $("#organization_div").show();
          $("#prof_organization").prop("required", true);
          $("#profile_div").show();
          $("#prof_profile").prop("required", true);
          $("#department_div").show();
          $("#prof_department").prop("required", true);
          $("#startdate_div").show();
          $("#prof_start_date").prop("required", true);
          $("#enddate_div").show();
          $("#prof_end_date").prop("required", true);

          if ($(this).val() != "P") {
            $("#location_div").show();
            $("#prof_location").prop("required", true);
          } else {
            $("#location_div").hide();
            $("#prof_location").prop("required", false);
          }

          if ($(this).val() == "I" || $(this).val() == "P") {
            $("#link_div").show();
          } else {
            $("#link_div").hide();
            $("#prof_link").prop("required", false);
          }

          if ($(this).val() == "T") {
            $("#organization_label").text("Institute/Organization Name");
            $("#profile_label").text("Training Program");
            $("#description_div").hide();
            $("#prof_description").prop("required", false);
          } else if ($(this).val() == "P") {
            $("#organization_label").text("Project Title");
          } else {
            $("#organization_label").text("Industry");
            $("#profile_label").text("Role");
            $("#description_div").show();
            $("#prof_description").prop("required", true);
          }
        } else {
          $("#organization_div").hide();
          $("#prof_organization").prop("required", false);
          $("#profile_div").hide();
          $("#prof_profile").prop("required", false);
          $("#description_div").hide();
          $("#prof_description").prop("required", false);
          $("#location_div").hide();
          $("#prof_location").prop("required", false);
          $("#department_div").hide();
          $("#prof_department").prop("required", false);
          $("#link_div").show();
          $("#prof_link").prop("required", true);
          $("#startdate_div").hide();
          $("#prof_start_date").prop("required", false);
          $("#enddate_div").hide();
          $("#prof_end_date").prop("required", false);
        }
        //document.getElementById("prof_div").style.display = "block";
        document.getElementById("prof_div").style.display = "block";
      });

      $("#professionSelector1").change(function () {
        if ($("#prof_stud_past_id1").val() == "0") clear_prof_form();
        $("#prof_category1").val($(this).val());
        if ($(this).val() != "W") {
          $("#organization_div1").show();
          $("#prof_organization1").prop("required", true);
          $("#profile_div1").show();
          $("#prof_profile1").prop("required", true);
          $("#department_div1").show();
          $("#prof_department1").prop("required", true);
          $("#startdate_div1").show();
          $("#prof_start_date1").prop("required", true);
          $("#enddate_div1").show();
          $("#prof_end_date1").prop("required", true);

          if ($(this).val() != "P") {
            $("#location_div1").show();
            $("#prof_location1").prop("required", true);
          } else {
            $("#location_div1").hide();
            $("#prof_location1").prop("required", false);
          }

          if ($(this).val() == "I" || $(this).val() == "P") {
            $("#link_div1").show();
          } else {
            $("#link_div1").hide();
            $("#prof_link1").prop("required", false);
          }

          if ($(this).val() == "T") {
            $("#organization_label1").text("Institute/Organization Name");
            $("#profile_label1").text("Training Program");
            $("#description_div1").hide();
            $("#prof_description1").prop("required", false);
          } else if ($(this).val() == "P") {
            $("#organization_label1").text("Project Title");
          } else {
            $("#organization_label1").text("Industry");
            $("#profile_label1").text("Role");
            $("#description_div1").show();
            $("#prof_description1").prop("required", true);
          }
        } else {
          $("#organization_div1").hide();
          $("#prof_organization1").prop("required", false);
          $("#profile_div1").hide();
          $("#prof_profile1").prop("required", false);
          $("#description_div1").hide();
          $("#prof_description1").prop("required", false);
          $("#location_div1").hide();
          $("#prof_location1").prop("required", false);
          $("#department_div1").hide();
          $("#prof_department1").prop("required", false);
          $("#link_div1").show();
          $("#prof_link1").prop("required", true);
          $("#startdate_div1").hide();
          $("#prof_start_date1").prop("required", false);
          $("#enddate_div1").hide();
          $("#prof_end_date1").prop("required", false);
        }
        //document.getElementById("prof_div").style.display = "block";
        document.getElementById("prof_div1").style.display = "block";
      });

      $("#prof_form1").on("submit", function (event) {
        event.preventDefault();
        if (
          new Date($("#prof_end_date1").val()) <
          new Date($("#prof_start_date1").val())
        ) {
          alert("End date should be after Start date.");
          return false;
        }
        var fdata = $(this).serialize();
        console.log(fdata);
        $.ajax({
          type: "get",
          url: "saveStudentPast",
          data: fdata,
          datatype: "json",
          success: function (response) {
            alert("Successfully Saved!");
            if ($("#prof_stud_past_id1").val() != "0")
              removeStudentProfRow(
                $("#prof_stud_past_id1").val(),
                $("#prof_category1").val()
              );

            addStudentProfRow({
              stud_past_id: response,
              category: $("#prof_category1").val(),
              organization: $("#prof_organization1").val(),
              profile: $("#prof_profile1").val(),
              description: $("#prof_description1").val(),
              location: $("#prof_location1").val(),
              department: $("#prof_department1").val(),
              link: $("#prof_link1").val(),
              start_date: $("#prof_start_date1").val(),
              end_date: $("#prof_end_date1").val(),
            });

            $("#empty_professional_div").hide();
            $("#addMoreProfession").modal("hide");
            window.location.reload();
          },
          error: function (error) {
            alert(error);
            alert(error_fetch);
          },
        });
      });

      $("#prof_form").on("submit", function (event) {
        event.preventDefault();
        if (
          new Date($("#prof_end_date").val()) <
          new Date($("#prof_start_date").val())
        ) {
          alert("End date should be after Start date.");
          return false;
        }
        var fdata = $(this).serialize();
        console.log(fdata);
        $.ajax({
          type: "get",
          url: "saveStudentPast",
          data: fdata,
          datatype: "json",
          success: function (response) {
            alert("Successfully Saved!");
            if ($("#prof_stud_past_id").val() != "0")
              removeStudentProfRow(
                $("#prof_stud_past_id").val(),
                $("#prof_category").val()
              );

            addStudentProfRow({
              stud_past_id: response,
              category: $("#prof_category").val(),
              organization: $("#prof_organization").val(),
              profile: $("#prof_profile").val(),
              description: $("#prof_description").val(),
              location: $("#prof_location").val(),
              department: $("#prof_department").val(),
              link: $("#prof_link").val(),
              start_date: $("#prof_start_date").val(),
              end_date: $("#prof_end_date").val(),
            });

            $("#empty_professional_div").hide();
            $("#addMoreProfession").modal("hide");
            window.location.reload();
          },
          error: function (error) {
            alert(error);
            alert(error_fetch);
          },
        });
      });

   
      function addStudentProfRow(studentPastProfession) {
        var action_col =
          "<i class='fa fa-pencil pr-2'" +
          'style="background: #0da0e2;color:white;padding: 3px 7px 3px 7px;margin-right: 4px;border-radius: 3px;" onclick="editprofession(\'' +
          studentPastProfession.stud_past_id +
          "','" +
          studentPastProfession.category +
          "','" +
          studentPastProfession.organization +
          "','" +
          studentPastProfession.location +
          "','" +
          studentPastProfession.profile +
          "','" +
          studentPastProfession.department +
          "','" +
          studentPastProfession.start_date +
          "','" +
          studentPastProfession.end_date +
          "','" +
          studentPastProfession.link +
          "','" +
          studentPastProfession.description +
          "')\"></i><i class='fa fa-times' style=\"background: red;color:white;padding: 3px 7px 3px 7px;border-radius: 3px;\" id='rem" +
          studentPastProfession.stud_past_id +
          "'" +
          "onclick=\"removeStudentPast('" +
          studentPastProfession.stud_past_id +
          "','" +
          studentPastProfession.category +
          "')\"></i>";
        if (studentPastProfession.category == "P") {
          project_table.row
            .add([
              studentPastProfession.organization,
              studentPastProfession.profile,
              studentPastProfession.department,
              studentPastProfession.start_date,
              studentPastProfession.end_date,
              studentPastProfession.link,
              studentPastProfession.description,
              action_col,
            ])
            .draw(false);
          $("#project_div").show();
        } else if (studentPastProfession.category == "T") {
          training_table.row
            .add([
              studentPastProfession.organization,
              studentPastProfession.profile,
              studentPastProfession.department,
              studentPastProfession.location,
              studentPastProfession.start_date,
              studentPastProfession.end_date,
              action_col,
            ])
            .draw(false);
          $("#training_div").show();
        } else if (studentPastProfession.category == "W") {
          worksample_table.row
            .add([
              "<a href='http://" +
                studentPastProfession.link +
                "' target='_blank'>" +
                studentPastProfession.link +
                "</a>",
              action_col,
            ])
            .draw(false);
          $("#worksample_div").show();
        } else if (studentPastProfession.category == "I") {
          internship_table.row
            .add([
              studentPastProfession.organization,
              studentPastProfession.location,
              studentPastProfession.profile,
              studentPastProfession.department,
              studentPastProfession.start_date,
              studentPastProfession.end_date,
              studentPastProfession.link,
              studentPastProfession.description,
              action_col,
            ])
            .draw(false);
          $("#internship_div").show();
        } else if (studentPastProfession.category == "J") {
          job_table.row
            .add([
              studentPastProfession.organization,
              studentPastProfession.location,
              studentPastProfession.profile,
              studentPastProfession.department,
              studentPastProfession.start_date,
              studentPastProfession.end_date,
              studentPastProfession.description,
              action_col,
            ])
            .draw(false);
          $("#job_div").show();
        }
      }

      function removeStudentProfRow(studentPastId, category) {
        if (category == "P")
          project_table
            .row($("#rem" + studentPastId).parents("tr"))
            .remove()
            .draw();
        else if (category == "T")
          training_table
            .row($("#rem" + studentPastId).parents("tr"))
            .remove()
            .draw();
        else if (category == "W")
          worksample_table
            .row($("#rem" + studentPastId).parents("tr"))
            .remove()
            .draw();
        else if (category == "I")
          internship_table
            .row($("#rem" + studentPastId).parents("tr"))
            .remove()
            .draw();
        else if (category == "J")
          job_table
            .row($("#rem" + studentPastId).parents("tr"))
            .remove()
            .draw();
      }

      function removeStudentEdu(studPastId) {
        console.log(
          "Attempting to remove student education with ID:",
          studPastId
        );

        if (confirm("Are you sure you want to delete this record?")) {
          $.ajax({
            url:
              "removeStudentPast/" +
              studPastId,
            type: "DELETE",
            success: function (response) {
              if (response === "success") {
                window.location.reload();
              } else {
                console.log("Delete failed: ", response);
              }
            },
            error: function (xhr, status, error) {
              console.log("Error during delete:", xhr.responseText);
            },
          });
        }
      }
    
</script>
			<script type="text/javascript">
      let cat = document.getElementById("edu_category1").value;
      console.log("---------------------", cat);
    </script>
			<script type="text/javascript">
			function toggleCustomInput(selectElement) {
			    const input = document.getElementById("customUniversity");
			    if (selectElement.value === "other") {
			        input.style.display = "block";
			        input.setAttribute("required", "required");
			    } else {
			        input.style.display = "none";
			        input.removeAttribute("required");
			    }
			}
			
			
  function toggleCustomInput(select) {
    const customInput = document.getElementById('customInstitute');
    if (select.value === 'other') {
      customInput.style.display = 'block';
      customInput.required = true;
      select.name = "temp"; // Prevent duplicate name
    } else {
      customInput.style.display = 'none';
      customInput.required = false;
      customInput.value = '';
      select.name = "organization"; // Restore original name
    }
  }
</script>
</div></div></body>
</html>