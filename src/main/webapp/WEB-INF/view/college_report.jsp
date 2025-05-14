
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="user_session.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | College Report</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
<link rel="icon" type="image/png" sizes="16x16"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script src="https://cdn.jsdelivr.net/npm/papaparse@5.4.1/papaparse.min.js"></script>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css'>
<link rel="stylesheet" type="text/css"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css'>
<link rel="stylesheet" type="text/css"
	href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css'>
<link
	href="${pageContext.request.contextPath}/style/dist/css/live_chat.css"
	rel="stylesheet" type="text/css" />





<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.16/jspdf.plugin.autotable.min.js"></script>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

.heading {
	font-size: 24px;
	font-family: Arial, sans-serif;
	color: #333;
	text-align: center;
	margin-bottom: 10px;
}

.subheading {
	font-size: 16px;
	font-family: Arial, sans-serif;
	color: #666;
	text-align: center;
	margin-bottom: 20px;
}
</style>









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
<style type="text/css">
.sidebar-menu .dropdown-toggle {
	padding: 15px 12px 15px 54px !important;
	font-size: 15px !important;
}

.parameter {
	padding: 0;
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

.bootstrap-select .dropdown-toggle {
	height: 35px;
	padding-right: 30px;
	font-size: 14px;
	font-weight: 400;
}

label {
	min-width: 25%;
	max-width: 0%;
	color: #1974c3;
	display: contents;
	margin-bottom: .5rem;
}

#style-3::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

#style-3::-webkit-scrollbar {
	width: 6px;
	background-color: #F5F5F5;
}

#style-3::-webkit-scrollbar-thumb {
	background-color: #c1c1c1;
}

#div_location::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

#div_location::-webkit-scrollbar {
	width: 6px;
	background-color: #F5F5F5;
}

#div_location::-webkit-scrollbar-thumb {
	background-color: #c1c1c1;
}

#div_tech::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

#div_tech::-webkit-scrollbar {
	width: 6px;
	background-color: #F5F5F5;
}

#div_tech::-webkit-scrollbar-thumb {
	background-color: #c1c1c1;
}

#div_dept::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	background-color: #F5F5F5;
}

#div_dept::-webkit-scrollbar {
	width: 6px;
	background-color: #F5F5F5;
}

