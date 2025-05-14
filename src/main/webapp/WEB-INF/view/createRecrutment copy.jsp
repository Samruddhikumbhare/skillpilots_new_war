<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | Internship Advertisements</title>

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
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
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
      href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css"
    />
    "
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.14/css/bootstrap-multiselect.css"
      integrity="sha512-EvvoSMXERW4Pe9LjDN9XDzHd66p8Z49gcrB7LCUplh0GcEHiV816gXGwIhir6PJiwl0ew8GFM2QaIg2TW02B9A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
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
      .sidebar-menu .dropdown-toggle {
        padding: 15px 12px 15px 54px !important;
        font-size: 15px !important;
      }

      .user-notification .dropdown-toggle .badge {
        position: absolute;
        right: 5px;
        top: 7px;
        /* background: #0f2c7eeb; */
        width: 5px;
        height: 5px;
        display: block;
        padding: 0;
      }

      .notification-list ul li a {
        display: block;
        position: relative;
        padding: 0px 15px 1px 7px !important;
        min-height: 75px;
        color: #666;
        font-size: 13px;
        font-weight: 500;
        font-family: "Inter", sans-serif;
        border-radius: 1px;
      }

      .dataTable {
        white-space: nowrap;
      }

      .datepicker table tr td.redday,
      .datepicker table tr th.redday {
        background: none !important;
        background-color: red !important;
        background-image: none !important;
        color: White !important;
        font-weight: bold !important;
        font-size: 12pt;
      }

      #errmsg {
        color: red;
      }

      table.dataTable > tbody > tr.child ul li:first-child {
        padding-top: 0;
        display: block;
        width: 300px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
      }

      table.dataTable thead th {
        padding: 0px 0px;
        text-align: center !important;
      }

      table.dataTable tbody td {
        padding: 10px 0px;
        text-align: center !important;
      }

      table.dataTable tbody td.child {
        text-align: left !important;
      }

      .multiselect-container {
        overflow: auto;
        max-height: 150px;
        min-width: 250px;
      }

      .multiselect {
        margin: 0px !important;
      }

      .checkbox input[type="checkbox"],
      label.checkbox-inline input[type="checkbox"] {
        opacity: 1;
        position: absolute;
        margin: 0;
        z-index: 1000;
        width: 47px !important;
        height: 17px !important;
        overflow: hidden;
        left: 0;
        pointer-events: none;
      }

      .dropdown-menu > .active > a,
      .dropdown-menu > .active > a:focus,
      .dropdown-menu > .active > a:hover {
        background-color: white !important;
      }

      .checkbox {
        color: black !important;
      }

      .box .box-body .input-group {
        margin: 0px;
      }

      .wrapper {
        overflow-x: hidden;
        overflow-y: auto;
      }

      .page-link {
        height: 34px;
      }

      .datepicker table tr td.redday,
      .datepicker table tr th.redday {
        background: none !important;
        background-color: red !important;
        background-image: none !important;
        color: White !important;
        font-weight: bold !important;
        font-size: 12pt;
      }

      #errmsg {
        color: red;
      }

      table.dataTable > tbody > tr.child ul li:first-child {
        padding-top: 0;
        display: block;
        width: 300px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
      }

      table.dataTable thead th {
        padding: 0px 0px;
        text-align: center !important;
      }

      table.dataTable tbody td {
        padding: 10px 0px;
        text-align: center !important;
      }

      table.dataTable tbody td.child {
        text-align: left !important;
      }

      .multiselect-container {
        overflow: auto;
        max-height: 150px;
      }

      .multiselect-container {
        overflow: auto;
        max-height: 150px;
      }

      .checkbox input[type="checkbox"],
      label.checkbox-inline input[type="checkbox"] {
        opacity: 1;
        position: absolute;
        margin: 0;
        z-index: 1000;
        width: 47px !important;
        height: 17px !important;
        overflow: hidden;
        left: 0;
        pointer-events: none;
      }

      .multiselect {
        margin: 0px !important;
      }

      .dropdown-menu > .active > a,
      .dropdown-menu > .active > a:focus,
      .dropdown-menu > .active > a:hover {
        background-color: white !important;
      }

      .checkbox {
        color: black !important;
      }

      /* below css file for daily schedule scroll */
      #test_daily {
        display: block;
        height: 300px;
        overflow: auto;
      }

      #daily_thead,
      #test_daily tr {
        display: table;
        width: 100%;
        table-layout: fixed;
      }

      #daily_thead {
        width: calc(100% - 1em);
      }

      /* below css file for weekly schedule scroll */
      #test_weekly {
        display: block;
        height: 300px;
        overflow: auto;
      }

      #weekly_thead,
      #test_weekly tr {
        display: table;
        width: 100%;
        table-layout: fixed;
      }

      #weekly_thead {
        width: calc(71% - 1em);
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

    <%@include file="header.jsp" %>

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
      <c:if test="${user.role eq '6'}">
        <div class="menu-block customscroll">
          <div class="sidebar-menu">
            <ul id="accordion-menu">
              <li>
                <a href="college_dashboard" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-house-1"></span
                  ><span class="mtext">Dashboard</span>
                </a>
              </li>
              <li>
                <a href="tandp_dashboard" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-house"></span
                  ><span class="mtext">T&P Dashboard</span>
                </a>
              </li>
              <li>
                <a
                  href="collegeViewInternships"
                  class="dropdown-toggle no-arrow"
                >
                  <span class="micon dw dw-certificate"></span
                  ><span class="mtext">Internships</span>
                </a>
              </li>
              <li>
                <a
                  href="external_internship_request_college"
                  class="dropdown-toggle no-arrow"
                >
                  <span class="micon dw dw-computer-1"></span
                  ><span class="mtext">External Requests</span>
                </a>
              </li>
              <li>
                <a href="college_internal_req" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-computer-1"></span
                  ><span class="mtext">Internal Requests</span>
                </a>
              </li>
              <li>
                <a
                  href="getAppliedStudentsOfCollege"
                  class="dropdown-toggle no-arrow"
                >
                  <span class="micon dw dw-user3"></span
                  ><span class="mtext">Student Application</span>
                </a>
              </li>
              <li hidden>
                <a href="comp_tie_up" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-flow"></span
                  ><span class="mtext">Industry Tie-ups</span>
                </a>
              </li>
              <li>
                <a href="college_dept" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-time-management"></span
                  ><span class="mtext">Manage Departments</span>
                </a>
              </li>
              <li hidden>
                <a href="collegeTransactions" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-balance"></span
                  ><span class="mtext">Balances</span>
                </a>
              </li>
              <li>
                <a href="college_report" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-edit-2"></span
                  ><span class="mtext">Internship Reports</span>
                </a>
              </li>
              <li>
                <a href="certificate" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-certificate-1"></span
                  ><span class="mtext">Certificate</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </c:if>
      <c:if test="${user.role eq '7'}">
        <div class="menu-block customscroll">
          <div class="sidebar-menu">
            <ul id="accordion-menu">
              <li>
                <a href="college_dashboard" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-house-1"></span
                  ><span class="mtext">Dashboard</span>
                </a>
              </li>

              <li>
                <a href="tandp_dashboard" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-house"></span
                  ><span class="mtext">T&P Dashboard</span>
                </a>
              </li>

              <li>
                <a
                  href="collegeViewInternships"
                  class="dropdown-toggle no-arrow"
                >
                  <span class="micon dw dw-certificate"></span
                  ><span class="mtext">Internships</span>
                </a>
              </li>
              <li>
                <a href="college_internal_req" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-computer-1"></span
                  ><span class="mtext">Internal Requests</span>
                </a>
              </li>
              <li>
                <a href="student_list" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-user3"></span
                  ><span class="mtext">Enroll Students</span>
                </a>
              </li>
              <li>
                <a
                  href="getAppliedStudentsOfCollege"
                  class="dropdown-toggle no-arrow"
                >
                  <span class="micon dw dw-computer-1"></span
                  ><span class="mtext">Students Request</span>
                </a>
              </li>
              <li>
                <a href="college_dept" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-time-management"></span
                  ><span class="mtext">Manage Departments</span>
                </a>
              </li>
              <li>
                <a href="college_report" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-edit-2"></span
                  ><span class="mtext">Internship Report</span>
                </a>
              </li>
              <li>
                <a href="certificate" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-certificate-1"></span
                  ><span class="mtext">View Certificate</span>
                </a>
              </li>
              <li>
                <a href="live_chat" class="dropdown-toggle no-arrow">
                  <span class="micon dw dw-chat3"></span
                  ><span class="mtext">Live Chat</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </c:if>
    </div>
    <div class="mobile-menu-overlay"></div>

    <div class="main-container">
      <div class="xs-pd-20-10 pd-ltr-20">
        <div class="title pb-20 text-center">
          <h6 class="h4 mb-0">
            <c:if test="${user.role eq '6'}">
              <div id="showfrm">
                <button
                  class="btn btn-primary btn-sm"
                  onclick="showForm()"
                  style="margin-left: 85%; padding: 2px 6px 2px 6px"
                >
                  Add Recrutment
                </button>
              </div>

              <div id="hidefrm">
                <button
                  class="btn btn-primary btn-sm"
                  onclick="hideForm()"
                  style="margin-left: 85%; padding: 2px 6px 2px 6px"
                >
                  Hide Form
                </button>
              </div>
            </c:if>
          </h6>
        </div>
        <div class="card-box mb-30">
          <div class="pd-20">
            <table class="table table-striped table-hover" id="placementTable">
              <thead>
                <tr>
                  <th></th>

                  <th hidden>Placement ID</th>
                  <th>Company Name</th>

                  <th>Job Title</th>
                  <th>Job Description</th>
                  <th>Website</th>
                  <th>Interview Start Date</th>
                  <th>Interview End Date</th>
                  <th>Criteria</th>
                  <c:if test="${user.role eq '6'}">
                    <th>Actions</th>
                  </c:if>
                </tr>
              </thead>
              <tbody>
                <!-- Iterate over placements and populate table rows -->
                <c:forEach var="placement" items="${placements}">
                  <tr>
                    <td><input type="checkbox" /></td>

                    <td hidden>${placement.placementId}</td>
                    <td>${placement.companyName}</td>

                    <td>${placement.placementDetails.jobTitle}</td>
                    <td>${placement.placementDetails.jobDescription}</td>
                    <td>
                      <a
                        href="${placement.placementDetails.website}"
                        target="_blank"
                        >${placement.placementDetails.website}</a
                      >
                    </td>
                    <td>${placement.placementDetails.interviewStartDate}</td>
                    <td>${placement.placementDetails.interviewEndDate}</td>
                    <td>
                      <span style="color: red"> SSC: </span>
                      ${placement.placementDetails.ssc}%,
                      <span style="color: red"> HSC: </span>
                      ${placement.placementDetails.hsc}%,
                      <span style="color: red"> UG: </span>
                      ${placement.placementDetails.ug}%
                    </td>

                    <c:if test="${user.role eq '6'}">
                      <!-- <td>
													<button type="button" class="btn btn-primary" onclick="openModal(${placement.placementId})">
														View Students
													</button>
												</td> -->

                      <td>
                        <button
                          type="button"
                          class="btn btn-primary"
                          onclick='searchStudents("${placement.placementId}", "${placement.placementDetails.ssc != null ? placement.placementDetails.ssc : 0}", 
	"${placement.placementDetails.hsc != null ? placement.placementDetails.hsc : 0}", 
	"${placement.placementDetails.ug != null ? placement.placementDetails.ug : 0}")'
                        >
                          Eligible Students
                        </button>

                        <!-- <button onclick="searchStudents()">click</button> -->
                      </td>
                    </c:if>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Modal Structure -->
        <div id="studentsModal" class="modal" style="display: none">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">Student List</h4>
                <button type="button" class="close" onclick="closeModal()">
                  &times;
                </button>
              </div>
              <button
                type="button"
                id="selectAllButton"
                onclick="toggleSelectAll()"
              >
                Select All
              </button>

              <div class="modal-body">
                <table id="studentsTable" class="table">
                  <thead>
                    <tr>
                      <th>Select:</th>
                      <th>Student Id</th>
                      <th>Student Name</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody id="studentsListBody">
                    <!-- Data will be dynamically inserted here -->
                  </tbody>
                </table>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary" onclick="closeModal()">
                  Close
                </button>
              </div>
            </div>
          </div>
        </div>

        <div class="card-box mb-30" id="frm">
          <div class="pd-20">
            <form id="placementForm" method="post">
              <!-- Placement Section -->
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Company Name</label>
                    <input
                      id="companyName"
                      name="companyName"
                      class="form-control"
                      type="text"
                    />
                  </div>
                  <div class="form-group">
                    <label>Company Person Name</label>
                    <input
                      id="contactName"
                      name="contactName"
                      class="form-control"
                      type="text"
                    />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Contact Person Number</label>
                    <input
                      id="contactNo"
                      name="contactNo"
                      class="form-control"
                      type="number"
                    />
                  </div>
                  <div class="form-group">
                    <label>Website Url</label>
                    <input
                      id="website"
                      name="website"
                      class="form-control"
                      type="text"
                      placeholder="https://www.example.com"
                    />
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Email</label>
                    <input
                      id="email"
                      name="email"
                      class="form-control"
                      type="email"
                    />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Address</label>
                    <input
                      id="address"
                      name="address"
                      class="form-control"
                      type="text"
                    />
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Profile</label>
                    <input
                      id="profile"
                      name="profile"
                      class="form-control"
                      type="text"
                    />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>City</label>
                    <input
                      id="city"
                      name="city"
                      class="form-control"
                      type="text"
                    />
                  </div>
                </div>
              </div>

              <!-- Placement Details Section -->
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Job Title</label>
                    <input
                      id="jobTitle"
                      name="jobTitle"
                      class="form-control"
                      type="text"
                    />
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="form-group">
                    <label>Job Description</label>
                    <textarea
                      id="jobDescription"
                      name="jobDescription"
                      class="form-control"
                      rows="3"
                    >
