<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="user_session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>SkillPilots | Confirm Education</title>
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon-16x16.png">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css" integrity="sha512-JdK5FqWm6zRt5GSmEJT7M4HpaGAiod0U3kLehOSz1NKpbL3QS7rHrcw2hvTwM8hKteBjyn7yzLCFzJE1F3+90w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style type="text/css">
	.fade:not(.show) {
    opacity: 1;
    }
	</style>
</head>

<body>
	
	

		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center font-18">
					<h1>Congratulations your Account is registered with us!</h1>
					<h4 class="padding-top-30 mb-30 weight-500" style="color: red;">Account Verification Pending</h4>
					<c:if test="${rejection_reason eq null}">
						<p>Your Account/Profile Is Not Verified By Your <strong>Departmental Head</strong>.Please Co-Ordinate With Your <strong>Departmental Head (H.O.D)</strong> For Verification Of Your Profile.</p>
					</c:if>
					<c:if test="${rejection_reason ne null}">
						<p>Your Account/Profile has been rejected by the Head of Department of your selected Institute
							with the reason - ${rejection_reason}.</p>
					</c:if>
					<div class="padding-bottom-30 row"
						style="margin: 0 auto;">
						<!-- <div class="col-6">
							<button type="button" id="editprofile"
								class="btn btn-success"
								data-dismiss="modal">
								<i class="fa fa-edit"></i> Edit Profile
							</button>
					
						</div> -->
						<div class="col-6">
							<button type="button" id="logout"
								class="btn btn-danger"
								data-dismiss="modal">
								<i class="fa fa-sign-out"></i> Logout
							</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>


		
	<%@include file="scriptfiles.jsp"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script type="text/javascript">
		//check if returned before acc verified
	function loadModal(){
	
			$('#editprofileConfirmModal').modal('show');
	 	}
	
		
	 
	$("#eduBtnNo").click(function(){
		$("#confirm_txt").val("no");
		$("#myform").submit();
	});
	$("#eduBtnYes").click(function(){
		$("#confirm_txt").val("yes");
		$("#myform").submit();
	});



$(document).ready(function() {
    $("#logout").click(function() {
        // Redirect the user to the logout URL
        window.location.href = '${pageContext.request.contextPath}/logout';
    });
});

	$("#editprofile").click(function(){
		$("#confirm_txt").val("edit");
		$("#myform").submit();
	});
	</script>
	
	

</body>
</html>