#div_dept::-webkit-scrollbar-thumb {
	background-color: #c1c1c1;
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
	<div class="main-container">
		<div class="card-box mb-30">
			<div class="pd-20 d-flex justify-content-center">
				<ul class="nav nav-pills justify-content-center mb-3" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#internship_report" role="tab"
						aria-selected="true">Internship Report</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#assessment_report" role="tab" aria-selected="false">Assessment
							Report</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						id="companyTab" href="#company_drives_tab" role="tab"
						aria-selected="false">Company Drives</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						id="recruitmentTab" href="#recruitments_tab" role="tab"
						aria-selected="false">Recruitments</a></li>
				</ul>
			</div>
		</div>
		<div class="tab-content">
			<!-- Internship Report Tab -->
			<div class="tab-pane fade show active" id="internship_report"
				role="tabpanel">

				<div class="title pb-20">
					<h4 class="h4 mb-0 text-center"
						style="color: white; background: #0f2c7eeb; border-radius: 5px;">College
						Internship's Report</h4>
				</div>

				<div class="page-header">
					<div class="row">
						<!-- Department Filter -->
						<div class="col-md-4 col-sm-12">
							<c:if test="${role eq ProjectConstants.iii_Role}">
								<div class="form-group parameter">
									<label>Departments</label> <select id="department"
										onchange="view_reportsingle()">
										<option selected value="">--Select Departments--</option>
										<c:forEach items="${dept_data}" var="dept">
											<option value="${dept[0]}">${dept[1]}</option>
										</c:forEach>
									</select>
								</div>
							</c:if>
							<c:if test="${role ne ProjectConstants.iii_Role}">
								<input type="hidden" id="department" value="${dept_data}">
							</c:if>
						</div>

						<!-- Status Filter -->
						<div class="col-md-4 col-sm-12">
							<div class="form-group parameter">
								<label>Status</label> <select id="status"
									onchange="view_reportsingle()">
									<option value="">--Select Status--</option>
									<option value="P">Pending</option>
									<option value="ongoing">Ongoing</option>
									<option value="Completed">Completed</option>
									<option value="X">Cancelled</option>
								</select>
							</div>
						</div>

						<!-- Skill Filter -->
						<div class="col-md-4 col-sm-12">
							<div class="form-group parameter">
								<label>Skill</label> <select id="technology"
									onchange="view_reportsingle()">
									<option selected value="">--Select Skill--</option>
									<c:forEach items="${technology_data}" var="tech">
										<option value="${tech}">${tech}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<div class="row">
						<!-- Duration Filter -->
						<div class="col-md-4 col-sm-12">
							<div class="form-group parameter">
								<label>Duration</label> <select id="duration"
									onchange="view_reportsingle()">
									<option value="">--Select no of Weeks--</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="16">16</option>
									<option value="20">20</option>
									<option value="24">24</option>
									<option value="32">32</option>
									<option value="40">40</option>
									<option value="52">52</option>
								</select>
							</div>
						</div>

						<!-- Industry Filter -->
						<div class="col-md-4 col-sm-12">
							<div class="form-group parameter">
								<label>Industry</label> <select id="industry"
									onchange="view_reportsingle()">
									<option selected value="">--Select Industry--</option>
									<c:forEach items="${industry_data}" var="ind">
										<option value="${ind[0]}">${ind[0]}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<!-- Internship Dates (Hidden) -->
						<div hidden class="col-md-4 col-sm-12">
							<div class="form-group parameter text-center radio">
								<label>Internship Dates</label><br> <label
									style="color: black;"><input type="radio"
									name="internship_dates" value="started_bet"> Started
									Between</label> <label style="color: black;"><input
									type="radio" name="internship_dates" value="ended_bet">
									Ended Between</label><br> <label style="color: black;"><input
									type="radio" name="internship_dates" value="complete_bet"
									style="margin-top: 10px;"> Complete Internship Between</label>
							</div>
							<br>
							<div id="report_dates" style="display: none;">
								<input id="from_date" data-date-format="yyyy-mm-dd"
									style="width: 45%; margin: 5px;" placeholder="From Date"
									readonly="true" /> <input id="to_date"
									data-date-format="yyyy-mm-dd" style="width: 45%; margin: 5px;"
									placeholder="To Date" readonly="true" />
							</div>
						</div>
					</div>

					<!-- Generate Buttons -->
					<div class="parameter" style="text-align: center;">
						<input type="button" value="Generate" class="btn btn-primary"
							onclick="view_report()" /> <input type="button"
							value="Generate All" class="btn btn-primary"
							onclick="viewAll_report()" />
					</div>
				</div>

				<!-- Internship Data Table -->
				<div class="page-header table-responsive scrollbar force-overflow"
					id="style-3"
					style="margin-bottom: 8px; padding: 0px; max-height: 373px; overflow: auto;">
					<table style="width: 100%;" class="table resp_data_table nowrap"
						id="myTable">
						<thead class="thead-light">
							<tr>
								<th>Student</th>
								<th>Team/Dept.</th>
								<th>Industry</th>
								<th>Duration</th>
								<th>Skill</th>
								<th>Start Date</th>
								<th>Completion Date</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody id="interns_data"></tbody>
					</table>
				</div>
				<center>
					<button class="btn btn-success btn-sm" onclick="generatePDF()">Download
						PDF</button>
					<button class="btn btn-success btn-sm" onclick="downloadCSV()">Download
						CSV</button>
				</center>
				<br>
			</div>

			<!-- Assessment Report Tab -->
			<div class="tab-pane fade" id="assessment_report" role="tabpanel">


				<div class="form-group">
					<label>Select Department</label> <select id="departmentID"
						class="form-control" onchange="fetchAssessmentData()">
						<option selected value="">--Select Department--</option>
						<c:forEach items="${dept_data}" var="dept">
							<option value="${dept[0]}">${dept[1]}</option>
						</c:forEach>
					</select>
				</div>

				<div class="title pb-20">
					<h4 class="h4 mb-0 text-center"
						style="color: white; background: #0f2c7eeb; border-radius: 5px;">Assessment
						Report</h4>
				</div>
				<div class="page-header table-responsive scrollbar force-overflow"
					style="margin-bottom: 8px; padding: 0px; max-height: 373px; overflow: auto;">
					<table style="width: 100%;" class="table resp_data_table nowrap"
						id="assessmentTable">
						<thead class="thead-light">
							<tr>
								<th>Student Name</th>
								<th>Department Name</th>
								<th>Level</th>
								<th>Test Name</th>
								<th>Obtained Marks</th>
								<th>Status</th>
								<th>Total Marks</th>
							</tr>
						</thead>
						<tbody id="assessment_data"></tbody>
					</table>
				</div>
				<center>
					<button id="downloadCSV" class="btn btn-primary">Download
						CSV</button>
					<button id="downloadPDF" class="btn btn-primary">Download
						PDF</button>
				</center>

			</div>
			<div class="tab-pane fade" id="company_drives_tab" role="tabpanel">
				<div class="card p-3">

					<h5>Company Drive Selections</h5>
					<div class="form-group">
  <label for="yearSelectCompany">Select Year</label>
  <select id="yearSelectCompany" class="form-control">
    <option value="">--All Years--</option>
  </select>
