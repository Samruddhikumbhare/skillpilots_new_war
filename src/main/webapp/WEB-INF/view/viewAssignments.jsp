<%@include file="user_session.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Assignments List</title>

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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
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

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <!-- Mobile Specific Metas -->

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

body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

/* Main Container */
.container {
	max-width: 1100px;
	margin: 50px auto;
	background: #fff;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	padding: 20px;
}

/* Header */

/* Upload Section */
.form-section {
	margin-top: 20px;
}

.form-label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
}

.form-input {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-button {
	background-color: #28a745;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 1rem;
}

.form-button:hover {
	background-color: #218838;
}

/* Uploaded Files Table */
.table-section {
	margin-top: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

table th, table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

table th {
	background-color: #0073e6;
	color: white;
}

table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.delete-button {
	background-color: #dc3545;
	color: white;
	border: none;
	padding: 5px 10px;
	border-radius: 3px;
	cursor: pointer;
}

.delete-button:hover {
	background-color: #c82333;
}

.main-container {
	padding: 20px;
}

.card {
	border-radius: 10px;
}

.btn {
	border-radius: 5px;
}

.footer-wrap {
	background-color: #f8f9fa;
	text-align: center;
	padding: 10px 0;
	box-shadow: 0 -1px 5px rgba(0, 0, 0, 0.1);
}

table th, table td {
	text-align: center;
	vertical-align: middle;
}

.modal-header, .modal-footer {
	border: none;
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
				alt=" " class="dark-logo"> <img
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg"
				alt=" " class="light-logo">
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
			<div class="title pb-20 text-center">
				<h2 class="h3 mb-0"
					style="color: white; background: #0f2c7eeb; border-radius: 5px; margin-left: 300px; position: relative; top: 45px; max-width: 1292px;">Study
					Materials</h2>
			</div>
			<div class="container mt-5" style="margin-left: 400px;">

				<c:if test="${user.role eq 7}">
					<button type="button" class="btn btn-success"
						onclick="openMaterialModal('add', null)">
						<i class="fas fa-plus"></i> Add Material
					</button>

				</c:if>
				<!-- Add Material Modal -->
				<div class="modal fade" id="addMaterialModal" tabindex="-1"
					aria-labelledby="addMaterialModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-header">

								<h5 class="modal-title" id="addMaterialModalLabel">Add
									Material</h5>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal" aria-label="Close">X</button>

							</div>
							<div class="modal-body">
								<form id="addMaterialForm"
									action="${pageContext.request.contextPath}/uploadMaterial"
									method="POST" enctype="multipart/form-data">
									<div class="mb-3">
										<label for="materialTitle" class="form-label fw-bold">Title</label>
										<input type="text" class="form-control" id="materialTitle"
											name="title" placeholder="Enter title" />
									</div>
									<div class="mb-3">
										<label for="materialDescription" class="form-label fw-bold">Description</label>
										<textarea class="form-control" id="materialDescription"
											name="description" rows="3" placeholder="Enter description"
											style="max-height: 100px; overflow: auto;">
                                        </textarea>
									</div>

									<div class="mb-3" id="uploadSection">
										<label for="materialFile" class="form-label fw-bold">Choose
											File</label> <input type="file" class="form-control"
											id="materialFile" name="file"
											accept=".pdf,.doc,.docx,.ppt,.pptx,.xls,.xlsx" />
									</div>
								</form>
								<div id="messageArea" class="alert alert-danger"
									style="display: none;">Please provide a title before
									saving.</div>
							</div>
							<div class="modal-footer">
								<!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->

								<button type="button" class="btn btn-success" id="saveButton"
									style="display: none;">Save</button>
								<span id="fileNameLabel"
									style="margin-left: 10px; display: none;"></span> <a href="#"
									class="btn btn-primary" id="downloadButton"
									style="display: none;" target="_blank">Download</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Uploaded Files List -->
				<div class="card mt-4 shadow-sm">
					<div class="card-header bg-secondary text-white">
						<h5 class="mb-0">
							<i class="fas fa-list"></i> Uploaded Materials
						</h5>
					</div>
					<div class="card-body">
						<table class="table table-striped table-hover" id="fileTable">
							<thead class="table-primary">
								<tr>
									<th scope="col">#</th>
									<th hidden scope="col">Id</th>
									<th>Company Name</th>
									<th scope="col">File Title</th>
									<th scope="col">Description</th>
									<th scope="col">Published Date</th>
									<th scope="col">Actions</th>
								</tr>
							</thead>
							<tbody>
								<!-- If materials list is not empty -->
								<c:if test="${not empty materials}">
									<c:forEach var="material" items="${materials}"
										varStatus="status">
										<tr>
											<td>${status.index + 1}</td>
											<td hidden>${material.assignMentId}</td>
											<td>${material.companyName}</td>
											<td>${material.name}</td>

											<td><a href="${material.description}" target="_blank">${material.description}</a>
												<span id="link-container"></span></td>

											<td>${material.createdAt}</td>
											<td><c:if test="${user.role eq 7}">
													<a href="javascript:void(0);" class="btn btn-danger"
														onclick="deleteFile('${material.uploadUrl}', '${material.fileName}', '${material.assignMentId}')">
														<i class="bi bi-trash"></i> Delete
													</a>
												</c:if>
												<button type="button" class="btn btn-info"
													onclick="openMaterialModal('view', {
                                                             title: '${material.name}',
                                                             description: '${material.description}',
                                                             uploadUrl: '${material.filePath}',
                                                             fileName: '${material.filePath}'
                                                                })">
													<i class="fas fa-eye"></i> View
												</button> <!-- New Button for Upload Solved Assignment -->
												<button type="button" class="btn btn-success"
													onclick="uploadSolvedAssignment({
                                                               title: '${material.name}',
                                                   description: '${material.description}',
                                                         materialId: '${material.assignMentId}',
                                                         companyId :'${material.companyId}'
                                                                             })">
													<i class="fas fa-upload"></i> Upload Solved Assignment
												</button></td>
										</tr>
									</c:forEach>
								</c:if>

								<!-- If materials list is empty -->
								<c:if test="${empty materials}">
									<tr>
										<td colspan="5" class="text-center text-muted">No study
											material available at this moment.</td>
									</tr>
								</c:if>
							</tbody>

						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-wrap pd-20 mb-20 card-box"
			style="position: relative; left: 332px; bottom: 0%; width: 77%">
			<i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
			<script>
          document.write(new Date().getFullYear());
        </script>
			All Rights Reserved SkillPilots &reg; | Designed & Developed By <a
				href="https://www.cluematrix.com/" target="_blank"
				style="color: #2800b4">Cluematrix</a> Technologies Pvt.Ltd.
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script type="text/javascript">


