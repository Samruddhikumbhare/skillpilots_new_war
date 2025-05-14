<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ page
language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
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
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />

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
    <link
      href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css"
      rel="stylesheet"
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

      .pagination {
        display: flex;
        justify-content: center; /* Centers the buttons horizontally */
        align-items: center; /* Aligns items vertically (if needed) */
        margin-top: 20px; /* Add space above the buttons */
        gap: 10px; /* Spacing between buttons */
      }

      .pagination a {
        margin: 0;
        padding: 8px 12px;
        text-decoration: none;
        color: #007bff;
        border: 1px solid #ddd;
        border-radius: 5px;
        transition: background-color 0.3s, color 0.3s;
      }

      .pagination a.active {
        font-weight: bold;
        background-color: #007bff;
        color: white;
        border-color: #007bff;
      }

      .pagination a.disabled {
        pointer-events: none;
        color: #ccc;
        border-color: #ddd;
      }

      .pagination a:hover:not(.active):not(.disabled) {
        background-color: #f0f0f0;
        color: #0056b3;
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

    <%@include file="header.jsp"%>

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

      <%@include file="sidebar.jsp"%>
    </div>
    <div class="mobile-menu-overlay"></div>

    <div class="main-container">
      <div class="xs-pd-20-10 pd-ltr-20">
        <div class="title pb-20">
          <h4
            class="h4 mb-0 text-center"
            style="color: white; background: #0f2c7eeb; border-radius: 5px"
          >
            Applied Students
          </h4>
        </div>

        <div class="card-box mb-30">
          <div class="pd-20">
            <div class="table-responsive">
              <table
                class="table table-striped table-hover align-middle text-center"
                id="placementTable"
                style="font-size: 15px"
              >
                <thead class="thead-dark">
                  <tr>
                    <th hidden>Drive ID</th>
                    <th style="min-width: 160px">
                      Job Role <i class="fas fa-briefcase text-secondary"></i>
                    </th>
                    <th style="min-width: 100px">
                      CTC <i class="fas fa-money-bill-wave text-success"></i>
                    </th>
                    <th style="min-width: 140px">
                      Experience <i class="fas fa-user-clock text-warning"></i>
                    </th>
                    <th style="min-width: 180px">
                      Actions <i class="fas fa-cogs text-info"></i>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="drive" items="${drive}">
                    <tr>
                      <td hidden>${drive.companyId}</td>
                      <td hidden>${drive.driveId}</td>
                      <td>${drive.jobRole}</td>
                      <td>${drive.ctc}</td>
                      <td>${drive.experience}</td>
                      <td>
                        <button
                          type="button"
                          class="btn btn-sm btn-primary mb-1"
                          title="View Students"
                          onclick='searchStudents("${drive.companyId}", "${drive.jobRole}", "${drive.driveId}")'
                        >
                          <i class="fas fa-users"></i> Students
                        </button>
                        <a
                          class="btn btn-sm btn-outline-info"
                          title="View History"
                          href="${pageContext.request.contextPath}/viewAppliedCandidateHistory?companyId=${drive.companyId}&drive_id=${drive.driveId}"
                        >
                          <i class="fas fa-history"></i> History
                        </a>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>

            <!-- Pagination -->
            <c:choose>
              <c:when test="${totalPages > 0}">
                <nav
                  aria-label="Drive pagination"
                  class="d-flex justify-content-center mt-4"
                >
                  <ul class="pagination">
                    <li class="page-item ${currentPage == 0 ? 'disabled' : ''}">
                      <a
                        class="page-link"
                        href="?page=${currentPage - 1}&size=${size}"
                        >Previous</a
                      >
                    </li>

                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                      <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&size=${size}"
                          >${i + 1}</a
                        >
                      </li>
                    </c:forEach>

                    <li
                      class="page-item ${currentPage == totalPages - 1 ? 'disabled' : ''}"
                    >
                      <a
                        class="page-link"
                        href="?page=${currentPage + 1}&size=${size}"
                        >Next</a
                      >
                    </li>
                  </ul>
                </nav>
              </c:when>
              <c:otherwise>
                <p class="text-center text-muted">No drives available.</p>
              </c:otherwise>
            </c:choose>
          </div>
        </div>

        <!-- Modal Structure -->
        <div
          id="studentsModal"
          class="modal fade show"
          style="display: none"
          tabindex="-1"
          aria-labelledby="studentsModalLabel"
          aria-hidden="true"
        >
          <div class="modal-dialog modal-md modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header bg-light text-dark">
                <h5 class="modal-title" id="studentsModalLabel">
                  <i class="fas fa-user-graduate"></i> Student List
                </h5>
                <button
                  type="button"
                  class="btn-close"
                  onclick="closeModal()"
                  aria-label="Close"
                ></button>
              </div>

              <div class="modal-body">
                <div class="mb-3">
                  <p class="mb-1 text-muted" hidden>
                    SELECTING STUDENTS FOR:
                    <span id="modalStatus" class="text-success"></span>
                  </p>

                  <div class="row g-2 align-items-center mb-3">
                    <div class="col-md-6">
                      <label for="roundDateTime" class="form-label"
                        >Select Date:</label
                      >
                      <input
                        type="date"
                        class="form-control"
                        id="roundDateTime"
                      />
                    </div>
                    <div class="col-md-6">
                      <label for="timeSelect" class="form-label"
                        >Select Time (24-hour format):</label
                      >
                      <select class="form-control" id="timeSelect">
                        <!-- Time options will be added dynamically -->
                      </select>
                    </div>
                  </div>

                  <div class="d-flex justify-content-end mb-2">
                    <button
                      type="button"
                      class="btn btn-outline-secondary btn-sm"
                      id="selectAllButton"
                      onclick="toggleSelectAll()"
                    >
                      <i class="fas fa-check-double"></i> Select All
                    </button>
                  </div>
                </div>

                <div
                  class="table-responsive"
                  style="max-height: 300px; overflow-y: auto"
                >
                  <table
                    id="studentsTable"
                    class="table table-striped table-hover text-center align-middle"
                  >
                    <thead class="table-light">
                      <tr>
                        <th>Select</th>
                        <th hidden>Student ID</th>
                        <th>Student Name</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody id="studentsListBody">
                      <!-- Data will be dynamically inserted here -->
                    </tbody>
                  </table>
                </div>
              </div>

              <div class="modal-footer d-flex justify-content-between">
                <button
                  id="applyButton"
                  class="btn btn-success"
                  onclick="nextRound()"
                >
                  <i class="fas fa-arrow-right"></i> Select For Next Round
                </button>
                <button class="btn btn-secondary" onclick="closeModal()">
                  Close
                </button>
              </div>
            </div>
          </div>
        </div>

        <%@include file="modal_common.jsp"%> <%@include file="modal.jsp"%>
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
      var timeSelect = document.getElementById("timeSelect");

      for (var hour = 0; hour < 24; hour++) {
        for (var minute = 0; minute < 60; minute += 30) {
          var hh = hour.toString().padStart(2, "0");
          var mm = minute.toString().padStart(2, "0");
          var option = document.createElement("option");
          option.value = hh + ":" + mm;
          option.textContent = hh + ":" + mm;
          timeSelect.appendChild(option);
        }
      }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>

    <script>
      function searchStudents(companyId, jobRole, driveId) {
        console.log("companyId =", companyId);
        console.log("jobRole =", jobRole);
        console.log("jobRole =", driveId);
        document.getElementById("modalStatus").textContent = driveId;

        fetch(
          "getCompanyDriveAppliedStd?companyId=" +
            companyId +
            "&jobRole=" +
            jobRole
        )
          .then((response) => {
            if (!response.ok) {
              throw new Error(
                "Network response was not ok " + response.statusText
              );
            }
            return response.json();
          })
          .then((data) => {
            console.log(data);
            populateModal(data); // Populate modal with student data
            openModal(); // Open the modal
          })
          .catch((error) =>
            console.error("Error fetching student data:", error)
          );
      }

      function populateModal(data) {
        const studentsListBody = document.getElementById("studentsListBody");
        studentsListBody.innerHTML = ""; // Clear the table body

        let hasAppliedStudents = false; // Flag to check if any student has "Applied" status

        data.forEach((student) => {
          if (student.status === "Applied") {
            hasAppliedStudents = true; // Mark that at least one student has "Applied" status

            const row = document.createElement("tr");

            // Checkbox column
            const selectCell = document.createElement("td");
            const checkbox = document.createElement("input");
            checkbox.type = "checkbox";
            checkbox.className = "studentCheckbox";
            checkbox.value = student.id; // Set the checkbox value to the student ID
            selectCell.appendChild(checkbox);

            // Student ID column (hidden)
            const idCell = document.createElement("td");
            idCell.textContent = student.id;
            idCell.style.display = "none"; // Hide this column

            // Student Name column
            const nameCell = document.createElement("td");
            nameCell.textContent = student.username;

            // Status column
            const statusCell = document.createElement("td");
            statusCell.textContent = student.status;

            // Append cells to row
            row.appendChild(selectCell);
            row.appendChild(idCell); // Hidden column added
            row.appendChild(nameCell);
            row.appendChild(statusCell);

            // Append row to table body
            studentsListBody.appendChild(row);
          }
        });

        // If no students with "Applied" status, show a message
        if (!hasAppliedStudents) {
          const noDataRow = document.createElement("tr");
          const noDataCell = document.createElement("td");
          noDataCell.colSpan = 3; // Set colspan to span across all columns
          noDataCell.textContent = "No students have applied.";
          noDataCell.style.textAlign = "center"; // Center-align the text

          noDataRow.appendChild(noDataCell);
          studentsListBody.appendChild(noDataRow);
        }
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

      function nextRound() {
        const tableBody = document.getElementById("studentsListBody");
        const checkboxes = tableBody.querySelectorAll(
          'input[type="checkbox"]:checked'
        );
        const selectedIds = Array.from(checkboxes)
          .map((checkbox) => Number(checkbox.value)) // Convert values to numbers
          .filter((id) => !isNaN(id)); // Remove any invalid or null values

        const driveId = parseInt(
          document.getElementById("modalStatus").textContent
        );
        const roundDateTime = document.getElementById("roundDateTime").value;

        if (!roundDateTime) {
          Swal.fire({
            title: "Incomplete Information!",
            text: "Please select the date and time for the round.",
            icon: "warning",
            confirmButtonText: "OK",
          });
          return;
        }

        if (selectedIds.length > 0) {
          const formattedDate = new Date(roundDateTime)
            .toISOString()
            .split("T")[0];
          const formattedTime = new Date(roundDateTime).toLocaleTimeString(
            "en-GB",
            {
              hour: "2-digit",
              minute: "2-digit",
            }
          );

          const requestBody = {
            studentIds: selectedIds,
            driveId: driveId,
            round: "1ST ROUND",
            roundTime: formattedTime,
            roundDate: formattedDate,
          };

          const formData = new FormData();

          // Add each property to FormData
          formData.append("driveId", requestBody.driveId);
          formData.append("round", requestBody.round);
          formData.append("roundTime", requestBody.roundTime);
          formData.append("roundDate", requestBody.roundDate);

          // Append each studentId (for lists/arrays)
          requestBody.studentIds.forEach((id) => {
            formData.append("studentIds", id);
          });

          fetch("http://43.204.35.211:8000/newskill/update-company-drive", {
            method: "PUT",
            body: formData,
          })
            .then((response) => response.json())
            .then((data) => {
              console.log("Selected for Round:", data);
              Swal.fire({
                title: "Success!",
                text: "The students have been selected for the round successfully.",
                icon: "success",
                confirmButtonText: "OK",
              });
              location.reload();
              closeModal();
            })
            .catch((error) => console.error("Error applying:", error));
        } else {
          Swal.fire({
            title: "No Selection!",
            text: "Please select at least one student to proceed.",
            icon: "warning",
            confirmButtonText: "OK",
          });
        }
      }
    </script>
  </body>
</html>
