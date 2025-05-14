<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | Create Password</title>

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
      .register-page-wrap .wizard-content .wizard > .content {
        min-height: 80px;
      }

      .fade:not(.show) {
        opacity: 1;
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
              src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/register-page-img.png"
              alt=""
            />
          </div>
          <div class="col-md-6 col-lg-5">
            <div class="register-box bg-white box-shadow border-radius-10">
              <div class="wizard-content">
                <c:url var="addAction" value="/student_reg_step2"></c:url>
                <form
                  class="tab-wizard2 wizard-circle wizard"
                  action="${pageContext.request.contextPath}/verify"
                  id="myForm"
                  modelAttribute="user"
                  method="post"
                  style="margin-bottom: 0px"
                >
                  <h5>Student Registration</h5>

                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label"
                          >Email Address*</label
                        >
                        <div class="col-sm-8">
                          <input
                            type="text"
                            id="email"
                            name="email"
                            path="email_id"
                            placeholder="Enter Email iD"
                            class="form-control"
                            maxlength="255"
                            autofocus=""
                            required="required"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label"
                          >Registration Code*</label
                        >
                        <div class="col-sm-8">
                          <input
                            type="text"
                            id="reg_code"
                            name="otp"
                            class="form-control"
                            maxlength="255"
                            required="required"
                            placeholder="Enter Registration Code"
                          />
                        </div>
                      </div>
                      <div
                        class="alert  alert-dismissable "
                        id="errorBox1"
                        style="display: none"
                      >
                    
                      </div>
                    </div>
                  </section>
                  <!-- Step 2 -->
                  <h5>Change Password</h5>
                  <section>
                    <div class="form-wrap max-width-600 mx-auto">
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label"
                          >Enter Password*</label
                        >
                        <div class="col-sm-8">
                          <input
                            type="password"
                            id="pass"
                            name="Enter Password"
                            class="form-control"
                            placeholder="Password"
                            maxlength="255"
                            required="required"
                          />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="col-sm-4 col-form-label"
                          >Confirm Password*</label
                        >
                        <div class="col-sm-8">
                          <form:input
                            type="password"
                            path="psswrd_data"
                            id="cPass"
                            class="form-control"
                            placeholder="Enter Confirm Password"
                            maxlength="255"
                            required="required"
                          />
                        </div>
                      </div>
                      <div
                        class="alert alert-danger alert-dismissable fade in errorBox"
                        id="errorBox2"
                        style="display: none"
                      >
                        <a href="#" class="close" aria-label="close">&times;</a>
                        <span id="errorText2"></span>
                      </div>
                    </div>
                  </section>
                </form>
              </div>
            </div>
          </div>
          <c:if test="${not empty error}">
            <div style="    position: absolute;
            left: 60%;
            top: 64%;
            padding: 2%;
            color: red;
            " class="alert ">${error}</div>
        </c:if>
        
              <!-- //<span><a href="/">Login</a></span> -->
            </div> 
          
        </div>
      </div>
    </div>
    
    <div class="container">
     <div class="row">
        <div class="col-md-12">
            <div class="alert alert-danger bg-white border-0 alert-dismissible fade show fixed-bottom text-center mb-4" role="alert">
                If you haven't received the registration code in your inbox, please check your spam or junk folder.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    </div>
</div>
    
    <!-- success Popup html Start -->
    <!-- success Popup html End -->
    <!-- js -->
    <%@include file="scriptfiles.jsp"%>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/jquery-steps/jquery.steps1.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/steps-setting.js"></script>
    <script type="text/javascript">
      $("#Next").click(function () {
        $("#myForm").submit();
      });

      // $(".close").click(function () {
      //   $(".errorBox").hide();
      // });
    </script>
  </body>
</html>