function uploadSolvedAssignment(materialData) {
    Swal.fire({
        title: 'Upload Solved Assignment',
        html: 
            '<form id="uploadSolvedAssignmentForm">' +
                '<div class="form-group">' +
                    '<label for="title">Assignment Title</label>' +
                    '<input type="text" class="form-control" id="title" value="' + materialData.title + '" readonly>' +
                '</div>' +
                '<div class="form-group">' +
                    '<label for="description">Assignment Description</label>' +
                    '<textarea class="form-control" id="description" readonly>' + materialData.description + '</textarea>' +
                '</div>' +
                '<div class="form-group">' +
                    '<label for="solvedFile">Choose Solved File</label>' +
                    '<input type="file" class="form-control" id="solvedFile" accept=".pdf,.doc,.docx">' +
                '</div>' +
            '</form>',
        showCancelButton: true,
        confirmButtonText: 'Upload',
        preConfirm: () => {
            const fileInput = document.getElementById('solvedFile');
            if (!fileInput.files.length) {
                Swal.showValidationMessage('Please select a file to upload.');
                return false;
            }
            return fileInput.files[0];
        },
    }).then((result) => {
        if (result.isConfirmed) {
            // Create FormData object and append required fields
            const formData = new FormData();
            formData.append('assignmentFile', result.value);
            formData.append('materialId', materialData.id); 
            formData.append('companyId', materialData.companyId);
            formData.append('studentId',${user.id})

            // Send the form data via a POST request
            fetch('${pageContext.request.contextPath}/uploadSolvedAssignment', {
                method: 'POST',
                body: formData,
            })
                .then((response) => response.text()) // Parse the response as plain text
                .then((message) => {
                    if (message === 'Assignment uploaded and student notified successfully') {
                        Swal.fire(
                            'Success!',
                            message, 
                            'success'
                        );
                    } else {
                        Swal.fire(
                            'Error!',
                            message || 'Failed to upload the assignment. Please try again later.',
                            'error'
                        );
                    }
                })
                .catch((error) => {
                    console.error('Upload error:', error);
                    Swal.fire('Error!', 'An unexpected error occurred. Please try again.', 'error');
                });
        }
    });
}


