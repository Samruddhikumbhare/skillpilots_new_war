<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>SkillPilots Chat Support</title>

  <!-- ✅ Bootstrap CDN -->

  <!-- ✅ Font Awesome CDN -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    #chat-support-btn {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: #007bff;
      color: white;
      padding: 10px 16px;
      border-radius: 30px;
      cursor: pointer;
      z-index: 999;
      font-weight: bold;
    }

    #chat-box {
      display: none;
      position: fixed;
      bottom: 80px;
      right: 20px;
      width: 340px;
      max-height: 500px;
      background: white;
      border-radius: 10px;
      box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
      flex-direction: column;
      overflow: hidden;
      z-index: 1000;
    }

    #chat-header {
      background: #02376f;
      color: white;
      padding: 12px;
      font-weight: bold;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .close-btn {
      cursor: pointer;
      font-size: 16px;
    }

    #chat-body {
      padding: 10px;
      height: 300px;
      overflow-y: auto;
      font-size: 14px;
    }

    #chat-input {
      display: flex;
      border-top: 1px solid #ccc;
    }

    #chat-input input {
      flex: 1;
      border: none;
      padding: 10px;
      font-size: 14px;
    }

    #chat-input button {
      background: #007bff;
      color: white;
      border: none;
      padding: 10px;
      cursor: pointer;
    }

    .chat-msg {
      margin: 6px 0;
      padding: 8px 12px;
      border-radius: 20px;
      display: inline-block;
      max-width: 80%;
      animation: slideIn 0.4s ease;
    }

    .bot {
      background: #f0f0f0;
      align-self: flex-start;
    }

    .user {
      background: #007bff;
      color: white;
      align-self: flex-end;
    }

    .feedback-buttons button {
      margin-right: 10px;
      padding: 5px 10px;
      border-radius: 15px;
      border: none;
      cursor: pointer;
    }

    .yes-btn {
      background: #28a745;
      color: white;
    }

    .no-btn {
      background: #dc3545;
      color: white;
    }

    .chat-option {
      padding: 6px 10px;
      border-radius: 10px;
      margin: 5px 0;
      background-color: #f5f5f5;
      cursor: pointer;
      transition: background 0.2s;
    }

    .chat-option:hover {
      background-color: #dce8ff;
    }

    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateX(50px);
      }
      to {
        opacity: 1;
        transform: translateX(0px);
      }
    }
  </style>
</head>
<body>

<!-- ✅ Chat Support Toggle Button -->
<div id="chat-support-btn" onclick="toggleChatBox()">
  <i class="fas fa-comment-dots"></i> Chat Support
</div>

<!-- ✅ Chat Box -->
<div id="chat-box">
  <div id="chat-header">
    SkillPilots Support
    <span class="close-btn" onclick="toggleChatBox()"><i class="fas fa-times"></i></span>
  </div>
  <div id="chat-body"></div>
  <div id="chat-input">
    <input type="text" id="user-msg" placeholder="Type your message..." onkeydown="if(event.key==='Enter')sendMessage()"/>
    <button onclick="sendMessage()"><i class="fas fa-paper-plane"></i></button>
  </div>
</div>