</div>
<div class="form-group">
					<label>Select Department</label> <select id="departments"
						class="form-control">
						<option selected value="">--Select Department--</option>
						<c:forEach items="${dept_data}" var="dept">
							<option value="${dept[0]}">${dept[1]}</option>
						</c:forEach>
					</select>
				</div>

					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Student Name</th>
								<th> Department</th>
								<th>Job Role</th>
								<th>Company Name</th>
								<th>Status</th>
								<th>Round Date</th>
							</tr>
						</thead>
						<tbody id="companyDriveTableBody">
							<!-- Dynamic rows inserted here -->
						</tbody>
					</table>
					
					
				</div>
				<button class="btn btn-primary" onclick="downloadExcel('companyDriveTableBody', 'Company_Drives.csv')">Download CSV</button>
					<button class="btn btn-primary" onclick="downloadCompanyDrivesPDF()">Download PDF</button>
			</div>

			<!-- Recruitments Tab -->
			<div class="tab-pane fade" id="recruitments_tab" role="tabpanel">
				<div class="card p-3">
					<h5>Recruitment Selections</h5>
					
					<div class="form-group">
					<label>Select Department</label> <select id="dept"
						class="form-control">
						<option selected value="">--Select Department--</option>
						<c:forEach items="${dept_data}" var="dept">
							<option value="${dept[0]}">${dept[1]}</option>
						</c:forEach>
					</select>
				</div>
					<div class="form-group">
						<label for="yearSelectRecruitment">Select Year</label> <select
							id="yearSelectRecruitment" class="form-control">
							<option value="">--All Years--</option>
						</select>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Student Name</th>
								<th>Job Role</th>
								<th>Company Name</th>
								<th>Status</th>
								<th>Round Date</th>
							</tr>
						</thead>
						<tbody id="recruitmentTableBody">
							<!-- Dynamic rows inserted here -->
						</tbody>
					</table>
				</div>
				<button class="btn btn-primary"
					onclick="downloadCSV('recruitmentTableBody', 'Recruitments.csv')">Download
					CSV</button>
				<button class="btn btn-primary" onclick="downloadRecruitmentsPDF()">Download
					PDF</button>

			</div>
		</div>
	</div>
<canvas id="deptPieChart" style="display: none;"></canvas>
<canvas id="yearDeptBarChart" style="display: none;"></canvas>

<canvas id="recruitmentsChart" style="display:none;" width="600" height="400"></canvas>
<canvas id="recruitmentsYearChart" style="display:none;" width="600" height="400"></canvas>
	

			
		
	<%@include file="modal_common.jsp"%><center>
		<canvas id="levelChart" width="400" height="200"
			style="display: none;"></canvas>


	

	<script>
function fetchAssessmentData() {
    const departmentId = document.getElementById('departmentID').value;
    console.log("Selected Department ID:", departmentId); // Now properly logs

    const collegeId = 14; // Fixed

    if (departmentId) {
        $.ajax({
            url: "http://43.204.35.211:8000/newskill/students-with-test?departmentId=" + departmentId + "&collegeId=" + collegeId,
            method: 'GET',
            success: function(response) {
                console.log("API Response:", response); // See the full API response in console

                let tbody = '';
                if (response && response.length > 0) {
                    response.forEach(function(student) {
                        const year = new Date(student.createdAt).getFullYear();

                        tbody += "<tr>"
                               + "<td>" + student.username + "</td>"
                               + "<td>" + student.dept_name + "</td>"
                               + "<td>" + student.questionLevel + "</td>"

                               + "<td>" + student.testName + "</td>"
                               + "<td>" + student.score + "</td>"
                               + "<td>" + student.status + "</td>"
                               + "<td>" + student.outOfMarks + "</td>"
                               + "<td data-year='" + year + "' style='display:none;'>" + year + "</td>"


                               + "</tr>";
                    });
                } else {
                    tbody = "<tr><td colspan='7' class='text-center'>No records found</td></tr>";
                }
                $('#assessment_data').html(tbody);
            },
            error: function(xhr, status, error) {
                console.error('Error:', status, error);
                alert('Failed to fetch assessment data!');
            }
        });
    } else {
        console.log("No department selected");
        $('#assessment_data').html('');
    }
}


</script>

	<script type="text/javascript">

//Download CSV
document.getElementById('downloadCSV').addEventListener('click', function() {
    const rows = [];
    $('#assessment_data tr').each(function() {
        const row = [];
        $(this).find('td').each(function() {
            row.push($(this).text());
        });
        rows.push(row);
    });

    const csv = Papa.unparse(rows); // Using PapaParse to convert to CSV format
    const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'assessment_report.csv';
    link.click();
});

// Download PDF
  const ctx = document.getElementById('levelChart').getContext('2d');
  const levelChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: ['Basic', 'Medium', 'Advanced'],
          datasets: [{
              label: 'Scores',
              data: [50, 70, 90], // replace with dynamic data if needed
              backgroundColor: ['#007bff', '#ffc107', '#28a745']
          }]
      },
      options: {
          responsive: false,
          scales: {
              y: {
                  beginAtZero: true
              }
          }
      }
  });

  // Generate PDF with Chart + Table
  

</script>

