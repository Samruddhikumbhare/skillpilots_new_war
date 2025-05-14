<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>

  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | College Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet" />

    <!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="16x16"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon-16x16.png" />

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <!-- Google Font -->
    <link rel="stylesheet"
      href="${pageContext.request.contextPath}/style/dist/css/terms_and_conditions_with_privacy_policy.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
      rel="stylesheet" />
    <!-- CSS -->
    <link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css" />
    <link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css" />
    <link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.css" />
    <link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css" />

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag() {
        dataLayer.push(arguments);
      }
      gtag("js", new Date());

      gtag("config", "UA-119386393-1");
    </script>
    <style type="text/css">
      .custom-control-input {
        position: absolute;
        left: 0px;
        z-index: 0;
        width: 2rem;
        height: 2.25rem;
        opacity: 0;
      }

      .register-page-wrap .wizard-content .wizard>.steps>ul {
        flex-wrap: initial !important;
      }

      .custom-file {
        text-align: end;
        width: 117%;
        margin-top: 10px;
      }

      .register-page-wrap .register-box {
        max-width: fit-content;
      }

      input[type="number"]::-webkit-outer-spin-button,
      input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
      }

      input[type="number"] {
        -moz-appearance: textfield;
        /* Firefox */
      }
    </style>
  </head>

  <body class="login-page">
    <div class="login-header box-shadow">
      <div class="container-fluid d-flex justify-content-between align-items-center">
        <div class="brand-logo" style="width: 12%">
          <a href="${pageContext.request.contextPath}/login_check">
            <img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg" alt="" />
          </a>
        </div>
      </div>
    </div>
    <div class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-6 col-lg-7">
            <img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/8747.png" alt="" />
          </div>

          <div class="col-md-6 col-lg-5">
            <div class="register-box bg-white box-shadow border-radius-10">
              <div class="wizard-content">
                <form action="college_registration" id="my_form" modelAttribute="college" enctype="multipart/form-data"
                  class="form-horizontal tab-wizard2 wizard-circle wizard" method="post"
                  onsubmit="return validateForm()">
                  <h5>College Details</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Institute Name<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input name="college_name" class="form-control firstCapital" maxlength="200" required="true"
                            placeholder="Name of the Institute"
                            title="Complete name of the Institute (to maintain its uniqueness)" />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Established Date<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input type="date" name="estd_date" class="form-control date_OB " id="datepicker"
                            placeholder="Date of establishment" />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Web URL<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input name="web_url" class="form-control" maxlength="30" placeholder="Institute Website"
                            title="www.example.com" />
                        </div>
                      </div>
                     <div class="form-group row align-items-center">
    <label class="col-sm-4 col-form-label">Email-Id<span style="color: red">*</span></label>
    <div class="col-sm-8">
        <input 
            name="email_id" 
            id="mail_id" 
            class="form-control" 
            onchange="checkExists(this);"
            onblur="validateEmail(this, 'maillabel')" 
        
            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+(\.[a-z]{2,})$" 
            required 
            maxlength="50" 
            placeholder="Institute Email-Id" />
        <label id="maillabel" style="color: red"></label>
    </div>
</div>

                      <div class="form-group row align-items-center">
    <label class="col-sm-4 col-form-label">About<span style="color: red">*</span></label>
    <div class="col-sm-8">
        <textarea name="about" class="form-control" maxlength="5000" 
            rows="3" 
            style="resize: none; height:80px; overflow-y: scroll;"
            placeholder="About company..."></textarea>
    </div>
