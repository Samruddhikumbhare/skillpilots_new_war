<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="user_session.jsp"%>
<link
	href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css' />"
	rel="stylesheet">

<style>
.header-right {
	display: -webkit-box;
	display: flex;
	-webkit-box-pack: end;
	justify-content: flex-end;
	height: 70px;
	width: 70%;
}

.header-left {
	display: -webkit-box;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	height: 100%;
	width: 10%;
}

.notification-icon-container {
	position: relative;
	display: inline-block;
}

.notification-icon-container .badge {
	position: absolute;
	top: -8px;
	right: -10px;
	background-color: red;
	color: white;
	font-size: 12px;
	border-radius: 50%;
	padding: 3px 6px;
}

.notification-icon-container i {
	font-size: 24px;
	color: #555;
	cursor: pointer;
	transition: color 0.3s ease;
}

.notification-icon-container i:hover {
	color: #000;
}

/* Example CSS for modal */
/* Modal Styling */
/* Modal Styling */
#notificationModal {
    margin-left:1200px;
    margin-top:100px;
    margin-bottom: 900px;
    bottom: 20px; /* Distance from the bottom of the screen */
    right: 20px;  /* Distance from the right edge of the screen */
    width: 300px; /* Width of the modal */
    background-color: #fff;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    border-radius: 8px;
    min-height: 200px;
    max-height:400px;

    overflow: auto;
    display: none; /* Initially hidden */
    z-index: 1000; /* Ensure it appears above other elements */
    animation: fadeIn 0.3s ease-in-out;
}

/* Fade-In Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px); /* Slight slide-up effect */
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Modal Content */
#notificationModal .modal-content {
    padding: 10px;
    max-height: 400px; /* Limit height with scroll */
    overflow-y: auto;
    box-sizing: border-box;
}

/* Close Button */
.close {
    float: right;
    font-size: 16px;
    cursor: pointer;
    color: #333;
}

/* Notification List */
.notification-list {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.notification-list li {
    padding: 12px;
    border-bottom: 1px solid #ccc;
    cursor: pointer;
    border-radius: 6px;
    transition: background-color 0.3s ease;
}

.notification-list li.unread {
    background-color: #f0f8ff; /* Light blue for unread */
    font-weight: bold;
}

.notification-list li.read {
    background-color: #fff; /* White for read */
    font-weight: normal;
}

.notification-list li:hover {
    background-color: #f5f5f5; /* Light gray on hover */
}


.modal-dialog-right {
    position: fixed;
    top: 0;
    right: 0;
    margin: 0;
    width: 100%; /* Adjust width for large modal */
    height: 100%; /* Full height of the page */
    transform: translateX(100%); /* Initially hidden to the right */
    transition: transform 0.5s ease-in-out; /* Smooth slide-in effect */
}
.modal.show .modal-dialog-right {
    transform: translateX(0); /* Slide in from the right */
}
/* Optional: Adjust modal content for larger size */
.modal-content {
    height: 100%;
    max-height: 90vh; /* Ensure modal is not too large vertically */
}
/* Optional: Adjust close button position */
.modal-header .close {
    font-size: 2rem;
    margin-top: -10px;
}
/* Ensures that all cards within the same row are the same height */
.card {
    height: 100%;
    width:100%;
    display: flex;
    flex-direction: column;
}
/* Ensures that the card body takes up the available space and pushes the footer to the bottom */
.card-body {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
}
/* Adds spacing to the date at the bottom of the card */
.card-body small {
    margin-top: auto;
}
#notesDisplay .card {
    height: 100%;
    min-height: 150px;
}


</style>
<div class="header">
	<div class="header-left">
		<div class="menu-icon dw dw-menu"></div>
		<div class="search-toggle-icon dw dw-search2"
			data-toggle="header_search"></div>
	</div>
	<div class="header-right">
		
		<div class="dashboard-setting user-notification">
			<div class="dropdown">
				<a class="dropdown-toggle no-arrow" href="javascript:;"
					data-toggle="right-sidebar"> <i class="dw dw-settings2"></i>
				</a>
			</div>
		</div>

		<!-- Notification Bell Icon Section -->
		<div class="user-notification">
			<div class="dropdown">
				<div class="notification-icon-container"
					style="position: relative; display: inline-; margin-right: 20px;">
					<!-- Bell Icon -->
					<i class="fas fa-bell"
						style="font-size: 24px; color: white; cursor: pointer;"
						onclick="toggleNotifications()"></i>

					<!-- Notification Count Badge -->
					<span id="notificationCount" class="badge"
						style="position: absolute; top: -5px; right: -10px; background-color: red; color: white; border-radius: 50%; padding: 3px 6px; font-size: 12px; display: none;">
						0 </span>
				</div>


				<i class="fas fa-sticky-note" onclick="viewNotes()"
					style="font-size: 24px; color: white; cursor: pointer;"
					data-toggle="modal" data-target="#stickyNotesModal"
					title="Sticky Notes"></i>
			</div>
		</div>
		
		
		<!-- Modal -->