<script type="text/javascript">
document.getElementById('downloadPDF').addEventListener('click', async function () {
    const jsPDFLib = window.jspdf;
    const doc = new jsPDFLib.jsPDF();

    const yearDataMap = {};

    var rows = document.querySelectorAll('#assessment_data tr');
    rows.forEach(function (row) {
        var cells = row.querySelectorAll('td');

        if (cells.length >= 7) {
            var name = cells[0].textContent;
            var dept = cells[1].textContent;
            var level = cells[2].textContent;
            var testName = cells[3].textContent;
            var marks = parseInt(cells[4].textContent);
            var status = cells[5].textContent;
            var total = parseInt(cells[6].textContent);
            var year = cells[7] ? cells[7].textContent.trim() : 'Unknown';

            if (!yearDataMap[year]) {
                yearDataMap[year] = {
                    rows: [],
                    pass: 0,
                    fail: 0,
                    lowScores: {},
                    levels: {}
                };
            }

            var yData = yearDataMap[year];

            if (status.toLowerCase() === 'passed') {
                yData.pass++;
            } else {
                yData.fail++;
            }

            var testLabel = testName;
            if (marks < 10) {
                yData.lowScores[testLabel] = (yData.lowScores[testLabel] || 0) + 1;
            }

            yData.levels[level] = (yData.levels[level] || 0) + 1;

            yData.rows.push([name, dept, level, testName, marks, total]);
        }
    });

    function delay(ms) {
        return new Promise(function (resolve) {
            setTimeout(resolve, ms);
        });
    }

    for (var year in yearDataMap) {
        var rowsData = yearDataMap[year].rows;
        var pass = yearDataMap[year].pass;
        var fail = yearDataMap[year].fail;
        var lowScores = yearDataMap[year].lowScores;
        var levels = yearDataMap[year].levels;

        // Create Canvas Elements
        var barCanvas = document.createElement('canvas');
        barCanvas.width = 300;
        barCanvas.height = 150;
        var pieCanvas = document.createElement('canvas');
        pieCanvas.width = 300;
        pieCanvas.height = 150;
        var levelCanvas = document.createElement('canvas');
        levelCanvas.width = 400;
        levelCanvas.height = 150;

        var barCtx = barCanvas.getContext('2d');
        var pieCtx = pieCanvas.getContext('2d');
        var levelCtx = levelCanvas.getContext('2d');

        new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: ['Passed', 'Failed'],
                datasets: [{
                    label: 'Students',
                    data: [pass, fail],
                    backgroundColor: ['green', 'red']
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    title: {
                        display: true,
                        text: 'Pass vs Fail - ' + year
                    }
                }
            }
        });

        new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: Object.entries(lowScores).map(function (entry) {
                    return entry[0] + ' (' + entry[1] + ')';
                }),
                datasets: [{
                    data: Object.values(lowScores),
                    backgroundColor: ['orange', 'blue', 'purple', 'gray', 'green']
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    title: {
                        display: true,
                        text: '<10 Marks - ' + year
                    }
                }
            }
        });

        new Chart(levelCtx, {
            type: 'bar',
            data: {
                labels: Object.keys(levels),
                datasets: [{
                    label: 'Students',
                    data: Object.values(levels),
                    backgroundColor: ['#4bc0c0', '#36a2eb', '#ff6384']
                }]
            },
            options: {
                responsive: false,
                plugins: {
                    title: {
                        display: true,
                        text: 'Level Participation - ' + year
                    }
                }
            }
        });

        await delay(800); // wait for charts to render

        // Add All 3 Charts to One Page
        doc.addPage();
        doc.setFontSize(14);
        doc.text("Year: " + year + " - Charts", 10, 10);

        // First row: two side-by-side charts
        doc.addImage(barCanvas.toDataURL('image/png'), 'PNG', 10, 15, 90, 60);
        doc.addImage(pieCanvas.toDataURL('image/png'), 'PNG', 105, 15, 90, 60);

        // Second row: Level chart centered
        doc.addImage(levelCanvas.toDataURL('image/png'), 'PNG', 35, 80, 140, 60);

        // Add Table
        doc.addPage();
        doc.text("Assessment Data - " + year, 10, 10);
        doc.autoTable({
            startY: 15,
            head: [['Student Name', 'Department', 'Level', 'Test Name', 'Marks', 'Total']],
            body: rowsData
        });
    }

    doc.save('assessment_report_by_year.pdf');
});
</script>


	<!-- Include PapaParse for CSV -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>
	<script>
  document.addEventListener('DOMContentLoaded', function () {
    const yearSelect = document.getElementById('yearSelect');
    const currentYear = new Date().getFullYear();

    for (let i = currentYear; i >= 2018; i--) {
      const option = document.createElement('option');
      option.value = i;
      option.textContent = i;
      yearSelect.appendChild(option);
    }
  });
</script>

	<script>
		function generatePDF() {
			const doc = new jsPDF();
		
			// Add heading
			doc.setFontSize(24);
			doc.setTextColor(51, 51, 51); // RGB color: #333
			doc.setFont("Arial", "bold");
			doc.text("Skillpilot", 90, 30, { align: 'center' });
		
			// Add subheading
			doc.setFontSize(16);
			doc.setTextColor(102, 102, 102); // RGB color: #666
			doc.setFont("Arial", "normal");
			doc.text("Internship Report", 85, 50, { align: 'center' });
		
			// Add report table
			const table = document.getElementById("myTable");
			const tableData = doc.autoTableHtmlToJson(table);
			doc.autoTable({
				startY: 60,
				head: [tableData.columns],
				body: tableData.data
			});
		
			// Save the PDF
			doc.save("college_report.pdf");
		}
		</script>

	<script>
    function downloadCSV() {
        const table = document.getElementById("myTable");
        const rows = table.querySelectorAll("tr");

        let csvContent = "";

        rows.forEach(row => {
            const cols = row.querySelectorAll("th, td");
            let rowData = [];
            cols.forEach(col => {
                rowData.push('"' + col.innerText + '"'); // Add double quotes around each cell value
            });
            csvContent += rowData.join(",") + "\n"; // Join cell values with commas and add a new line
        });

        // Create a Blob from the CSV content
        const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });

        // Create a link element to trigger the download
        const link = document.createElement("a");
        if (link.download !== undefined) { // feature detection
            const url = URL.createObjectURL(blob);
            link.setAttribute("href", url);
            link.setAttribute("download", "college_report.csv");
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    }
</script>
	<script>
