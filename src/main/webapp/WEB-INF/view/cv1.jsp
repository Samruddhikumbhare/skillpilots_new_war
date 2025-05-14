<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Test History</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

<!-- Font Awesome CDN -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet">

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

.selected-template {
	border: 4px solid #007bff;
	box-shadow: 0 0 15px rgba(0, 123, 255, 0.5);
	opacity: 1;
}

.disabled-template {
	pointer-events: none;
	opacity: 0.4;
}

.template-card.selected {
    border: 3px solid #0d6efd;
    box-shadow: 0 0 15px rgba(13, 110, 253, 0.5);
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


100
%


50
%;


}
100


%
{
background-position


:


0
%


50
%;


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


	<div class="container-fluid mt-5">
		<div class="row justify-content-center">
			<div class="col-12 col-xl-11">
				<div class="cv-wrapper">


					<div class="cv-header row align-items-center">
						<!-- Student Photo (Left Side) -->
						<div class="col-md-3 text-center mb-3 mb-md-0">
							<img
								src="${pageContext.request.contextPath}/student/photo/${student.student_id}"
								alt="Student Photo" class="rounded-circle"
								style="width: 140px; height: 200px; object-fit: cover; border: 4px solid #ccc;">

						</div>

						<!-- Student Info (Right Side) -->
						<div class="col-md-9">
							<h1>${student.student_name.toUpperCase()}</h1>
							<p>
								<i class="fas fa-phone"></i> ${student.contact}
							</p>
							<p>
								<i class="fas fa-envelope"></i> ${student.email_id}
							</p>
							<p>
								<i class="fas fa-map-marker-alt"></i> ${student.curr_city}
							</p>
						</div>
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
							<c:forEach var="edu" items="${studentPast}">
								<p>
									<strong>${edu.organization}</strong><br> ${edu.category} -
									${edu.board}<br> <strong>Score:</strong>
									${edu.description}%
								</p>
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
									<span class="badge bg-success">${skill}</span>
								</c:forEach>
							</p>
						</div>

						<div class="divider"></div>

						<!-- Work Experience -->
						<div>
							<div class="section-title">Work Experience</div>
							<c:forEach var="internship" items="${internship3}">
								<p>
									<strong>${internship.companyName}</strong> <span
										class="float-end">${internship.date_started} -
										${internship.date_completed}</span><br> <strong>Technology:</strong>
									${internship.technology}<br> <strong>Duration:</strong>
									${internship.duration} Weeks &nbsp;|&nbsp; <strong>Status:</strong>
									${internship.status}
								</p>
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>




	<div class="text-center mb-5">

		<%-- <input type="hidden" id="studentId" value="${student.student_id}" />
<input type="hidden" id="selectedTemplate" value="${student.getSelectedTemplate()}" />
<input type="hidden" id="templateEnabled" value="${student.isTemplateEnabled()}" />
 --%>
		<a href="#" id="btn-cv1-select" class="btn btn-outline-primary me-2"
			onclick="selectTemplate('cv1')"
			title="Once you select this template you cannot select another template">
			<i class="fa-solid fa-circle-check"></i> Select Template 1
		</a>
		
		 <a href="editCV1" class="btn btn-outline-primary me-2"> <i
			class="fas fa-edit"></i> Edit CV
		</a>

		<button onclick="downloadCV1('pdf')" id="download-btn"
			class="btn download-btn d-none">
			<i class="fas fa-download"></i> Download PDF
		</button>



	</div>

	<h2 class="text-center text-center">Choose Your Resume Template</h2>
	<div
		class="text-center my-5 d-flex justify-content-center flex-wrap gap-4">

		<div class="template-card bg-white shadow-sm mx-2 mb-4" id="btn-cv1">
			<a href="cv1"> <img src="images/cv1.png" alt="Template 1"
				class="w-100">
			</a>
			<div class="template-button">
				
					<a href="cv1" class="btn btn-outline-primary btn-sm mt-2">View
						Template 1</a>
				
			</div>
		</div>

		<div class="template-card bg-white shadow-sm mx-2 mb-4" id="btn-cv2">
			<a href="cv2"> <img src="images/cv2.png" alt="Template 2"
				class="w-100">
			</a>
			<div class="template-button">
				
					<a href="cv2" class="btn btn-outline-success btn-sm mt-2">View
						Template 2</a>
				
			</div>
		</div>

		<div class="template-card bg-white shadow-sm mx-2 mb-4" id="btn-cv3">
			<a href="cv3"> <img src="images/cv3.png" alt="Template 3"
				class="w-100">
			</a>
			<div class="template-button">
				
					<a href="cv3" class="btn btn-outline-danger btn-sm mt-2">View
						Template 3</a>
				
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

	<script>
  function selectTemplate(templateId) {
    const allTemplates = ['cv1', 'cv2', 'cv3'];

    allTemplates.forEach(id => {
      const card = document.getElementById('btn-' + id);
      const selectBtn = document.getElementById('btn-' + id + '-select');

      if (id !== templateId) {
        // Disable and dim non-selected
        if (card) {
          card.style.opacity = '0.4';
          card.style.pointerEvents = 'none';
        }
        if (selectBtn) {
          selectBtn.classList.add('disabled');
        }
      } else {
        // Highlight selected
        if (card) {
          card.style.border = '3px solid #0d6efd'; // Bootstrap primary
          card.style.boxShadow = '0 0 15px #0d6efd';
          card.style.opacity = '1';
        }
        if (selectBtn) {
          selectBtn.classList.remove('btn-outline-primary');
          selectBtn.classList.add('btn-primary');
          selectBtn.innerHTML = '<i class="fa-solid fa-circle-check"></i> Selected';
          selectBtn.setAttribute('disabled', true);
        }
      }
    });

    // Show download button
    const downloadBtn = document.getElementById('download-btn');
    if (downloadBtn) {
      downloadBtn.classList.remove('d-none');
    }
  }
</script>

<!-- <script>
  function selectTemplate(templateName) 
  {
	    var selectedTemplate = document.getElementById("selectedTemplate").value;
	    console.log("Selected Template:", selectedTemplate);
	  
	    var templateEnabled = document.getElementById("templateEnabled").value;
	    console.log("Enable template :",templateEnabled);
	  
        var studentId = document.getElementById("studentId").value;
        console.log("Student Id :",studentId);
    
        var params = "studentId=" + encodeURIComponent(studentId) + 
                 "&template=" + encodeURIComponent(templateName);

    fetch("select-template", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: params
    })
    .then(function(response) {
      if (response.ok)
      {
        highlightSelectedTemplate(templateName);
        showDownloadButton(templateName);
        alert("Template selected successfully!");
      } 
      else
      {
        alert("Something went wrong while selecting the template.");
      }
    });
    
    const downloadBtn = document.getElementById('download-btn');
    downloadBtn.classList.remove('d-none');
  }

  function highlightSelectedTemplate(selectedId) {
    var templates = ["cv1", "cv2", "cv3"];
    templates.forEach(function(tpl) {
      var element = document.getElementById("btn-" + tpl);
      if (element) {
        if (tpl === selectedId) {
          element.classList.add("selected-template");
          element.classList.remove("disabled-template");
        } else {
          element.classList.add("disabled-template");
          element.classList.remove("selected-template");
        }
      }
    });
  }

  function showDownloadButton(templateName) {
    var buttons = ["cv1", "cv2", "cv3"];
    buttons.forEach(function(tpl) {
      var btn = document.getElementById("download-" + tpl);
      if (btn) {
        btn.classList.remove("show");
      }
    });

    var selectedBtn = document.getElementById("download-" + templateName);
    if (selectedBtn) {
      selectedBtn.classList.add("show");
    }
  }

  window.onload = function () {
      // Check if the page was reloaded (true for refresh or back-forward navigation)
	    var selected = document.getElementById("selectedTemplate").value;
	    var enabled = document.getElementById("templateEnabled").value;

	    if (selected !== "" && (enabled === "true" || enabled === 1)) {

	        highlightSelectedTemplate(selected);
	        showDownloadButton(selected);
	        console.log("nnnnnn:",selected);
	        
	        console.log("iiiiii:",enabled);

	        // Show the download button by removing `d-none`
	        var downloadBtn = document.getElementById("download-btn");
	        if (downloadBtn) {
	            downloadBtn.classList.remove("d-none");
	        }
	    }
	};


</script> -->

</body>
</html>

