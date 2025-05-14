
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@include file="user_session.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>SkillPilots | Live Chat</title>

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

	<<div class="left-side-bar">
		<div class="brand-logo">
			<a href="javascript:;"> <img
				src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg" alt="" class="dark-logo"> 
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
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="page-header" style="padding-bottom: 0px;margin-bottom: 20px;">
			<c:url var="addAction" value="${pageContext.request.contextPath}/live_chat"></c:url>
			<form:form modelAttribute="chat" id="my_form" action="${addAction}"
					method="post">
					
					<div class="row">
						<c:if test="${not empty user and user.role eq 0 or user.role eq 8 or user.role eq 6}">
							
								<div class="col-md-4 col-sm-12">
									<div class="form-group parameter">
										<label>HOD</label>
										<div class="dropdown bootstrap-select form-control dropup">
											<select class="selectpicker form-control" id="select_hod"
												data-style="btn-outline-info" tabindex="-98">
												<option>Select Chat Agent</option>
												<c:forEach items="${hod}" var="comp">
												<option value="${comp.id}">${comp.username}</option>
											</c:forEach>
											</select>
										</div>
									</div>
								</div>
							
						</c:if>
						<c:if test="${not empty colleges}">
							<div class="col-md-4">
								<div class="parameter">
									<label>College List</label>
									<select class="selectpicker form-control" id="select_coll"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${colleges}" var="col">
											<option value="${col.college_id}">${col.college_name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>HR</label>
									<select class="selectpicker form-control" id="select_hr"
												data-style="btn-outline-info" tabindex="-98">
												<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${HR}" var="hr">
											<option value="${hr.id}">${hr.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 8 or user.role eq 7 or user.role eq 6 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Student List</label>
										<select class="selectpicker form-control" id="select_student"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Students--</option>
										<c:forEach items="${students}" var="stud">
											<option value="${stud.id}">${stud.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 0 or user.role eq 7}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Dept.Incharge</label>
									<select class="selectpicker form-control" id="select_incharge"
									data-style="btn-outline-info" tabindex="-98">
									<option selected value="">--Select Chat Agent--</option>
									<c:forEach items="${incharge}" var="deptInch">
										<option value="${deptInch.id}">${deptInch.username}</option>
									</c:forEach>
										</select>
									</div>
								</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 0 or user.role eq 7}">
							<div class="col-md-4">
								<div class="parameter">
									<label>TPO</label>
									<select class="selectpicker form-control" id="select_tpo"
									data-style="btn-outline-info" tabindex="-98">
									<option selected value="">--Select Chat Agent--</option>
									<c:forEach items="${tpos}" var="tpo">
											<option value="${tpo.id}">${tpo.username}</option>
										</c:forEach>
										</select>
									</div>
								</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 4}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Comp.Manager</label>
									
									<select class="selectpicker form-control" id="select_manager"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${manager}" var="manager">
											<option value="${manager.managerId}">${manager.managerName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 10 or user.role eq 0 or user.role eq 3}">
							<div class="col-md-4">
								<div class="parameter">
									<label>Internship Lead</label>
									<select class="selectpicker form-control" id="select_lead"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${incharge}" var="teamlead">