<div class="modal fade" id="stickyNotesModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog modal-xl modal-dialog-scrollable" role="document" style="max-width: 62vw; height: 90vh;">
        <div class="modal-content h-100" style="height: 100%; border-radius: 10px;">
            <div class="modal-header">
                <h5 class="modal-title">Sticky Notes</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body d-flex flex-column overflow-auto" style="flex-grow: 1;">
                <button class="btn btn-primary mb-3" id="addNoteBtn" style="background-color:#0f2c7eeb;" onclick="showNoteForm()">Add Note</button>
                <!-- Display notes -->
                <div id="notesDisplay" class="mb-3">
                    <!-- Notes will be inserted here -->
                </div>
                <!-- Area to show textarea when Add Note is clicked -->
                <div id="noteFormArea" style="display: none;">
                    <textarea class="form-control mb-3" name="notes" rows="7" placeholder="Write your note here..."></textarea>
                </div>
            </div>
            <!-- Footer buttons -->
            <div class="modal-footer" id="footerButtons" style="display: none;">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="cancelNote()">Cancel</button>
                <button type="button" class="btn btn-success" onclick="submitNote()">Submit</button>
            </div>
        </div>
    </div>
</div>

		<!-- Notification Modal -->
		<div id="notificationModal" class="modal" style="display: none;">
			<div class="modal-content">
				<span class="close" onclick="toggleNotifications()">&times;</span>
				<ul id="notificationList" class="notification-list"></ul>
				<!-- Notification list will be populated here -->
			</div>
		</div>


		<%-- 	<div class="user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="#" role="button" data-toggle="dropdown">
						<i class="icon-copy dw dw-notification"></i>
						<span class="badge notification-active">
						<c:if
							test="${notifResponse.urCount gt 0}">
							<span class="label label-warning" id="noOfNotif"
								style="font-size: 13px !important;color: #9ff711;">${notifResponse.urCount}</span>
						</c:if>
						</span>
					</a>
				<div class="dropdown-menu dropdown-menu-right">
					<!-- Header Section -->

				</div>
			</div>
			</div> --%>
		<div class="user-info-dropdown">
			<div class="dropdown">
				<a class="dropdown-toggle" href="#" role="button"
					data-toggle="dropdown"> <span class="user-icon"> <img
						src="<c:url value='/get_logo'/>" alt="Custom Logo"
						style="width: 100%; height: 100%;">

				</span> <span class="user-name"> <c:if
							test="${not empty user.email}">${user.username}</c:if>
				</span>
				</a>

				<div
					class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
					<c:if test="${user.role eq '0' || user.role eq '10'}">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editStudentProfile"><i
							class="dw dw-user1"></i> Edit Profile</a>
					</c:if>

					<c:if test="${user.role eq '5'}">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editCollegeProfile"><i
							class="dw dw-user1"></i> Edit Profile</a>
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editUserProfile"><i
							class="dw dw-user1"></i> Edit III Profile</a>

					</c:if>

					<c:if test="${user.role eq '1'}">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editCompProfile"><i
							class="dw dw-user1"></i> Edit Profile</a>
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editUserProfile"><i
							class="dw dw-user1"></i> Edit HR Profile</a>

					</c:if>
					<c:if
						test="${user.role eq '7' || user.role eq '8' || user.role eq '6'|| user.role eq '4' || user.role eq '3' || user.role eq '2'}">


						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editUserProfile"><i
							class="dw dw-user1"></i> Edit Profile</a>

					</c:if>
					<c:if test="${user_data.role eq '2'}">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editUserProfile"><i
							class="dw dw-user1"></i> Edit Profile</a>
					</c:if>
					<c:if test="${user_data.role eq '3'}">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editUserProfile"><i
							class="dw dw-user1"></i> Edit Profile</a>
					</c:if>
					<a class="dropdown-item" href="change_password"><i
						class="dw dw-password"></i> Change Password</a> <a
						class="dropdown-item"
						href="${pageContext.request.contextPath}/logout"><i
						class="dw dw-logout"></i> Log Out</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	
