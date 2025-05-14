
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="user_session.jsp"%>

<!-- role 1 and role 2 same sidebar -->
<!-- this sidebar for company hr mahanger tl -->
<c:if
	test="${user.role eq '1' || user.role eq '2' || user.role eq '3' || user.role eq '4'}">
	<div class="menu-block customscroll">
		<div class="sidebar-menu">
			<ul id="accordion-menu">
				<li><a href="company_dashboard"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-house-1"></span><span class="mtext">Open
							Internships</span>
				</a></li>

				<li><a href="company_internships"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-certificate"></span><span class="mtext">Internships
							Status</span>
				</a></li>

				<c:if test="${user.role eq '1' || user.role eq '2'}">
					<li><a href="company_posts" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-computer"></span><span class="mtext">Publish
								Internship </span>
					</a></li>
				</c:if>
				<c:if test="${user.role eq '1' || user.role eq '2'}">
					<li><a href="recruitment_campus"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-computer"></span><span class="mtext">Publish
								Jobs</span>
					</a></li>
				</c:if>
				<c:if test="${user.role eq '1' || user.role eq '2'}">
					<li><a href="external_internship_request_company"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-computer-1"></span><span class="mtext">Current
								Applicant </span>
					</a></li>
				</c:if>
				<li><a href="company_internal_request"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-computer-1"></span><span class="mtext">Onboard
							Request </span>
				</a></li>
				<c:if test="${user.role eq '3' || user.role eq '4'}">
					<li><a href="company_study_material"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-book"></span><span class="mtext">Study
								Material </span>
					</a></li>
				</c:if>


				<!-- 	<li><a href="college_tie_up" class="dropdown-toggle no-arrow">
      <span class="micon dw dw-repeat-1"></span><span class="mtext">Institute Tie-Ups</span>
  </a></li> -->
				<li><a href="add_company_member"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-user-11"></span><span class="mtext">Manage
							Teams</span>
				</a></li>
				<c:if test="${user.role eq '1' || user.role eq '2'}">
					<li><a href="company_online_test"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-personal-computer"></span><span class="mtext">Manage
								Test</span>
					</a></li>
				</c:if>
				<li hidden><a href="companyTransactions"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-money-2"></span><span class="mtext">Balances</span>
				</a></li>

				<c:if test="${user.role eq '1' || user.role eq '2'}">
					<li><a href="certificate" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-certificate-1"></span><span
							class="mtext">Certificates</span>
					</a></li>
				</c:if>
				<c:if test="${user.role eq '1' || user.role eq '2'}">
					<li><a href="company_report" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-file3"></span><span class="mtext">Internship
								Reports</span>
					</a></li>
				</c:if>
				<li><a href="live_chat" class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-chat3"></span><span class="mtext">Live
							Chat</span>
				</a></li>
				<li><a href="meet" class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-chat3"></span><span class="mtext">SkillMeet</span>
				</a></li>
			</ul>
		</div>
	</div>
</c:if>

<!-- all role of company sidebar ended -->

<!-- college dashboard  sidebar -->

<c:if
	test="${user.role eq '5' || user.role eq '6' || user.role eq '7' || user.role eq '8'}">
	<div class="menu-block customscroll">
		<div class="sidebar-menu">
			<ul id="accordion-menu">
				<li><a href="college_dashboard"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-house-1"></span><span class="mtext">Open
							Internships</span>
				</a></li>
				<c:if
					test="${user.role eq '5' || user.role eq '6' || user.role eq '7'}">
					<li><a href="tandp_dashboard" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house"></span><span class="mtext">T&P
								Dashboard</span>
					</a></li>
				</c:if>
				<li><a href="collegeViewInternships"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-certificate"></span><span class="mtext">Internships
							Status</span>
				</a></li>

				<c:if test="${user.role eq '5' || user.role eq '6'}">
					<li><a href="external_internship_request_college"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-computer-1"></span><span class="mtext">Current
								Applicants </span>
					</a></li>
				</c:if>

				<li><a href="college_internal_req"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-computer-1"></span><span class="mtext">
							Requests Onboard</span>
				</a></li>

				<c:if test="${user.role eq '8' || user.role eq '7'}">
					<li><a href="student_list" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-user3"></span><span class="mtext">Enroll
								Students</span>
					</a></li>
					<li><a href="getAppliedStudentsOfCollege"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-computer-1"></span><span class="mtext">Students
								Request</span>
					</a></li>
				</c:if>
				<c:if test="${user.role eq '5' || user.role eq '6'}">
					<li><a href="getAppliedStudentsOfCollege"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-user3"></span><span class="mtext">Student
								Application</span>
					</a></li>
				</c:if>
				<li hidden><a href="comp_tie_up"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-flow"></span><span class="mtext">Industry
							Tie-ups</span>
				</a></li>
				<li><a href="college_dept" class="dropdown-toggle no-arrow">
						<span class="micon dw dw-time-management"></span><span
						class="mtext">Manage Departments</span>
				</a></li>
				<c:if test="${user.role eq '7'}">
					<li><a href="study_material" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-book"></span> <!-- Use an appropriate icon -->
							<span class="mtext">Study Material</span>
					</a></li>
				</c:if>
				<c:if test="${user.role eq '7'}">
					<li hidden><a href="get_Assessment_Test_Data"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-file-26"></span><span class="mtext">Self
								Assessment </span>
					</a></li>
				</c:if>
				<li hidden><a href="collegeTransactions"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-balance"></span><span class="mtext">Balances</span>
				</a></li>

				<li><a href="certificate" class="dropdown-toggle no-arrow">
						<span class="micon dw dw-certificate-1"></span><span class="mtext">Certificate</span>
				</a></li>
				<c:if test="${user.role ne 5}">
					<li><a href="live_chat" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat3"></span><span class="mtext">Live
								Chat</span>
					</a></li>
				</c:if>
				<li><a href="college_report" class="dropdown-toggle no-arrow">
						<span class="micon dw dw-edit-2"></span><span class="mtext">Internship
							Reports</span>
				</a></li>
				<li><a href="meet" class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-chat3"></span><span class="mtext">SkillMeet</span>
				</a></li>
			</ul>
		</div>
	</div>
