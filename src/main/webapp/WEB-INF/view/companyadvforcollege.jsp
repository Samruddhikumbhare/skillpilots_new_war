
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SkillPilots | Company Advertisements</title>
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
	<%@include file="stylesheets.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/dist/css/myCss/schedule_internship.css" />

<style>
input::-webkit-input-placeholder {
	font-size: 200 !important;
}

.txt-center {
	text-align: center;
}

.img-thumbnail {
	width: 90px !important;
	height: 90px !important;
	max-width: 90px;
}

::-webkit-scrollbar {
	width: 0.5em;
	height: 1em
}

::-webkit-scrollbar-button {
	background: white
}

::-webkit-scrollbar-track-piece {
	background: white
}

::-webkit-scrollbar-thumb {
	background: #0073b7
}

.scroll {
	overflow-y: scroll;
	height: 140px;
}

input {
	border: #000;
	padding: 10px;
	font-size: 1.2em;
	/* width: 100%;*/
}

input::placeholder {
	color: red;
}

label, input {
	font-family: sans-serif;
}

.checkbox label, .radio label {
	min-height: 0px !important;
}

.checkbox label, .radio label {
	min-height: 0px !important;
}

.checkbox .checkbox-material:before, label.checkbox-inline .checkbox-material:before
	{
	display: block;
	position: absolute;
	top: -5px;
	left: 0;
	content: "";
	background-color: rgba(0, 0, 0, .84);
	height: 0px !important;
	width: 0px !important;
	border-radius: 100%;
	z-index: 1;
	opacity: 0;
	margin: 0;
	-webkit-transform: scale3d(2.3, 2.3, 1);
	transform: scale3d(2.3, 2.3, 1)
}

.skin-blue .form-group label, .skin-blue .form-group.is-focused label.control-label
	{
	color: black !important;
}

.checkbox .checkbox-material .check, label.checkbox-inline .checkbox-material .check
	{
	position: relative;
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid rgba(0, 0, 0, .54);
	border-radius: 2px;
	overflow: hidden;
	z-index: 1
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	background-color: #05b038 !important;
	border-color: #05b038 !important;
}

.bg-orange {
	background-color: #05b038 !important;
}

.check {
	width: 10px !important;
	height: 10px !important;
	margin-right: 5px !important;
}

.radio .circle, label.radio-inline .circle {
	border: 2px solid rgba(0, 0, 0, .54);
	height: 10px !important;
	width: 10px !important;
	border-radius: 100% !important;
}

.radio span, label.radio-inline span {
	left: 29px !important;
}

.checkbox .checkbox-material, label.checkbox-inline .checkbox-material {
	top: 0px !important;
}

.form-group label {
	font-size: 12px !important;
}

.align-left {
	margin-top: 10px;
	margin-left: -3%;
	margin-top: 1%;
	margin-right: 1%;
	margin-bottom: 1%;
	margin-left: 0%;
}

.morecontent span {
	display: none;
}

.morelink {
	display: block;
}

.panel-heading {
	background-color: #0073b7;
	color: #FFFFFF;
	width: 100%;
}

.btn {
	padding: 1px 12px !important;
}

.panel-heading {
	padding: 5px 15px;
}

.form-group {
	padding-bottom: 5px !important;
	margin: 0px 0px 0px -20px !important;
}

h5, .h5 {
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}

.box .box-header {
	padding: 6px !important;
}

.bg-white {
	background-color: white;
}

/* .tab_td {
    padding: 3px !important;
    
}
.td_hover:hover{
color: black;
background: #cccccc;
font-weight: bold;
}
.modal-body {
    position: relative !important;
    padding: 15px !important;
}  */
tbody {
	height: 100px;
	overflow: auto;
}
</style>
</head>

