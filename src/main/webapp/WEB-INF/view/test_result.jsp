<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>SkillPilots | Test Result</title>
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.css" integrity="sha512-qGaAtuKvSCWSaqGi3MX0T+h3SYcOUlrwpURUWgIgCsLQ92cBVzNCDtIvvB0/NDawwH2RcHAYvzEYS25+jzMTnQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<%@include file="stylesheets.jsp"%>
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
		<div>
		<div class="title pb-20">
				<h4 class="h4 mb-0 text-center" style="color: white;background: #0f2c7eeb;border-radius: 5px;">Company Report</h4>
			</div>
			<div class="page-header">
				<div class="row">
					<div class="col-sm-6 mx-auto">
			<div style="padding: 10px; margin: 20px; text-align: center;">
				<div>
					<c:if test="${data.testResult eq ProjectConstants.company_test_result_passed}">
						<img alt="" src="/images/congrats1.gif" style="max-height: 500px;max-width:800px;">
						<h1>Congratulations! You have passed test.</h1>
					</c:if>

					<c:if test="${data.testResult eq ProjectConstants.company_test_result_failed}">
						<img alt="" src="/images/sorry1.jpg" style="max-height: 500px;max-width:800px;">
						<h1>Sorry! You are failed.</h1>
					</c:if>
					<h3>You have scored ${data.totalMarks} out of ${data.outof}.</h3>
				</div>

				<div >
					<h4>Score Card</h4>
					<div class="col-sm-6 mx-auto" id="score_card">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td>Correct answers</td>
									<td><span id="spanCA">${data.correctAns}</span></td>
								</tr>
								<tr>
									<td>Wrong answers</td>
									<td><span id="spanWA">${data.wrongAns}</span></td>
								</tr>
								<tr>
									<td>Questions not attempted</td>
									<td><span id="spanNA">${data.noAns}</span></td>
								</tr>
								<tr>
									<td>Marks scored</td>
									<td><span id="spanTotalMarks">${data.totalMarks}</span></td>
								</tr>
								<tr>
									<td>Out Of</td>
									<td><span id="spanOutOf">${data.outof}</span></td>
								</tr>
								<tr>
									<td>Result</td>
									<td><span id="spanResult">${data.testResult}</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-sm-6 mx-auto">
						<button class="btn btn-success" onclick="printDiv();">
							<i class="fa fa-print" aria-hidden="true"></i> Print
						</button>
					</div>
				</div>
			</div>
		</div>
			</div>
				
		</div>
	</div>
	</div>
	

	<!--End Content Wrapper. Contains page content-->
	<!-- footer-->
	<%@include file="footer.jsp"%>
	<%@include file="scriptfiles.jsp"%>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script type="text/javascript">
		function printDiv() {
			var divToPrint = document.getElementById('score_card');
			newWin = window.open("");
			newWin.document.write(divToPrint.outerHTML);
			newWin.print();
			newWin.close();
		}
		//disable browsers back button
		$(document).ready(function() {
			window.history.pushState(null, "", window.location.href);
			window.onpopstate = function() {
				window.history.pushState(null, "", window.location.href);
			};
		});
	</script>
</body>
</html>