</c:if>

<!-- college all role sidebar ended -->

<!-- internal and external students -->
<c:if test="${user.role eq '0' || user.role eq '10'}">
	<div class="menu-block customscroll">
		<div class="sidebar-menu">
			<ul id="accordion-menu">
			<li><a href="${pageContext.request.contextPath}/dash"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-house-1"></span><span class="mtext">Dashboard</span>
					</a></li>
				<li><a href="${pageContext.request.contextPath}/stud_home"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-house-1"></span><span class="mtext">Open
							Internships</span>
				</a></li>

				<c:if test="${user.role eq 0}">
					<li><a href="campusDriveForStudentsDashboard"
						class="dropdown-toggle no-arrow"> <span
							class="micon dw dw-list"></span><span class="mtext">College
								Campus Drive </span>
					</a></li>
				</c:if>

				<li><a href="companyCampusDriveForStudentsDashboard"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-list"></span><span class="mtext">Live
							Openings </span>
				</a></li>

				<li><a href="studentinternships"
					class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-certificate"></span><span class="mtext">Internships
							Status</span>
				</a></li>
				<li><a href="appliedCompanies" class="dropdown-toggle no-arrow">
						<span class="micon dw dw-personal-computer"></span><span
						class="mtext">Requests Status</span>
				</a></li>
				<li class="dropdown"><a href="#"
					class="dropdown-toggle no-arrow" data-toggle="dropdown"> <span
						class="micon dw dw-edit2"></span> <span class="mtext">Study
							Material</span>
				</a>
					<ul class="submenu">
						<li><a href="view_company">View Company Material</a></li>
						<c:if test="${user.role eq 0}">

							<li><a href="study_material">Notes</a></li>
						</c:if>
						<li><a href="viewAssignments">View Assignments</a></li>
						<li hidden><a href="downloadAssignments">Download
								Assignments</a></li>
					</ul></li>


				<li><a href="https://exam.skillpilots.com/" class="dropdown-toggle no-arrow">
						<span class="micon dw dw-file-26"></span><span class="mtext">Self
							Assessment </span>
				</a></li>
				<c:if test="${user.role eq 10 || user.role eq 0}">
					<li><a href="live_chat" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-chat3"></span><span class="mtext">Live
								Chat</span>
					</a></li>
				</c:if>

				<li><a href="meet" class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-chat3"></span><span class="mtext">SkillMeet</span>
				</a></li>
				<li><a href="stud_testHistory" class="dropdown-toggle no-arrow">
						<span class="micon dw dw-file-411"></span><span class="mtext">Test
							History</span>
				</a></li>

				<li><a href="cv1" class="dropdown-toggle no-arrow"> <span
						class="micon dw dw-certificate"></span><span class="mtext">Resume/CV</span>
				</a></li>


				<li><a href="certificate" class="dropdown-toggle no-arrow">
						<span class="micon dw dw-certificate-1"></span><span class="mtext">Internship
							Certificate</span>
				</a></li>
				<li hidden><a href="viewCompAndApply" class="dropdown-toggle no-arrow">
						<span class="micon dw dw-list"></span><span class="mtext">Industry
							List</span>
				</a></li>

			</ul>
		</div>
	</div>
</c:if>
<!-- internal and external students end -->