</script>


	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- js -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
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
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/advanced-components.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
	<script
		src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>


</body>




<script>

document.querySelector('.btn-secondary').addEventListener('click', function () {
	  $('#addMaterialModal').modal('hide');
	});

function viewFile(fileName) {
    const baseURL = window.location.origin;  // Get the base URL dynamically
    const fileUrl = `${pageContext.request.contextPath}/uploads/`+ fileName;
    console.log("File URL:", fileUrl);  // Log the full URL to check it
    window.open(fileUrl, '_blank');
}

function openMaterialModal(mode, material) {
    // Get modal elements
    const modalTitle = document.getElementById('addMaterialModalLabel');
    const materialTitle = document.getElementById('materialTitle');
    const materialDescription = document.getElementById('materialDescription');
    const materialFile = document.getElementById('materialFile');
    const uploadSection = document.getElementById('uploadSection');
    const saveButton = document.getElementById('saveButton');
    const downloadButton = document.getElementById('downloadButton');
    const messageArea = document.getElementById('messageArea');

    // Reset modal fields and buttons
    materialTitle.value = '';
    materialDescription.value = '';
    materialFile.value = '';
    uploadSection.style.display = 'block';
    saveButton.style.display = 'none';   
    downloadButton.style.display = 'none';
    messageArea.style.display = 'none';  

    if (mode === 'add') {
        modalTitle.textContent = 'Add Material';
        saveButton.style.display = 'block';
        saveButton.onclick = () => {
            if (materialTitle.value.trim() === '') {
                messageArea.style.display = 'block';
                return;
            }
            document.getElementById('addMaterialForm').submit();
        };
    } else if (mode === 'view') {
        modalTitle.textContent = 'View Material';
        uploadSection.style.display = 'none'; 
        materialTitle.value = material.title || 'No title provided';
        materialDescription.value = material.description || 'No description available';
           const fileName = material.fileName;
            const fileNameWithExtension = fileName.endsWith('.pdf') ? fileName : fileName+`.pdf`;

            fileNameLabel.textContent = fileNameWithExtension;
            fileNameLabel.style.display = 'inline'; //  
        downloadButton.style.display = 'block';
        downloadButton.href =`${pageContext.request.contextPath}/download/`+ material.uploadUrl; 
    }

    // Show the modal
    const modal = new bootstrap.Modal(document.getElementById('addMaterialModal'));
    modal.show();
}


</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("submitBtn").addEventListener("click", function() {
        const title = document.getElementById("materialTitle").value.trim();
        const messageArea = document.getElementById("messageArea");
        
        if (title === "") {
            // Display message if title is not provided
            messageArea.style.display = "block";
        } else {
            // Hide message and submit the form if title is provided
            messageArea.style.display = "none";
            document.getElementById("addMaterialForm").submit();
        }
    });


</script>










</html>