<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="user_session.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>SkillPilots | Internship Requests Status</title>
<link rel="apple-touch-icon" sizes="180x180" href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
<link rel="icon" type="image/png" sizes="16x16" href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css'>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css'>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css'>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css'>
<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css'>
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
.sidebar-menu .dropdown-toggle {
		padding: 15px 12px 15px 54px!important;
		font-size: 15px!important;
	}
	.user-notification .dropdown-toggle .badge {
    position: absolute;
    right: 5px;
    top: 7px;
    /* background: #0f2c7eeb; */
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
	
	#notif_header_text{
	color: #2800bb;
    font-size: 13px;
    }
    .fa fa-info-circle{
    	font-size: medium;
    }
</style>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg'
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
			<jsp:useBean id="now" class="java.util.Date" />
			<div class="title pb-20">
				<h4 class="h4 mb-0 text-center" style="color: white;background: #0f2c7eeb;border-radius: 5px;">Internship Request Status</h4>
			</div>
			<div class="card-box mb-30">
				<div class="pd-20">
					<c:if test="${not empty studentsAppliedToCompanies}">
							<table class="data-table table hover nowrap">
    <thead class="thead-light">
        <tr>
            <th>Request ID</th>
            <th>Company Name</th>
            <th>Date Applied</th>
            <th>Domain</th>
            <th>Duration</th>
            <th>Status</th>
            <!-- Add more headers here if needed -->
        </tr>
    </thead>
   
 
 
								<tbody id="tablist">
										<c:forEach var="stApplied"
											items="${studentsAppliedToCompanies}">
											<tr>
												<td>${stApplied[7]}	</td>
												<td>${stApplied[11]}</td>
										<td><c:set var="dateString" value="${stApplied[8]}" /> <fmt:parseDate
												var="parsedDate" value="${dateString}" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${parsedDate}" /></td>
										<td>${stApplied[4]}</td>
												<td>${stApplied[5]} Weeks</td>
												<td><c:choose>
														<c:when
															test="${(role==ProjectConstants.hod_Role && stApplied[9] eq ProjectConstants.student_req_approval_status_hod_approval)
														||(role==ProjectConstants.iii_Role && stApplied[9] eq ProjectConstants.student_req_approval_status_iii_approval)}">
															<span class="label label-success pointer"
																onclick="approve('${stApplied[7]}');"> <i
																class="fa fa-check" aria-hidden="true"></i> Approve
															</span>
															<span id="reject_btn" class="label label-danger pointer"
																data-toggle="modal" data-target="#myModal"
																onclick="setRejection_id('${stApplied[7]}');"> <i
																class="fa fa-times" aria-hidden="true"></i> Reject
															</span>
														</c:when>

														<c:when
															test="${role ne ProjectConstants.hod_Role && stApplied[9] eq ProjectConstants.student_req_approval_status_hod_approval}">
															<span style="background: #48b3e4ad;padding: 5px 5px 5px 5px;border-radius: 5px;">HOD approval pending</span>
														</c:when>

														<c:when
															test="${role ne ProjectConstants.iii_Role && stApplied[9] eq ProjectConstants.student_req_approval_status_iii_approval}">
															<span style="background: #48b3e4ad;padding: 5px 5px 5px 5px;border-radius: 5px;">T&P/III head approval pending</span>
														</c:when>

														<c:when
															test="${stApplied[9] eq 'S'}">
															<span style="background: #13d63da1;padding: 5px 5px 5px 5px;border-radius: 5px;">Assigned</span>
														</c:when>

														<c:when
															test="${stApplied[9] eq 'pending'}">
															<span><i class="fa fa-clock-o fa-spin" style="color: red;"></i>&nbsp;Company approval pending</span>
														</c:when>
														<c:when
															test="${stApplied[9] eq 'R'}">
															<span style="color: red;"><i class="" style="color: red;"></i>&nbsp;Rejected</span>
														</c:when>

														<c:when test="${stApplied[9] eq 'A'}">
															<span style="background: #13d63da1;padding: 5px 5px 5px 5px;border-radius: 4px;">Approved</span>
														</c:when>

												
														
														<c:when test="${stApplied[9] eq 'D'}">
															<span>Test Submitted. Waiting for Industry to evaluate results.</span>
														</c:when>
														

														<c:when test="${stApplied[9] eq ProjectConstants.request_cancelled_by_system}">
															<span title="Internship started in some other company.">Cancelled</span>
														</c:when>
														<c:when test="${stApplied[9] eq 'T'}">
															<c:if test="${stApplied[15] ne ProjectConstants.student_test_data_status_disqualified}">
															
																<a href="<c:url value="startTest?test_data_id=${stApplied[12]}&current_page=rs"/>" style="padding: 5px;">
																	<i class="fa fa-play label label-success pointer" style="background: #1b00ff;padding: 6px 8px 6px 7px; border-radius: 4px;color: white;">
																	 Start Test</i>
																</a>
																<div style="font-size: 12px;float: left;">
																	<span>Last date to appear</span><br>
																	<span style="color: red;">${stApplied[14]}</span>
																</div>
															</c:if>
															<c:if test="${stApplied[15] eq 'D'}">
																<span class="label label-danger" style="background: red;color: white;padding: 3px 5px 3px 5px;border-radius: 3px;">You were disqualified.</span>
															</c:if>
														</c:when>
														<c:when test="${stApplied[9] eq 'T' && now ge stApplied[14]}">
															<span style="background: red;color: white;padding: 3px 5px 3px 5px;border-radius: 3px;">Your Test is expired.</span>
															</c:when>
															<c:when test="${stApplied[9] eq 'Passed' && now ge stApplied[14]}">
															<span style="background: green;color: white;padding: 3px 5px 3px 5px;border-radius: 3px;">Passed.</span>
															</c:when>
													</c:choose></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
			</c:if>
				<div class="card-box mb-30 m-3">
				<div class="pd-20">
					<c:if test="${not empty map }">
				<div>
					<!--start send table -->
					<div class="col-xl-12">
						<div class="box">
							<div class="panel-heading" style="text-align: center;background: #0f2c7eeb;color: white;">
								<span>Requests raised by Institute</span>
							</div><br>
							<div class="box-body">
								<table class="data-table table hover nowrap">
								<thead class="thead-light">
										<tr>
											<th>Company Name</th> 
											<th>Technology</th>
											<th>Duration</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody id="tablist">
										<c:forEach var="stApplied" items="${map}">
    <tr>
        <td>${stApplied.key[0]}</td>
        <td>${stApplied.key[1]}</td>
        <td>${stApplied.key[2]} weeks</td>
        <td>
            <c:choose>
                <c:when test="${empty stApplied.key[3]}">
                    <c:choose>
                        <c:when test="${fn:containsIgnoreCase(stApplied.value, 'reject')}">
                            <span class="tooltip">${stApplied.value}<span class="tooltiptext">${stApplied.key[5]}</span></span>
                        </c:when>
                        <c:otherwise>
                            ${stApplied.value}
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${stApplied.key[7] eq 'T'}">
                            <a href="<c:url value='startTest?test_data_id=${stApplied.key[7]}'/>" style="padding: 5px;">
                                <i class="fa fa-play label label-success pointer" style="font-size: 16px !important;"> Start Test</i>
                            </a>
                            <div style="font-size: 12px; float: left;">
                                <span>Last date to appear </span><br>
                                <span>${stApplied.key[4]}</span>
                            </div>
                        </c:when>
                        <c:when test="${stApplied.key[6] eq 'C'}">
                            
                            <div style="font-size: 12px; float: left;">
                                <span>Test submitted.Please wait for the Industry to evaluate your result.</span><br>
                               
                            </div>
                        </c:when>
						   <c:when test="${stApplied.key[7] eq 'A'}">
                            
                            <div style="font-size: 12px; float: left;">
                                <span>In Process within Industry</span><br>
                               
                            </div>
                        </c:when>

						 <c:when test="${stApplied.key[7] eq 'P'}">
                            
                            <div style="font-size: 12px; float: left;">
                                <span>Pending Approval From Industry</span><br>
                               
                            </div>
                        </c:when>
                        <c:when test="${now ge stApplied.key[4]}">
                            <span>Your Test is expired.</span>
                        </c:when>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>				</div>

			</c:if>
			<%@include file="modal_common.jsp"%>
			<%-- <%@include file="comp_coll_details_modal.jsp"%> sk--%>
			<%@include file="modalStudentDetails.jsp"%>
			<%@include file="footer.jsp"%>
		</div>
	</div>

	<!-- js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/onlineTestScript.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.buttons.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.bootstrap4.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/pdfmake.min.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/vfs_fonts.js'></script>
	<!-- Datatable Setting js -->
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js'></script>
	<!-- bootstrap-tagsinput js -->
	<script src='${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js'></script>
	<script src='${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js'></script>
</body>
</html>