Develop scalable applications</textarea
                    >
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>SSC %</label>
                    <input
                      id="ssc"
                      name="ssc"
                      class="form-control"
                      type="text"
                    />
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="form-group">
                    <label>HSC %</label>
                    <input
                      id="hsc"
                      name="sshscc"
                      class="form-control"
                      type="text"
                    />
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="form-group">
                    <label>UG %</label>
                    <input id="ug" name="ug" class="form-control" type="text" />
                  </div>
                </div>

                <div hidden class="col-md-6">
                  <div class="form-group">
                    <label>Is Open</label>
                    <input
                      id="isOpen"
                      name="isOpen"
                      class="form-control"
                      type="text"
                      value="true"
                    />
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Interview Start Date</label>
                    <input
                      type="date"
                      name="interviewStartDate"
                      id="interviewStartDate"
                      class="form-control"
                    />
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="form-group">
                    <label>Interview End Date</label>
                    <input
                      type="date"
                      name="interviewEndDate"
                      id="interviewEndDate"
                      class="form-control"
                    />
                  </div>
                </div>
              </div>

              <!-- Department IDs Section -->
              <div class="form-group">
                <label>Departments</label>
                <select
                  id="departmentIds"
                  name="departmentIdsList"
                  class="form-control"
                  multiple
                >
                  <option value="1" selected>Department 1</option>
                  <option value="2" selected>Department 2</option>
                  <option value="3" selected>Department 3</option>
                </select>
              </div>

              <!-- Submit Button -->
              <div class="form-group">
                <input
                  type="submit"
                  id="submitButton"
                  class="btn btn-primary btn-sm pull-right"
                  value="Submit"
                />
              </div>
            </form>
          </div>
        </div>

        <%@include file="modal_common.jsp" %> <%@include file="modal.jsp" %>
      </div>

      <div class="modal fade show" id="comp_advt_details_modal" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
          <!-- Modal content-->
          <div class="modal-content">
            <div
              class="panel-heading"
              style="
                background: #0f2c7eeb;
                padding: 4px 0px 4px 16px;
                color: white;
              "
            >
              <button type="button" class="close" data-dismiss="modal">
                &times;
              </button>
              <span class="modal-title">Advertisement Description</span>
            </div>
            <div class="modal-body">
              <p id="advt_details"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/company_posts.js"></script>
    <script
      src="${pageContext.request.contextPath}/style/dist/js/bootstrap-multiselect.js"
      type="text/javascript"
    ></script>

    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/internship_schedule.js"></script>
    <script src="https://unpkg.com/sweetalert${pageContext.request.contextPath}/style/dist/sweetalert.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/vfs_fonts.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>

    <script>
      document
        .getElementById("placementForm")
        .addEventListener("submit", function (event) {
          event.preventDefault();

          const formData = {
            placement: {
              companyName: document.getElementById("companyName").value,
              contactNo: document.getElementById("contactNo").value,
              email: document.getElementById("email").value,
              address: document.getElementById("address").value,
              profile: document.getElementById("profile").value,
            },
            placementDetails: {
              jobTitle: document.getElementById("jobTitle").value,
              jobDescription: document.getElementById("jobDescription").value,
              ssc: document.getElementById("ssc").value,
              hsc: document.getElementById("hsc").value,
              ug: document.getElementById("ug").value,
              city: document.getElementById("city").value,
              website: document.getElementById("website").value,
              isOpen: document.getElementById("isOpen").value,
              interviewStartDate:
                document.getElementById("interviewStartDate").value,
              interviewEndDate:
                document.getElementById("interviewEndDate").value,
            },
            departmentIdsList: Array.from(
              document.getElementById("departmentIds").options
            )
              .filter((option) => option.selected)
              .map((option) => option.value),
          };

          fetch(
            "http://43.204.35.211:8000/newskill/addPlacement?collegeId=10",
            {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
              },
              body: JSON.stringify(formData),
            }
          )
            .then((response) => response.json())
            .then((data) => {
              console.log("Success:", data);
              window.location.reload();
            })
            .catch((error) => {
              console.error("Error:", error);
            });
        });
    </script>

    <script>
      // acccept only number
      $(document).ready(function () {
        //called when key is pressed in textbox
        $("#duration").keypress(function (e) {
          //if the letter is not digit then display error and don't type anything
          if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            /* display error message */
            $("#errmsg").html("Number Only").show().fadeOut("slow");
            return false;
          }
        });

        $("#capacity").keypress(function (e) {
          //if the letter is not digit then display error and don't type anything
          if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            /* display error message */
            $("#errmsgcap").html("Number Only").show().fadeOut("slow");
            return false;
          }
        });
      });

      //set default drowp down first element blank
      document.getElementById("technology_name").selectedIndex = -1;

      $("#comp_schedule_form").hide();
      function showCompanyScheduleform(com_adv_id, duration) {
        $("#comp_adv_form").hide();
        get_schedule(com_adv_id, "INLINE");
        type_of_schedule(com_adv_id, duration);
        $("#comp_schedule_form").show();
      }

      function back() {
        $("#comp_schedule_form").hide();
        $("#comp_adv_form").show();
      }
      function testempty() {
        $("#sbtn").prop("disabled", false);
      }

      function getdataskip() {
        $("#getskipval").val("yes");
        $("#schedform").submit();
      }
    </script>

    <script>
      document.addEventListener("DOMContentLoaded", hideForm());

      function showForm() {
        document.getElementById("frm").hidden = false; // Show the form
        document.getElementById("hidefrm").hidden = false; // Show the hide button
        document.getElementById("showfrm").hidden = true; // Hide the show button
      }

      function hideForm() {
        document.getElementById("frm").hidden = true; // Hide the form
        document.getElementById("hidefrm").hidden = true; // Hide the hide button
        document.getElementById("showfrm").hidden = false; // Show the show button
      }
    </script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>

    <!-- <script>
						function searchStudents(placementId,hsc,ssc,ug) {
						
							fetch('stdList?placementId='+placementId + '&ssc=' + ssc + '&hsc=' + hsc + '&ug=' + ug)
								
							
							.then(response => {
									if (!response.ok) {
										throw new Error('Network response was not ok ' + response.statusText);
									}
									return response.json(); // Fetch student data as JSON
								})
								.then(data => {
									console.log(data);
									populateModal(data); // Call a function to populate the modal
									openModal(); // Open the modal
								})
								.catch(error => console.error('Error fetching student data:', error));
						}
					
						function populateModal(studentsList) {
							const tableBody = document.getElementById('studentsListBody');
							tableBody.innerHTML = ''; // Clear any existing data
					
							studentsList.forEach(student => {
								const row = document.createElement('tr');
					
								const checkboxCell = document.createElement('td');
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.value = student.studentId; // You can set the value of the checkbox to student ID or any other field
        checkboxCell.appendChild(checkbox);
        row.appendChild(checkboxCell);

								const statusCell = document.createElement('td');
								statusCell.textContent = student.studentId;
								row.appendChild(statusCell);


								const nameCell = document.createElement('td');
								nameCell.textContent = student.studentName;
								row.appendChild(nameCell);
				
					
								tableBody.appendChild(row);
							});
						}
					
						function openModal() {
							document.getElementById('studentsModal').style.display = 'block';
						}
					
						function closeModal() {
							document.getElementById('studentsModal').style.display = 'none';
						}
					</script> -->

    <script>
      function searchStudents(placementId, hsc, ssc, ug) {
        fetch(
          "stdList?placementId=" +
            placementId +
            "&ssc=" +
            ssc +
            "&hsc=" +
            hsc +
            "&ug=" +
            ug
        )
          .then((response) => {
            if (!response.ok) {
              throw new Error(
                "Network response was not ok " + response.statusText
              );
            }
            return response.json(); // Fetch student data as JSON
          })
          .then((data) => {
            console.log(data);
            populateModal(data); // Call a function to populate the modal
            openModal(); // Open the modal
          })
          .catch((error) =>
            console.error("Error fetching student data:", error)
          );
      }

      function populateModal(studentsList) {
        const tableBody = document.getElementById("studentsListBody");
        tableBody.innerHTML = ""; // Clear any existing data

        studentsList.forEach((student) => {
          const row = document.createElement("tr");

          const checkboxCell = document.createElement("td");
          const checkbox = document.createElement("input");
          checkbox.type = "checkbox";
          checkbox.value = student.studentId;

          if (student.status === "Applied") {
            checkbox.disabled = true; // Disable the checkbox
          }

          checkboxCell.appendChild(checkbox);
          row.appendChild(checkboxCell);

          const studentId = document.createElement("td");
          studentId.textContent = student.studentId;
          row.appendChild(studentId);

          const nameCell = document.createElement("td");
          nameCell.textContent = student.studentName;
          row.appendChild(nameCell);

          const statusCell = document.createElement("td");
          statusCell.textContent = student.status;
          row.appendChild(statusCell);

          tableBody.appendChild(row);
        });
      }

      function openModal() {
        document.getElementById("studentsModal").style.display = "block";
      }

      function closeModal() {
        document.getElementById("studentsModal").style.display = "none";
      }

      function toggleSelectAll() {
        const tableBody = document.getElementById("studentsListBody");
        const checkboxes = tableBody.querySelectorAll('input[type="checkbox"]');
        const selectAllButton = document.getElementById("selectAllButton");

        const allChecked = Array.from(checkboxes).every(
          (checkbox) => checkbox.checked && !checkbox.disabled
        );

        checkboxes.forEach((checkbox) => {
          if (!checkbox.disabled) {
            checkbox.checked = allChecked ? false : true; // If all enabled are checked, uncheck them; otherwise, check all
          }
        });

        selectAllButton.textContent = allChecked
          ? "Deselect All"
          : "Select All";
      }
    </script>
  </body>
</html>
