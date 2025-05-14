<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@include file="user_session.jsp" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>SkillPilots | Student List</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
      rel="stylesheet"
    />
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/css/myCss/feedback_css.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
	<script type="text/javascript">
	function validateMe() {
		if (document.getElementById("files").files.length == 0) {
			alertMsg("Please select a file.");
			return false;
		} else {
			return true;
		}
	}
</script>
	<style type="text/css">
	
	      body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #343541, #444654);
            color: white;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .chat-container {
            width: 500px;
            height: 80vh;
            background: rgba(64, 65, 79, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }
        .chat-header {
            background: #222327;
            padding: 15px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
        .chat-box {
            flex: 1;
            padding: 15px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            scroll-behavior: smooth;
        }
        .chat-message {
            max-width: 80%;
            padding: 12px;
            border-radius: 12px;
            font-size: 14px;
            margin-bottom: 10px;
            word-wrap: break-word;
            opacity: 0;
            transform: translateY(10px);
            animation: fadeIn 0.3s ease-in-out forwards;
        }
        .user-message {
            background: #1e90ff;
            color: white;
            align-self: flex-end;
        }
        .bot-message {
            background: #494a53;
            color: white;
            align-self: flex-start;
        }
        .typing-indicator {
            display: none;
            align-self: flex-start;
            background: rgba(255, 255, 255, 0.2);
            padding: 10px;
            border-radius: 10px;
            font-size: 14px;
            color: lightgray;
        }
        .chat-input {
            display: flex;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            padding: 10px;
            background: #222327;
        }
        .chat-input input {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            outline: none;
        }
        .chat-input input::placeholder {
            color: lightgray;
        }
        .chat-input button {
            margin-left: 10px;
            padding: 12px;
            background: #1e90ff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }
      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(10px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
	.sidebar-menu .dropdown-toggle {
		padding: 15px 12px 15px 54px!important;
		font-size: 15px!important;
	}
	.page-link{
		line-height: 1rem!important;
	}
	.user-notification .dropdown-toggle .badge {
    position: absolute;
    right: 5px;
    top: 7px;
   /*  background: #0f2c7eeb; */
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
#studentDetailsModal{
	padding-left: 21% !important;
}
	</style>
</head>
<body>
	<div class="pre-loader">
		<div class="pre-loader-box">
			<div class="loader-logo"><img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg" alt=""></div>
			<div class='loader-progress' id="progress_div">
				<div class='bar' id='bar1'></div>
			</div>
			<div class='percent' id='percent1'>0%</div>
			<div class="loading-text">
				Loading...
			</div>
		</div>
	</div>

	<%@include file="header.jsp"%>

	<div class="right-sidebar">
		<div class="sidebar-title">
			<h3 class="weight-600 font-16 text-blue">
				Layout Settings
				<span class="btn-block font-weight-400 font-12">User Interface Settings</span>
			</h3>
			<div class="close-sidebar" data-toggle="right-sidebar-close">
				<i class="icon-copy ion-close-round"></i>
			</div>
		</div>
		<div class="right-sidebar-body customscroll">
			<div class="right-sidebar-body-content">
				<h4 class="weight-600 font-18 pb-10">Header Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);" class="btn btn-outline-primary header-white">White</a>
					<a href="javascript:void(0);" class="btn btn-outline-primary header-dark active">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);" class="btn btn-outline-primary sidebar-light ">White</a>
					<a href="javascript:void(0);" class="btn btn-outline-primary sidebar-dark active">Dark</a>
				</div>
				<div class="reset-options pt-30 text-center">
					<button class="btn btn-danger" id="reset-settings">Reset Settings</button>
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

	 <%@include file="header.jsp"%>
    <div class="main-container">
        <div class="chat-container">
            <div class="chat-header">Chat with AI</div>
            <div class="chat-box" id="chatBox"></div>
            <div class="typing-indicator" id="typingIndicator">AI is typing...</div>
            <div class="chat-input">
                <input type="text" id="question" placeholder="Ask me anything..." onkeypress="handleKeyPress(event)"/>
                <button onclick="askAI()">Send</button>
            </div>
        </div>
    </div>

    <script>
        function handleKeyPress(event) {
            if (event.keyCode === 13) {
                askAI();
            }
        }

        function askAI() {
            var question = $("#question").val().trim();
            if (!question) {
                alert("Please enter a question!");
                return;
            }

            $("#question").val("");
            addMessage("You", question, "user-message");
            $("#typingIndicator").show();

            $.ajax({
                type: "POST",
                url: "http://localhost:8080/api/qna/ask",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({ question: question }),
                success: function (response) {
                    $("#typingIndicator").hide();
                    if (response.AI_Answer) {
                    	console.log(response.AI_Answer,"dddddddddddddd")
                        showFormattedResponse(response.AI_Answer);
                    } else {
                        addMessage("AI", "Sorry, I couldn't fetch an answer.", "bot-message");
                    }
                },
                error: function () {
                    $("#typingIndicator").hide();
                    addMessage("AI", "An error occurred while fetching the response.", "bot-message");
                }
            });
        }

        function addMessage(sender, message, className) {
            var chatBox = document.getElementById("chatBox");
            var messageDiv = document.createElement("div");
            messageDiv.className = `chat-message ${className}`;
            messageDiv.innerHTML = `<strong>${sender}:</strong> ${message}`;
            
            chatBox.appendChild(messageDiv);
            chatBox.scrollTop = chatBox.scrollHeight;
        }


        function showFormattedResponse(responseText) {
            console.log("AI Response:", responseText); // Debugging to check response

            var chatBox = $("#chatBox");
            var lines = responseText.split("\n");
            
            console.log("sssssssssss",lines)

            // Add the main AI response
            var paragraph = $("<div>").addClass("chat-message bot-message").html(`<strong>AI:</strong> ${lines[0]}`);
            chatBox.append(paragraph);
            chatBox.scrollTop(chatBox[0].scrollHeight);

            // Add remaining lines as bullet points (if any)
            if (lines.length > 1) {
                setTimeout(() => {
                    var bulletList = $("<ul>").addClass("chat-message bot-message");
                    for (var i = 1; i < lines.length; i++) {
                        bulletList.append(`<li>${lines[i]}</li>`);
                    }
                    chatBox.append(bulletList);
                    chatBox.scrollTop(chatBox[0].scrollHeight);
                }, 500);
            }
        }


    </script>
	
	</div>
	<!-- js -->
	<%@include file="scriptfiles.jsp"%>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/student_list.js"></script>
	<script type="text/javascript" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
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
<%-- <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
 --%>	
  
</body>
</html>