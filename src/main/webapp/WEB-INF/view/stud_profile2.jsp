<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | College Registration</title>

    <!-- Site favicon -->
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico"
    />

    <!-- Mobile Specific Metas -->
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1"
    />

    <!-- Google Font -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/style/dist/css/terms_and_conditions_with_privacy_policy.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <!-- CSS -->
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css"
    />

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script
      async
      src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"
    ></script>
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

      .register-page-wrap .wizard-content .wizard > .steps > ul {
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
    <div
      class="register-page-wrap d-flex align-items-center flex-wrap justify-content-center"
    >
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-6 col-lg-7">
            <img
              src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/8747.png"
              alt=""
            />
          </div>

          <div class="col-md-6 col-lg-5">
            <div class="register-box bg-white box-shadow border-radius-10">
              <div class="wizard-content">
                <form
                  action="${pageContext.request.contextPath}/setExternalOrInternal"
                  id="my_form"
                  modelAttribute="users"
                  enctype="multipart/form-data"
                  class="form-horizontal tab-wizard2 wizard-circle wizard"
                  method="post"
                  onsubmit="return validateForm()"
                >
                  <h5>Student Details</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Full Name<span style="color: red">*</span></label
                        >
                        <div class="col-sm-8">
                          <input
                            name="username"
                            class="form-control firstCapital"
                            maxlength="200"
                            required="true"
                            placeholder="Full Name"
                            title="Complete name of the Institute (to maintain its uniqueness)"
                          />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">
                          Date Of Birth<span style="color: red">*</span></label
                        >
                        <div class="col-sm-8">
                          <input
                          type="date"
                            name="dob"
                            class="form-control date_OB"
                            id="datepicker"
                            placeholder="Date of Birth"
                          
                          />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Gender<span style="color: red">*</span></label
                        >
                        <div class="col-sm-8">
                          <Select
                            name="gender"
                            class="form-control"
                            maxlength="30"
                            placeholder="Institute Website"
                            title="www.example.com"
                          >
                            <option selected value="" disabled="disabled">
                              --Select Gender--
                            </option>
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                          </Select>
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Email-Id<span style="color: red">*</span></label
                        >
                        <div class="col-sm-8">
                          <input
                            name="email"
                            id="mail_id"
                            class="form-control"
                            readonly="true"
                            value="${user.email}"
                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+(\.[a-z]+){1,2}$"
                            required="true"
                            maxlength="50"
                            placeholder=" Email-Id"
                          />
                          <label id="maillabel" style="color: red"></label>
                        </div>
                      </div>
                      <sub style="bottom: 0.75em; color: red; float: right"
                        >Note : (*) All Fields Are Mandetory</sub
                      >
                    </div>
                  </section>
                  <!-- Step 2 -->
                  <h5>Contact Details</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Contact Number<span style="color: red"
                            >*</span
                          ></label
                        >
                        <div class="col-sm-8">
                          <input
                            value="${user.contact_no}"
                            name="contact_no"
                            readonly="true"
                            placeholder="Contact Number"
                            class="form-control"
                            id="street_number"
                            maxlength="100"
                          />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Current City<span style="color: red">*</span></label
                        >
                        <div class="col-sm-8">
                          <input
                            name="curr_city"
                            placeholder="Current City"
                            class="form-control"
                            id="route"
                            maxlength="30"
                          />
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Home City</label
                        >
                        <div class="col-sm-8">
                          <input
                            name="home_city"
                            class="form-control"
                            title="Please select the city first in the given area."
                            placeholder="City"
                            id="locality"
                            maxlength="25"
                          />
                        </div>
                      </div>
                            <div class="form-group row align-items-center">
    <label class="col-sm-4 col-form-label">Skills</label>
    <div class="col-sm-8">
        <select name="skills" class="form-control" id="skills" multiple>
            <c:forEach var="tech" items="${technology}">
                <option value="${tech.technology_name}">${tech.technology_name}</option>
            </c:forEach>
        </select>
    </div>
</div>

                      <sub style="bottom: 0.75em; color: red; float: right"
                        >Note : (*) All Fields Are Mandetory</sub
                      ><br />
                    </div>
                  </section>
                  <!-- Step 3 -->

                  <h5>Terms & Conditions</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <!-- <div class="form-group row align-items-center">
                        <div class="col-sm-12 row">
                          <div class="col-sm-10">
                            <input
                              type="file"
                              name="collegelogo"
                              id="upload-photo"
                              accept="image/*"
                              class="form-control-file form-control height-auto"
                            />
                            <small
                              >Upload Institute's Logo Here<span
                                style="color: red"
                                >*</span
                              ></small
                            >
                          </div>
                        </div>
                      </div> -->
                      <div class="col-sm-12 row">
                        <div class="col-sm-5">
                          <!-- Placeholder for profile image -->
                        </div>
                        <div class="col-sm-1"></div>
                        <div class="col-sm-5">
                          <!-- <img
                            id="sign-upload"
                            src="<c:url value='/images/blank_profile.jpg' />"
                          /> -->
                        </div>
                      </div>
                      <input name="role" id="radio2" type="hidden" value="10" />
                      <br />
                      <div class="custom-control custom-checkbox">
                        <span
                          style="margin-left: 6px; font-size: 14px"
                          id="terms_conditions"
                          data-toggle="tooltip"
                          data-placement="top"
                          title="Please go through the T&C's and Privacy Policy and accept the same."
                        >
                          <input
                            type="checkbox"
                            id="term_conditions"
                            style="margin-top: 2px; vertical-align: top"
                          />
                          I accept
                          <a href="https://www.skillpilots.com/termsCondition" target="_blank" class="embed-link">
                            *Terms and Conditions</a
                          >
                          and
                          <a href="https://www.skillpilots.com/privacyPolicy" class="embed-link-privacy" target="_blank">
                            *Privacy Policy</a
                          > </span
                        ><br />
                        <span style="margin-left: 6px; font-size: 14px">
                          <input
                            type="checkbox"
                            name="subscribe"
                            checked="true"
                            style="margin-top: 2px; vertical-align: top"
                          />
                          Subscribe to SkillPilots newsletters
                        </span>
                      </div>
                    </div>
                    <input hidden type="submit" value="Submit" id="sub" />
                  </section>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@include file="terms_and_conditions_with_privacy_policy.jsp" %> <%@include
    file="scriptfiles.jsp" %>
    <script
      type="text/javascript"
      src="${pageContext.request.contextPath}/style/dist/js/myjs/registration_utility1.js"
    ></script>
    <script
      type="text/javascript"
      src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/pdfobject.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/terms_and_condition_with_privacy_policy.js"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUlCQ6MBRc_JIpz68S5-7prwYjevo1s1M&libraries=places&callback=initAutocomplete"
      async
      defer
    ></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/geolocation.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps.js"></script>
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
      $("#Submit").click(function (e) {
  e.preventDefault(); // Prevent default form submission

  // Run the validation function
  if (validateForm()) {
    // Show loading spinner with SweetAlert2
    Swal.fire({
      title: 'Please wait...',
      text: 'Submitting your data...',
      allowOutsideClick: false,
      didOpen: () => {
        Swal.showLoading(); // Show loading spinner
      }
    });

    // Trigger the submit button to perform form submission
    setTimeout(() => {
      $("#sub").click(); // Programmatically click the submit button
    }, 500); // Optional delay to let the loading alert appear smoothly
  }
});

      function checkExists(inputElement) {
        var email = inputElement.value;
        checkEmail(email, function (exists) {
          if (exists) {
            alert("Email already exists!"); // Show an alert if the email exists
            inputElement.value = "";
          }
        });
      }
    </script>
  <script>
    
function validateForm() {
  // Section 1: Student Details
  var username = document.getElementsByName("username")[0].value;
  var dob = document.getElementsByName("dob")[0].value;
  var email = document.getElementsByName("email")[0].value;
  var gender = document.getElementsByName("gender")[0].value;

  if (username === "" || dob === "" || email === "" || gender === "") {
    Swal.fire({
      icon: 'error',
      title: 'Incomplete Form',
      text: 'Please fill in all required fields for Student Details.',
    });
    return false;
  }

  // Section 2: Contact Details
  var contact_no = document.getElementsByName("contact_no")[0].value;
  var curr_city = document.getElementsByName("curr_city")[0].value;

  if (contact_no === "" || curr_city === "") {
    Swal.fire({
      icon: 'error',
      title: 'Incomplete Form',
      text: 'Please fill in all required fields for Contact Details.',
    });
    return false;
  }

  // Section 3: Terms & Conditions
  var termsCheckbox = document.getElementById('term_conditions');
  if (!termsCheckbox.checked) {
    Swal.fire({
      icon: 'error',
      title: 'Incomplete Form',
      text: 'Please accept the Terms and Conditions.',
    });
    return false;
  }

  // If all validations pass, allow form submission
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </body>
</html>
