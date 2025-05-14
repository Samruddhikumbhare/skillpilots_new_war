<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
  <title>Student Dashboard</title>
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
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #f8f9fa, #e0e0e0);
      margin: 0;
      padding: 20px;
      color: #333;
    }
    .container {
      max-width: 1200px;
      margin: auto;
    }
    .top-section {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: linear-gradient(to right, #5e60ce, #7400b8);
      padding: 30px;
      border-radius: 20px;
      color: white;
      margin-bottom: 20px;
    }
    .greeting h2 {
      margin: 0;
      font-size: 28px;
    }
    .greeting p {
      font-size: 16px;
      margin: 5px 0;
    }
    .avatar {
      width: 70px;
      height: 70px;
      border-radius: 50%;
      background: url('https://i.ibb.co/xgKzrP6/avatar.png') center/cover no-repeat;
      margin-right: 15px;
    }
    .profile-card {
      display: flex;
      align-items: center;
    }
    .visit-btn {
      margin-top: 10px;
      background: #fff;
      color: #5e60ce;
      padding: 8px 15px;
      border: none;
      border-radius: 12px;
      cursor: pointer;
      font-weight: 600;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(330px, 1fr));
      gap: 20px;
      margin-bottom: 20px;
    }
    .card {
      background: rgba(255, 255, 255, 0.6);
      backdrop-filter: blur(12px);
      border-radius: 20px;
      padding: 20px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    .card h3 {
      margin-bottom: 15px;
      font-size: 20px;
      color: #5e60ce;
    }
    .assessment-table {
      width: 100%;
      border-collapse: collapse;
    }
    .assessment-table th, .assessment-table td {
      padding: 10px;
      text-align: left;
    }
    .assessment-table th {
      background-color: #f0f0f0;
      font-weight: 600;
    }
    .job-circle {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      background: #5e60ce;
      color: white;
      font-size: 24px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 10px 0;
    }
    .course {
      margin-bottom: 15px;
    }
    .progress-bar {
      background: #ddd;
      border-radius: 50px;
      height: 14px;
      width: 100%;
      overflow: hidden;
    }
    .progress {
      height: 100%;
      border-radius: 50px;
      transition: width 1s ease-in-out;
    }
    .uiux { background: #ff6b6b; }
    .frontend { background: #4dabf7; }
    .python { background: #38d9a9; }

    .date {
      background-color: white;
      color: #5e60ce;
      padding: 5px 15px;
      border-radius: 12px;
      display: inline-block;
      font-weight: bold;
      font-size: 14px;
      margin-bottom: 10px;
    }
  </style>
</head>
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
<div class="container">
  <div class="top-section">
    <div>
      <div class="date">${date}</div>
      <div class="greeting">
        <h2>Hey Good Day ${user.name}</h2>
        <p><i class="fas fa-graduation-cap"></i> Education is not preparation for life; education is life itself.</p>
      </div>
    </div>
    <div class="profile-card">
      <div class="avatar"></div>
      <div>
        <div><strong>${user.name}</strong><br>Front-End Developer crafting clean, responsive websites. <a href="#" style="color: #fff;">Read More</a></div>
        <button class="visit-btn">Visit Profiles</button>
      </div>
    </div>
  </div>

  <div class="grid">
    <div class="card">
      <h3>ASSESSMENT</h3>
      <table class="assessment-table">
        <tr><th>Test Name</th><th>Levels</th><th>Scores</th></tr>
        <c:forEach var="a" items="${assessments}">
          <tr>
            <td>${a.test}</td>
            <td>${a.level}</td>
            <td>${a.score}</td>
          </tr>
        </c:forEach>
      </table>
    </div>

    <div class="card">
      <h3>INTERNSHIP</h3>
      <p><i class="fas fa-briefcase"></i> Completed Internships: <strong>${internshipsCompleted}</strong></p>
    </div>

    <div class="card">
      <h3>JOB</h3>
      <div class="job-circle">${acceptedJobs}</div>
      <p><i class="fas fa-file-alt"></i> Applications: ${jobApplications}</p>
      <p><i class="fas fa-check-circle"></i> Accepted: ${acceptedJobs}</p>
      <p><strong>Job Apply:</strong> ${acceptedJobs}/${jobApplications}</p>
    </div>
  </div>

  <div class="grid">
    <div class="card" style="grid-column: span 2;">
      <h3>COURSE STATUS</h3>
      <div class="course">
        <label>UI&UX Designer - ${courseProgress.UIUX}%</label>
        <div class="progress-bar"><div class="progress uiux" style="width:${courseProgress.UIUX}%"></div></div>
      </div>
      <div class="course">
        <label>Frontend Development - ${courseProgress.Frontend}%</label>
        <div class="progress-bar"><div class="progress frontend" style="width:${courseProgress.Frontend}%"></div></div>
      </div>
      <div class="course">
        <label>Python - ${courseProgress.Python}%</label>
        <div class="progress-bar"><div class="progress python" style="width:${courseProgress.Python}%"></div></div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