<%-- 											<option value="${teamlead.leadId}">${teamlead.leadName}</option>
 --%>										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						<c:if test="${not empty user and user.role eq 1 or user.role eq 2 }">
							<div class="col-md-4">
								<div class="parameter">
									<label>T And P </label>
									<select class="selectpicker form-control" id="select_lead"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${tpo}" var="tpo">
											<option value="${tpo.id}">${tpo.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						
						<c:if test="${not empty user and user.role eq 6 }">
							<div class="col-md-4">
								<div class="parameter">
									<label>Company </label>
									<select class="selectpicker form-control" id="select_lead"
												data-style="btn-outline-info" tabindex="-98">
										<option selected value="">--Select Chat Agent--</option>
										<c:forEach items="${company}" var="company">
											<option value="${company.id}">${company.username}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</c:if>
						
						
					</div>
				
					
				</form:form>
					</div>
				<div class="col-sm-12 col-md-6">
					</div>
					<div class="col-sm-12 col-md-6 mb-20" id="chatWindow" style="display: none;padding-left: 0px;">
						<div class="card card-box" id="chtbox">
							<div class="card-header form-inline" style="background: #0f2c7eeb;">
								<div class="chat-profile-photo">
												<!-- <img src="../SkillPilots${pageContext.request.contextPath}/style/dist/dash/vendors/images/profile-photo.jpg" style="max-height: 39px;" alt=""> -->
											</div>
											<div class="chat-profile-name">
											<span id="chatagent" style="color: white">	</span> 
											<span id="user_id" style="color: white">	</span> 
											<span style="position: absolute; top: 10px; right: 10px; cursor: pointer;" id="endchat" data-toggle="tooltip" data-placement="top" title="Click On Close Icon To End Chat"> <i class="fa fa-times-circle" style="color:white"></i></span>
									</div>
							</div>
							<div class="card-body">
								<div class="card-body height3" id="style-3"
								style="overflow: auto;  height: 174px;">
							
							</div>
								
							</div>
							<div>
								<textarea class="form-control" placeholder="Type Here To Send Message..."
									id="btninput" style="position: relative;height: 38px;"></textarea>
								<div>
									<span class="input-group-text send_btn" id="chatbtn1"
										style="float: right; bottom: 5px; position: absolute; right: 23px;"><i
										class="fa fa-send-o"></i></span>
								</div>
							</div>
							</div>
						</div>
					</div>
			<!-- <%@include file="modal_common.jsp"%> -->
			<div class="footer-wrap pd-20 mb-20 card-box" style="position: fixed; bottom: 0%; width: 77%;">
				<i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
				<script>
					document.write(new Date().getFullYear())
				</script>
				All Rights Reserved SkillPilots &reg; | Designed & Developed By <a
					href="https://www.cluematrix.com/" target="_blank"
					style="color: #2800b4;">Cluematrix</a> Technologies Pvt.Ltd.
			</div>
		</div>
	</div>
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
$(document).ready(function(){
    // Bind change event to all select elements within the form with ID 'my_form'
    $('#my_form .selectpicker').change(function(){
        // Get the selected option value
        var selectedOptionValue = $(this).val();
        var selectedOptionText = $(this).find("option:selected").text();

        // Assuming you have a modal with an ID 'chatWindow'
        // Update the content or value you want to show in your modal
        $('#chatagent').text(selectedOptionText 


		);

        // Show your modal, adjust this part according to your modal's show function
        // Here we are simply toggling the display of the chatWindow element
        $('#chatWindow').show();

        // Optional: If you want to hide the modal when the chat is closed
        $('#endchat').click(function(){
            $('#chatWindow').hide(); // Hide the chat window
        });
    });
});
</script>
<script>
	$(document).ready(function(){
    var selectedOptionValue; // Declare this at a higher scope

    $('#my_form .selectpicker').change(function(){
        selectedOptionValue = $(this).val(); // This will now be accessible later
        var selectedOptionText = $(this).find("option:selected").text();
        $('#chatagent').text(selectedOptionText );
      //  $('#user_id').text('${user.id}');
        $('#chatWindow').show();
        
        fetchChatMessages(selectedOptionValue);
        setInterval(function() {
            fetchChatMessages(selectedOptionValue);
        }, 2000);
    });

    function sendMessage() {
        var message = $("#btninput").val();
        if (message == null || message == "") {
            swal("Can't Send A Blank Message.");
        } else {
            var receiver_id = selectedOptionValue;
            console.log("Receiver id " + receiver_id);
            var sender_id = '${user.id}';

            $.ajax({
                type: "POST",
                url: "saveChat",
                data: {
                    message: message,
                    sender_id: sender_id,
                    receiver_id: receiver_id
                },
                context: document.body,
                cache: false,
                async: true,
                success: function(data) {
                    $("#btninput").val("");
                    fetchChatMessages(selectedOptionValue);
                }
            });
        }
    }

    $('#chatbtn1').click(function(e) {
        e.preventDefault();
        sendMessage();
    });

    $('#btninput').keypress(function(e) {
        if (e.which == 13) { // Enter key pressed
            e.preventDefault();
            sendMessage();
        }
    });
});

// Define a function to fetch chat messages
function fetchChatMessages(selectedOptionValue) {
    var sender_id = '${user.id}';
    var receiver_id = selectedOptionValue;

    $.ajax({
        url: '${pageContext.request.contextPath}/getChat',
        type: 'GET',
        dataType: 'json',
        data: {
            senderId: sender_id,
            receiverId: receiver_id,
        },
        success: function(response) {
            console.log(response);
            
            response.sort(function(a, b) {
                return new Date(a.timestamp) - new Date(b.timestamp);
            });
            
            var chatDisplay = $('.card-body .height3');
            chatDisplay.empty();
            
            var loggedInUserId = sender_id;
            
            response.forEach(function(chat) {
                var messageType = chat.senderId == loggedInUserId ? 'sender' : 'receiver';
                var messageElement = $('<div>')
                    .addClass('chat-message ' + messageType)
                    .attr('id', 'msg-' + chat.id)
                    .text(chat.message);
                
                var timestampElement = $('<div>')
                    .addClass('timestamp')
                    .text(chat.timestamp);
                
                var chatContainer = $('<div>')
                    .addClass('chat-container')
                    .addClass(messageType) // Add sender/receiver class to container
                    .append(messageElement)
                    .append(timestampElement);
                
                chatDisplay.append(chatContainer);
            });
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}








	</script>
	
	

</body>
</html>