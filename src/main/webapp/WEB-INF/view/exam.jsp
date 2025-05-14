
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@include file="user_session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<meta charset="utf-8">
<title>SkillPilots | Assesment</title>
<!-- Import Google Icon Font -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Import materialize.css -->
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" media="screen,projection"/>
    <!-- Ensure proper rendering and touch zooming -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
<link href="${pageContext.request.contextPath}/style/dist/css/live_chat.css" rel="stylesheet" type="text/css" />
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
<style type="text/css">
	.parameter {
    padding: 0;
}
/* Container for all messages */
.card-body .height3 {
    display: flex;
    flex-direction: column;
    padding: 10px;
}

/* Basic styling for each chat message */
.chat-message {
    padding: 8px 12px;
    border-radius: 20px;
    margin-bottom: 8px;
    max-width: 80%;
    word-wrap: break-word;
}

/* Styling for messages sent by the user */

    .chat-message.sender {
        text-align: right;
        background-color: #d1e7dd; /* Light green background for sender */
        padding: 10px;
        border-radius: 10px;
        margin: 5px 0;
        max-width: 70%;
        margin-left: auto; /* Align to the right */
        align-self: flex-end;
    }

    .chat-message.receiver {
        text-align: left;
        background-color: #f8d7da; /* Light red background for receiver */
        padding: 10px;
        border-radius: 10px;
        margin: 5px 0;
        max-width: 70%;
        margin-right: auto; /* Align to the left */
        align-self: flex-start;
    }

.timestamp.sender {
    font-size: 9px;
    color: #888;
    margin-top: 5px; /* Adjusted margin top */
    display: block;
    clear: both;
    text-align: right; /* Align sender timestamp to right */
    width: auto; /* Adjusted width for sender timestamp */
    margin-left: auto; /* Align to the right */
    margin-right: 0; /* Align to the right */
}


.timestamp.receiver {
    font-size: 9px;
    color: #888;
    margin-top: 5px; /* Adjusted margin top */
    display: block;
    clear: both;
    text-align: left; /* Align receiver timestamp to left */
    width: auto; /* Adjusted width for receiver timestamp */
    margin-left: 0; /* Align to the left */
    margin-right: auto; /* Align to the left */
}


.chat-container {
    margin-bottom: 10px;
}

.btn-large {
          font-size: small;
      padding: 5px 10px;
        border-radius: 2px;
        height: auto;
    line-height: 30px;
ransition: background-color 0.3s ease;
    }
    .btn-large:hover {
        background-color: #004d40;
    }
    .btn-large .material-icons {
        font-size: 1.0em;
    }