<script>
      let lastMainOption = "";

      function toggleChatBox() {
        const chatBox = document.getElementById("chat-box");
        chatBox.style.display =
          chatBox.style.display === "none" ? "flex" : "none";
      }

      function sendMessage() {
        const input = document.getElementById("user-msg");
        const msg = input.value.trim();
        if (!msg) return;
        addMessage("user", msg);
        input.value = "";
        handleUserInput(msg.toLowerCase());
      }

      function addMessage(type, text) {
    	  const time = new Date().toLocaleTimeString([], {
    	    hour: "2-digit",
    	    minute: "2-digit",
    	  });

    	  const message =
    	    '<div class="chat-msg ' + type + '">' +
    	    text +
    	    '<br><small style="font-size:10px;color:gray">' +
    	    time +
    	    "</small></div>";

    	  const body = document.getElementById("chat-body");
    	  body.innerHTML += message;
    	  body.scrollTop = body.scrollHeight;
    	  sessionStorage.setItem("chat-history", body.innerHTML);
    	}


      function addBotMessage(msg) {
        setTimeout(() => {
          addMessage("bot", msg);
          bindOptionEvents();
        }, 400);
      }

      function bindOptionEvents() {
    	  var options = document.querySelectorAll(".chat-option");
    	  for (var i = 0; i < options.length; i++) {
    	    options[i].onclick = function () {
    	      handleUserInput(this.dataset.msg.toLowerCase());
    	    };
    	  }
    	}


      function showWelcome() {
        addBotMessage(`
      <i class="fas fa-handshake"></i> Welcome to <b>SkillPilots</b>!<br><br>
      <i class="fas fa-question-circle"></i> How can I assist you today?<br><br>
      <div class="chat-option" data-msg="1"><i class="fas fa-user-graduate"></i> Internship Related Queries</div>
      <div class="chat-option" data-msg="2"><i class="fas fa-user-edit"></i> Profile Update Help</div>
      <div class="chat-option" data-msg="3"><i class="fas fa-briefcase"></i> Job Related Queries</div>
      <div class="chat-option" data-msg="4"><i class="fas fa-file-alt"></i> Assessment Test Queries</div>
      <div class="chat-option" data-msg="5"><i class="fas fa-ellipsis-h"></i> Other</div>
    `);
      }

      function showFeedback() {
        addBotMessage(`
      <div style="margin-top:10px;"><i class="fas fa-comment-alt"></i> Was this helpful?</div>
      <div class="feedback-buttons mt-2">
        <button class="yes-btn" onclick="handleFeedback('yes')"><i class="fas fa-thumbs-up"></i> Yes</button>
        <button class="no-btn" onclick="handleFeedback('no')"><i class="fas fa-thumbs-down"></i> No</button>
      </div>
      <div style="margin-top:10px;">
        <button onclick="showWelcome()" style="background:#0056b3;color:white;padding:6px 12px;border:none;border-radius:20px;cursor:pointer;"><i class="fas fa-home"></i> Return to Main Menu</button>
      </div>
    `);
      }

      function handleFeedback(response) {
        if (response === "yes") {
          addBotMessage("<i class='fas fa-smile'></i> Glad I could help!");
        } else {
          addBotMessage(
            "<i class='fas fa-user-clock'></i> A support agent will contact you soon."
          );
        }
      }

      function askPhoneNumber() {
    	  addBotMessage(`
    	    <i class="fas fa-phone-alt"></i> Please enter your phone number:<br>
    	    <input type="text" id="phone-input" placeholder="Enter phone number"
    	      style="margin-top:8px;width:90%;padding:6px;border-radius:6px;border:1px solid #ccc;" />
    	    <button onclick="submitPhoneNumber()" 
    	      style="margin-top:8px;background:#007bff;color:white;border:none;padding:6px 12px;border-radius:6px;cursor:pointer;">Submit</button>
    	  `);
    	}


      function askPhoneNumber() {
    	  addBotMessage(`
    	    <div id="phone-container">
    	      <i class="fas fa-phone-alt"></i> Please enter your phone number:<br>
    	      <input type="text" id="phone-input" placeholder="Enter phone number" 
    	        style="margin-top:8px;width:90%;padding:6px;border-radius:6px;border:1px solid #ccc;" />
    	      <button id="submit-phone-btn" 
    	        style="margin-top:8px;background:#007bff;color:white;border:none;padding:6px 12px;border-radius:6px;cursor:pointer;">
    	        Submit
    	      </button>
    	    </div>
    	  `);
    	}


      function submitPhoneNumber() {
    	  setTimeout(() => {
    	    const input = document.getElementById("phone-input");


    	    let phone = input.value.trim();
    	    phone = phone.replace(/\D/g, "");

    	    const isValid = phone.length === 10;


    	    addMessage("user", phone);
    	    addBotMessage(
    	      "<i class='fas fa-check-circle'></i> Thank you! We'll contact you at <b>" + phone + "</b> soon."
    	    );

    	    fetch("send-support-notification?phone=" + phone, {
    	      method: "POST"
    	    });
    	  }, 100); 
    	}


      document.addEventListener("DOMContentLoaded", () => {
    	  const saved = sessionStorage.getItem("chat-history");
    	  if (saved) document.getElementById("chat-body").innerHTML = saved;

    	  setTimeout(() => {
    	    toggleChatBox();
    	    showWelcome();
    	  }, 1000);

    	  // Attach event listener to parent container (event delegation)
    	  document.getElementById("chat-body").addEventListener("click", function (e) {
    	    if (e.target && e.target.id === "submit-phone-btn") {
    	      submitPhoneNumber();
    	    }
    	  });
    	});

      function handleUserInput(msg) {
    	  if (msg === "1" || msg.includes("internship")) {
    	    lastMainOption = "1";
    	    addBotMessage(`
    	      <b><i class="fas fa-user-graduate"></i> Internship Help:</b><br>
    	      <div class="chat-option" data-msg="apply">How to apply</div>
    	      <div class="chat-option" data-msg="status">Check application status</div>
    	      <div class="chat-option" data-msg="documents">Required documents</div>
    	      <div class="chat-option" data-msg="followup">I have been hired but employer is not replying to my email and calls.</div>
    	      <div class="chat-option" data-msg="offer">Where will I receive my Offer letter?</div>
    	      <div class="chat-option" data-msg="working">Can I apply if I am pursuing a degree or working professional?</div>
    	    `);
    	  } else if (msg === "2" || msg.includes("profile")) {
    	    addBotMessage(`
    	      <b><i class="fas fa-user-edit"></i> Profile Update Help:</b><br>
    	      <div class="chat-option" data-msg="editprofile">How to update my profile?</div>
    	      <div class="chat-option" data-msg="uploadresume">How to upload my resume?</div>
    	    `);
    	  } else if (msg === "editprofile") {
    	    addBotMessage("Go to your Dashboard > Profile and click 'Edit Profile' to update your details.");
    	    showFeedback();
    	  } else if (msg === "uploadresume") {
    	    addBotMessage("Go to Dashboard > Profile and upload your resume in the 'Resume' section.");
    	    showFeedback();
    	  } else if (msg === "3" || msg.includes("job")) {
    	    lastMainOption = "3";
    	    addBotMessage(`
    	      <b><i class="fas fa-briefcase"></i> Job Help:</b><br>
    	      <div class="chat-option" data-msg="jobapply">How to apply for jobs?</div>
    	      <div class="chat-option" data-msg="jobstatus">Job application status</div>
    	      <div class="chat-option" data-msg="resume">Resume requirements</div>
    	      <div class="chat-option" data-msg="rejected">Why was my application rejected?</div>
    	    `);
    	  } else if (msg === "jobapply") {
    	    addBotMessage("Visit the <a href='https://home.skillpilots.com/companyCampusDriveForStudentsDashboard'>Jobs</a> section and apply to available positions.");
    	    showFeedback();
    	  } else if (msg === "jobstatus") {
    	    addBotMessage("Go to Dashboard > Job Applications to track your application status.");
    	    showFeedback();
    	  } else if (msg === "resume") {
    	    addBotMessage("A professional resume in PDF format is required.");
    	    showFeedback();
    	  } else if (msg === "rejected") {
    	    addBotMessage("Applications can be rejected due to ineligibility or profile mismatch.");
    	    showFeedback();
    	  } else if (msg === "4" || msg.includes("assessment")) {
    	    lastMainOption = "4";
    	    addBotMessage(`
    	      <b><i class="fas fa-file-alt"></i> Assessment Help:</b><br>
    	      <div class="chat-option" data-msg="testlink">Where to find the test link?</div>
    	      <div class="chat-option" data-msg="retest">Can I retake the test?</div>
    	      <div class="chat-option" data-msg="testresult">When will I get my results?</div>
    	      <div class="chat-option" data-msg="testissue">I faced a technical issue during test</div>
    	    `);
    	  } else if (msg === "testlink") {
    	    addBotMessage("You can find your test link under Dashboard > Assessments.");
    	    showFeedback();
    	  } else if (msg === "retest") {
    	    addBotMessage("Retests are allowed in some cases. Please contact support.");
    	    showFeedback();
    	  } else if (msg === "testresult") {
    	    addBotMessage("Assessment results are typically sent within 3-5 business days.");
    	    showFeedback();
    	  } else if (msg === "testissue") {
    	    addBotMessage("Please write to <b>support@cluematrix.com</b> with your issue details.");
    	    showFeedback();
    	  } else if (msg === "apply") {
    	    addBotMessage("Go to the <a href='/internships'>Internships</a> page and apply.");
    	    showFeedback();
    	  } else if (msg === "status") {
    	    addBotMessage("Visit Dashboard > My Applications to check status.");
    	    showFeedback();
    	  } else if (msg === "documents") {
    	    addBotMessage("Resume, College ID, and Govt ID are required.");
    	    showFeedback();
    	  } else if (msg === "followup") {
    	    addBotMessage("Please follow up with the employer. If not responsive, contact support.");
    	    showFeedback();
    	  } else if (msg === "offer") {
    	    addBotMessage("You'll receive it on your email.");
    	    showFeedback();
    	  } else if (msg === "working") {
    	    addBotMessage("Yes, you can apply.");
    	    showFeedback();
    	  } else if (msg === "5" || msg.includes("other")) {
    	    addBotMessage(`
    	      <b><i class="fas fa-ellipsis-h"></i> Other Queries:</b><br>
    	      <div class="chat-option" data-msg="payment">Payment Issues</div>
    	      <div class="chat-option" data-msg="contactme">Call Support</div>
    	    `);
    	  } else if (msg === "payment") {
    	    addBotMessage("For payment issues, email <b>support@cluematrix.com</b>.");
    	    showFeedback();
    	  } else if (msg === "contactme") {
    	    askPhoneNumber();
    	  } else {
    	    addBotMessage("Sorry, I didn’t understand. Please choose from the menu.");
    	  }
    	}


      /* document.addEventListener("DOMContentLoaded", () => {
        const saved = sessionStorage.getItem("chat-history");
        if (saved) document.getElementById("chat-body").innerHTML = saved;
        setTimeout(() => {
          toggleChatBox();
          showWelcome();
        }, 1000);
      }); */
    </script>
</body>
</html>
