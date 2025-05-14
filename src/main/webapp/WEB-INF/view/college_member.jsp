
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="user_session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>SkillPilots | Manage Department's</title>
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
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
.sidebar-menu .dropdown-toggle {
		padding: 15px 12px 15px 54px!important;
		font-size: 15px!important;
	}
	.user-notification .dropdown-toggle .badge {
    position: absolute;
    right: 5px;
    top: 7px;
  /*   background: #317c9e; */
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
.table td {
	padding: 0.7rem;
}
.form-group {
    margin-bottom: 8px;
}
</style>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo">
				<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
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
		<div class="title pb-20">
				<h4 class="h4 mb-0 text-center" style="color: white;background: #0f2c7eeb;border-radius: 5px;">Manage Department</h4>
			</div>
			
			<div class="min-height-200px">
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
					<c:if test="${user.role eq '5' || user.role eq '6'}">
						<button type="button" class="btn btn-success btn-sm pull-left"
							style="margin-bottom: 6px;float: right;" onclick="showForm();">Add
							Department</button>
						</c:if>
						<c:if test="${user.role eq '7'}">
							<button hidden type="button" class="btn btn-success btn-sm pull-left"
								style="margin-bottom: 6px;float: right;" onclick="showForm2();">Add
								Department Incharge</button>
							</c:if>
						
					<br>
					
						<div class="box-body">
							<table class="table table-bordered table-sm">
								<thead class="thead-light">
									<tr>
										<c:if test="${user.role eq '7' || user.role eq '8'}">
											
												<th hidden>id</th>
												<th></th>
												<th>Department</th>
												<th>HOD</th>
												<th>Departmental Coordinator</th>
												<th>Validity</th>
										
										</c:if>
									<c:if test="${user.role eq '5' || user.role eq '6'}">
										<th hidden>id</th>
										<th></th>
										<th>Department</th>
										<th>HOD</th>
										<th>Departmental Coordinator</th>
										<th>Validity</th>
									</c:if>
									</tr>
								</thead>
								
								<tbody>
									<c:if test="${user.role eq '5' || user.role eq '6'}">
								
										<c:forEach var="collDeptList" items="${collDeptLinkList}">
    <tr> 
        <td><input type="radio" name="rowid" id="${collDeptList.collDeptLinkId}" class="${collDeptList.collDeptLinkId}"></td>
        <td hidden id="did">${collDeptList.collDeptLinkId}</td>
         <td>${collDeptList.deptName}</td>
		  <td>${collDeptList.hodName}</td>
       <td>
    <c:choose>
        <c:when test="${empty collDeptList.iiiId}">
            <span class="label label-info pointer">Not assigned</span>
        </c:when>
        <c:otherwise>
            ${collDeptList.iiiName}
        </c:otherwise>
    </c:choose>
</td>
        <td>${collDeptList.expirationDate}</td>
        <!-- Add more columns as needed -->
    </tr>
</c:forEach>
								
								</c:if>
								<c:if test="${user.role eq '7' || user.role eq '8'}">
									<c:forEach var="collDeptList" items="${collDeptLinkList}">
										 <tr> 
        <td><input type="radio" name="rowid" id="${collDeptList.collDeptLinkId}" class="${collDeptList.collDeptLinkId}"></td>
        <td hidden>${collDeptList.collDeptLinkId}</td>
         <td>${collDeptList.deptName}</td>
		  <td>${collDeptList.hodName}</td>
        <td>${collDeptList.iiiName}
			<c:if
													test="${user.role eq '7'}">
													<c:if test="${empty collDeptList.iiiId}">
														<span class="label label-info pointer"
															onclick="showform('none');">ASSIGN</span>
														<input type="hidden" id="iiiDeptCoId" value="0">
													</c:if>
													<c:if test="${not empty collDeptList.iiiId}">
														<span class="label label-info pointer"
															onclick="showform('${collDeptList.collDeptLinkId}');">CHANGE</span>
														<input type="hidden" id="iiiDeptCoId"
															value="${collDeptList.collDeptLinkId}">
													</c:if>
												</c:if>
		</td>
        <td>${collDeptList.expirationDate}</td>
        <!-- Add more columns as needed -->
    </tr>
									</c:forEach>
								</c:if>
								</tbody>
								</tbody>
								
							</table>

						</div>
					
					<!-- /.box-body -->
					<c:if test="${user.role eq '5' || user.role eq '6'}">
					<div class="box-footer clearfix">
					
							<button type="button" id="change_dept"
								class="btn btn-primary dept_action btn-sm" disabled="disabled">Change</button>
							<button hidden type="button" id="renew_dept"
								class="btn btn-primary dept_action btn-sm" disabled="disabled">Renew</button>
							<button type="button" id="cancel_dept"
								class="btn btn-danger  btn-sm" data-toggle="modal"  data-target="#deleteModal" disabled="disabled">Remove</button>
						
					</div>
				</c:if>
					<c:if test="${user.role eq '7'}">
					<div hidden class="box-footer clearfix">
					
							<button type="button" id="change_dept"
								class="btn btn-primary dept_action btn-sm deptinch" disabled="disabled">Change</button>
					
							<button type="button" id="cancel_dept"
								class="btn btn-danger  btn-sm" data-toggle="modal"  data-target="#deleteModal" disabled="disabled">Remove</button>
						
					</div>
				</c:if>
				</div>
			</div>
			<!--End Content Wrapper. Contains page content-->
			<c:if test="${user.role eq '5' || user.role eq '6'}">
			<div class="modal fade show" id="addcollmember" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">
						<div class="panel-heading text-center" style="background: #0f2c7eeb;color: white;padding: 5px 0 5px 0px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<span class="modal-title">${moduleHeading}</span>
						</div>
						
						<form id="userForm" modelAttribute="user" action="${pageContext.request.contextPath}/college_dept"
							method="post">
							
						<div class="form-group is-empty form-inline"
									style="margin-top: 10px !important;">
									<label for="inputLast" class="col-md-4 control-label">Member
										Name</label>
									<div class="col-md-8">
										<input type="hidden" id="id" name="id">
										<input name="username" id="username"
											class="form-control firstCapital" placeholder="Member Name"
											maxlength="255" required="true" style="width: 84%;height: 40px;"/>
										<!-- <input class="form-control"  type="text"> -->
									</div>
								</div>
								<div class="form-group is-empty form-inline">
									<label for="inputEmail" class="col-md-4 control-label">Contact
										No.</label>
									<div class="col-md-8">
										<input name="contact_no" class="form-control contact" placeholder="Contact No." 
											id="contact" pattern="\d*" maxlength="12" required="true" style="width: 84%;height: 40px;" 
											onchange="checkContactExists(this)" onblur="checkContactExists(this)" minlength="10"/>
										<label id="contact_error" style="color: red;"></label>
									</div>
								</div>
								<div class="form-group is-empty form-inline">
									<label for="inputDate" class="col-md-4 control-label">Email
										ID</label>
									<div class="col-md-8">
    <input name="email" id="mail_id" placeholder="Email Id" class="form-control"
           required="true" style="width: 84%;height: 40px;" oninput="checkExists(this)"/>
    <label id="maillabel" style="color: red;"></label>
</div>

								</div>
								<c:if test="${user_data.role eq ProjectConstants.iii_Role}">
									<div class="form-group is-empty form-inline">
										<label for="inputName" class="col-md-4 control-label">Department</label>
										<div class="col-md-8">
											<select name="dept_id" id="dept" class="form-control" onchange="onDepartmentChange(this)">
    <option value="-1">Select a Department</option>
    <c:forEach items="${departments}" var="item">
        <option value="${item.deptId}">${item.dept_name}</option>
    </c:forEach>
</select>

										</div>
									</div>
								</c:if>
								<input type="hidden" name="coll_dept_link_id"
									id="coll_dept_link_id" value="">
								<div class="modal-footer" style="border-top: 0px">
									<button class="btn btn-primary btn-sm pull-right" id="sbtn"
										type="submit" style="margin-right: 50px;">SUBMIT</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</c:if>
						<!--End Content Wrapper. Department Incharge-->
						<c:if test="${user.role eq '7'}">
							<div class="modal fade show" id="addcollmember2" tabindex="-1"
							role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
							<div class="modal-dialog modal-dialog-centered modal-lg">
								<div class="modal-content">
									<div class="panel-heading text-center" style="background: #0f2c7eeb;color: white;padding: 5px 0 5px 0px;">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<span class="modal-title">Add Department Co-ordinator</span>
									</div>
									
									<form id="userForm2" modelAttribute="user2" action="${pageContext.request.contextPath}/college_dept_inch"
										method="post">
										
									<div class="form-group is-empty form-inline"
												style="margin-top: 10px !important;">
												<label for="inputLast" class="col-md-4 control-label">Member
													Name</label>
												<div class="col-md-8">
													<input type="hidden" id="id" name="id">
													<input name="username" id="username"
														class="form-control firstCapital" placeholder="Member Name"
														maxlength="255" required="true" style="width: 84%;height: 40px;"/>
													<!-- <input class="form-control"  type="text"> -->
												</div>
											</div>
											<div class="form-group is-empty form-inline">
												<label for="inputEmail" class="col-md-4 control-label">Contact
													No.</label>
												<div class="col-md-8">
													<input name="contact_no" class="form-control contact" placeholder="Contact No." 
														id="contact" pattern="\d*" maxlength="12" required="true" style="width: 84%;height: 40px;" 
														onchange="checkContactExists(this)" onblur="checkContactExists(this)" minlength="10"/>
													<label id="contact_error" style="color: red;"></label>
												</div>
											</div>
											<div class="form-group is-empty form-inline">
												<label for="inputDate" class="col-md-4 control-label">Email
													ID</label>
												<div class="col-md-8">
													<input name="email" id="mail_id" placeholder="Email Id" class="form-control"
														oninput="checkExists(this)"
														required="true" style="width: 84%;height: 40px;"/>
													<label id="maillabel" style="color: red;"></label>
												</div>
											</div>
											<c:if test="${user.role eq '5' || user.role eq  '6' }">
												<div class="form-group is-empty form-inline">
													<label for="inputName" class="col-md-4 control-label">Department</label>
													<div class="col-md-8">
														<!-- <input  class="form-control" placeholder="Department" maxlength="250"   type="text"> -->
															<select name="dept_id" id="dept" class="form-control" >
												<option value="-1">Select a Department</option>
												<c:forEach items="${departments}" var="item">
													<option value="${item.deptId}">${item.dept_name}</option>
												</c:forEach>
											</select>
													</div>
												</div>
											</c:if>
											<input type="hidden" id="iiiDeptCoId"
															value="${collDeptList.collDeptLinkId}">
											<div class="modal-footer" style="border-top: 0px">
												<button class="btn btn-primary btn-sm pull-right" id="sbtn"
													type="submit" style="margin-right: 50px;">SUBMIT</button>
											</div>
									</form>
								</div>
							</div>
						</div>
				</c:if>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
				<input type="hidden" id="delid" name="id">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to remove this Member?</p>
                <!-- Display collDeptLinkId here -->
                <!-- <p>collDeptLinkId: <span id="collDeptLinkIdDisplay"></span></p> -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" id = "delete" class="btn btn-danger">Delete</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade show" id="addcollmember2" tabindex="-1"
							role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
							<div class="modal-dialog modal-dialog-centered modal-lg">
								<div class="modal-content">
									<div  class="panel-heading text-center" style="background: #0f2c7eeb;color: white;padding: 5px 0 5px 0px;">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<span class="modal-title">Add Department Incharge</span>
									</div>
									
									<form id="userForm2" modelAttribute="user2" action="${pageContext.request.contextPath}/college_dept"
										method="post">
										
									<div class="form-group is-empty form-inline"
												style="margin-top: 10px !important;">
												<label for="inputLast" class="col-md-4 control-label">Member
													Name</label>
												<div class="col-md-8">
													<input type="hidden" id="id" name="id">
													<input name="username" id="username"
														class="form-control firstCapital" placeholder="Member Name"
														maxlength="255" required="true" style="width: 84%;height: 40px;"/>
													<!-- <input class="form-control"  type="text"> -->
												</div>
											</div>
											<div class="form-group is-empty form-inline">
												<label for="inputEmail" class="col-md-4 control-label">Contact
													No.</label>
												<div class="col-md-8">
													<input name="contact_no" class="form-control contact" placeholder="Contact No." 
														id="contact" pattern="\d*" maxlength="12" required="true" style="width: 84%;height: 40px;" 
														onchange="checkContactExists(this)" onblur="checkContactExists(this)" minlength="10"/>
													<label id="contact_error" style="color: red;"></label>
												</div>
											</div>
											<div class="form-group is-empty form-inline">
												<label for="inputDate" class="col-md-4 control-label">Email
													ID</label>
												<div class="col-md-8">
													<input name="email" id="mail_id" placeholder="Email Id" class="form-control"
														oninput="checkExists(this)"
														required="true" style="width: 84%;height: 40px;"/>
													<label id="maillabel" style="color: red;"></label>
												</div>
											</div>
											<c:if test="${user.role eq '5' || user.role eq '6'}">
												<div class="form-group is-empty form-inline">
													<label for="inputName" class="col-md-4 control-label">Department</label>
													<div class="col-md-8">
														<!-- <input  class="form-control" placeholder="Department" maxlength="250"   type="text"> -->
														<select name="dept_id" id="depts" class="form-control" >
												<option value="-1">Select a Department</option>
												<c:forEach items="${departments}" var="item">
													<option value="${item.deptId}">${item.dept_name}</option>
												</c:forEach>
											</select>
													</div>
												</div>
											</c:if>
											    <input type="hidden" name="collDeptLinkId" id="collDeptLinkId" value="${collDeptList.collDeptLinkId}">

											<div class="modal-footer" style="border-top: 0px">
												<button class="btn btn-primary btn-sm pull-right" id="sbtn"
													type="submit" style="margin-right: 50px;">SUBMIT</button>
											</div>
									</form>
								</div>
							</div>
						</div>

			<div class="modal fade show" id="balanceDataModal" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myLargeModalLabel">Packages Available</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						</div>
						<div class="modal-body">
							<input type="hidden" id="renew_coll_dept_link_id">
							<div id="balance_table_div">
								<table class="table table-striped table-sm">
									<tr>
										<th></th>
										<th>No of Department</th>
										<th>No of Internship</th>
										<th>Expiration Date</th>
										<th>Show Package Details</th>
									</tr>
									<tbody id="balance_departments">
									</tbody>
								</table>
								<button type="button" id="renew_dept_button"
									class="btn btn-success btn-sm" style="width: 100%;">RENEW</button>
							</div>
							<div id="package_table_div">
								<table class="table table-striped table-sm">
									<tr>
										<th></th>
										<th>Package Name</th>
										<th>No of Departments</th>
										<th>No of Internships</th>
										<th>Validity</th>
										<th>Amount</th>
									</tr>
									<tbody id="package_avail">
									</tbody>
								</table>
								<div class="modal-footer" style="border-top: 0px;">
									<button type="button" id="btn-payAndRecharge"
										class="btn btn-success btn-sm">PAY AND RE-CHARGE</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<%@include file="footer.jsp"%>
			<%@include file="modal_transactionsAndBalances.jsp"%>
		</div>
	</div>
	
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/college_member.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
						<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/transactionsAndBalances.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="https://unpkg.com/sweetalert${pageContext.request.contextPath}/style/dist/sweetalert.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
	<script>

var cdlId;


		$(document).ready(function () {
    var selectedData = {}; // To store selected row data

    // Add click event listener to radio buttons
    $('tbody').on('click', 'input[type="radio"]', function () {
        // Get data from the selected row
        var $row = $(this).closest('tr');
        selectedData.id = $row.find('td:eq(1)').text();
        selectedData.department = $row.find('td:eq(2)').text();
        selectedData.username = $row.find('td:eq(3)').text();
        // Add more variables as needed
    });

    // Add click event listener to "Change" button
    // $('#change_dept').on('click', function () {
    //     // Check if a radio button is selected
    //     if ($.isEmptyObject(selectedData)) {
    //         alert('Please select a row first.');
    //         return;
    //     }

    //     // Populate form fields in the modal with selected data
    //     $('#id').val(selectedData.id);
    //     $('#username').val(selectedData.username);
    //     $('#deptName').val(selectedData.deptName);
    //     // Populate more fields as needed

    //     // Open the modal
    //     $('#addcollmember').modal('show');
    // });
    // Add click event listener to "Change" button
    $('.deptinch').on('click', function () {
        // Check if a radio button is selected
        if ($.isEmptyObject(selectedData)) {
            alert('Please select a row first.');
            return;
        }

        // Populate form fields in the modal with selected data
        $('#id').val(selectedData.id);
        $('#username').val(selectedData.username);
		$('#dept').val(selectedData.department);
        // Populate more fields as needed

        // Open the modal
        $('#addcollmember2').modal('show');
    });

    // Add click event listener to "Remove" button
    $('#cancel_dept').on('click', function () {
        // Check if a radio button is selected
        if ($.isEmptyObject(selectedData)) {
            alert('Please select a row first.');
            return;
        }

        // Populate form fields in the modal with selected data
        $('#delid').val(selectedData.id);
        console.log(selectedData.id);

        // Open the modal
        $('#deleteModal').modal('show');
    });

    // Add click event listener to "Delete" button inside the modal
 $('#deleteModal').on('show.bs.modal', function (e) {
    // Get the collDeptLinkId value from the hidden td element
    var collDeptLinkId = $('#did').text();
	        $('#delid').val(selectedData.id);
        console.log("wwwwwwwwww",selectedData.id);


    console.log("ddddddd"+collDeptLinkId)
    // Set the collDeptLinkId value into the span element
    $('#collDeptLinkIdDisplay').text(collDeptLinkId);
});
    $('#delete').on('click', function () {
		 cdlId =selectedData.id;

 console.log("eeeeeeeeee",cdlId)

    // Get the collDeptLinkId value from the hidden td element
    var collDeptLinkId = $('#did').text();
        console.log("aaaaaaaaaa",selectedData.id);

    // Make a direct HTTP request to cancel the department
    $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/cancel_dept/' + cdlId, // Assuming the endpoint is /cancel_dept/{id}
        success: function (response) {
            // Handle success, e.g., refresh the page or update the UI
            console.log('Successfully canceled department.');
            $('#deleteModal').modal('hide');
            location.reload(true); // Reload the page to reflect changes
        },
        error: function (error) {
            // Handle error
            console.error('Error canceling department:', error);
        }
    });
});
});


