<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="user_session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Edit Profile</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
<style type="text/css">
textarea.form-control {
    height: 71px;
}
.sidebar-menu .dropdown-toggle {
		padding: 15px 12px 15px 54px!important;
		font-size: 15px!important;
	}
.custom-file-input, .custom-file-label, .custom-select, .form-control {
    font-family: 'Inter', sans-serif;
    color: #131e22;
    font-weight: 400;
    height: 41px;
    border-color: #d4d4d4;
    letter-spacing: .035em;
    -webkit-transition: all .3s ease-in-out;
    transition: all .3s ease-in-out;
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
    padding: 0px 15px 1px 7px!important;
    min-height: 75px;
    color: #666;
    font-size: 13px;
    font-weight: 500;
    font-family: 'Inter', sans-serif;
    border-radius: 1px;
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
	left: 0;
	width: 100%;
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
				<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg" alt="">
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
				Layout Settings <span class="btn-block font-weight-400 font-12"></span>
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
				src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg' alt="" class="dark-logo"> 
				<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg' alt="" class="light-logo">
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
				<h2 class="h3 mb-0">Edit Your Profile Information</h2>
			</div>
			<div class="pd-20 card-box mb-30">
				<div class="row">
					<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30">
						<div class="pd-20 card-box height-100-p">
							<%-- <div class="profile-photo">
								<a href="modal" data-toggle="modal" data-target="#modal"
								
								class="edit-avatar"><i class="fa fa-pencil"></i></a> 
						

								<img src="<c:url value='/get_logo'/>" alt="logo" class="avatar-photo"
									style="width: -webkit-fill-available; height: -webkit-fill-available;">
								<div class="modal fade" id="modal" tabindex="-1" role="dialog"
									aria-labelledby="modalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-body pd-5">
												<div class="img-container">
													<img id="image" src="<c:url value='/get_logo'/>"
														alt="Picture" style="inline-size: -webkit-fill-available;">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> --%>
							
							<!-- Center the profile image container -->
<div class="d-flex justify-content-center align-items-center mb-3">
    <div class="profile-img-container" data-toggle="modal" data-target="#profilePicModal11">
        <img src="<c:url value='/get_logo2'/>" alt="Student Photo"
            class="rounded-circle shadow-lg"
            style="width: 180px; height: 180px; object-fit: cover; border: 6px solid #007BFF;">
        <div class="overlay">Change Photo</div>
    </div>
</div>

							
							
							<div class="modal fade" id="profilePicModal11" tabindex="-1"
								role="dialog" aria-labelledby="profilePicModalLabel11"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<form action="update-company-photo" method="post"
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
												<img src="${pageContext.request.contextPath}/get_logo2"
													alt="Current Photo" class="rounded mb-3"
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
							
							
							
							<div class="d-flex justify-content-center">
    <div class="text-center">
        <h5 class="h5 mb-0">${user.username}</h5>
        <p class="text-muted font-14">Your subtitle</p>
    </div>
</div>

							<div class="profile-info">
								<h5 class="mb-20 h5 text-blue">Contact Information</h5>
								<ul>
									<li><span>Email Address:</span>${user.email}</li>
									<li><span>Phone Number:</span> ${user.contact_no}</li>
									<if test="${user.verified} eq 1"> 
														<li><span>Account Verified :</span> true
													</if>
													</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30">
						<div class="card-box height-100-p overflow-hidden">
							<div class="profile-tab height-100-p">
								<div class="tab height-100-p">
									<ul class="nav nav-tabs customtab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#timeline" role="tab">Personal
												Information</a></li>
									</ul>
									<div class="tab-content">
										<!-- Timeline Tab start -->
										<div class="tab-pane fade show active" id="timeline"
											role="tabpanel">
											<div class="pd-20">
												<c:url var="addAction" value="/editCompProfile"></c:url>
<form modelAttribute="company" action="${addAction}" enctype="multipart/form-data" method="post">
    <ul class="profile-edit-list row">
        <li class="weight-500 col-md-6">
            <h4 class="text-blue h5 mb-20">Edit Your Profile Setting</h4>
            <div class="form-group">
                <label for="company_name">Company Name</label>
                <input id="company_name" name="company_name" value="${company.company_name}" class="form-control form-control-lg" readonly />
                <small id="namelabel" style="color: red;"></small>
            </div>
            <div class="form-group">
                <label for="estd_date">Establishment Date</label>
                <input id="estd_date" name="estd_date" value="${company.estd_date}" class="form-control form-control-lg" readonly />
            </div>
            <div class="form-group">
                <label for="email_id">Email-Id</label>
                <input id="email_id" name="email_id" value="${company.email_id}" class="form-control form-control-lg" readonly />
            </div>
            <div class="form-group">
                <label for="web_url">Web URL</label>
                <input id="web_url" name="web_url" value="${company.web_url}" placeholder="Enter URL" class="form-control form-control-lg" required maxlength="30" />
            </div>
            <div class="form-group">
                <label for="registration_no">Registration No.(CIN/GST/etc)</label>
                <input id="registration_no" name="registration_no" value="${company.registration_no}" class="form-control form-control-lg" readonly />
            </div>
            <div class="form-group">
                <label for="company_about">About Us</label>
                <input id="company_about" name="about" value="${company.about}" class="form-control form-control-lg" placeholder="About company..." required maxlength="750"></input>
            </div>
           <%--  <div class="form-group">
                <label for="company_logo">Upload Image</label>
                <div class="custom-file">
                    <input type="file"  src="<c:url value='/get_logo'/> "id="company_logo" name="companylogo" accept="image/*" class="custom-file-input form-control form-control-lg form-control-file">
                    <label class="custom-file-label" for="company_logo">Choose file</label>
                </div>
                
                
                
            </div> --%>
             <div class="form-group">
                <label for="contact1">Contact 1</label>
                <input id="contact1" type="text" name="contact_1" value="${company.contact_1}" class="form-control form-control-lg contact" pattern="\d*" placeholder="Enter contact No" onchange="checkContactExists(this)" onblur="checkContactExists(this)" required maxlength="12" minlength="10">
            </div>
            
           
            <div hidden class="form-group">
                <label for="address-autocomplete">City</label>
                <input id="address-autocomplete" name="city" value="${company.city}" placeholder="Select city for your new address" onFocus="geolocate()" type="text" class="form-control">
            </div>
        </li>
        <li class="weight-500 col-md-6 mt-5">
           
            <div class="form-group">
                <label for="address_line1">Address (Line-1)</label>
                <input id="address_line1" name="line_1" value="${company.line_1}" class="form-control form-control-lg" placeholder="Address line 1" required maxlength="100" disabled>
            </div>
            <div class="form-group">
                <label for="address_line2">Address (Line-2)</label>
                <input id="address_line2" name="line_2" value="${company.line_2}" class="form-control form-control-lg" placeholder="Address line 2" maxlength="100" disabled>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <input id="city" name="city" value="${company.city}" class="form-control form-control-lg" placeholder="City" readonly required maxlength="25">
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <input id="state" name="state" value="${company.state}" class="form-control form-control-lg" placeholder="State" readonly required maxlength="25">
            </div>
            <div class="form-group">
                <label for="country">Country</label>
                <input id="country" name="country" value="${company.country}" class="form-control form-control-lg" placeholder="Country" readonly required maxlength="25">
            </div>
            <div class="form-group">
                <label for="pincode">Pincode</label>
                <input id="pincode" name="pincode" value="${company.pincode}" class="form-control form-control-lg" pattern="[0-9]{6}" placeholder="Pincode" disabled maxlength="6" required>
            </div>
              <div class="form-group">
                <label for="contact2">Contact 2</label>
                <input id="contact2" type="text" name="contact_2" value="${company.contact_2}" class="form-control form-control-lg contact" pattern="\d*" placeholder="Enter contact No" maxlength="12" minlength="10">
            </div>
           
           
            <div class="form-group mb-0">
                <input type="submit" id="sbtn" class="btn btn-primary" value="Save & Update">
            </div>
        </li>
    </ul>
</form>




											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<input type="hidden" value="${user_data.email_id}"
					id="existing_emailid"> <input type="hidden"
					value="${user_data.contact_no}" id="existing_contact">
			</div>
			<%@include file="modal_common.jsp"%>
			<%@include file="footer.jsp"%>
			</div>
			<input type="hidden" value="${college.email_id}" id="existing_emailid">
			<input type="hidden" value="${college.contact_1}" id="existing_contact">
			<input type="hidden" value="${college.contact_2}" id="existing_contact2">
		</div>
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUlCQ6MBRc_JIpz68S5-7prwYjevo1s1M&libraries=places&callback=initAutocomplete" async defer></script>
	<script  src="${pageContext.request.contextPath}/style/dist/js/myjs/geolocation.js"></script>
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
	
	<script>
document.addEventListener('DOMContentLoaded', function () {
    var fileInput = document.getElementById('company_logo');
    var label = fileInput.nextElementSibling; // The label element next to the file input

    fileInput.addEventListener('change', function (event) {
        var fileName = event.target.files[0] ? event.target.files[0].name : 'Choose file';
        label.textContent = fileName;
    });
});


function removeProfilePhoto() {
    $.ajax({
      type: "POST",
      url: "${pageContext.request.contextPath}/remove-company-photo",
      success: function(response) {
        if (response.success) {
          alert("Photo removed successfully");
          // Optionally update the image to show placeholder
          $('img[alt="Current Photo"]').attr("src", "${pageContext.request.contextPath}/static/images/default-logo.png");
        } else {
          alert("Failed to remove photo");
        }
      },
      error: function(xhr, status, error) {
        alert("Error removing photo: " + xhr.responseText);
      }
    });
  }


</script>

</body>
</html>