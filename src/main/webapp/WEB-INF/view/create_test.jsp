<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@include file="user_session.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | Live Chat</title>

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
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css"
    />
    <link
      href="${pageContext.request.contextPath}/style/dist/css/live_chat.css"
      rel="stylesheet"
      type="text/css"
    />
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script
      async
      src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"
    ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag() {
        dataLayer.push(arguments);
      }
      gtag("js", new Date());

      gtag("config", "UA-119386393-1");
    </script>
    <style type="text/css">
      .parameter {
        padding: 0;
      }

      /* Container for all messages */
      .main-container {
        width: 100%;
        padding: 20px;
        max-width: 900px;
        margin: 0 auto;
      }

      .test-form {
        background-color: #f4f4f4;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
      }

      .form-title {
        text-align: center;
        font-size: 24px;
        margin-bottom: 20px;
        color: #333;
      }

      .form-group-horizontal {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
      }

      .field {
        flex: 1;
        margin-right: 15px;
      }

      .field:last-child {
        margin-right: 0;
      }

      .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
      }

      .form-group input,
      .form-group select,
      .form-group textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        color: #333;
      }

      .form-group input:focus,
      .form-group select:focus,
      .form-group textarea:focus {
        border-color: #007bff;
        outline: none;
      }

      .submit-btn {
        display: block;
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: bold;
        color: white;
        background-color: #007bff;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      .submit-btn:hover {
        background-color: #0056b3;
      }
    </style>
  </head>

  <body>
    <div class="pre-loader">
      <div class="pre-loader-box">
        <div class="loader-logo">
          <img
            src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
            alt=""
          />
        </div>
        <div class="loader-progress" id="progress_div">
          <div class="bar" id="bar1"></div>
        </div>
        <div class="percent" id="percent1">0%</div>
        <div class="loading-text">Loading...</div>
      </div>
    </div>
    <%@include file="stylesheets.jsp" %> <%@include file="header.jsp" %>

    <div class="right-sidebar">
      <div class="sidebar-title">
        <h3 class="weight-600 font-16 text-blue">
          Layout Settings
          <span class="btn-block font-weight-400 font-12"
            >User Interface Settings</span
          >
        </h3>
        <div class="close-sidebar" data-toggle="right-sidebar-close">
          <i class="icon-copy ion-close-round"></i>
        </div>
      </div>
      <div class="right-sidebar-body customscroll">
        <div class="right-sidebar-body-content">
          <h4 class="weight-600 font-18 pb-10">Header Background</h4>
          <div class="sidebar-btn-group pb-30 mb-10">
            <a
              href="javascript:void(0);"
              class="btn btn-outline-primary header-white"
              >White</a
            >
            <a
              href="javascript:void(0);"
              class="btn btn-outline-primary header-dark active"
              >Dark</a
            >
          </div>

          <h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
          <div class="sidebar-btn-group pb-30 mb-10">
            <a
              href="javascript:void(0);"
              class="btn btn-outline-primary sidebar-light"
              >White</a
            >
            <a
              href="javascript:void(0);"
              class="btn btn-outline-primary sidebar-dark active"
              >Dark</a
            >
          </div>

          <div class="reset-options pt-30 text-center">
            <button class="btn btn-danger" id="reset-settings">
              Reset Settings
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="left-side-bar">
      <div class="brand-logo">
        <a href="javascript:;">
          <img
            src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
            alt=""
            class="dark-logo"
          />
          <img
            src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg"
            alt=""
            class="light-logo"
          />
        </a>
        <div class="close-sidebar" data-toggle="left-sidebar-close">
          <i class="ion-close-round"></i>
        </div>
      </div>
      <%@include file="sidebar.jsp" %>
    </div>

    <!-- Main container -->
    <div
      class="main-container"
      style="background-color: white; margin-top: 100px; margin-left: 500px"
    >
      <!-- Button to trigger modal -->
      <button
        type="button"
        class="submit-btn"
        id="addFormBtn"
        data-toggle="modal"
        data-target="#exampleModal"
        style="left: 50px"
      >
        Add Form
      </button>

      <!-- Modal structure -->
      <div
        class="modal fade"
        id="exampleModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <!-- Modal header -->
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Test Form</h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>

            <!-- Modal body containing the form -->
            <div class="modal-body">
              <form
                id="testForm"
                action="#"
                method="post"
                style="background-color: white"
              >
                <div class="form-group-horizontal">
                  <div class="form-group">
                    <label class="form-control" for="testName"
                      >Test Name:</label
                    >
                    <input
                      class="form-control"
                      type="text"
                      id="testName"
                      name="testName"
                      required
                      placeholder="Enter test name"
                    />
                  </div>
                </div>

                <div class="form-group-horizontal">
                  <div class="field">
                    <label for="totalMark">Total Marks:</label>
                    <input
                      class="form-control"
                      type="number"
                      id="totalMark"
                      name="total_mark"
                      required
                      placeholder="Enter total marks"
                    />
                  </div>

                  <div class="field">
                    <label for="totalQue">Total Questions:</label>
                    <input
                      class="form-control"
                      type="number"
                      id="totalQue"
                      name="total_que"
                      required
                      placeholder="Enter total questions"
                    />
                  </div>
                </div>

                <div class="form-group-horizontal">
                  <div class="field">
                    <label for="time">Time (in minutes):</label>
                    <input
                      class="form-control"
                      type="number"
                      id="time"
                      name="time"
                      required
                      placeholder="Enter time duration"
                    />
                  </div>

                  <div class="field">
                    <label for="cutOff">Cut Off:</label>
                    <input
                      class="form-control"
                      type="number"
                      id="cutOff"
                      name="cut_off"
                      required
                      placeholder="Enter cut off"
                    />
                  </div>
                </div>

                <div class="form-group-horizontal">
                  <div class="field">
                    <label for="marksPerQue">Marks per Question:</label>
                    <input
                      class="form-control"
                      type="number"
                      id="marksPerQue"
                      name="mark_per_que"
                      required
                      placeholder="Enter marks per question"
                    />
                  </div>
                </div>

                <button type="submit" class="submit-btn">Submit</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Add JavaScript to toggle the form visibility -->
    <script>
      // Get the button and form elements
      const addFormBtn = document.getElementById("addFormBtn");
      const testForm = document.getElementById("testForm");

      // Add event listener to the "Add Form" button
      addFormBtn.addEventListener("click", function () {
        // Toggle the visibility of the form
        if (
          testForm.style.display === "none" ||
          testForm.style.display === ""
        ) {
          testForm.style.display = "block";
        } else {
          testForm.style.display = "none";
        }
      });
    </script>

    <!-- <%@include file="modal_common.jsp"%> -->
    <div
      class="footer-wrap pd-20 mb-20 card-box"
      style="position: fixed; bottom: 0%; width: 77%"
    >
      <i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
      <script>
        document.write(new Date().getFullYear());
      </script>
      All Rights Reserved SkillPilots &reg; | Designed & Developed By
      <a
        href="https://www.cluematrix.com/"
        target="_blank"
        style="color: #2800b4"
        >Cluematrix</a
      >
      Technologies Pvt.Ltd.
    </div>

    <!-- js -->
    <%@include file="scriptfiles.jsp" %>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />

    <!-- Bootstrap JS and dependencies (jQuery and Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
  </body>
</html>
