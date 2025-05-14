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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

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
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<style>
body {
	background-color: #f8f9fa;
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

.resume-container {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
	padding: 30px;
	margin-top: 40px;
	margin-bottom: 40px;
}

.section-title {
	font-weight: bold;
	font-size: 1.3rem;
}

.resume-header h1 {
	font-size: 2.2rem;
}

.template-previews {
	padding: 30px 15px;
	background: #fff;
	border-top: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 40px;
}

.template-previews img {
	transition: transform 0.3s ease;
}

.template-card.selected {
    border: 3px solid #0d6efd;
    box-shadow: 0 0 15px rgba(13, 110, 253, 0.5);
  }

.template-previews img:hover {
	transform: scale(1.05);
}

.download-btn {
	margin-top: 30px;
	margin-bottom: 10px;
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


<div class="row">
    <div class="col-12 text-center">
      <h2 class="fw-bold mt-5">Template 2</h2>
    </div>
  </div>


	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-7 col-lg-9 resume-container">


				<!-- Header -->
				<div class="resume-header border-bottom pb-3 mb-4 text-center">
					<h1 class="text-uppercase fw-bold mb-2">${student.student_name}</h1>
					<p class="text-muted mb-1">
						<i class="fas fa-phone-alt"></i> ${student.contact} &nbsp;|&nbsp;
						<i class="fas fa-envelope"></i> ${student.email_id} &nbsp;|&nbsp;
						<i class="fas fa-map-marker-alt"></i> ${student.curr_city}
					</p>
				</div>

				<!-- About Me -->
				<div class="mb-4">
					<h4 class="text-primary border-start border-4 ps-3 mb-3">About
						Me</h4>
					<p class="text-justify">
						Hello! I'm <strong>${student.student_name},</strong> an
						enthusiastic and motivated individual with a strong interest in
						software development and real-world problem solving. <br>I am
						passionate about learning new technologies and applying them to
						create impactful solutions. I have successfully completed multiple
						internships that exposed me to various stages of the development
						lifecycle, including planning, coding, testing, and deployment.
						Through these experiences, I've gained hands-on expertise in
						technologies like <strong>${student.skills}</strong> and built a
						solid foundation in both front-end and back-end development. I
						thrive in collaborative environments and am always eager to take
						on challenges that push me out of my comfort zone. My goal is to
						continuously grow as a developer and contribute meaningfully to
						innovative projects. Outside of coding, I enjoy participating in
						coding competitions, contributing to open-source projects, and
						staying updated with the latest tech trends.
					</p>
				</div>

				<!-- Education -->
				<div class="mb-4">
					<h4 class="text-primary border-start border-4 ps-3 mb-3">Education</h4>
					<c:forEach var="studentPasts" items="${studentPast}">
						<div
							class="d-flex justify-content-between border-bottom pb-2 mb-3">
							<div>
								<p class="mb-1">
									<strong>Qualification:</strong> ${studentPasts.category}
								</p>
								<p class="mb-1">
									<strong>Organization:</strong> ${studentPasts.organization}
								</p>
							</div>
							<div class="text-end">
								<p class="mb-1">
									<strong>Board:</strong> ${studentPasts.board}
								</p>
								<p class="mb-1">
									<strong>Percentage:</strong> ${studentPasts.description}%
								</p>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- Work Experience -->
				<div class="mb-4">
					<h4 class="text-primary border-start border-4 ps-3 mb-3">Work
						Experience</h4>
					<c:forEach var="internship" items="${internship3}">
						<div class="mb-3 border-bottom pb-2">
							<div class="d-flex justify-content-between">
								<div>
									<h5 class="mb-1 text-dark">${internship.companyName}</h5>
									<p class="text-muted mb-0">Position: Intern</p>
								</div>
								<div class="text-end text-muted">
									<p class="mb-0">${internship.duration}weeks</p>
									<p class="mb-0">Status: ${internship.status}</p>
								</div>
							</div>
							<p class="mt-2">
								<strong>Technologies Used:</strong> ${internship.technology}
							</p>
						</div>
					</c:forEach>
				</div>

				<!-- Skills -->
				<div class="mb-4">
					<h4 class="text-primary border-start border-4 ps-3 mb-3">Skills</h4>
					<ul class="list-inline">
						<c:forEach var="skill" items="${student.skills.split(',')}">
							<li
								class="list-inline-item badge bg-secondary text-light p-2 m-1">
								<i class="fas fa-check-circle"></i> ${skill.trim()}
							</li>
						</c:forEach>
					</ul>
				</div>

				<!-- Contact -->
				<div class="mb-4">
					<h4 class="text-primary border-start border-4 ps-3 mb-3">Contact
						Me</h4>
					<ul class="list-unstyled ps-3">
						<li><i class="fas fa-map-marker-alt me-2"></i>
							${student.curr_city}</li>
						<li><i class="fas fa-envelope me-2"></i> ${student.email_id}</li>
						<li><i class="fas fa-phone me-2"></i> ${student.contact}</li>
					</ul>
				</div>


			</div>
		</div>
	</div>


	<div class="text-center mb-5">

<%-- 
<input type="hidden" id="studentId" value="${student.student_id}" />
<input type="hidden" id="selectedTemplate" value="${student.getSelectedTemplate()}" />
<input type="hidden" id="templateEnabled" value="${student.isTemplateEnabled()}" /> --%>
	

  <a href="#" id="btn-cv2-select" class="btn btn-outline-primary me-2"
   onclick="selectTemplate('cv2')" 
   title="Once you select this template you cannot select another template">
   <i class="fa-solid fa-circle-check"></i> Select Template 2
</a>


		
		
		 <a href="editCV1" class="btn btn-outline-primary me-2"> <i
			class="fas fa-edit"></i> Edit CV2
		</a>

		<button onclick="downloadCV2('pdf')" id="download-btn" class="btn download-btn d-none">
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
    async function downloadCV2(format) {
        if (format === 'pdf') {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            const element = document.querySelector('.container');
            const canvas = await html2canvas(element, { scale: 2 });
            const imgData = canvas.toDataURL('image/png');
            const imgProps = doc.getImageProperties(imgData);
            const pdfWidth = doc.internal.pageSize.getWidth();
            const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
            doc.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
            doc.save('CV2.pdf');
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



<!-- 
<script>
  function selectTemplate(templateName) 
  {
	  var selectedTemplate = document.getElementById("selectedTemplate").value;
	    console.log("Selected Template:", selectedTemplate);
	  
	  var templateEnabled = document.getElementById("templateEnabled").value;
	  console.log("Enable template :",templateEnabled);
	  
  var studentId = document.getElementById("studentId").value;
  console.log("Student Id :",studentId);  
	  
    var studentId = document.getElementById("studentId").value;
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
	    var selected = document.getElementById("selectedTemplate").value;
	    var enabled = document.getElementById("templateEnabled").value;

	    if (selected && (enabled === "true" || enabled === "1")) {
	        highlightSelectedTemplate(selected);
	        showDownloadButton(selected);

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