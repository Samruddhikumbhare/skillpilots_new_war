<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | Student Registration</title>

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
                            required
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
                            value="${user.email}"
                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+(\.[a-z]+){1,2}$"
                            required="true"
                            readonly="true"
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
                            readonly="true"
                            value="${user.contact_no}"
                            name="contact_no"
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
                        <label class="col-sm-4 col-form-label">Home City</label>
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

                      <br />
                    </div>
                  </section>
                  <!-- Step 3 -->
                  <h5>College Details</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Select Institute<span style="color: red"
                            >*</span
                          ></label
                        >
                        <div class="col-sm-8">
                          <select
                            name="college_id"
                            class="form-control"
                            placeholder="Country"
                            id="college"
                            maxlength="25"
                            title="${MessageConstants.address_tooltip}"
                            required="true"
                          >
                            <option selected value="-1" disabled>
                              Select an Institute
                            </option>
                            <c:forEach items="${colleges}" var="college">
                              <option value="${college.college_id}">
                                ${college.college_name}
                              </option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Select Department<span style="color: red"
                            >*</span
                          ></label
                        >
                        <div class="col-sm-8">
                          <select
                            name="dept"
                            class="form-control"
                            placeholder="Pincode"
                            id="department"
                            maxlength="6"
                            required="true"
                          >
                            <option selected value="" disabled>
                              --Select a Department--
                            </option>
                            <c:forEach
                              items="${defaultDepartments}"
                              var="department"
                            >
                              <option value="${department.deptId}"></option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label">
                          Marks %(Aggregate till now)<span style="color: red"
                            >*</span
                          >
                        </label>
                        <div class="col-sm-8">
                          <input
                            name="description"
                            id="description"
                            class="form-control contact"
                            pattern="^(100|[1-9]?[0-9](\.[0-5])?)$"
                            placeholder="Enter valid percentage or aggregate"
                            title="Enter a valid percentage (e.g., 9.5 or 95). Up to one decimal place allowed, max value 100."
                            oninput="validateAggregate()"
                            required="true"
                          />
                          <small
                            id="description_error"
                            style="color: red"
                          ></small>
                        </div>
                      </div>

                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Current Enrollment No.</label
                        >
                        <div class="col-sm-8">
                          <input
                            name="curr_enroll_no"
                            id="contact"
                            class="form-control contact"
                            placeholder="Enter Enrollment No"
                          />
                          <small id="contact2_error" style="color: red"></small>
                        </div>
                      </div>
                      <sub style="bottom: 0.75em; color: red; float: right"
                        >Note : (*) All Fields Are Mandetory</sub
                      >
                    </div>
                  </section>
                  <!-- Step 4 -->
                  <h5>Select Degree</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Current Year<span style="color: red">*</span></label
                        >
                        <div class="col-sm-8">
                          <select
                            type="text"
                            name="curr_year"
                            class="form-control firstCapital"
                            pattern="[a-zA-Z\s]{1,200}"
                            required="true"
                          >
                            <option selected="selected" disabled="disabled">
                              --Select Year--
                            </option>
                            <option value="1st Year">1st Year</option>
                            <option value="2nd Year">2nd Year</option>
                            <option value="3rd Year">3rd Year</option>
                            <option value="4th Year">4th Year</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Select Degree<span style="color: red">*</span></label
                        >
                        <div class="col-sm-8">
                          <div
                            class="custom-control custom-radio custom-control-inline pb-0"
                          >
                            <input
                              id="studentPast.category1"
                              name="category"
                              checked="true"
                              class="custom-control-input degreeRadio"
                              type="radio"
                              value="DIP"
                              required="true"
                            />
                            <label
                              class="custom-control-label"
                              for="studentPast.category1"
                              >Diploma</label
                            >
                          </div>
                          <div
                            class="custom-control custom-radio custom-control-inline pb-0"
                          >
                            <input
                              id="ug"
                              name="category"
                              class="custom-control-input degreeRadio"
                              type="radio"
                              value="UG"
                            />
                            <label class="custom-control-label" for="ug"
                              >UG</label
                            >
                          </div>
                          <div
                            class="custom-control custom-radio custom-control-inline pb-0"
                          >
                            <input
                              id="pg"
                              name="category"
                              class="custom-control-input degreeRadio"
                              type="radio"
                              value="PG"
                            />
                            <label class="custom-control-label" for="pg"
                              >PG</label
                            >
                          </div>
                          <div
                            class="custom-control custom-radio custom-control-inline pb-0"
                          >
                            <input
                              id="studentPast.category2"
                              name="category"
                              class="custom-control-input degreeRadio"
                              type="radio"
                              value="PHD"
                            />
                            <label
                              class="custom-control-label"
                              for="studentPast.category2"
                              >PHD</label
                            >
                          </div>
                        </div>
                      </div>
                      <div class="form-group row align-items-center">
                        <label class="col-sm-4 col-form-label"
                          >Board/University<span style="color: red"
                            >*</span
                          ></label
                        >
                        <div class="col-sm-8">
                          <input
                            name="board"
                            id="contact"
                            class="form-control contact"
                            required="true"
                          />
                          <label id="contact3_error" style="color: red"></label>
                        </div>
                      </div>

                      <sub style="bottom: 0.75em; color: red; float: right"
                        >Note : (*) All Fields Are Mandetory</sub
                      ><br />
                    </div>
                  </section>
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
                      <input name="role" id="radio2" type="hidden" value="0" />
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
                          <a
                            href="https://www.skillpilots.com/termsCondition"
                            class="embed-link"
                            target="_blank"
                          >
                            *Terms & Conditions</a
                          >
                          and
                          <a
                            href="https://www.skillpilots.com/privacyPolicy"
                            class="embed-link-privacy"
                            target="_blank"
                          >
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
    <script>
      $(document).ready(function () {
        $("#department").prop("disabled", true);

        // Listen for changes on the college dropdown
        $("#college").change(function () {
          var collegeId = $(this).val();

          // Check if a valid college ID is selected
          if (collegeId && collegeId !== "-1") {
            $("#department").prop("disabled", false);

            // Make AJAX call to fetch departments based on college ID
            $.ajax({
              url: "${pageContext.request.contextPath}/dept",
              type: "GET",
              data: { collegeId: collegeId },
              success: function (response) {
                var departmentDropdown = $("#department");
                departmentDropdown.empty();
                departmentDropdown.append(
                  '<option selected value="" disabled>--Select a Department--</option>'
                );

                // Populate the department dropdown with the response data
                $.each(response, function (index, department) {
                  departmentDropdown.append(
                    $("<option></option>")
                      .attr("value", department.id)
                      .text(department.deptName)
                  );
                });
              },
              error: function (xhr, status, error) {
                console.error("Error fetching departments: ", error);
              },
            });
          } else {
            // Clear the department dropdown if no valid college is selected
            $("#department")
              .prop("disable", true)
              .empty()
              .append(
                '<option selected value="" disabled>--Select a Department--</option>'
              );
          }
        });
      });
    </script>

    <script>
      function validateAggregate() {
        const inputField = document.getElementById("description");
        const errorField = document.getElementById("description_error");

        // Remove any special characters like % or non-numeric characters except .
        inputField.value = inputField.value.replace(/[^0-9.]/g, "");

        // Regular expression to match valid percentages (0-100, with optional .0 to .5)
        const pattern = /^(0|[1-9]\d*)(\.\d+)?$/;

        // Check if the sanitized input matches the pattern
        if (!pattern.test(inputField.value) && inputField.value !== "") {
          errorField.textContent = "Please enter a valid percentage ";
          return false;
        } else {
          errorField.textContent = ""; // Clear the error message if valid
          return true;
        }
      }
    </script>
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
            title: "Please wait...",
            text: "Submitting your data...",
            allowOutsideClick: false,
            didOpen: () => {
              Swal.showLoading(); // Show loading spinner
            },
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
            icon: "error",
            title: "Incomplete Form",
            text: "Please fill in all required fields for Student Details.",
          });
          return false;
        }

        // Section 2: Contact Located At
        var contact_no = document.getElementsByName("contact_no")[0].value;
        var curr_city = document.getElementsByName("curr_city")[0].value;

        if (contact_no === "" || curr_city === "") {
          Swal.fire({
            icon: "error",
            title: "Incomplete Form",
            text: "Please fill in all required fields for Contact Details.",
          });
          return false;
        }

        // Section 3: College Information
        var college_id = document.getElementsByName("college_id")[0].value;
        var dept = document.getElementsByName("dept")[0].value;
        var description = document.getElementsByName("description")[0].value;

        if (college_id === "" || dept === "" || description === "") {
          Swal.fire({
            icon: "error",
            title: "Incomplete Form",
            text: "Please fill in all required fields for College Information.",
          });
          return false;
        }

        // Section 4: Select Degree
        var curr_year = document.getElementsByName("curr_year")[0].value;
        var category = document.getElementsByName("category")[0].value;
        var board = document.getElementsByName("board")[0].value;

        if (curr_year === "" || category === "" || board === "") {
          Swal.fire({
            icon: "error",
            title: "Incomplete Form",
            text: "Please fill in all required fields for Select Degree.",
          });
          return false;
        }

        // Check if Terms and Conditions are accepted
        var termsCheckbox = document.getElementById("term_conditions");
        if (!termsCheckbox.checked) {
          Swal.fire({
            icon: "error",
            title: "Incomplete Form",
            text: "Please fill in all required fields for Terms and Conditions.",
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
      const maxDate = today.toISOString().split("T")[0];
      // Set the max attribute of the date input
      document.getElementById("datepicker").setAttribute("max", maxDate);
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </body>
</html>