function showForm() {
	console.log("jsjshhddh");
    $('#addcollmember').modal('show');
}
function showForm2() {
    $('#addcollmember2').modal('show');
}

function showform(collDeptLinkId) {
	console.log(collDeptLinkId)
	console.log("dhdhdhd");
	  $('#addcollmember2').modal('show')
	if (collDeptLinkId == 'none') {
		//$("#addcollmember").modal().show();
	} else {
		//alert(param);
		//$("#collDeptLinkId").val(param);
		
	}
}
	</script>
	
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// Target the form by its ID
			document.getElementById("userForm").addEventListener("submit", function(event) {
				var departmentSelect = document.getElementById("dept");
				var selectedDepartment = departmentSelect.value;
		
				// Check if the "-1" option is selected, indicating no department is selected
				if (selectedDepartment === "-1") {
					// Prevent form submission
					event.preventDefault();
					// Optionally, alert the user or display a message
					alert("Please select a department before submitting.");
				}
			});
		});
		</script>
		
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
  function onDepartmentChange(selectElement) {

	var a= document.getElementById("dept").value;

	console.log("dhdhdhdhdhdhd", a)
    const deptId = selectElement.value; 
	
	// Get selected department ID
    const collegeId = 1; // Replace with dynamic college ID if needed

    if (deptId !== "-1") { // Ensure a valid department is selected
        checkHod(collegeId, a);
    }
}

function checkHod(collegeId, a) {
	console.log("ddddddddddddddd", a);
    const contextPath = `${pageContext.request.contextPath}`; // Ensure this resolves correctly
    fetch(`${pageContext.request.contextPath}/existDept?college_id=${collegeId}&deptId=`+a)
        .then(response => response.json())
        .then(data => {
            if (data.status === "exists") {
                Swal.fire({
                    icon: 'info',
                    title: 'HOD Exists',
                    text: data.message,
                }).then(() => {
                    // Clear the selected field after user clicks OK
                    const selectElement = document.getElementById('depts'); // Replace 'depts' with your actual select element I

					  if (selectElement) {
                        selectElement.value = "-1"; // Reset the dropdown to the default option
                        console.log("Cleared department selection.");
                    }
                });
            }
            // Do nothing if no HOD exists (status is "not_exists").
        })
        .catch(error => {
            // Suppress any error alert and optionally log it silently
            console.error('API call failed:', error);
        });
}

</script>


</body>
</html>