<body class="skin-blue sidebar-mini wysihtml5-supported fixed"
	onload="advertisementLoad();">
	<div id="load"></div>
	<div class="wrapper" id="wrapperdiv">
		<!--header-->
		<%@include file="header.jsp"%>
		<%@include file="sidebar_utility.jsp"%>
		<%@include file="footer.jsp"%>

		<!--Start Content Wrapper. Contains page content-->
		<div class="content-wrapper bg-white">
			<!-- Content Header (Page header)
			<section class="content-header bg-white">
				<h1>WOW</h1>
			</section>
			<!--End Content Header (Page header)-->
			<section class="content">
				<div class="row bg-white" style="max-height: 80%; overflow: scroll">
					<div class="col-md-4" style="padding: 0px 40px;">
						<div class="box">
							<div class="panel-heading">
								<strong>Filter</strong>
							</div>
						</div>
						<div class="box">
							<div class="box-header with-border">
								<i class="fa fa-map-marker"></i>&nbsp; Filter by location <span
									id="location_reset" title="Reset filter"
									style="float: right; color: #0073b7;" class="pointer"
									onclick="resetSearch('location','location_reset');"> <i
									class="fa fa-refresh"></i></span>
							</div>
							<div class="box-tools">
								<div class="input-group input-group-sm">
									<div class="form-group is-empty" style="padding: 10px;">
										<input type="text" id="location"
											class="form-control pull-right search_control"
											style="width: 88%; border: 1px solid #0073b7; border-radius: 4px;" />
									</div>
									<div class="input-group-btn">
										<label> <span title="Search" class="pointer"
											style="color: #0073b7"
											onclick="getnextAdvertisement('0','0');getpageno('1');">
												<i class="fa fa-filter"></i>
										</span></label>
									</div>
								</div>
							</div>
							<div class="form-group scroll" id="div_location">
								<c:forEach items="${cities}" var="location">
									<div class="checkbox">
										<label id="lbl_${location}"><input type="checkbox"
											class="filter_checkbox" name="location" value="${location}">${location}</label>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="box">
							<div class="box-header with-border">
								<i class="fa fa-building"></i>&nbsp; Filter by dept. <span
									title="Reset" id="dept_reset"
									style="float: right; color: #0073b7" class="pointer"
									onclick="resetSearch('dept','dept_reset');"> <i
									class="fa fa-refresh"></i></span>
							</div>
							<div class="box-tools">
								<div class="input-group input-group-sm">
									<div class="form-group is-empty" style="padding: 10px;">
										<input type="text" id="dept"
											class="form-control pull-right search_control"
											style="width: 93%; border: 1px solid #0073b7; border-radius: 4px;">
									</div>
									<div class="input-group-btn">
										<label><span title="search" class="pointer"
											style="color: #0073b7"
											onclick="getnextAdvertisement('0','0');getpageno('1');">
												<i class="fa fa-filter"></i>
										</span></label>
									</div>
								</div>
							</div>
							<div class="form-group scroll" id="div_dept">
								<c:forEach items="${dept_names}" var="dept_name">
									<div class="checkbox">
										<c:set var="deptall_sp_remv"
											value="${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(dept_name,')', ''),
												'(', ''),'&', ''),'.', ''),' ', '')}" />
										<label id="lbl_${deptall_sp_remv}" class="showall"><input
											type="checkbox" class="filter_checkbox" name="dept"
											value="${deptall_sp_remv}"> ${dept_name}</label>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="box">
							<div class="box-header with-border">
								<i class="fa fa-briefcase"></i>&nbsp; Filter by skill <span
									title="Reset" id="tech_reset"
									style="float: right; color: #0073b7" class="pointer"
									onclick="resetSearch('tech','tech_reset');"> <i
									class="fa fa-refresh"></i></span>
							</div>
							<div class="box-tools">
								<div class="input-group input-group-sm">
									<div class="form-group is-empty" style="padding: 10px;">
										<input class="form-control pull-right search_control"
											style="width: 91%; border: 1px solid #0073b7; border-radius: 4px;"
											id="tech" type="text">
									</div>
									<div class="input-group-btn">
										<label><span title="search" style="color: #0073b7"
											class="pointer"
											onclick="getnextAdvertisement('0','0');getpageno('1');"><i
												class="fa fa-filter"></i></span></label>
									</div>
								</div>
							</div>
							<div class="form-group scroll" id="div_tech">
								<c:forEach items="${tech_names}" var="tech_name">
									<div class="checkbox">
										<c:set var="techall_sp_remv"
											value="${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(tech_name,
											'\\'', ''),'/', ''),'+', ''),'#', ''),'.', ''),' ', '')}" />
										<label id="lbl_${techall_sp_remv}" class="showall_tech"><input
											type="checkbox" class="filter_checkbox" name="tech"
											value="${techall_sp_remv}"> ${tech_name}</label>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="box">
							<div class="box-header with-border">
								<i class="fa fa-inr"></i>&nbsp; Stipend <span id="sti_reset"
									title="Reset" style="float: right; color: #0073b7;"
									class="pointer" onclick="resetSearch('stipend','sti_reset');">
									<i class="fa fa-refresh"></i>
								</span>
							</div>
							<div class="form-group" style="margin: 0px !important;">
								<div class="input-group input-group-sm">
									<div class="form-group is-empty">
										<div class="radio">
											<label><input type="radio" class="sti_check"
												name="stipend" value="1"> Paid</label>

										</div>
										<div class="radio">
											<label><input type="radio" class="sti_check"
												name="stipend" value="0"> Unpaid</label>
										</div>
									</div>
									<div class="input-group-btn">
										<label><span title="search" class="pointer"
											style="float: right; color: #0073b7"
											onclick="getnextAdvertisement('0','0');getpageno('1');">
												<i class="fa fa-filter" style="font-size: 135%;"></i>
										</span></label>
									</div>
								</div>
							</div>
						</div>
						<div class="box">
							<div class="box-header with-border">
								<i class="fa fa-clock-o"></i>&nbsp; Duration <span
									id="duration_reset" title="Reset"
									style="float: right; color: #0073b7;" class="pointer"
									onclick="resetSearch('duration','duration_reset');"> <i
									class="fa fa-refresh"></i></span>
							</div>
							<div class="form-group">
								<div class="radio">
									<label><input type="radio" class="duration_check"
										name="duration" value=">="> Greater Than </label> <label><input
										type="radio" class="duration_check" name="duration" value="<=">
										Less Than </label>
								</div>
								<div class="input-group input-group-sm">
									<div class="is-empty">
										<input class="form-control pull-right"
											style="width: 88%; border: 1px solid #0073b7; border-radius: 4px;"
											id="duration_val" type="text" required="true">
									</div>
									<div class="input-group-btn">
										<label><span title="Search" style="color: #0073b7"
											class="pointer"
											onclick="getnextAdvertisement('0','0');getpageno('1');"><i
												class="fa fa-filter" style="font-size: 135%;"></i></span></label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-8" style="padding-right: 40px;">
						<div class="box">
							<div class="panel-heading" style="text-align: center;">
								<strong>Available Internships</strong>
							</div>
						</div>
						<div id='box' class="box"
							style="height: 975px; padding: 5px; max-height: 144%; overflow: auto;">
						</div>
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right"
								id="page_list1"></ul>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!--End Content Wrapper. Contains page content-->

		<%@include file="comp_coll_details_modal.jsp"%>
		<%@include file="modal.jsp"%>
		<%@include file="modal_adv_schedule.jsp"%>
		<%@include file="modalStudentDetails.jsp"%>
	</div>
	<input type="hidden" id="gif_file_path"
		value='<c:url value="/images/loading.gif"/>'>
	<c:if
		test="${role== ProjectConstants.hod_Role || role==ProjectConstants.dept_incharge_Role }">
		<input type="hidden" id="role" value="${role}" />
	</c:if>
	<c:if test="${log_type eq ProjectConstants.user_initials_student  }">
		<input type="hidden" id="student_log" value="${log_type}" />
	</c:if>
	<%@include file="scriptfiles.jsp"%>
	<script type="text/javascript">
		$("#send_interns").attr("disabled", true);

		$('.student_chk').click(function() {
			if (!$("input[type='radio']:checked").val()) {
				alert('Company Not Selected !');
				return false;
			} else {
				var checkedIds = $(".student_chk:checked").length;
				var uncheck = false;
				if (checkedIds > request_student_limit) {
					alert(raise_req_student_limit_rchd);
					uncheck = true;
				} else {
					var company_id = $(
							'input[name=cmp_radiobtn]:checked')
							.attr("id");
					var studid = $(this).attr("id");
					$
							.ajax({
								url : 'checkEligibleToApply?student_id='
										+ studid
										+ '&company_id='
										+ company_id,
								type : 'get',
								async : false,
								success : function(response) {
									if (response.result) {
										uncheck = true;
										if (response.reason == "applied") {
											alert(raise_req_student_req_pndng);
										} else {
											alert(already_has_ongoing_internship);
										}
									}
								},
								error : function(errorResp) {
									console.log(errorResp);
									alert("Oops! Some error occured while checking student's eligibility to apply!");
								}
							});
				}

				if (uncheck) {
					$('#' + studid).prop('checked', false);
					return false;
				}

				//if ($(this).is(":checked")) {
				if (checkedIds > 0) {
					$('#send_interns').removeAttr('disabled');
				} else if ($(this).is(":not(:checked)")) {
					$('#send_interns').attr("disabled",
							"disabled");
				}
			}
		});
	</script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/internship_schedule.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/schedule_internship.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/showmore_or_showless.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/sendinternshipGroup.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/companyadvforcollege.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
</body>

</html>