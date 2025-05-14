
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="user_session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>SkillPilots | Add Student Details</title>
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css'>
	<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css'>
	<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.css'>
	<link rel="stylesheet" type="text/css" href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css'>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
	<style type="text/css">
@import url("https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:wght@300;400;700&display=swap");
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
a {
	text-decoration: none;
}
ul {
	list-style-type: none;
}


.radio-section {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}
h1 {
	margin-bottom: 20px;
}
.radio-item [type="radio"] {
	display: none;
}
.radio-item + .radio-item {
	margin-top: 15px;
}
.radio-item label {
	display: block;
	padding: 20px 60px;

	border: 2px solid rgba(255, 255, 255, 0.1);
	border-radius: 8px;
	cursor: pointer;
	font-size: 18px;
	font-weight: 400;
	min-width: 250px;
	white-space: nowrap;
	position: relative;
	transition: 0.4s ease-in-out 0s;
}
.radio-item label:after,
.radio-item label:before {
	content: "";
	position: absolute;
	border-radius: 50%;
}
.radio-item label:after {
	height: 19px;
	width: 19px;
	border: 2px solid #524eee;
	left: 19px;
	top: calc(50% - 12px);
}
.radio-item label:before {
	background: #524eee;
	height: 20px;
	width: 20px;
	left: 21px;
	top: calc(50%-5px);
	transform: scale(5);
	opacity: 0;
	visibility: hidden;
	transition: 0.4s ease-in-out 0s;
}
.radio-item [type="radio"]:checked ~ label {
	border-color: #524eee;
}
.radio-item [type="radio"]:checked ~ label::before {
	opacity: 1;
	visibility: visible;
	transform: scale(1);
}
.button-91 {
  color: #fff;
  padding: 15px 25px;
  background-color: #38D2D2;
  background-image: radial-gradient(93% 87% at 87% 89%, rgba(0, 0, 0, 0.23) 0%, transparent 86.18%), radial-gradient(66% 66% at 26% 20%, rgba(255, 255, 255, 0.55) 0%, rgba(255, 255, 255, 0) 69.79%, rgba(255, 255, 255, 0) 100%);
  box-shadow: inset -3px -3px 9px rgba(255, 255, 255, 0.25), inset 0px 3px 9px rgba(255, 255, 255, 0.3), inset 0px 1px 1px rgba(255, 255, 255, 0.6), inset 0px -8px 36px rgba(0, 0, 0, 0.3), inset 0px 1px 5px rgba(255, 255, 255, 0.6), 2px 19px 31px rgba(0, 0, 0, 0.2);
  border-radius: 14px;
  font-weight: bold;
  font-size: 16px;
margin-left: 4rem;
margin-top: 2rem;
  border: 0;

  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;

  cursor: pointer;
}
/* Style the dropdown container */
#college_id {
  width: 200px; /* Adjust the width as needed */
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 16px; /* Adjust font size */
}

/* Style the options */
#college_id option {
  padding: 8px;
  background-color: #fff; /* Background color of options */
  color: #000; /* Text color of options */
}

/* Style the selected option */
#college_id option:checked {
  background-color: #007bff; /* Background color of selected option */
  color: #fff; /* Text color of selected option */
}

</style>
</head>

<body class="login-page">
	  <div class="login-header box-shadow">
      <div
        class="container-fluid d-flex justify-content-between align-items-center"
      >
        <div class="brand-logo" style="width: 12%">
          <a href="${pageContext.request.contextPath}/home">
            <img
              src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
              alt=""
            />
          </a>
        </div>
      </div>
    </div>
	<div class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/register-page-img.png' alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					
						<section class="radio-section">
							<div class="radio-list">
								<h1>Do You Want To Link Your Account With College?</h1>
								<div class="radio-item">
									<input name="role" id="radio1" type="radio" value="10" onchange="toggleCollegeSelect()">
									<label for="radio1">No</label>
								</div>
									<div class="radio-item">
										<input name="role" id="radio2" type="radio" value="0" onchange="toggleCollegeSelect()">
										<label for="radio2">Yes</label>
									</div>
							
								<!-- HTML -->
								
							</div>
						</section>
					
					
			</div>
		</div>
	</div>
	<!-- success Popup html Start -->
	
	<!-- success Popup html End -->
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	


	
<script>
    function toggleCollegeSelect() {
        var selectClgDiv = document.getElementById("selectclg");
        var radioYes = document.getElementById("radio2");
        var radioNo = document.getElementById("radio1");
        var roleInput = document.getElementById("radio1").value;
	
        if (radioYes.checked) {
           
            // Redirect to a new page here
            window.location.href = "${pageContext.request.contextPath}/stud_profile1"; 
        } else if (radioNo.checked) {
            // Set the role value to 10 when "No" is selected
            roleInput.value = "10";
            // Redirect to home page
            window.location.href = "${pageContext.request.contextPath}/stud_profile2?role=" +"10";
        }
    }
</script>

</script>

</body>



</html>