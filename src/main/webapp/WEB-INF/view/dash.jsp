<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Dashboard</title>
  
  <link rel="apple-touch-icon" sizes="180x180"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
   <link rel="icon" type="image/png" sizes="16x16"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>
  <link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet" />
<!-- CSS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f3f4f6;
    }
    .container {
     
      max-width: 1200px;
      margin: auto;
    }
    
     .card {
    background-color: white;
    border-radius: 15px;
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }

 .grid {
  display: flex;
  flex-wrap: wrap; /* Allows wrap on smaller screens */
  gap: 20px;
}

  .chart-container {
    width: 100%;
    max-width: 200px;
    height: 200px;
    margin: 10px auto 0;
    position: relative;
  }

  canvas {
    width: 100% !important;
    height: 100% !important;
  }
    .header{
      background-color: white;
      border-radius: 15px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .header {
      background-color: #1e3a8a;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
    }
    .profile-card {
      display: flex;
      align-items: center;
      gap: 15px;
    }
    .profile-pic {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      flex-shrink: 0;
    }
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 20px;
    }
    .progress-bar {
      background-color: #e5e7eb;
      border-radius: 10px;
      overflow: hidden;
      height: 10px;
      margin-top: 5px;
    }
    .progress {
      height: 10px;
      background-color: #2563eb;
    }
    ul {
      padding-left: 20px;
    }
    .highlight {
      color: #2563eb;
    }
    .flex-layout {
      display: flex;
      flex-direction: row;
      flex-wrap: wrap;
      gap: 20px;
      align-items: flex-start;
    }
    .profile-info {
      max-width: 300px;
      flex-shrink: 0;
    }
    .main-info {
      flex-grow: 1;
    }
    button {
      background-color: white;
      border: 1px solid #2563eb;
      color: #2563eb;
      padding: 5px 10px;
      border-radius: 5px;
      cursor: pointer;
    }
    button:hover {
      background-color: #2563eb;
      color: white;
    }
   .modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0; top: 0;
  width: 100%; height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  animation: fadeIn 0.3s ease;
}

.modal-content {
  background: #fff;
  margin: 10% auto;
  padding: 20px;
  width: 50%;
  border-radius: 10px;
  animation: slideIn 0.4s ease;
}