let notifications = []; // Store notifications array

// Fetch notifications based on user ID
// Polling interval (e.g., 10 seconds)

function fetchNotifications() {
    const userId = ${user.id}; // Assuming the user ID is available
    const url = "${pageContext.request.contextPath}/notifications?id=" + userId;

    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error("Failed to fetch notifications");
            }
            return response.json();
        })
        .then(data => {
            notifications = data;
            updateNotificationCount();
            populateNotifications();
        })
        .catch(error => {
            console.error("Error fetching notifications:", error);
            document.getElementById("notificationList").innerHTML =
                "<li style='color: red;'>Failed to load notifications.</li>";
        });

    // Repeat the fetch every POLL_INTERVAL
}


function updateNotificationCount() {
    const unreadCount = notifications.filter(n => n.status === false).length;
    const badge = document.getElementById('notificationCount');
    if (unreadCount > 0) {
        badge.innerText = unreadCount;
        badge.style.display = 'inline';
    } else {
        badge.style.display = 'none';
    }
}


function populateNotifications() {
    const notificationList = document.getElementById('notificationList');
    
    if (notifications.length === 0) {
        notificationList.innerHTML = "<li>No new notifications</li>";
    } else {
        console.log("Populating Notifications"); // Log when function is called
        let notificationsHTML = '';
        notifications.forEach(n => {
            console.log("Notification:", n); // Log each notification object
            const date = new Date(n.dateTime);
            const formattedDate = date.getDate() + '-' + (date.getMonth() + 1) + '-' + date.getFullYear() + ' ' + date.getHours() + ':' + date.getMinutes();
            notificationsHTML +=
                '<li onclick="markAsRead(' + n.notifId + ')" class="' + (n.read ? '' : 'unread') + '">' +
                '<strong>' + n.title + '</strong><br>' +
                n.msgBody + '<br>' +
                '<small>' + formattedDate + '</small>' +
                '</li>';
        });
        notificationList.innerHTML = notificationsHTML;
    }
}


function markAsRead(notificationId) {
    console.log("Marking notification as read:", notificationId);
    fetch(`${pageContext.request.contextPath}/notifications/read/` + notificationId, { method: 'POST' })
        .then(response => {
            // Check if the response is JSON
            const contentType = response.headers.get("content-type");
            if (contentType && contentType.includes("application/json")) {
                return response.json();
            } else {
                return response.text(); // Handle non-JSON responses
            }
        })
        .then(data => {
            if (typeof data === "object") {
            } else {
            }

            const notification = notifications.find(n => n.notifId === notificationId);
            if (notification) {
                notification.read = true;
                updateNotificationCount();
                populateNotifications();
            }

            location.reload(); // Reload the page
        })
        .catch(error => {
            console.error("Error marking notification as read:", error);
        });
}




// Toggle notification modal visibility
function toggleNotifications() {
    const modal = document.getElementById('notificationModal');
    if (modal.style.display === 'none') {
        modal.style.display = 'block'; // Show the modal
        fetchNotifications(); 

        
      } else {
        modal.style.display = 'none'; // Hide the modal
      }    
  
}

// Fetch notifications on page load
document.addEventListener('DOMContentLoaded', () => {
    fetchNotifications(); 
});

	

	
	</script>
	
	
	<script>
