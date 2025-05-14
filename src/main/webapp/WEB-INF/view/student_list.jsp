<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="user_session.jsp" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>SkillPilots | Student List</title>

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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/css/myCss/feedback_css.css">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
	<script type="text/javascript">
	function validateMe() {
		if (document.getElementById("files").files.length == 0) {
			alertMsg("Please select a file.");
			return false;
		} else {
			return true;
		}
	}
</script>
	<style type="text/css">
	.sidebar-menu .dropdown-toggle {
		padding: 15px 12px 15px 54px!important;
		font-size: 15px!important;
	}
	.page-link{
		line-height: 1rem!important;
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
#studentDetailsModal{
	padding-left: 21% !important;
}
	</style>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo"><img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">
				Loading...
			</div>
		</div>
	</div>

	<%@include file="header.jsp"%>

	<div class="right-sidebar">
		<div class="sidebar-title">
			<h3 class="weight-600 font-16 text-blue">
				Layout Settings
				<span class="btn-block font-weight-400 font-12">User Interface Settings</span>
			</h3>
			<div class="close-sidebar" data-toggle="right-sidebar-close">
				<i class="icon-copy ion-close-round"></i>
			</div>
		</div>
		<div class="right-sidebar-body customscroll">
			<div class="right-sidebar-body-content">
				<h4 class="weight-600 font-18 pb-10">Header Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);" class="btn btn-outline-primary header-white">White</a>
					<a href="javascript:void(0);" class="btn btn-outline-primary header-dark active">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);" class="btn btn-outline-primary sidebar-light ">White</a>
					<a href="javascript:void(0);" class="btn btn-outline-primary sidebar-dark active">Dark</a>
				</div>
				<div class="reset-options pt-30 text-center">
					<button class="btn btn-danger" id="reset-settings">Reset Settings</button>
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
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">

				<div class="row clearfix">
					<div class="col-lg-12 col-md-12 col-sm-12 mb-30">
						<div class="pd-20 card-box">
							<h5 class="h4 text-blue mb-20 text-center">Student List</h5>
							<div class="tab">
							<div id="approvedSearchBar" class="form-group d-none w-25 float-end">
			                    <input type="text" class="form-control" id="approvedStudentSearch" placeholder="Search by name...">
			                  
		                    </div>
								<ul class="nav nav-tabs customtab" role="tablist">
									<li class="nav-item">
										<a class="nav-link active" data-toggle="tab" href="#reg_multi" role="tab" aria-selected="true">Register Multiple Students</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#new_adm" role="tab" aria-selected="false">New Admissions</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#stud_appr" role="tab" aria-selected="false">Approved Students</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#stud_rej" role="tab" aria-selected="false">Rejected Students</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="reg_multi" role="tabpanel">
										<div class="pd-20 text-center">
											<span style="font-size: 16px;font-weight:600">
											Here you can upload an excel with basic data of student's who currently belong<br>
											to your department and create validated logins for them.
										</span>
										</div>
										<div class="text-center" style="margin-top:3%;">
										<span style="font-size: 12px;font-weight:600">
											Download Excel format from here.</span>
										<br>
										   
									<a href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/Student_Registration.xlsx" class="btn btn-primary btn-sm" style="color:white;padding:3px !important;margin-top: 1% !important">
											Download <i class="fa fa-download"></i>
										<div class="ripple-container"><div class="ripple ripple-on ripple-out" style="left: 53.1477px; top: -2.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 42.2386px; top: -6.73865px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 42.2386px; top: -6.73865px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 42.2386px; top: -6.73865px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 42.2386px; top: -6.73865px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 61.1477px; top: -10.1932px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 57.1477px; top: -9.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 57.1477px; top: -9.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 54.1477px; top: -6.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 54.1477px; top: -6.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 54.1477px; top: -6.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 54.1477px; top: -6.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 54.1477px; top: -6.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 61.1477px; top: -9.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div><div class="ripple ripple-on ripple-out" style="left: 62.1477px; top: -9.19318px; background-color: rgb(255, 255, 255); transform: scale(2.72301);"></div></div></a>
									</div>
									<div style="margin-top:3%;" 
										title="Please upload excel after filling the downloaded excel from above.">
										<form class="text-center" method="post" action="uploadregistrationXL" enctype="multipart/form-data" 
											onsubmit="return validateMe()">
											<span style="font-size: 12px;font-weight:600">
												Upload filled Excel File.</span>
											<br>
											<input class="form-control-file form-control height-auto" type="file" id="files" name="fileUpload" 
												style="display:inline; margin-top:1%;max-width: 30%;"
												accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/>
											<input type="submit" id="btnUpload" class="btn btn-primary btn-sm"  
												value="Upload"
												style="padding:3px !important;margin-top: 1% !important;"/>
										</form>
									</div>
									</div>
									<div class="tab-pane fade" id="new_adm" role="tabpanel">
										<div class="pd-20">
							<c:if test="${user.role eq '7'|| user.role eq '8'}">
							<c:if test="${not empty studentRequestList}">
								<table class="data-table table hover nowrap" id="student_req"
									style="margin-top: 7px;">
									<thead>
										<tr>
											<th class="table-plus datatable-nosort">select</th>
											<th>Student Name</th>
											<th>Requested Date</th>
										</tr>
									</thead>
									<c:forEach items="${studentRequestList}" var="student">
										
										<tbody>
											<tr id="row${student.student_id}">
												<td><input type="checkbox" name="stud_id"
													id="${student.student_id}" value="${student.student_id}" onclick="enable_disable(this)"></td>
												<td><a><span class="pointer actionSpan" title="Click Here To View Student Details" style="color: blue; cursor: pointer;"
													data-toggle="modal" data-target="#studentDetailsModal"
													onclick="dispStudentData('${student.student_id}');">${student.student_name}</span></a></td>
												<td>${student.creation_date}</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
								<div class="text-center">
									<button type="button" id="app_btn"
									class="btn btn-primary btn-sm  text-center" ><i class="fa fa-check" aria-hidden="true"></i> Approve</button>
								<button type="button" id="rej_btn" class="btn btn-danger btn-sm  text-center"
									data-toggle="modal" data-target="#rejectModelfor_External_req"
									onclick="rejectReqId('${student.student_id}');">  <i class="fa fa-ban" aria-hidden="true"></i> Reject</button>
								</div>
							</c:if>
							</c:if>
							<c:if test="${empty studentRequestList}">
								<label>No new admission found.</label>
							</c:if>
										</div>
									</div>
									<div class="tab-pane fade" id="stud_appr" role="tabpanel">
										<div class="pd-20">
											<c:if test="${not empty studentApprove_List}">
								<table class="data-table table hover multiple-select-row nowrap" style="margin-top:7px;">
									<thead>
										<tr>
											<th class="table-plus datatable-nosort">Student Name</th>
											<th>Mobile No.</th>
											<th>Email</th>
											<th>Year</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${studentApprove_List}" var="student">
											<tr>
												<td><a href="#" onclick="return false;"><span class="pointer actionSpan" title="Click Here To View Student Details"
												 style="color: blue; cursor: pointer;"	data-toggle="modal" data-target="#studentDetailsModal"
													onclick="dispStudentData('${student.student_id}');">${student.student_name}</span></a></td>
												<td>${student.contact}</td>
												<td>
													${student.email_id}
												</td>
												<td>${student.curr_year}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${empty studentApprove_List}">
								<label>No Student found.</label>
							</c:if>
										</div>
									</div>
									
												<div class="tab-pane fade" id="stud_rej" role="tabpanel">
										<div class="pd-20">
											<c:if test="${not empty rejectedStudents}">
								<table class="data-table table hover multiple-select-row nowrap" style="margin-top:7px;">
									<thead>
										<tr>
											<th class="table-plus datatable-nosort">Student Name</th>
											<th>Mobile No.</th>
											<th>Email</th>
											<th>Year</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${rejectedStudents}" var="student">
											<tr>
												<td><a href="#" onclick="return false;"><span class="pointer actionSpan" title="Click Here To View Student Details"
												 style="color: blue; cursor: pointer;"	data-toggle="modal" data-target="#studentDetailsModal"
													onclick="dispStudentData('${student.student_id}');">${student.student_name}</span></a></td>
												<td>${student.contact}</td>
												<td>
													${student.email_id}
												</td>
												<td>${student.curr_year}</td>
											</tr>
										
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${empty rejectedStudents}">
								<label>No Student found.</label>
							</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="modal.jsp"%>
			<%@include file="modalStudentDetails.jsp"%>
			<%@include file="footer.jsp"%>
		</div>
	</div>
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/student_list.js"></script>
	<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<!-- buttons for Export datatable -->
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
<%-- <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
 --%>	
 <script type="text/javascript">
		
		$(document).ready(function () {
			  var student_id = [];
			  $("input[type='checkbox']").change(function() {
			  var checked = $(this).val();
			    if ($(this).is(':checked')) {
			    	student_id.push(checked);
			    }else{
			    	student_id.splice($.inArray(checked, student_id),1);
			    }
			  });
			 
			  $('#app_btn').on('click', function () {
				  $.ajax({
					  url:"stud_a_r?student_id="+student_id+"&click_type=approve",
						/* url : "assignGroupRoles?group_role_assign="+tmp, */
						cache : false,
						success : function(data) {
							location.reload();
						}
					});
			  });
			  
			});
		function closeModal(){
		    $(".modal-backdrop").css("position", "inherit");
			//window.location.reload();
		}
		
		 function dispStudentData(studentId) {
			    $("#divLoading").show();
			    $.ajax({
			        type: "GET",
			        url: "${pageContext.request.contextPath}/getStudentDetails?student_id=" + studentId,
			        async: false,
			        success: function(response) {
			            $('#scrollDiv').scrollTop(0);
			            // setting personal details
			            var studentDetails = response; // Access the response directly
			            $("#name").text(studentDetails.student_name);
			            $("#email").text(studentDetails.email_id);
			            $("#contact").text(studentDetails.contact);
						
			            $("#curr_city").text(studentDetails.curr_city);
			            $("#home_city").text(studentDetails.home_city);
			            $("#skills").text(studentDetails.skills);
			            $("#dob").text(studentDetails.d_o_b);
			            $("#interest").text(studentDetails.interest);
			            $("#hobbies").text(studentDetails.hobbies);
			            $("#achievements").text(studentDetails.achievements);
			            if (studentDetails.photo != null && studentDetails.photo != "") {
			                document.getElementById("studentPic").src = "data:image/png;base64," + studentDetails.photo;
			            } else {
			                document.getElementById("studentPic").src = "data:image/png;base64," + blank_pro_image;
			            }

			        },
			        error: function(xhr, status, error) {
			            console.log("Error:", error);
			            // Handle error here
			        }
			    });
			}
		
	</script>
	<script>
	$(document).ready(function () {
		$('a[href="#stud_appr"]').on('shown.bs.tab', function () {
			$('#approvedSearchBar').removeClass('d-none');
		});
		$('a[data-toggle="tab"]').not('[href="#stud_appr"]').on('shown.bs.tab', function () {
			$('#approvedSearchBar').addClass('d-none');
		});
		$('#approvedStudentSearch').on('keyup', function () {
			var value = $(this).val().toLowerCase();
			$('#stud_appr tbody tr').filter(function () {
				$(this).toggle($(this).find('td:first').text().toLowerCase().indexOf(value) > -1);
			});
		});
	});
</script>
</body>
</html>