</div>
                      
                      <sub style="bottom: 0.75em; color: red; float: right">Note : (*) All Fields Are Mandetory</sub>
                    </div>
                  </section>
                  <!-- Step 2 -->
                  <h5>College Located At</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Address (Line-1)<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input name="line_1" class="form-control" placeholder="Address line 1 " id="street_number"
                            maxlength="100" title="${MessageConstants.address_tooltip}" />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Address (Line-2)<span style=""></span></label>
                        <div class="col-sm-8">
                          <input name="line_2" class="form-control" id="route" placeholder="Address line 2"
                            maxlength="100" title="${MessageConstants.address_tooltip}" />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">City<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input name="city" class="form-control" onFocus="geolocate()"
                            title="Please select the city first in the given area." placeholder="City" id="locality"
                            maxlength="25" />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">State<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input name="state" class="form-control" placeholder="State" id="administrative_area_level_1"
                            maxlength="25" title="${MessageConstants.address_tooltip}" />
                        </div>
                      </div>
                      <sub style="bottom: 0.75em; color: red; float: right">Note : (*) All Fields Are
                        Mandetory</sub><br />
                    </div>
                  </section>
                  <!-- Step 3 -->
                  <h5>Contact Details</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Country<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input name="country" class="form-control" placeholder="Country" id="country" maxlength="25"
                            title="${MessageConstants.address_tooltip}" />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Pincode<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input type="number" name="pincode" class="form-control" pattern="[0-9]{6}"
                            title="${MessageConstants.address_tooltip}" placeholder="Pincode" id="postal_code"
                            maxlength="6" required="true" />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Contact #1 <span style="color: red">*</span> </label>
                        <div class="col-sm-8">
                          <input type="text" name="contact_1" id="contact" class="form-control"
                            placeholder="Contact #1" maxlength="12" pattern="\d{10}"
                            title="Please enter exactly 10 digits" required="true"
                            oninput="validateContactNum(this, 'contact1_error')" />
                          <small id="contact1_error" style="color: red;"></small>


                        </div>
                      </div>

                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Contact #2</label>
                        <div class="col-sm-8">
                          <input type="text" name="contact_2" id="contact" placeholder="Contact #2"
                            class="form-control contact" maxlength="10" pattern="\d{10}"
                            oninput="validateContactNum(this, 'contact2_error')"  maxLength=12  />
                          <small id="contact2_error" style="color: red;"></small>
                        </div>
                      </div>
                      <sub style="bottom: 0.75em; color: red; float: right">Note : (*) All Fields Are Mandetory</sub>
                    </div>
                  </section>
                  <!-- Step 4 -->
                  <h5>III Cell / T&P Head Details</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Name<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input type="text" name="username" class="form-control firstCapital" placeholder="User's Name"
                            pattern="[a-zA-Z\s]{1,200}" />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Email-Id<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input type="text" name="uemail" id="mail_id2" onchange="checkExists(this)"
                            placeholder="Email Id" class="form-control"  onblur="validateEmail(this, 'maillabel2')" 
                            oninput="validateEmails();"
                            class="form-control" required="true" />
                          <label id="maillabel2" style="color: red"></label>
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Contact Number<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <input  type="text" name="ucontact" id="contact" placeholder="Contact No" class="form-control contact"
      oninput="validateContactNum(this, 'contact3_error')" maxLength=12 />
                          <small id="contact3_error" style="color: red;"></small>
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">Gender<span style="color: red">*</span></label>
                        <div class="col-sm-8">
                          <select name="ugender" class="form-control" style="padding: 0px !important; cursor: pointer"
                            required="true">
                            <option selected value="" disabled="disabled">
                              --Select Gender--
                            </option>
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                          </select>
                        </div>
                      </div>

                      <sub style="bottom: 0.75em; color: red; float: right">Note : (*) All Fields Are
                        Mandetory</sub><br />
                    </div>
                  </section>
                  <h5>Upload Logo</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <div class="col-sm-12 row">
                          <div class="col-sm-10">
                            <input type="file" name="collegelogo" id="upload-photo" accept="image/*"
                              class="form-control-file form-control height-auto" />
                            <small>Upload Institute's Logo Here</small>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-12 row">
                        <div class="col-sm-5">
                          <!-- Placeholder for profile image -->
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-5">
                          <img id="sign-upload"
                            src="https://i0.wp.com/vssmn.org/wp-content/uploads/2018/12/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png?fit=860%2C681&ssl=1' />" />
                        </div>
                      </div>

                      <br />
                      <div class="custom-control custom-checkbox">
                        <span style="margin-left: 6px; font-size: 14px" id="terms_conditions" data-toggle="tooltip"
                          data-placement="top"
                          title="Please go through the T&C's and Privacy Policy and accept the same.">
                          <input type="checkbox" id="term_conditions" style="margin-top: 2px; vertical-align: top" />
                          I accept
                          <a href="https://www.skillpilots.com/termsCondition" class="embed-link" target="_blank">
                            *Terms and Conditions</a>
                          and
                          <a href="https://www.skillpilots.com/privacyPolicy" class="embed-link-privacy" target="_blank">
                            *Privacy Policy</a> </span><br />
                        <span style="margin-left: 6px; font-size: 14px">
                          <input type="checkbox" name="subscribe" checked="true"
                            style="margin-top: 2px; vertical-align: top" />
                          Subscribe to SkillPilots newsletters
                        </span>
                      </div>
                    </div>
                  </section>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="terms_and_conditions_with_privacy_policy.jsp" %>
      <%@include file="scriptfiles.jsp" %>

        <script type="text/javascript"
          src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility.js"></script>

        <script type="text/javascript"
          src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility1.js"></script>
        <script type="text/javascript"
          src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
        <script src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>
        <script src="${pageContext.request.contextPath}/style/dist/pdfobject.min.js"></script>
        <script
          src="${pageContext.request.contextPath}/style/dist/js/myjs/terms_and_condition_with_privacy_policy.js"></script>
        <script
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUlCQ6MBRc_JIpz68S5-7prwYjevo1s1M&libraries=places&callback=initAutocomplete"
          async defer></script>
        <script src="${pageContext.request.contextPath}/style/dist/js/myjs/geolocation.js"></script>
        <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
        <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
        <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
        <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
        <script
          src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.js"></script>
        <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/steps-setting.js"></script>
        <script type="text/javascript">
          $(document).ready(function () {
            $(document).on("change", ".btn-file :file", function () {
              var input = $(this),
                label = input.val().replace(/\\/g, "/").replace(/.*\//, "");
              input.trigger("fileselect", [label]);
            });

            $(".btn-file :file").on("fileselect", function (event, label) {
              var input = $(this).parents(".input-group").find(":text"),
                log = label;

              if (input.length) {
                input.val(log);
              } else {
                if (log) alert(log);
              }
            });
            function readURL(input) {
              if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                  $("#profile-upload").attr("src", e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
              }
            }

            $("#upload-photo").change(function () {
              readURL(this);
            });
          });
          $(document).ready(function () {
            $("#Submit").click(function (e) {
              e.preventDefault(); // Prevent form submission before validation
              if (!$("#term_conditions").prop("checked")) {
                Swal.fire({
                  icon: "warning",
                  title: "Terms and Conditions Required",
                  text: "Please accept the Terms and Conditions to proceed.",
                });
                return false; // Prevent form submission
              }
              if (validateForm()) {
                Swal.fire({
                  title: "Please wait...",
                  text: "Submitting your data...",
                  allowOutsideClick: false, // Prevent clicking outside to close the alert
                  didOpen: () => {
                    Swal.showLoading(); // Show loading spinner
                    $("#my_form").submit(); // Submit the form after showing the spinner
                  },
                });
                // Simulate delay for form submission
				setTimeout(function () {
					Swal.close();  // Close the loading spinner
					Swal.fire({
						icon: 'success',
						title: 'Registration successful!',
						text: 'You will be redirected shortly.',
						showConfirmButton: false,
						allowOutsideClick: false,
						didOpen: () => {
							Swal.showLoading();  // Show loading spinner
						}
					});

					// Submit the form programmatically after success message
					
				}, 2000); 
              }
             
            });
          });

          function checkExists(inputElement) {
        	    var email = inputElement.value;

        	    // Simulate email check
        	    checkEmail(email, function (exists) {
        	        if (exists) {
        	            // Use SweetAlert to display a user-friendly alert
        	            Swal.fire({
        	                icon: 'warning',
        	                title: 'Email Already Exists!',
        	                text: 'Please use a different email address.',
        	                confirmButtonText: 'OK',
        	                confirmButtonColor: '#3085d6'
        	            }).then(() => {
        	                // Clear the input field after the alert
        	                inputElement.value = "";
        	            });
        	        }
        	    });
        	}

        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
          function validateForm() {
            // Section 1: College Details
            var collegeName = document.getElementsByName("college_name")[0].value;
            var estdDate = document.getElementsByName("estd_date")[0].value;
            var webUrl = document.getElementsByName("web_url")[0].value;
            var emailId = document.getElementsByName("email_id")[0].value;

            if (
              collegeName === "" ||
              estdDate === "" ||
              webUrl === "" ||
              emailId === ""
            ) {
              Swal.fire({
                icon: "warning",
                title: "Incomplete Form",
                text: "Please fill in all required fields in College Details.",
              });
              return false;
            }

            // Section 2: College Located At
            var line1 = document.getElementsByName("line_1")[0].value;
            var line2 = document.getElementsByName("line_2")[0].value;
            var city = document.getElementsByName("city")[0].value;
            var state = document.getElementsByName("state")[0].value;

            if (line1 === "" || city === "" || state === "") {
              Swal.fire({
                icon: "warning",
                title: "Incomplete Form",
                text: "Please fill in all required fields in College Location.",
              });
              return false;
            }

            // Section 3: Contact Details
            var country = document.getElementsByName("country")[0].value;
            var pincode = document.getElementsByName("pincode")[0].value;
            var contact1 = document.getElementsByName("contact_1")[0].value;

            if (country === "" || pincode === "" || contact1 === "") {
              Swal.fire({
                icon: "warning",
                title: "Incomplete Form",
                text: "Please fill in all required fields in Contact Details.",
              });
              return false;
            }

            // Section 4: III Cell / T&P Head Details
            var username = document.getElementsByName("username")[0].value;
            var uemail = document.getElementsByName("uemail")[0].value;
            var ucontact = document.getElementsByName("ucontact")[0].value;
            var ugender = document.getElementsByName("ugender")[0].value;

            if (
              username === "" ||
              uemail === "" ||
              ucontact === "" ||
              ugender === ""
            ) {
              Swal.fire({
                icon: "warning",
                title: "Incomplete Form",
                text: "Please fill in all required fields for III Cell / T&P Head Details.",
              });
              return false;
            }

            // If all required fields are filled, return true to allow form submission
            return true;
          }
        </script>

        <script>
          // Get the current date and format it as yyyy-mm-dd
          const today = new Date();
          const maxDate = today.toISOString().split('T')[0];
          // Set the max attribute of the date input
          document.getElementById('datepicker').setAttribute('max', maxDate);
        </script>

<script>
function validateContactNum(input, errorId) {
    var value = input.value;
    var errorElement = document.getElementById(errorId);

    // Remove non-numeric characters
    value = value.replace(/[^0-9]/g, "");

    // Update the input value without non-numeric characters
    input.value = value;

    // Check if the input is empty
    if (value.trim() === "") {
        errorElement.textContent = " - Not applicable"; // Display 'Not applicable' if input is empty
    }
    // Check if the input is 10, 11, or 12 digits
    else if (!/^\d{10,12}$/.test(value)) {
        errorElement.textContent = "Please enter exactly 10, 11, or 12 digits"; // Display message for invalid length
    } else {
        errorElement.textContent = ""; // Clear error if input is valid
    }
}
function validateEmail(input, errorId) {
    var value = input.value;
    var errorElement = document.getElementById(errorId);

    // Regex for email validation
    var emailPattern = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;

    if (value.trim() === "") {
        errorElement.textContent = "Email is required."; // Message for empty input
    } else if (!emailPattern.test(value)) {
        errorElement.textContent = "Invalid email format. Example: example@domain.com"; // Invalid format
    } else {
        errorElement.textContent = ""; // Clear error if valid
    }
}


</script>


        <script>
          function validateContact(input, errorElementId, minLength, maxLength) {
            var contact = input.value;
            var error = document.getElementById(errorElementId);
            var nextButton = document.getElementById('nextButton'); // Assuming there is a Next button

            // Remove any non-numeric characters and enforce max length
            contact = contact.replace(/\D/g, '').slice(0, maxLength);
            input.value = contact; // Update the input with sanitized value

            if (contact.length < minLength) {

            } else if (contact.length > maxLength) {
              error.innerText = `Contact cannot exceed ${maxLength} Number.`;
              if (nextButton) nextButton.disabled = true;
            } else {
              error.innerText = "";
              if (nextButton) nextButton.disabled = false;
            }
          }
        </script>


<script>
	function validateEmails() {
	  const email1 = document.querySelector('input[name="email_id"]').value;
	  const email2 = document.querySelector('input[name="uemail"]').value;
  
	  if (email1 && email2 && email1 === email2) {
		Swal.fire({
		  icon: "warning",
		  title: "Validation Error",
		  text: "TPO Email ID and College Email ID cannot be the same!",
		}).then(() => {
		  document.querySelector('input[name="uemail"]').value = "";
		});
	  }
	}
  </script>


  </body>

  </html>