@keyframes fadeIn {
  from { opacity: 0; } to { opacity: 1; }
}
@keyframes slideIn {
  from { transform: translateY(-20px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}
  </style>
</head>
<body style="margin: 45px; padding-left: 180px; display: flex">


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
	</div>







  <div class="container" >
<div class="" style="background-color: #1f3c88;border-radius: 12px;display: flex; align-items: flex-start; margin-top:-20px; margin-bottom: 20px;">
  
  <!-- Left Blue Info Box (smaller) -->
  <div class="main-info" style="background-color: #1f3c88; color: white; border-radius: 12px; padding: 16px 20px; flex: 1;">
    <div style="background-color: #dbe2ef; color: #1f3c88; padding: 4px 10px; border-radius: 10px; display: inline-block; font-weight: bold; font-size: 14px;">
      ${date}
    </div>
    <h2 style="margin-top: 12px; color:#C0C0C0; font-size: 30px;">Hey Good Day ${user.name}</h2>
    <p style="font-size: 20px;"><em>Education is not preparation for life; education is life itself. 🎓</em></p>
  </div>

  <!-- Right Profile Card (with black text) -->
  <div class="profile-card" style="background-color: #f0f2f5; border-radius: 12px; padding: 20px; display: flex; align-items: center; box-shadow: 0 4px 12px rgba(0,0,0,0.1); color: black; max-width: 700px; margin: 10px 10px;">
  
  <!-- Profile Image (Left Column) -->
  <div style="flex-shrink: 0; margin-right: 20px;">
    <img src="<c:url value='/get_logo'/>" alt="Student Photo"
         style="width: 140px; height: 140px; object-fit: cover; border: 4px solid #007BFF; border-radius: 50%;">
  </div>
  
  <!-- Info (Right Column) -->
  <div style="flex-grow: 1;">
    <h2 style="margin: 0; font-size: 24px;">${user.name}</h2>
 <p id="bioText" style="font-size: 18px; margin: 10px 0;">
  Front-End Developer crafting clean, responsive websites. 
  <span id="moreText" style="display: none;"> Passionate about UX/UI and always eager to learn new tools and technologies.</span>
  <span id="toggleText" style="color: #007BFF; cursor: pointer;" onclick="toggleReadMore()">Read More</span>
  <span onclick="openModal()" title="Edit" style="cursor: pointer; margin-left: 10px;">✏️</span>
</p>

   <button 
  style="padding: 8px 16px; border: none; background-color: #e7f0fe; border-radius: 8px; color: #1f3c88; font-weight: bold; cursor: pointer;" 
  onclick="window.location.href='${pageContext.request.contextPath}/editStudentProfile'">
  Visit Profile
</button>

  </div>

</div>


</div>

<div class="grid">
  <!-- Assessment Card -->
  <div class="card">
    <h6 style="font-size: 20px;  color: #1f3c88;">Assessment</h6>
    <c:forEach var="assessment" items="${assessments}">
      <p style="margin: 0 0 2px;">${assessment.name} (${assessment.level}): ${assessment.score} Marks</p>
    </c:forEach>

    <div class="chart-container">
      <canvas id="assessmentChart"></canvas>
    </div>
  </div>

  <!-- Internships Card -->
  <div class="card">
    <h6 style="font-size: 20px;  color: #1f3c88;">Internships</h6>
    <ul style="padding-left: 0px;">
      <li >✅ ${internships.approved} Applications Pending</li>
      <li>✔️ ${internships.completed} Internships Ongoing</li>
    </ul>
    <p class="highlight">Completed Internships: ${internships.totalSubmitted}</p>
     <div class="chart-container">
    <canvas id="internshipChart"></canvas>
  </div>
  </div>

  <!-- Jobs Card -->
  <div class="card">
    <h6 style="font-size: 20px; color: #1f3c88;">Jobs</h6>
    <p style="margin: 0 0 1px;"><strong class="highlight">Job Apply: ${jobs.applied}/${jobs.total}</strong></p>
    <p style="margin: 0 0 1px;">Job Applications: ${jobs.total}</p>
    <p style="margin: 0 0 1px;">Accepted Profiles: ${jobs.accepted}</p>
    <!-- Chart -->
  <div class="chart-container">
  <canvas id="simpleJobsBarChart" style="max-height: 300px; margin-top: 20px;"></canvas>

  </div>
  </div>
</div>
<script>
  const simpleJobsCtx = document.getElementById('simpleJobsBarChart').getContext('2d');
  new Chart(simpleJobsCtx, {
    type: 'bar',
    data: {
      labels: ['Total Jobs', 'Applied', 'Accepted'],
      datasets: [{
        label: 'Job Stats',
        data: [${jobs.total}, ${jobs.applied}, ${jobs.accepted}],
        backgroundColor: ['#FFCE56', '#36A2EB', '#4BC0C0']
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          suggestedMax: ${jobs.total}
        }
      }
    }
  });
</script>

<script>
  const internshipCtx = document.getElementById('internshipChart').getContext('2d');
  new Chart(internshipCtx, {
    type: 'doughnut',
    data: {
      labels: ['Pending Applications', 'Ongoing/Completed'],
      datasets: [{
        data: [${internships.approved}, ${internships.completed}],
        backgroundColor: ['#FF9F40', '#4BC0C0']
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'right'
        }
      }
    }
  });
</script>

<script>
  const labels = [
    <c:forEach var="assessment" items="${assessments}" varStatus="loop">
      "${assessment.name}"<c:if test="${!loop.last}">,</c:if>
    </c:forEach>
  ];

  const data = [
    <c:forEach var="assessment" items="${assessments}" varStatus="loop">
      ${assessment.score}<c:if test="${!loop.last}">,</c:if>
    </c:forEach>
  ];

  const ctx = document.getElementById('assessmentChart').getContext('2d');
  new Chart(ctx, {
    type: 'pie',
    data: {
      labels: labels,
      datasets: [{
        data: data,
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0']
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'right',
          labels: {
            boxWidth: 12
          }
        }
      }
    }
  });
</script>

   <div class="grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
  <!-- Jobs & Internships Card -->
  <div class="card" style="background-color: #ffffff; border-radius: 16px; padding: 20px; box-shadow: 0 4px 12px rgba(0,0,0,0.05);">
    <h6 style="font-size: 20px; margin-bottom: 16px; color: #1f3c88;">Jobs and Internships Available</h6>
    
    <h5 style="margin-bottom: 8px; font-size: 16px; color: #333;">Available Jobs</h5>
    <ul style="padding-left: 16px; margin-bottom: 16px;">
      <c:forEach var="job" items="${availableJobs}">
        <li style="margin-bottom: 6px;">🔹 <strong>${job.title}</strong> – <em>${job.role}</em></li>
      </c:forEach>
    </ul>
    
    <h5 style="margin-bottom: 8px; font-size: 16px; color: #333;">Available Internships</h5>
    <ul style="padding-left: 16px;">
      <c:forEach var="intern" items="${availableInternships}">
        <li style="margin-bottom: 6px;">🔸 <strong>${intern.title}</strong> – <em>${intern.advTitle}</em></li>
      </c:forEach>
    </ul>
  </div>

  <!-- Courses Status Card -->
  <div class="card" style="background-color: #ffffff; border-radius: 16px; padding: 20px; box-shadow: 0 4px 12px rgba(0,0,0,0.05);">
    <h4 style="font-size: 20px; margin-bottom: 16px; color: #1f3c88;">Courses Status</h4>
    <c:forEach var="course" items="${courses}">
      <p style="margin: 10px 0 4px 0; font-weight: 500;">${course.name}</p>
      <div style="background-color: #e0e0e0; height: 10px; border-radius: 6px; overflow: hidden; margin-bottom: 12px;">
        <div style="width: ${course.progress}%; height: 100%; background-color: ${course.color}; transition: width 0.5s;"></div>
      </div>
    </c:forEach>
  </div>
</div>

  </div>
  <div id="editModal" class="modal">
  <div class="modal-content">
    <h3>Edit Bio</h3>
    <textarea id="bioInput" rows="4" style="width: 100%; padding: 8px;"></textarea>
    <div style="text-align: right; margin-top: 10px;">
      <button onclick="closeModal()" style="margin-right: 8px;">Cancel</button>
      <button onclick="saveBio()">Save</button>
    </div>
  </div>
</div>
  <script>
  function toggleReadMore() {
	  const moreText = document.getElementById("moreText");
	  const toggle = document.getElementById("toggleText");

	  if (!moreText || !toggle) return; // Prevents error

	  moreText.style.display = (moreText.style.display === "none") ? "inline" : "none";
	  toggle.textContent = (toggle.textContent === "Read More") ? "Read Less" : "Read More";
	}


	function openModal() {
	  const bio = document.getElementById("bioText").innerText.replace("Read More", "").replace("Read Less", "").replace("✏️", "").trim();
	  document.getElementById("bioInput").value = bio;
	  document.getElementById("editModal").style.display = "block";
	}

	function closeModal() {
	  document.getElementById("editModal").style.display = "none";
	}

	function saveBio(studentId) {
		  const updatedText = document.getElementById("bioInput").value;

		  
		  document.body.style.cursor = 'wait';

		
		  const editIcon = document.querySelector("#bioText .edit-icon");
		  if (editIcon) {
		    editIcon.innerHTML = '<span class="spinner" style="margin-left: 5px;"></span>';
		  }

		  fetch("about", {
		    method: "PUT",
		    headers: {
		      "Content-Type": "application/json"
		    },
		    body: JSON.stringify({ about: updatedText })
		  })
		  .then(response => {
		    if (!response.ok) throw new Error("Failed to update bio");
		    return response.text();
		  })
		  .then(() => {
		    document.getElementById("bioText").innerHTML =
		      updatedText +
		      ' <span id="toggleText" style="color: #007BFF; cursor: pointer;" onclick="toggleReadMore()">Read More</span>' +
		      ' <span class="edit-icon" onclick="openModal()" title="Edit" style="cursor: pointer; margin-left: 10px;">✏️</span>';

		    // Reset cursor after slight delay
		    setTimeout(() => {
		      document.body.style.cursor = 'default';
		      closeModal();

		     
		    }, 200);
		  })
		  .catch(error => {
		    document.body.style.cursor = 'default';
		    alert(error.message);
		  });
		}

</script>
</body>
</html>