function viewAll_report() {
    $.ajax({
    type: "GET",
    url: "${pageContext.request.contextPath}/getreportAll",
    success: function(response) {
        console.log("Report data:", response);
        $("#interns_data").empty();
        var reports = response; // Directly use response, no need to parse
        if (Array.isArray(reports)) {
            reports.forEach(function(report) {
                var row = "<tr>" +
                    "<td>" + (report.studentName || '') + "</td>" +  // Use studentName instead of student_id
                    "<td>" + (report.dept_name || '') + "</td>" +
                    "<td>" + (report.internship.companyName  || '') + "</td>" +  // Display collegeName
                    "<td>" + (report.internship.duration || '') + "</td>" +
                    "<td>" + (report.internship.technology || '') + "</td>" +
                    "<td>" + (formatDate(report.internship.date_started) || '') + "</td>" +
                    "<td>" + (formatDate(report.internship.date_completed) || '') + "</td>" +
                    "<td>" + (report.internship.status || '') + "</td>" +
                    "</tr>";
                $("#interns_data").append(row);
            });
        } else {
            console.error("Expected an array but got:", reports);
        }
    },
    error: function(xhr, status, error) {
        console.error("Error:", error);
    }
});
}




</script>



	<script>
		function formatDate(timestamp) {
		if (!timestamp) {
			return 'N/A';
		}
		var date = new Date(timestamp);
		var year = date.getFullYear();
		var month = ('0' + (date.getMonth() + 1)).slice(-2);
		var day = ('0' + date.getDate()).slice(-2);
		return month + '/' + day + '/' + year;
	}
	
	function view_report() {
		var selectedDepartment = $("#department").val();
		var selectStatus = $('#status').val();
		var selectTechnology = $('#technology').val();
		var selectDuration = $('#duration').val();
		var selectInstitute = $('#industry').val();
	
		var requestData = {
			coll_dept:selectedDepartment|| null,
			
			status: selectStatus || null,
			technology: selectTechnology || null,
			duration: selectDuration || null,
			company_name: selectInstitute || null
		};
	
		$.ajax({
		type: "GET",
		url: "${pageContext.request.contextPath}/getreport",
		data: requestData,
		success: function(response) {
			console.log("Report data:", response);
			$("#interns_data").empty();
			
			var reports = response; // Directly use response, no need to parse
	
			if (Array.isArray(reports)) {
				reports.forEach(function(report) {
					var row = "<tr>" +
						"<td>" + (report.studentName || '') + "</td>" +  // Use studentName instead of student_id
						"<td>" + (report.dept_name || '') + "</td>" +
						"<td>" + (report.internship.companyName  || '') + "</td>" +  // Display collegeName
						"<td>" + (report.internship.duration || '') + "</td>" +
						"<td>" + (report.internship.technology || '') + "</td>" +
						"<td>" + (formatDate(report.internship.date_started) || '') + "</td>" +
						"<td>" + (formatDate(report.internship.date_completed) || '') + "</td>" +
						"<td>" + (report.internship.status || '') + "</td>" +
						"</tr>";
					$("#interns_data").append(row);
				});
			} else {
				console.error("Expected an array but got:", reports);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error:", error);
		}
	});
	}
	
		</script>
	<!-- for find by single selector -->
	<script>
			function formatDate(timestamp) {
			if (!timestamp) {
				return 'N/A';
			}
			var date = new Date(timestamp);
			var year = date.getFullYear();
			var month = ('0' + (date.getMonth() + 1)).slice(-2);
			var day = ('0' + date.getDate()).slice(-2);
			return month + '/' + day + '/' + year;
		}
		
		function view_reportsingle() {
			var selectedDepartment = $("#department").val();
			var selectStatus = $('#status').val();
			var selectTechnology = $('#technology').val();
			var selectDuration = $('#duration').val();
			var selectInstitute = $('#industry').val();
		
			var requestData = {
				coll_dept:selectedDepartment,
				department: selectedDepartment,
				status: selectStatus || null,
				technology: selectTechnology || null,
				duration: selectDuration || null,
				company_name: selectInstitute || null
			};
		
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath}/getreportsingle",
				data: requestData,
				success: function(response) {
					console.log("Report data:", response);
					$("#interns_data").empty();
					var reports = JSON.parse(response);
		
					if (Array.isArray(reports)) {
		reports.forEach(function(report) {
			var row = "<tr>" +
				"<td>" + (report.studentName  || '') + "</td>" +
				"<td>" + (report.dept_name || '') + "</td>" +
		
				"<td>" + (report.internship.companyName || '') + "</td>" +
				"<td>"+ (report.internship.duration || '') + "</td>" +
				"<td>" + (report.internship.technology || '') + "</td>" +
				"<td>" + (formatDate(report.internship.date_started) || '') + "</td>" +
				"<td>" + (formatDate(report.internship.date_completed) || '') + "</td>" +
				"<td>" + (report.internship.status || '') + "</td>" +
				"</tr>";
			$("#interns_data").append(row);
		});
	} else {
		console.error("Expected an array but got:", reports);
	}
				},
				error: function(xhr, status, error) {
					console.error("Error:", error);
				}
			});
		}
		
			</script>


	<script>
	document.addEventListener("DOMContentLoaded", function () {
		  // Populate year dropdowns
		  populateYearDropdown("yearSelectCompany");
		  populateYearDropdown("yearSelectRecruitment");

		  // Load data initially
		  loadCompanyDrives();
		  loadRecruitments();

		  // Setup tab change listener
		  document.querySelector('a[href="#company_drives_tab"]').addEventListener("click", function () {
		    loadCompanyDrives();
		  });

		  document.querySelector('a[href="#recruitments_tab"]').addEventListener("click", function () {
		    loadRecruitments();
		  });

		  // Setup year and department change listeners
		  document.getElementById("yearSelectCompany").addEventListener("change", loadCompanyDrives);
		  document.getElementById("departments").addEventListener("change", loadCompanyDrives);
		  document.getElementById("dept").addEventListener("change", loadRecruitments);

		  document.getElementById("yearSelectRecruitment").addEventListener("change", loadRecruitments);
		});

  function populateYearDropdown(selectId) {
    var yearSelect = document.getElementById(selectId);
    var currentYear = new Date().getFullYear();
    for (var i = currentYear; i >= 2018; i--) {
      var option = document.createElement("option");
      option.value = i;
      option.text = i;
      yearSelect.appendChild(option);
    }
  }

  function loadCompanyDrives() {
	  const departmentId = document.getElementById('departments').value;
	  const year = document.getElementById("yearSelectCompany").value;
	  const collegeId = 14;

	  let url = "http://43.204.35.211:8000/newskill/company-drives?collegeId=" + collegeId;

	  if (year) {
	      url += "&year=" + year;
	  }

	  if (departmentId) {
	      url += "&department=" + encodeURIComponent(departmentId);
	  }


    fetch(url)
      .then(function (response) {
        return response.json();
      })
      .then(function (data) {
        var tbody = document.getElementById("companyDriveTableBody");
        tbody.innerHTML = "";
        data.forEach(function (row) {
          tbody.innerHTML +=
            "<tr>" +
              "<td>" + row.student_name + "</td>" +
              "<td>" + row.department_name + "</td>" +

              "<td>" + row.job_role + "</td>" +
              "<td>" + row.company_name + "</td>" +
              "<td>" + row.status + "</td>" +
              "<td>" + row.round_date + "</td>" +
            "</tr>";
        });
      })
      .catch(function (error) {
        console.error("Error loading company drives: " + error);
      });
  }

  function loadRecruitments() {
	  const departmentId = document.getElementById('dept').value;

    var year = document.getElementById("yearSelectRecruitment").value;
    var collegeId = 14;
    let url = "http://43.204.35.211:8000/newskill/recruitments?collegeId=" + collegeId;

    
    if (year) {
	      url += "&year=" + year;
	  }

	  if (departmentId) {
	      url += "&department=" + encodeURIComponent(departmentId);
	  }
    fetch(url)
      .then(function (response) {
        return response.json();
      })
      .then(function (data) {
        var tbody = document.getElementById("recruitmentTableBody");
        tbody.innerHTML = "";
        data.forEach(function (row) {
          tbody.innerHTML +=
            "<tr>" +
              "<td>" + row.student_name + "</td>" +
              "<td>" + row.job_role + "</td>" +
              "<td>" + row.company_name + "</td>" +
              "<td>" + row.status + "</td>" +
              "<td>" + row.round_date + "</td>" +
            "</tr>";
        });
      })
      .catch(function (error) {
        console.error("Error loading recruitments: " + error);
      });
  }
