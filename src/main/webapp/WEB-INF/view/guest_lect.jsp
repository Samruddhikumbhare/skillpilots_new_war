<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>SkillPilots</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
	<%@include file="stylesheets.jsp"%>
	<style>
	.parameter{
		padding:5px;
	}
	select{
		padding: 5px !important;
		max-width: 60%;
	}
	input, select{
		border-width: 0px !important;
		border-bottom-width: 2px !important;
		border-color:#1974c3;
	}
	label{
		min-width:25%;
		max-width:40%;
		color:#1974c3;
	}
	.checkbox, .radio {
		margin:0px;
	}
	.radio label, label.radio-inline {
		padding-left:30px;
	}
	.boxx{
        padding: 20px;
        display: none;
        margin-top: 18px;
    }
	</style>
	<link href="/plugins/datatables/extensions/Responsive/css/dataTables.responsive.css"
		rel="stylesheet" type="text/css" />
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
			<h1>Guest Lecture</h1>
			</section>
			<!--End Content Header (Page header)-->

			<!--Main content-->
			<section class="content">
			<div class="box">
			<c:url var="addAction" value="/get_guest_lect"></c:url>
			<form:form modelAttribute="guestlecture" id="my_form" action="${addAction}" enctype="multipart/form-data"
				method="post">
				
					<div class="col-md-12">
						<!--Start data table-->
						<div class="col-md-4">
								<div class="parameter">
								<label>Skill</label>
								<form:select id="technology" path="technology" required="required">
									<option selected value="">--Select Technology--</option>
									<c:forEach items="${technology_data}" var="tech">
										<option value="${tech}">${tech}</option>
									</c:forEach>
								</form:select>
							</div>
							<c:if test="${role ne ProjectConstants.iii_Role}">
								<form:input type="hidden" path="technology" id="technology" value="${technologies}"></form:input>
							</c:if>
						</div>
						<div class="col-md-4">
							<div class="parameter" id="req">
								<label>Duration :</label> <label><input type="radio"
									name="colorRadio" value="days" required="required"/>By Days </label> <label> <input
									type="radio" name="colorRadio" value="hours" required="required">By Hours
								</label>
							</div>
						</div>
						<div class="col-md-4">
						<div class="parameter">
							<div class="days boxx">
								<form:select id="days" path="time" style="margin-top: -37px"><form:option value="" >--Select no
										of Days--</form:option>
									<option value="1">1 Day</option>
									<option value="2">2 Days</option>
									<option value="3">3 Days</option>
									<option value="4">4 Days</option>
									<option value="5">5 Days</option>
									<option value="6">6 Days</option></form:select>

							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="parameter">
							<div class="hours boxx">
								<form:select id="hours" path="time" style="margin-top: -46px" required="required"><form:option value="" >--Select
										no of Hours--</form:option>
									<option value="1">1 Hour</option>
									<option value="2">2 Hours</option>
									<option value="3">3 Hours</option>
									<option value="4">4 Hours</option>
									<option value="5">5 Hours</option>
									<option value="6">6 Hours</option></form:select>
							</div>
						</div>
					</div>
				</div>
					<div class="parameter" style="text-align:center">
						<input type="submit" value="Submit" id="generate_lecture"
							class="btn btn-success" />
					</div>
					</form:form>
				</div>
				
			</section>
		</div>
		<!--End Content Wrapper. Contains page content-->

		<!-- footer-->
		<%@include file="footer.jsp"%>
	</div>
	<%@include file="scriptfiles.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input[type="radio"]').click(function() {
				var inputValue = $(this).attr("value");
				var targetBoxx = $("." + inputValue);
				$(".boxx").not(targetBoxx).hide();
				$(targetBoxx).show();
			});
		});
		
		/* function save_guestLect() {
			if(($("input[type='radio']:checked").val()) && ($("#days").val()=="" || $("#hours").val()=="")){
				alert("Please select Technology,Days Or Hours.");
				return;
			}
		} */

	</script>
</body>
</html>