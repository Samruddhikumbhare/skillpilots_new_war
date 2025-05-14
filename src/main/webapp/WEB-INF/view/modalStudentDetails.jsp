<!-- FontAwesome + Bootstrap 4 -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--  --><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
 -->
<style>
    .modal-content {
        border-radius: 18px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        animation: fadeIn 0.4s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .profile-header {
        background: linear-gradient(45deg, #6a11cb, #2575fc);
        color: white;
        border-top-left-radius: 18px;
        border-top-right-radius: 18px;
        padding: 20px;
        position: relative;
    }

    .profile-header .close {
        color: white;
        opacity: 1;
        position: absolute;
        right: 20px;
        top: 20px;
        font-size: 1.5rem;
    }

    .profile-avatar {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
        border: 3px solid white;
        margin-top: -70px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    .profile-info p {
        margin-bottom: 6px;
    }

    .profile-btn {
        font-size: 0.9rem;
        padding: 6px 12px;
        margin-left: 10px;
    }

    .section-divider {
        border-top: 1px dashed #ccc;
        margin: 1rem 0;
    }
</style>

<!-- Modal HTML -->
<div class="modal fade" id="studentDetailsModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">

      <!-- Header -->
      <div class="profile-header bg-light p-3 d-flex justify-content-between align-items-center">
        <h4 class="mb-0 mx-auto">Aspirant Profile</h4>
        <button type="button" class="close ml-auto" data-dismiss="modal">&times;</button>
      </div>

      <!-- Body -->
      <div class="modal-body px-4 py-3">
        <div class="row align-items-center">
          
          <!-- Profile Left -->
          <div class="col-md-4 text-center mb-3 mb-md-0">
            <img id="studentPic" src="" alt="Profile" class="profile-avatar mb-2" style="width: 130px; height: 130px; border-radius: 50%; object-fit: cover;">
            <h5 id="name" class="font-weight-bold text-capitalize mt-2"></h5>

            <div id="linkedinSection" class="mt-3" style="display: none;">
              <a id="linkedinLink" href="#" target="_blank" class="btn btn-outline-primary btn-sm">
                <i class="fab fa-linkedin"></i> LinkedIn
              </a>
            </div>

            <div id="resumeSection" class="mt-2" style="display: none;">
              <a id="resumeLink" href="#" target="_blank" class="btn btn-outline-primary btn-sm">
                <i class="fas fa-file-pdf"></i> View Resume
              </a>
            </div>
          </div>

          <!-- Info Right -->
          <div class="col-md-8">
            <p><i class="fas fa-envelope mr-2 text-muted"></i><span id="email"></span></p>
            <p><i class="fas fa-phone mr-2 text-muted"></i><span id="contact"></span></p>
            <p><i class="fas fa-calendar-alt mr-2 text-muted"></i>DOB: <span id="dob"></span></p>
            <p><i class="fas fa-map-marker-alt mr-2 text-muted"></i>Current: <span id="curr_city"></span> | Home: <span id="home_city"></span></p>

            <hr>

            <p><strong>Skills:</strong> <span id="skills"></span></p>
            <p><strong>Interest:</strong> <span id="interest"></span></p>
            <p><strong>Achievements:</strong> <span id="achievements"></span></p>

            <!-- Live Project Section -->
            <div id="projectSection" style="display: none;" class="mt-4">
              <h5 class="fw-bold text-dark mb-2">Latest Project</h5>
              <p class="mb-1"><strong>Title:</strong> <span id="projectTitle"></span></p>
              <p><strong>Description:</strong></p>
              <p id="projectDescription" class="text-muted mb-1"></p>
              <p><strong>Created On:</strong> <span id="projectDate" class="text-secondary"></span></p>
              <a id="projectGithub" href="#" target="_blank" class="btn btn-outline-dark btn-sm mt-2">
                <i class="fab fa-github"></i> View on GitHub
              </a>
              <a id="projectFile" href="#" target="_blank" class="btn btn-outline-primary btn-sm mt-2" style="display: none;">
  <i class="fas fa-file-pdf"></i> View Project File
</a>
              
            </div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-dark btn-block mx-4" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>




<script>

function closeModal() 
{
	
	
    $("#studentDetailsModal").modal("hide");
    //$("body").removeClass("modal-open"); // Removes body overlay
   // $(".modal-backdrop").remove(); // Removes the backdrop preventing clicks

    
}
</script>