</script>
<script type="text/javascript">

function drawDepartmentPieChartForPDF(deptCount) {
	  return new Promise(resolve => {
	    const ctx = document.getElementById("deptPieChart").getContext("2d");
	    if (window.deptChartInstance) window.deptChartInstance.destroy();

	    window.deptChartInstance = new Chart(ctx, {
	      type: "pie",
	      data: {
	        labels: Object.keys(deptCount),
	        datasets: [{
	          data: Object.values(deptCount),
	          backgroundColor: Object.keys(deptCount).map(() => getRandomColor())
	        }]
	      },
	      options: {
	        responsive: false,
	        animation: false,
	        plugins: {
	          legend: {
	            display: true,
	            position: 'right'
	          },
	          title: {
	            display: true,
	            text: 'Selections by Department'
	          }
	        }
	      },
	      plugins: [{
	        afterRender: resolve
	      }]
	    });
	  });
	}
//Generate Company Drives Report PDF with Charts and Table
async function downloadCompanyDrivesPDF() {
  const { jsPDF } = window.jspdf;
  const pdf = new jsPDF({ orientation: "landscape" });
  let y = 15;

  // Title
  pdf.setFontSize(18);
  pdf.setFont("helvetica", "bold");
  pdf.text("Company Drives Report", 140, y, { align: "center" });
  y += 15;

  const rows = Array.from(document.querySelectorAll("#companyDriveTableBody tr"));
  const deptCount = {};
  const yearDeptCount = {};

  rows.forEach(row => {
    const cols = row.querySelectorAll("td");
    if (cols.length === 6) {
      const dept = cols[1].textContent.trim();
      const year = cols[5].textContent.trim();
      deptCount[dept] = (deptCount[dept] || 0) + 1;
      const key = year + "_" + dept;
      yearDeptCount[key] = (yearDeptCount[key] || 0) + 1;
    }
  });

  // Charts
  const pieChartImg = await createPieChartImage(deptCount, "Department-wise Selections");
  const barChartImg = await createBarChartImage(yearDeptCount, "Year-Department Selections");

  // Draw charts side by side
  pdf.addImage(pieChartImg, "PNG", 20, y, 120, 70);
  pdf.addImage(barChartImg, "PNG", 160, y, 120, 70);
  y += 80;

  // Table Title
  pdf.setFontSize(14);
  pdf.text("Selected Student Details", 15, y);
  y += 5;

  const headers = [["Student Name", "Department", "Job Role", "Company", "Status", "Year"]];
  const body = rows.map(row => {
    const cols = row.querySelectorAll("td");
    return [
      cols[0].textContent,
      cols[1].textContent,
      cols[2].textContent,
      cols[3].textContent,
      cols[4].textContent,
      cols[5].textContent
    ];
  });

  pdf.autoTable({
    startY: y,
    head: headers,
    body: body,
    theme: 'grid',
    headStyles: { fillColor: [22, 160, 133] },
    styles: { fontSize: 10, cellPadding: 2 },
    margin: { left: 15, right: 15 }
  });

  pdf.save("Company_Drives_Report.pdf");
}