function showNoteForm() {
    document.getElementById("noteFormArea").style.display = "block";
    document.getElementById("footerButtons").style.display = "flex";
    document.getElementById('addNoteBtn').style.display = 'none';
}
</script>
<script>
document.getElementById("addNoteBtn").addEventListener("click", function () {
    this.style.display = 'none'; // Hide Add Note button
    document.getElementById("noteFormArea").style.display = 'block'; // Show textarea
    document.getElementById("footerButtons").style.display = 'flex'; // Show Submit and Cancel buttons
});
</script>
<script>
function cancelNote() {
    document.getElementById('noteFormArea').style.display = 'none';
    document.getElementById('footerButtons').style.display = 'none';
    document.getElementById('addNoteBtn').style.display = 'inline-block';
    const textarea = document.querySelector('#noteFormArea textarea');
    if (textarea) textarea.value = '';
}
function toggleNoteOptions(icon) {
    const options = icon.nextElementSibling;
    options.style.display = options.style.display === 'none' ? 'block' : 'none';
}
</script>
<script>
function viewNotes() {
    const studentId = "${user.id}";
    fetch("getNotes?studentId=" + studentId)
        .then(response => {
            if (!response.ok) throw new Error("Notes not found");
            return response.json();
        })
       .then(data => {
    const notesContainer = document.getElementById("notesDisplay");
    notesContainer.innerHTML = "";
    if (data.length === 0) {
        notesContainer.innerHTML = "<p>No notes found.</p>";
    } else {
        let noteCardsHTML = "";
        data.forEach(function(note) {
        	const noteCard =
        		  '<div class="col-md-6 mb-3">' +
        		    '<div class="card border-left-info shadow-sm position-relative h-100">' +
        		      '<i class="fas fa-plus-circle text-primary" onclick="toggleNoteOptions(this)" style="position: absolute; top: 10px; right: 10px; font-size: 20px; cursor: pointer;"></i>' +
        		     
        		      // Edit/Delete options menu
        		      '<div class="note-options shadow-sm bg-white p-2 rounded" style="display:none; position:absolute; top:40px; right:10px; z-index:1000;">' +
        		        '<button class="btn btn-sm btn-warning mb-1 w-100" onclick="showEditForm(this)"><i class="fa-solid fa-pen-to-square"></i></button>' +
        		        '<button class="btn btn-sm btn-danger w-100" onclick="deleteNote(' + note.id + ')"><i class="fa-solid fa-trash"></i></button>' +
        		      '</div>' +
        		      // Note content
        		      '<div class="card-body">' +
        		        '<p class="card-text">' + note.notes + '</p>' +
        		        '<small class="text-muted">' + note.date + '</small>' +
        		      '</div>' +
        		      // Edit form (initially hidden)
        		      '<div class="edit-note-form mt-2" style="display: none;">' +
        		        '<textarea class="form-control mb-2">' + note.notes + '</textarea>' +
        		        '<button class="btn btn-sm btn-success" onclick="updateNote(this, ' + note.id + ')">Update Note</button>' +
        		      '</div>' +
        		    '</div>' +
        		  '</div>';
            noteCardsHTML += noteCard; // Append each note card to the noteCardsHTML variable
        });
        notesContainer.innerHTML = '<div class="row">' + noteCardsHTML + '</div>'; // Wrap the note cards with a row div
    }
})
        .catch(function(error) {
            console.error("Error fetching notes:", error);
            document.getElementById("notesDisplay").innerHTML = "<p>Error loading notes.</p>";
        });
}
</script>
<script>
function showEditForm(button) {
    const card = button.closest('.card');
    const editForm = card.querySelector('.edit-note-form');
    editForm.style.display = 'block';
}
function loadNotes() {
    fetch('getNotes?studentId=' + studentId)
        .then(response => response.json())
        .then(data => {
        	console.log(response.data);
            // render updated notes
        });
}
function updateNote(button, noteId) {
    const card = button.closest('.card');
    const textarea = card.querySelector('textarea');
    const updatedNote = textarea.value;
    fetch('updateStickyNote', {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            noteId: noteId,
            notes: updatedNote
        })
    })
    .then(response => response.json())
    .then(data => {
        alert("Note updated successfully!");
        viewNotes(); // function to reload notes after update
    })
    .catch(error => console.error('Error:', error));
}
function deleteNote(noteId) {
    if (confirm("Are you sure you want to delete this note?")) {
        fetch('deleteStickyNote', {
            method: 'Delete',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                noteId: noteId
            })
        })
        .then(response => response.json())
        .then(data => {
            alert("Note deleted successfully!");
            loadNotes();
        })
        .catch(error => console.error('Error:', error));
    }
}
function submitNote() {
    const noteTextarea = document.querySelector("textarea");
    const note = noteTextarea.value;
    const studentId = "${user.id}"; // Replace with actual dynamic ID
    fetch('addStickyNotes', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            notes: note,
            studentId: studentId
        })
    })
    .then(response => response.json())
    .then(data => {
        alert("Note saved successfully!");
        // Reset modal form
        noteTextarea.value = ""; // Clear textarea
        document.getElementById("noteFormArea").style.display = 'none'; // Hide textarea
        document.getElementById("footerButtons").style.display = 'none'; // Hide footer buttons
        document.getElementById("addNoteBtn").style.display = 'block'; // Show Add Note button
        // Close modal
        $('#stickyNotesModal').modal('hide');
        viewNotes();
    })
    .catch(error => console.error('Error:', error));
}
</script>
	
	