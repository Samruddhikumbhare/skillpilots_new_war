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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico" />

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- Google Font -->
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

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
      window.dataLayer = window.dataLayer || [];
      function gtag() {
        dataLayer.push(arguments);
      }
      gtag("js", new Date());

      gtag("config", "UA-119386393-1");
    </script>
<style type="text/css">
.cert-card {
	border-radius: 15px;
	transition: all 0.3s ease-in-out;
}

.cert-card:hover {
	transform: scale(1.03);
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
}

.btn-outline-primary:hover {
	background: #007bff;
	color: white;
}

/* SCROLL ENABLED WHEN NO CERTIFICATIONS EXIST */
#certificationListContainer {
	max-height: 400px;
	overflow-y: auto;
	padding-right: 10px;
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
																		<td style="white-space: nowrap; padding-left: 13px;">
																			<c:if
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
																			</c:if>
																		</td>
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
																	<h5 class="modal-title" id="exampleModalLongTitle">
																		Add Educational Qualification</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close"
																		data-toggle="tooltip" data-placement="bottom" title=""
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
																											<c:forEach items="${allColleges}"
																												var="college">
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
																										class="form-control" id="edu_enddate"
																										min="1900"
																										max="${ProjectConstants.current_year}"
																										required />
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
																										class="form-control mySelect"
																										name="department" id="edu_departments">
																										<option selected value="" disabled="disabled">
																											--Select a Stream/Degree--</option>
																										<option value="1">CSE & DS</option>
																										<option value="2">Electronics &
																											Communication</option>
																										<option value="3">Civil Eng.</option>
																										<option value="4">B.E./B.Tech -
																											Computer Science and Engineering</option>
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
																										<option value="19">B.A. - Psychology
																										</option>
																										<option value="20">B.A. - Philosophy
																										</option>
																										<option value="21">B.A. - Economics</option>
																										<option value="22">B.A. - Journalism
																											and Mass Communication</option>
																										<option value="23">B.Sc. - Physics</option>
																										<option value="24">B.Sc. - Chemistry
																										</option>
																										<option value="25">B.Sc. -
																											Mathematics</option>
																										<option value="26">B.Sc. - Biology</option>
																										<option value="27">B.Sc. - Computer
																											Science</option>
																										<option value="28">B.Sc. -
																											Biotechnology</option>
																										<option value="29">B.Sc. -
																											Environmental Science</option>
																										<option value="30">B.Sc. -
																											Microbiology</option>
																										<option value="31">B.Sc. - Zoology</option>
																										<option value="32">B.Sc. - Botany</option>
																										<option value="33">B.Com. -
																											Accounting and Finance</option>
																										<option value="34">B.Com. - Banking
																											and Insurance</option>
																										<option value="35">B.Com. - Business
																											Economics</option>
																										<option value="36">B.Com. - Marketing
																											Management</option>
																										<option value="37">B.Com. - Business
																											Analytics</option>
																										<option value="38">BCA - General</option>
																										<option value="39">BCA - Data Science
																										</option>
																										<option value="40">BCA - Artificial
																											Intelligence</option>
																										<option value="41">BBA - General</option>
																										<option value="42">BBA - Finance</option>
																										<option value="43">BBA - Marketing</option>
																										<option value="44">BBA - Human
																											Resource Management</option>
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
																										<option value="57">M.A. -
																											International Relations</option>
																										<option value="58">M.A. - Public
																											Administration</option>
																										<option value="59">M.A. - Social Work
																										</option>
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
																										<option value="68">MCA - Data Science
																										</option>
																										<option value="69">MCA - Artificial
																											Intelligence</option>
																										<option value="70">MBA - General</option>
																										<option value="71">MBA - Finance</option>
																										<option value="72">MBA - Marketing</option>
																										<option value="73">MBA - Human
																											Resource Management</option>
																										<option value="74">MBA - Operations
																											Management</option>
																										<option value="75">MBA - Information
																											Technology</option>
																										<option value="76">M.Ed - Master of
																											Education</option>
																										<option value="77">LLM - Master of
																											Laws</option>
																										<option value="78">MD/MS - Doctor of
																											Medicine/Master of Surgery</option>
																										<option value="79">MDS - Master of
																											Dental Surgery</option>
																										<option value="80">MPT - Master of
																											Physiotherapy</option>
																										<option value="81">PhD - Engineering
																										</option>
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
																		<td>${department}</td>
																		<td>${studPast.organization}</td>
																		<td>${studPast.board}</td>
																		<td>${studPast.description}</td>
																		<td>${studPast.end_date}</td>
																		<td style="white-space: nowrap; padding-left: 13px;">
																			<c:if
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
																			</c:if>
																		</td>
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
																	<h5 class="modal-title" id="exampleModalLongTitle">
																		Add Educational Qualification</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close"
																		data-toggle="tooltip" data-placement="bottom" title=""
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
										</div>

										<div class="tab-pane fade height-100-p" id="setting"
											role="tabpanel">
											<div class="pd-20 profile-task-wrap">
												<div class="container pd-0">
													<!-- Open Task start -->
													<div class="task-title row align-items-center">
														<div class="col-md-8 col-sm-12">
															<h5></h5>
														</div>
														<div class="col-md-4 col-sm-12 text-right">
															<a href="prof-add1" data-toggle="modal"
																data-target="#prof-add1"
																class="bg-light-blue btn text-blue weight-500"><i
																class="ion-plus-round"></i> Add</a>
														</div>
													</div>
													<div class="profile-task-list pb-30">
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
													</div>
													<div id="project_div" class="professional_div">
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
													</div>
													<div id="training_div" class="professional_div">
														<legend>Training(s)</legend>
														<table id="training_table" class="table table-bordered">
															<thead>
																<tr>
																	<th>Institute Name</th>
																	<th>Training Program</th>
																	<th>Skill</th>
																	<th>Location</th>
																	<th>Start Date</th>
																	<th>End Date</th>
																	<th style="width: 12px"></th>
																</tr>
															</thead>
															<tbody></tbody>
														</table>
													</div>
													<div id="worksample_div" class="professional_div">
														<legend>Work Sample(s)</legend>
														<table id="worksample_table" class="table table-bordered">
															<thead>
																<tr>
																	<th>Work Sample Link</th>
																	<th style="width: 12px"></th>
																</tr>
															</thead>
															<tbody></tbody>
														</table>
													</div>

													<div id="internship_div" class="professional_div">
														<legend>Internship(s)</legend>
														<table id="internship_table"
															class="table table-bordered nowrap table-responsive">
															<thead>
																<tr>
																	<th>Industry</th>
																	<th>Location</th>
																	<th>Role</th>
																	<th>Skill</th>
																	<th>Start Date</th>
																	<th>End Date</th>
																	<th>Project Link</th>
																	<th>Description</th>
																	<th style="width: 12px; white-space: nowrap"></th>
																</tr>
															</thead>
															<tbody></tbody>
														</table>
													</div>

													<div id="job_div" class="professional_div">
														<legend>Job(s)</legend>
														<table id="job_table"
															class="table table-bordered nowrap table-responsive">
															<thead>
																<tr>
																	<th>Industry</th>
																	<th>Location</th>
																	<th>Role</th>
																	<th>Skill</th>
																	<th>Start Date</th>
																	<th>End Date</th>
																	<th>Description</th>
																	<th style="width: 12px"></th>
																</tr>
															</thead>
															<tbody></tbody>
														</table>
													</div>
													<!-- Open Task End -->
													<!-- add task popup start -->
													<div class="modal fade customscroll" id="prof-add1"
														tabindex="-1" role="dialog">
														<div class="modal-dialog modal-dialog-centered"
															role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLongTitle">
																		Add Professional Details</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close"
																		data-toggle="tooltip" data-placement="bottom" title=""
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
																						<select id="professionSelector1"
																							class="form-control"
																							style="display: inline; width: 150px;">
																							<option disabled="disabled" selected="selected">
																								--Select Category--</option>
																							<option value="P">Project</option>
																							<option value="T">Training</option>
																							<option value="W">Work Sample</option>
																							<option value="I">Internship</option>
																							<option value="J">Job</option>
																						</select>
																					</div>
																				</div>
																				<div id="prof_div1" style="display: none">
																					<form id="prof_form1">
																						<input type="hidden" name="stud_past_id"
																							id="prof_stud_past_id1" /> <input type="hidden"
																							value="${user_data.user_id}" name="student_id1" />
																						<input type="hidden" name="category"
																							id="prof_category1" />
																						<div class="row"
																							style="margin-right: 0px; margin-left: 0px;">
																							<div class="col-md-6" id="organization_div1">
																								<div class="form-group">
																									<label id="organization_label1">Company
																										Name</label> <input type="text"
																										id="prof_organization1" name="organization"
																										class="form-control" required maxlength="100" />
																								</div>
																							</div>
																							<div class="col-md-6" id="profile_div1">
																								<div class="form-group">
																									<label id="profile_label1">Role</label> <input
																										type="text" name="profile" id="prof_profile1"
																										maxlength="50" class="form-control" required />
																								</div>
																							</div>
																							<div class="col-md-6" id="description_div1">
																								<div class="form-group">
																									<label>Description</label> <input type="text"
																										name="description" id="prof_description1"
																										class="form-control" required maxlength="1000" />
																								</div>
																							</div>
																							<div class="col-md-6" id="location_div1">
																								<div class="form-group">
																									<label>Location</label> <input type="text"
																										name="location" id="prof_location1"
																										class="form-control" required maxlength="100" />
																								</div>
																							</div>
																							<div class="col-md-6" id="department_div1">
																								<div class="form-group">
																									<label>Skills</label> <input type="text"
																										name="department" id="prof_department1"
																										value="hhh" class="form-control" required
																										maxlength="80" />
																								</div>
																							</div>
																							<div class="col-md-6" id="link_div1">
																								<div class="form-group">
																									<label>Link</label> <input type="text"
																										name="link" id="prof_link1"
																										class="form-control" required maxlength="100"
																										pattern="[a-zA-Z0-9_\-]+(\.[a-zA-Z0-9_\-]+){2,3}$"
																										title="www.example.com" />
																								</div>
																							</div>
																						</div>
																						<div class="row"
																							style="margin-right: 0px; margin-left: 0px;">
																							<div class="col-md-6">
																								<div class="form-group" id="startdate_div1">
																									<label>Start Date</label> <input type="text"
																										name="start_date" id="prof_start_date1"
																										class="form-control date-picker"
																										readonly="true" pattern="dd/MM/yyyy" required />
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group" id="enddate_div1">
																									<label>End Date</label> <input type="text"
																										name="end_date" id="prof_end_date1"
																										class="form-control date-picker"
																										readonly="true" required />
																								</div>
																							</div>
																						</div>
																						<div class="form-group" style="text-align: center">
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
										<!-- Setting Tab End -->
									</div>
								</div>
							</div>
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
								<button class="btn btn-success mt-4 w-100" data-toggle="modal"
									data-target="#addCertificationModal">
									<i class="fas fa-plus"></i> Add New Certification
								</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal to Add & Upload Certification -->
				<div class="modal fade" id="addCertificationModal" tabindex="-1"
					role="dialog" aria-labelledby="addCertificationLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header bg-success text-white">
								<h5 class="modal-title">
									<i class="fas fa-upload"></i> Add & Upload Certification
								</h5>
								<button type="button" class="close text-white"
									data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="certificationForm">
									<div class="form-group">
										<label><i class="fas fa-certificate"></i>
											Certification Name</label> <input type="text" class="form-control"
											id="certificationName" required>
									</div>
									<div class="form-group">
										<label><i class="fas fa-building"></i> Issuing
											Organization</label> <input type="text" class="form-control"
											id="issuingOrganization" required>
									</div>
									<div class="form-group">
										<label><i class="fas fa-calendar-alt"></i> Issued Date</label>
										<input type="date" class="form-control" id="issueDate"
											required>
									</div>
									<div class="form-group">
										<label><i class="fas fa-calendar-times"></i> Expiry
											Date (optional)</label> <input type="date" class="form-control"
											id="expiryDate">
									</div>
									<div class="form-group">
										<label><i class="fas fa-file-upload"></i> Upload
											Certificate</label> <input type="file" class="form-control-file"
											id="certificateImage" accept="image/*">
									</div>
									<div class="form-group">
										<label><i class="fas fa-link"></i> Google Drive Link
											(optional)</label> <input type="url" class="form-control"
											id="certificateLink">
									</div>
									<button type="button" class="btn btn-success w-100"
										onclick="uploadCertification()">
										<i class="fas fa-save"></i> Save Certification
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal to View Certificate -->
				<!-- Modal to View Certificate -->
				<div class="modal fade" id="viewCertificateModal" tabindex="-1" role="dialog" aria-labelledby="viewCertificateModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="viewCertificateModalLabel"><i class="fas fa-certificate"></i> View Certificate</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <iframe id="certificateIframe" width="100%" height="600px" style="border: none;"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fas fa-times"></i> Close</button>
            </div>
        </div>
    </div>