// Create Pie Chart as Image
async function createPieChartImage(dataMap, title) {
  const canvas = document.createElement("canvas");
  canvas.width = 600;
  canvas.height = 300;
  canvas.style.display = "none";
  document.body.appendChild(canvas);

  const labels = Object.keys(dataMap);
  const values = Object.values(dataMap);
  const colors = labels.map(() => getRandomColor());

  const ctx = canvas.getContext("2d");
  const chart = new Chart(ctx, {
    type: "pie",
    data: {
      labels,
      datasets: [{
        data: values,
        backgroundColor: colors
      }]
    },
    options: {
      plugins: {
        title: {
          display: true,
          text: title,
          font: {
            size: 18
          }
        },
        legend: {
          position: "bottom",
          labels: {
            font: {
              size: 12
            }
          }
        }
      }
    }
  });

  await new Promise(resolve => setTimeout(resolve, 1000));
  const imgData = canvas.toDataURL("image/png");
  chart.destroy();
  document.body.removeChild(canvas);
  return imgData;
}

// Create Bar Chart as Image
async function createBarChartImage(dataMap, title) {
  const canvas = document.createElement("canvas");
  canvas.width = 600;
  canvas.height = 300;
  canvas.style.display = "none";
  document.body.appendChild(canvas);

  const labels = Object.keys(dataMap);
  const values = Object.values(dataMap);
  const colors = labels.map(() => getRandomColor());

  const ctx = canvas.getContext("2d");
  const chart = new Chart(ctx, {
    type: "bar",
    data: {
      labels,
      datasets: [{
        label: "Selections",
        data: values,
        backgroundColor: colors
      }]
    },
    options: {
      plugins: {
        title: {
          display: true,
          text: title,
          font: {
            size: 18
          }
        },
        legend: {
          display: false
        }
      },
      scales: {
        x: {
          ticks: {
            font: {
              size: 12
            },
            maxRotation: 90,
            minRotation: 45
          }
        },
        y: {
          ticks: {
            font: {
              size: 12
            }
          }
        }
      }
    }
  });

  await new Promise(resolve => setTimeout(resolve, 1000));
  const imgData = canvas.toDataURL("image/png");
  chart.destroy();
  document.body.removeChild(canvas);
  return imgData;
}


// Generate random hex color

function getRandomColor() {
	  const letters = '0123456789ABCDEF';
	  let color = '#';
	  for (let i = 0; i < 6; i++) {
	    color += letters[Math.floor(Math.random() * 16)];
	  }
	  return color;
	}