.user-notification .dropdown-toggle .badge {
    position: absolute;
    right: 5px;
    top: 7px;
  /*   background: #0f2c7eeb; */
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
.bootstrap-select .dropdown-toggle {
    height: 35px;
    padding-right: 30px;
    font-size: 14px;
    font-weight: 400;
}
.form-group {
    margin-bottom: 1px;
}
.device-manage-progress-chart ul li, .mb-30 {
    margin-bottom: 38px;
}
#style-3::-webkit-scrollbar
{
	width: 6px;
	background-color: #F5F5F5;
}

#style-3::-webkit-scrollbar-thumb
{
	background-color: #0f2c7eeb;
}
.chat-box .chat-desc ul, .pd-ltr-20 {
    padding: 10px 20px 0;
}

/* Custom modal styling */
.modal {
    max-width: 500px; /* Adjust the max-width to fit your needs */
    width: 90%; /* Responsive width */
}

.modal-content h4 {
    margin-bottom: 20px;
}

.modal-content p {
    margin: 10px 0;
    font-size: 16px;
}

.modal-footer {
    text-align: center;
}

/* Center the modal horizontally and vertically */
.modal {
    top: 50% !important;
    transform: translateY(-50%) !important;
}

/* Ensure modal content is scrollable if needed */
.modal-content {
    overflow-y: auto;
    max-height: 400px; /* Adjust the max-height to fit your needs */
}
 .footer-wrap {
            position: fixed;
            bottom: 0;
            width: 100%; /* Set width to 100% to span the entire bottom */
            text-align: center; /* Center the text */
            background-color: white; /* Add a background color if needed */
            padding: 10px 0; /* Add padding for better appearance */
            box-shadow: 0 -1px 5px rgba(0, 0, 0, 0.1); /* Optional: add a shadow for better separation */
        }
        .footer-wrap a {
            color: #2800b4; /* Keep link color as specified */
            text-decoration: none; /* Remove underline from link */
        }
        .footer-wrap a:hover {
            text-decoration: underline; /* Underline link on hover */
        }
        .footer-wrap .fa-copyright {
            font-size: 17px;
            color: red;
            margin-right: 5px; /* Add some space between icon and text */
        }
         body {
/*             background: linear-gradient(135deg, #667eea, #764ba2);
 */            font-family: 'Arial', sans-serif;
            color: white;
        }
        .container {
            margin-top: 40px;
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            font-weight: bold;
            color: #4a148c;
            text-transform: uppercase;
        }
        table {
            border-radius: 10px;
            overflow: hidden;
        }
        th {
            background: #4a148c;
            color: white;
            font-size: 18px;
            padding: 15px;
        }
        td {
            font-size: 16px;
            padding: 12px;
            color: black;
        }
        .btn {
            border-radius: 8px;
            font-weight: bold;
        }
        .green {
            background: #43a047 !important;
        }
        .blue {
            background: #1e88e5 !important;
        }
        
        .wait-message {
            background: #ffeb3b;
            color: #000;
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
        }
        .table-container {
            overflow-x: auto;
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
					<a href="javascript:;"> <img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg" alt="" class="dark-logo"> 
				<img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
	
		<%@include file="sidebar.jsp"%>
	</div>
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
        <div class="container">
            <h2 class="center-align"><i class="fa-solid fa-list-check"></i> Available Tests</h2>
            <div class="table-container">
                <table class="highlight responsive-table">
                    <thead>
                        <tr>
                            <th><i class="fa-solid fa-book-open"></i> Test Name</th>
                            <th><i class="fa-solid fa-star"></i> Total Marks</th>
                            <th><i class="fa-solid fa-circle-question"></i> Total Questions</th>
                            <th><i class="fa-solid fa-clock"></i> Time (minutes)</th>
                            <th><i class="fa-solid fa-tasks"></i> Action</th>
                            <th><i class="fa-solid fa-chart-bar"></i> Result</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="test" items="${tests}">
                            <tr>
                                <td><strong>${test.testName}</strong></td>
                                <td>${test.totalMarks}</td>
                                <td>${test.totalQuestions}</td>
                                <td>${test.time}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${test.status == 'Start Test'}">
                                            <form action="disclaimer" method="get">
                                                <input type="hidden" name="testId" value="${test.testId}">
                                                <button class="btn waves-effect waves-light green">
                                                    <i class="fa-solid fa-play start-icon"></i> Start Test
                                                </button>
                                            </form>
                                        </c:when>
                                        <c:when test="${test.status == 'You can give the test after 1 week'}">
                                            <p class="wait-message">
                                                You can give the test after 1 week.
                                            </p>
                                        </c:when>
                                        <c:when test="${test.status == 'Retake Test'}">
                                            <form action="disclaimer" method="get">
                                                <input type="hidden" name="testId" value="${test.testId}">
                                                <button class="btn waves-effect waves-light blue">
                                                    <i class="fa-solid fa-rotate-left retake-icon"></i> Retake Test
                                                </button>
                                            </form>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                   <button class="btn waves-effect waves-light purple view-result" data-test-id="${test.testId}">
    <i class="fa-solid fa-eye"></i> View Results
</button>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>




<!-- Modal Structure -->
<div id="resultModal" class="modal" style="max-width: 400px;">
    <div class="modal-content">
        <h5>Test Results</h5>
        <div id="resultDetails">
            <p><strong>Marks Obtained:</strong> <span id="marksObtained"></span></p>
            <p><strong>Correct Answers:</strong> <span id="correctAnswers"></span></p>
            <p><strong>Wrong Answers:</strong> <span id="wrongAnswers"></span></p>
            <p><strong>Unanswered:</strong> <span id="unanswered"></span></p>
            <p><strong>Status:</strong> <span id="resultStatus"></span></p>
        </div>
        <div id="noResults" style="display: none; color: red;">
            No results found. Student needs to take the assessment.
        </div>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
</div>
			<!-- <%@include file="modal_common.jsp"%> -->
			
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<!-- Include jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Include jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script>
document.addEventListener('DOMContentLoaded', function () {
    // Add event listeners for all "View Results" buttons
    document.querySelectorAll('.view-result').forEach(function (button) {
        button.addEventListener('click', function () {
            var testId = this.getAttribute('data-test-id');
            var studentId = "${user.id}";  // Ensure `user.id` is available in JSP and populated correctly

            // Fetch the result data using AJAX
            fetch('getTestResults?testId=' + testId + '&studentId=' + studentId)
                .then(response => response.json())
                .then(data => {
                    console.log(data); // Log the data to check if it's coming correctly from the backend
                    
                    if (data && data.resultStatus) {
                        // Use SweetAlert2 to show the results in a modal style popup
                    	 Swal.fire({
                             title: 'Test Results',
                             html: 
                                 '<p><strong>Marks Obtained:</strong> ' + data.totalMarks + '</p>' +
                                 '<p><strong>Correct Answers:</strong> ' + data.correctAns + '</p>' +
                                 '<p><strong>Wrong Answers:</strong> ' + data.wrongAns + '</p>' +
                                 '<p><strong>Unanswered:</strong> ' + data.noAns + '</p>' +
                                 '<p><strong>Status:</strong> ' + data.resultStatus + '</p>',
                             icon: 'info',
                             confirmButtonText: 'Close',
                             customClass: {
                                 popup: 'swal-popup-center' // Custom class to center the popup
                             }
                         });
                    } else {
                        // If no results are found
                        Swal.fire({
                            title: 'No Results Found',
                            text: 'Student needs to take the assessment.',
                            icon: 'error',
                            confirmButtonText: 'Close'
                        });
                    }
                })
                .catch(error => {
                    console.error('Error fetching result data:', error);
                    Swal.fire({
                        title: 'No Results Found',
                        text: 'Student needs to take the assessment.',
                        icon: 'error',
                        confirmButtonText: 'Close'
                    });
                });
        });
    });
});

    
    function startTest() {
        var elem = document.documentElement;
        if (elem.requestFullscreen) {
            elem.requestFullscreen();
        } else if (elem.mozRequestFullScreen) { // Firefox
            elem.mozRequestFullScreen();
        } else if (elem.webkitRequestFullscreen) { // Chrome, Safari and Opera
            elem.webkitRequestFullscreen();
        } else if (elem.msRequestFullscreen) { // IE/Edge
            elem.msRequestFullscreen();
        }

        // Hide the start button and show the first question
        document.getElementById('startTestButton').style.display = 'none';
        questions[currentQuestionIndex].classList.add('active');
        updateButtonVisibility();
    }

    document.addEventListener('DOMContentLoaded', function() {
        updateButtonVisibility();
    });
</script>


	<!-- SweetAlert2 CDN -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
	
	

</body>
</html>