</div>


				<div class="modal fade" id="photoModal" tabindex="-1" role="dialog"
					aria-labelledby="photoModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="photoModalLabel">Student Photo
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<img src="" alt="Student Photo" id="modal-photo"
									style="width: 100%" />
							</div>
						</div>
					</div>
				</div>

				<input type="hidden" value="${user_data.email_id}"
					id="existing_emailid" /> <input type="hidden"
					value="${user_data.contact_no}" id="existing_contact" />


				<%@include file="modal_common.jsp"%>
				<%@include file="footer.jsp"%>

				<script>
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
				<script>
    
      function updateFileNameLabel(input) {
        var label = document.getElementById("profile_photo_label");
        if (input.files.length > 0) {
          label.innerText = input.files[0].name;
        } else {
          label.innerText = "Choose file";
        }
      }
    </script>
				<script>
      document.addEventListener("DOMContentLoaded", function () {
        const avatarImage = document.getElementById("avatar-image");
        const modalPhoto = document.getElementById("modal-photo");

        avatarImage.addEventListener("click", function () {
          modalPhoto.src = avatarImage.src; // Set modal photo source
          $("#photoModal").modal("show"); // Show modal
        });
      });
      
      
      
      </script>
				<script>


    const studentId = "${user.id}"; // Replace with logged-in student ID

    function fetchCertifications() {
    	
    	console.log("sssssssssssssss",studentId);
        $.ajax({
            url: "http://localhost:8001/skillpilot/certifications/" + studentId,
            type: "GET",
            success: function(data) {
                const certificationList = $("#certificationList");
                certificationList.empty();

                if (data.length === 0) {
                    $("#noCertificationsMessage").show();
                } else {
                    $("#noCertificationsMessage").hide();
                    data.forEach(cert => {
                        const certCard = 
                            '<div class="col-md-6">' +
                                '<div class="card shadow-lg p-3 mb-3">' +
                                    '<div class="card-body">' +
                                        '<h5 class="card-title"><i class="fas fa-award"></i> ' + cert.name + '</h5>' +
                                        '<p class="text-muted"><strong>Issued By:</strong> ' + cert.companyName + '</p>' +
                                        '<p><strong>Issued Date:</strong> ' + cert.issuueDate + '</p>' +
                                        (cert.url ? 
                                            '<a href="#" onclick="showPdf(\'' + cert.url + '\')" class="btn btn-outline-primary btn-sm">' +
                                                '<i class="fas fa-eye"></i> View' +
                                            '</a>' 
                                        : '') +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                        certificationList.append(certCard);
                    });

                }
            },
            error: function() {
                alert("Error fetching certifications.");
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
            url: "http://localhost:8001/skillpilot/addCertificate",
            type: "POST",
            processData: false,
            contentType: false,
            data: formData,
            success: function () {
                alert("Certification uploaded successfully!");
                $("#addCertificationModal").modal("hide");
                fetchCertifications();
            },
            error: function () {
                alert("Error uploading certification.");
            }
        });
    }
</script>

<script>

function showPdf(fileName) {
    if (fileName.includes("drive.google.com")) {
        window.open(fileName, '_blank'); // Opens Google Drive link in a new tab
    } else {
    	fileUrl = `${pageContext.request.contextPath}/uploads/` + fileName;
        window.open(fileUrl, '_blank');
    }
}


			</script>








    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%@include file="modal_stud_past.jsp"%> <%@include file="scriptfiles.jsp"%>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
    <script
      type="text/javascript"
      src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"
    ></script>
    <script
      type="text/javascript"
      src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility.js"
    ></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/student_past_edu.js"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUlCQ6MBRc_JIpz68S5-7prwYjevo1s1M&libraries=places&callback=initAutocomplete"
      async
      defer
    ></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/geolocation2.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js"></script>
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

      function removeStudentPast(studentPastId, category) {
        $.ajax({
          type: "get",
          url: "removeStudentPast?past_id=" + studentPastId,
          success: function (response) {
            removeStudentProfRow(studentPastId, category);
          },
          error: function (error) {
            alert(error);
          },
        });
      }

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
              "${pageContext.request.contextPath}/removeStudentPast/" +
              studPastId,
            type: "DELETE",
            success: function (response) {
              // Check response from the server
              if (response === "success") {
                window.location.reload();
              } else {
                console.log("Delete failed: ", response);
                // Handle failure (e.g., show message to user)
              }
            },
            error: function (xhr, status, error) {
              console.log("Error during delete:", xhr.responseText);
              // Handle error (e.g., show message to user)
            },
          });
        }
      }
    </script>

				<script>
      let cat = document.getElementById("edu_category1").value;
      console.log("---------------------", cat);
    </script>
</body>
</html>