async function downloadRecruitmentsPDF() {
	  const { jsPDF } = window.jspdf;
	  const pdf = new jsPDF({ orientation: "landscape" });
	  let y = 15;

	  // Title
	  pdf.setFontSize(18);
	  pdf.setFont("helvetica", "bold");
	  pdf.text("Recruitments Report", 140, y, { align: "center" });
	  y += 15;

	  // Gather table data & aggregates
	  const rows = Array.from(document.querySelectorAll("#recruitmentTableBody tr"));
	  const companyCount = {};
	  const yearCount = {};

	  rows.forEach(function(row) {
	    const cols = row.querySelectorAll("td");
	    if (cols.length === 5) {
	      var company = cols[2].textContent.trim();
	      var dateStr = cols[4].textContent.trim();
	      var year    = dateStr.split("-")[0];

	      companyCount[company] = (companyCount[company] || 0) + 1;
	      yearCount[year]       = (yearCount[year]       || 0) + 1;
	    }
	  });

	  // Create and embed pie chart: Company‑wise distribution
	  var pieImg = await createPieChartImage(companyCount, "Company-wise Distribution");
	  pdf.addImage(pieImg, "PNG", 15, y, 120, 70);

	  // Create and embed bar chart: Year‑wise distribution
	  var barImg = await createBarChartImage(yearCount, "Year-wise Distribution");
	  pdf.addImage(barImg, "PNG", 155, y, 120, 70);
	  y += 85;

	  
	  
	  // Table header
	  pdf.setFontSize(14);
	  pdf.setFont("helvetica", "bold");
	  pdf.text("Student Name", 15, y);
	  pdf.text("Job Role",     65, y);
	  pdf.text("Company",      115, y);
	  pdf.text("Status",       165, y);
	  pdf.text("Year",         195, y);
	  y += 8;

	  // Table rows
	  pdf.setFont("helvetica", "normal");
	  rows.forEach(function(row) {
	    const cols = row.querySelectorAll("td");
	    if (cols.length === 5) {
	      pdf.text(cols[0].textContent.trim(), 15,  y);
	      pdf.text(cols[1].textContent.trim(), 65,  y);
	      pdf.text(cols[2].textContent.trim(), 115, y);
	      pdf.text(cols[3].textContent.trim(), 165, y);
	      pdf.text(cols[4].textContent.trim().split("-")[0], 195, y);
	      y += 7;
	      if (y > 180) {
	        pdf.addPage();
	        y = 20;
	      }
	    }
	  });

	  pdf.save("Recruitments_Report.pdf");
	}

	const chartInstances = {}; // Store chart references

	async function drawChart(canvasId, title, tableId, columnIndex) {
	  const canvas = document.getElementById(canvasId);
	  const ctx = canvas.getContext("2d");

	  // Ensure it's hidden from screen
	  canvas.style.display = "none";

	  // Destroy previous chart if exists
	  if (chartInstances[canvasId]) {
	    chartInstances[canvasId].destroy();
	  }

	  const rows = document.getElementById(tableId).querySelectorAll("tr");
	  const countMap = {};

	  rows.forEach(row => {
	    const key = row.children[columnIndex]?.textContent.trim();
	    if (key) {
	      countMap[key] = (countMap[key] || 0) + 1;
	    }
	  });

	  chartInstances[canvasId] = new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: Object.keys(countMap),
	      datasets: [{
	        label: title,
	        data: Object.values(countMap),
	        backgroundColor: 'rgba(255, 99, 132, 0.7)',
	      }]
	    },
	    options: {
	      responsive: false,
	      animation: false,
	      plugins: {
	        legend: { display: false }
	      }
	    }
	  });

	  // Wait for chart to finish rendering
	  await new Promise(resolve => setTimeout(resolve, 500));
	}

	async function drawYearChart(canvasId, title, tableId) {
	  const canvas = document.getElementById(canvasId);
	  const ctx = canvas.getContext("2d");

	  // Ensure it's hidden
	  canvas.style.display = "none";

	  if (chartInstances[canvasId]) {
	    chartInstances[canvasId].destroy();
	  }

	  const rows = document.getElementById(tableId).querySelectorAll("tr");
	  const countMap = {};

	  rows.forEach(row => {
	    const date = row.children[4]?.textContent;
	    const year = new Date(date).getFullYear();
	    if (!isNaN(year)) {
	      countMap[year] = (countMap[year] || 0) + 1;
	    }
	  });

	  chartInstances[canvasId] = new Chart(ctx, {
	    type: 'line',
	    data: {
	      labels: Object.keys(countMap),
	      datasets: [{
	        label: title,
	        data: Object.values(countMap),
	        borderColor: 'rgba(54, 162, 235, 1)',
	        fill: false,
	        tension: 0.1
	      }]
	    },
	    options: {
	      responsive: false,
	      animation: false,
	      plugins: {
	        legend: { display: false }
	      }
	    }
	  });

	  await new Promise(resolve => setTimeout(resolve, 500));
	}

	function downloadExcel(tbodyId, fileName) {
		  // Locate the tbody and its parent table
		  var tbody = document.getElementById(tbodyId);
		  if (!tbody) {
		    alert("Table body not found: " + tbodyId);
		    return;
		  }
		  var table = tbody.closest("table");

		  // Build CSV header from the table’s THEAD
		  var headerCells = table.querySelectorAll("thead th");
		  if (headerCells.length === 0) {
		    alert("No <thead><th> found in table.");
		    return;
		  }
		  var headers = Array.from(headerCells).map(function(th) {
		    return '"' + th.textContent.trim() + '"';
		  });
		  var csvContent = headers.join(",") + "\n";

		  // Build CSV rows from the TBODY
		  var rows = tbody.querySelectorAll("tr");
		  if (rows.length === 0) {
		    alert("No data available to download.");
		    return;
		  }
		  rows.forEach(function(row) {
		    var cols = row.querySelectorAll("td");
		    var rowData = Array.from(cols).map(function(td) {
		      return '"' + td.textContent.trim() + '"';
		    });
		    csvContent += rowData.join(",") + "\n";
		  });

		  // Trigger download
		  var blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
		  var link = document.createElement("a");
		  link.setAttribute("href", URL.createObjectURL(blob));
		  link.setAttribute("download", fileName);
		  document.body.appendChild(link);
		  link.click();
		  document.body.removeChild(link);
		}

</script>

	<%@include file="scriptfiles.jsp"%>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
</body>
</html>