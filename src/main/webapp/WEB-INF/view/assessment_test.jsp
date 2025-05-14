<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SkillPilots</title>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
	<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/css/bootstrap-multiselect.css'>
	<link type="text/css" href='${pageContext.request.contextPath}/style/dist/css/dataTables.checkboxes.css' rel="stylesheet" />
<%@include file="stylesheets.jsp"%>

<style>
.switch {
	position: relative;
	width: 46px;
	height: 25px;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #868282;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 18px;
	width: 18px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #09af36;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(20px);
	-ms-transform: translateX(20px);
	transform: translateX(20px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

.fa:hover {
	color: #0073b7;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	background-color: #ffffff !important;
	color: #0073b7 !important;
}

.nav-tabs>li.active>a {
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
}

.tab-pane {
	padding: 10px;
}

div.option>label, div.option>input {
	vertical-align: top;
}

.option {
	margin-top: 5px;
}

div.option>textarea {
	width: 75%;
	height: 35px;
	border-radius: 15px;
}

table.ques_table>tbody>tr>td {
	padding: 0px;
}

table.ques_table>tbody>tr>td>textarea {
	width: 100%;
	padding: 0px;
	height: 80px;
}

table.ques_table>tbody>tr.readonly>td>textarea {
	background-color: #ff8f8f;
}

#title {
	margin: 0px;
	font-size: 24px;
	color: #01af36;
	font-family: serif;
	font-weight: bold;
}
</style>
</head>
<body class="skin-blue sidebar-mini wysihtml5-supported fixed">
	<div id="load"></div>
	<div class="wrapper" id="wrapperdiv">
		<!--header-->
		<%@include file="header.jsp"%>
		<%@include file="sidebar_utility.jsp"%>

		<!--Start Content Wrapper. Contains page content-->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Your Assessment Tests</h1>
			</section>
			<!--End Content Header (Page header)-->

			<!--Main content-->
			<section class="content"
				style="max-height: 78%; overflow: scroll; margin: 0px;">
			<div class="row" style="">
				<c:url var="addAction" value="/saveAssessmentTest"></c:url>
				<input type="hidden" name="selected_students" id="selected_students" value="${selected_students}"/>
				<form:form modelAttribute="assessmenttest" id="assessement_test"
					action="${addAction}" method="post">
					<div class="col-xs-12" id="assessment_test_form">
						<div class="box">
							<div class="box-body">
								<div class="row ">
									<form:hidden path="test_id" id="test_id" />
									<div class="form-group col-md-4">
										<label><b>Test Name</b></label><br>
										<form:input path="test_name" name="test_name" id="test_name"
											class="form-control" placeholder="Enter a name for the test"
											maxlength="20" required="true" />
									</div>
									<div class="form-group col-md-2">
										<label><b>Total Marks</b></label><br>
										<form:input type="number" path="total_mark" name="total_mark"
											id="total_mark" class="form-control"
											title="Enter total marks of the test" max="100"
											required="true" min="20" />
									</div>
									<div class="form-group col-md-2">
										<label><b>Cut-Off</b></label><br>
										<form:input type="number" name="cutoff" path="cut_off"
											id="cut_off" class="form-control" title="Enter cut_off Marks"
											max="99" required="true" min="1" />
									</div>
									<div class="form-group col-md-2">
										<label><b>Total Questions</b></label><br>
										<form:input type="number" name="totalque" path="total_que"
											id="total_que" class="form-control"
											title="Enter total questions in the test" max="99"
											required="true" min="20" />
									</div>
								</div>
								<div class="row ">
									<div class="form-group col-md-3" style="width: 20%;">
										<label><b>Time In Min</b></label><br>
										<form:input type="number" name="totaltime" path="time"
											id="time" class="form-control" title="Enter Total In Minutes"
											max="100" required="true" min="20" />
									</div>
									<div class="form-group col-md-3" style="width: 20%;">
										<label><b>Marks/Question</b></label><br>
										<form:input type="number" name="markperque"
											path="mark_per_que" id="mark_per_que" class="form-control"
											max="20" title="Enter Marks" required="true" min="1" />
									</div>
									<div class="form-group col-md-3" style="width: 20%;">
										<label><b>From Date</b></label><br>
										<form:input path="from_date" id="from_date" name="fdate"
											class="form-control mydatepicker"
											placeholder="Enter From Date Here" required="true" />
									</div>
									<div class="form-group col-md-3" style="width: 20%;">
										<label><b>To Date</b></label><br>
										<form:input path="to_date" id="to_date"
											class="form-control mydatepicker"
											placeholder="Enter To Date Here" required="true" />
									</div>
								</div>
							</div>
							<div class="box-body">
								<center>
									<input type="submit" class="btn btn-success" id="test_submit"
										value="Create Test" />
								</center>
							</div>
						</div>
					</div>
				</form:form>
			</div>
			<div class="row" style="">
				<div class="col-xs-12" id="assessment_test_form">
					<div class="box">
						<div class="box-body">
							<center>
								<h1 id="title">
									<strong>Test Details</strong>
								</h1>
							</center>
						</div>
						<div class="box-body">
							<table class="table table-bordered mb-0 mytable" id="mytable">
								<c:if test="${ not empty assesstests }">
									<thead>
										<tr>
											<th>Test Name</th>
											<th>Total Marks</th>
											<th>Total Question</th>
											<th>Cut off</th>
											<th>Marks/Question</th>
											<th>Actions</th>
											<th>Active</th>
										</tr>
									</thead>
								</c:if>
								<tbody id="cmptest_tablist">
									<c:forEach var="list_tab" items="${assesstests}"
										varStatus="loop">
										<tr>
											<td>${list_tab.test_name}</td>
											<td id="${list_tab.test_id}_total_marks">${list_tab.total_mark}</td>
											<td id="${list_tab.test_id}_total_ques">${list_tab.total_que}</td>
											<td>${list_tab.cut_off}</td>
											<td id="${list_tab.test_id}_mark_per_ques">${list_tab.mark_per_que}</td>
											<td id="actions_${list_tab.test_id}"
												style="text-align: center;"><c:if
													test="${list_tab.status eq ProjectConstants.assessment_test_status_active}">
													<span class="fa fa-pencil-square" style="color: #1974c3;"
														id="${list_tab.test_id}" disabled=disabled
														title="An active test cannot be edited."></span>&nbsp&nbsp
													<span data-toggle="modal" data-target="#questionsModal"
														class="fa fa-user-plus" style="color: #1974c3;"
														id="${list_tab.test_id}" title="Click to Assign Test."></span>
												</c:if> <c:if
													test="${list_tab.status eq ProjectConstants.assessment_test_status_inactive}">
													<span class="fa fa-pencil-square" style="color: #1974c3;"
														id="${list_tab.test_id}"
														onclick="edit_assessment_Test_Data('${list_tab.test_id}');"
														title="Click to edit Test format."></span>
												</c:if>&nbsp <c:if
													test="${list_tab.status eq ProjectConstants.assessment_test_status_inactive}">
													<span data-toggle="modal" data-target="#questionsModal"
														class="fa fa-user-plus" style="color: #1974c3;"
														id="${list_tab.test_id}" title="Click to Assign Test."></span>
												</c:if>&nbsp <c:if
													test="${list_tab.status eq ProjectConstants.assessment_test_status_inactive}">
													<span class="fa fa-times-circle" style="color: #f70a0a;"
														id="${list_tab.test_id}"
														onclick="delete_assessment_Test_Data('${list_tab.test_id}');"
														title="Click to Delete Test."></span>
												</c:if></td>
											<td style="text-align: center;"><label class="switch">
													<input type="checkbox" data-toggle="switch"
													id="${list_tab.test_id}_status"
													onclick="manage_Status(this,'${list_tab.test_id}')"
													<c:if test="${list_tab.status eq ProjectConstants.assessment_test_status_active}">
																checked </c:if>>
													<span class="slider round"></span>
											</label></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="modal fade" id="questionsModal" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog" style="width: 95%">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4>Students List</h4>
										</div>
										<div class="modal-body">
											<div class="row">
												<div class="responsive-table">
													<table class="table table-bordered mb-0 mytable"
														id="mytable1">
														<c:if test="${ not empty students }">
															<thead>
																<tr>
																	<th></th>
																	<th>Student id</th>
																	<th>Institute id</th>
																	<th>Student Name</th>
																	<th>Email</th>
																</tr>
															</thead>
														</c:if>
														<tbody id="cmptest_tablist">
															<c:forEach var="list_tab" items="${students}"
																varStatus="loop">
																<c:if test="${list_tab.acc_verified eq true}">
																<tr>
																	<td></td>
																	<td>${list_tab.user_id}</td>
																	<td>${list_tab.institute_id}</td>
																	<td>${list_tab.username}</td>
																	<td>${list_tab.email_id}</td>
																</tr>
																</c:if>
															</c:forEach>
														</tbody>
													</table>
													<div class="form-actions" style="text-align: center;">
														<button type="button" id="save_emp_next_btn"
															class="btn btn-primary">Assign tests</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="col-md-4">
								<div id="xldownload${list_tab.test_id}" class=" pull-left">
									<span style="font-size: 12px; font-weight: 600"> * To
										add multiple Test Questions at once, <br>Download, fill
										and upload the file from here.
									</span> <br> <a
										href="defaultExcel/Assessment Test Questions.xlsx?testid=${list_tab.test_id}"
										class="btn"
										style="padding: 0px !important; margin: 0 25% 0 0 !important;"
										download> Download <i class="fa fa-download"></i>
									</a>
									<form method="post"
										action="assessmentTestQuestionsXL?testid=${list_tab.test_id}"
										enctype="multipart/form-data" style="display: contents;">
										<div class="btn"
											style="padding: 0px !important; margin: 0px !important; color: #0773c7"
											title="Please upload excel after filling the downloaded file from left hand side.">
											Upload <i class="fa fa-upload"></i> <input type="file"
												name="fileUpload" onchange="this.form.submit()"
												accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
												style="position: absolute; width: 111%; font-size: 16px; opacity: 0; margin: -21px" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</section>
		</div>
		<%@include file="footer.jsp"%>
	</div>
	<%@include file="scriptfiles.jsp"%>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/assessment_test.js"></script>
		<script type="text/javascript" src='${pageContext.request.contextPath}/style/dist/js/bootstrap-multiselect.js'></script>
		<script type="text/javascript" src='${pageContext.request.contextPath}/style/dist/js/dataTables.checkboxes.js'></script>
	<script type="text/javascript" src='${pageContext.request.contextPath}/style/dist/js/dataTables.checkboxes.min.js'></script>
	<script type="text/javascript">
	$('#mytable').dataTable( {
		  "lengthMenu": [ [5, 10, 25, -1], [5, 10, 25, "All"] ]
		} );
    
    var studtable = $('#mytable1').DataTable({
    	"lengthMenu" : [ [ 5, 10, 20, 30, -1 ], [ 5, 10, 20, 30, "All" ] ],
    	'initComplete': function(settings){
    		var api = this.api();
    		api.cells(
    				api.rows(function(idx, data, node){
    					return $("#selected_students").val().includes(data[0]);
    				}).indexes(),
    				0
    		).checkboxes.select();
    	},
    	'columnDefs': [{
    		'targets': 0,
    		'checkboxes': {'selectRow': true},
    	}],
    	'select': {'style': 'multi'},
    	'order': [[1, 'asc']]
    });
	</script>
</body>
</html>