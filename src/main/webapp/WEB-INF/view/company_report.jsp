<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | Company Report</title>

    <!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180"
    href=='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
    <link rel="icon" type="image/png" sizes="16x16"
    href=='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>

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

    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.16/jspdf.plugin.autotable.min.js"></script>
    <style>
      table {
        border-collapse: collapse;
        width: 100%;
      }
      th,
      td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
      }
      .heading {
        font-size: 24px;
        font-family: Arial, sans-serif;
        color: #333;
        text-align: center;
        margin-bottom: 10px;
      }
      .subheading {
        font-size: 16px;
        font-family: Arial, sans-serif;
        color: #666;
        text-align: center;
        margin-bottom: 20px;
      }
    </style>

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
      .sidebar-menu .dropdown-toggle {
        padding: 15px 12px 15px 54px !important;
        font-size: 15px !important;
      }
      .parameter {
        padding: 0;
      }
      .user-notification .dropdown-toggle .badge {
        position: absolute;
        right: 5px;
        top: 7px;
        /*  background: #0f2c7eeb; */
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
      .bootstrap-select .dropdown-toggle {
        height: 35px;
        padding-right: 30px;
        font-size: 14px;
        font-weight: 400;
      }
      label {
        min-width: 25%;
        max-width: 0%;
        color: #1974c3;
        display: contents;
        margin-bottom: 0.5rem;
      }
      #style-3::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
        background-color: #f5f5f5;
      }

      #style-3::-webkit-scrollbar {
        width: 6px;
        background-color: #f5f5f5;
      }

      #style-3::-webkit-scrollbar-thumb {
        background-color: #c1c1c1;
      }
      #div_location::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
        background-color: #f5f5f5;
      }

      #div_location::-webkit-scrollbar {
        width: 6px;
        background-color: #f5f5f5;
      }

      #div_location::-webkit-scrollbar-thumb {
        background-color: #c1c1c1;
      }
      #div_tech::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
        background-color: #f5f5f5;
      }

      #div_tech::-webkit-scrollbar {
        width: 6px;
        background-color: #f5f5f5;
      }

      #div_tech::-webkit-scrollbar-thumb {
        background-color: #c1c1c1;
      }
      #div_dept::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
        background-color: #f5f5f5;
      }

      #div_dept::-webkit-scrollbar {
        width: 6px;
        background-color: #f5f5f5;
      }

      #div_dept::-webkit-scrollbar-thumb {
        background-color: #c1c1c1;
      }
    </style>
  </head>
  <body>
    <div class="pre-loader">
      <div class="pre-loader-box">
        <div class="loader-logo">
          <img
            src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg"
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
        <a href="javascript:;"> <img
          src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg" alt="" class="dark-logo"> 
          <img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg" alt="" class="light-logo">
        </a>
        <div class="close-sidebar" data-toggle="left-sidebar-close">
          <i class="ion-close-round"></i>
        </div>
      </div>
      <%@include file="sidebar.jsp"%>
    </div>
    <div class="mobile-menu-overlay"></div>
    <div class="main-container">
      <div>
        <div class="title pb-20">
          <h4
            class="h4 mb-0 text-center"
            style="color: white; background: #0f2c7eeb; border-radius: 5px"
          >
            Company Report
          </h4>
        </div>
        <div class="page-header">
          <div class="row">
            <div class="col-md-4 col-sm-12">
              <div class="form-group parameter">
                <label>Teams</label>
                <select
                  id="department"
                  style="width: 100%"
                  onchange="view_reportsingle()"
                >
                  <option selected value="">--Select Team--</option>
                  <c:forEach items="${dept_data}" var="dept">
                    <option value="${dept}">${dept}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <div class="col-md-4 col-sm-12">
              <div class="form-group parameter">
                <label>Status</label>
                <select
                  id="status"
                  style="width: 100%"
                  onchange="view_reportsingle()"
                >
                  <option value="">--Select Status--</option>
                  <option value="P">Pending</option>
                  <option value="ongoing">Ongoing</option>
                  <option value="Completed">Completed</option>
                  <option value="X">Cancelled</option>
                </select>
              </div>
            </div>
            <div class="col-md-4 col-sm-12">
              <div class="form-group parameter">
                <label>Skill</label>
                <select
                  id="technology"
                  style="width: 100%"
                  onchange="view_reportsingle()"
                >
                  <option selected value="">--Select Skill--</option>
                  <c:forEach items="${technology_data}" var="tech">
                    <option value="${tech}">${tech}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-4 col-sm-12">
              <div class="form-group parameter">
                <label>Duration</label>
                <select
                  id="duration"
                  style="width: 100%"
                  onchange="view_reportsingle()"
                >
                  <option value="">--Select no of Weeks--</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="16">16</option>
                  <option value="20">20</option>
                  <option value="24">24</option>
                  <option value="32">32</option>
                  <option value="40">40</option>
                  <option value="52">52</option>
                </select>
              </div>
            </div>
            <div class="col-md-4 col-sm-12">
              <div class="form-group parameter">
                <label>Institute</label>
                <select id="institute" onchange="view_reportsingle()">
                  <option selected value="">--Select Institute--</option>
                  <c:forEach items="${institute_data}" var="inst">
                    <option value="${inst[1]}">${inst[0]}</option>
                  </c:forEach>
                  <option value="external">External Interns</option>
                </select>
              </div>
            </div>
            <div hidden class="col-md-4 col-sm-12">
              <div class="form-group parameter text-center radio">
                <label>Internship Dates</label><br />
                <label style="color: black"
                  ><input
                    type="date"
                    name="internship_dates"
                    value="started_bet"
                  />&nbsp;Started Between</label
                >
                <label style="color: black"
                  ><input
                    type="date"
                    name="internship_dates"
                    value="ended_bet"
                  />&nbsp;Ended Between</label
                ><br />
                <label style="color: black"
                  ><input
                    type="date"
                    name="internship_dates"
                    value="complete_bet"
                    style="margin-top: 10px"
                  />&nbsp;Complete Internship Between</label
                >
              </div>
              <br />
              <div id="report_dates" style="display: none">
                <input
                  id="from_date"
                  data-date-format="yyyy-mm-dd"
                  style="width: 45%; margin: 5px"
                  placeholder="From Date"
                  readonly="true"
                />
                <input
                  id="to_date"
                  data-date-format="yyyy-mm-dd"
                  style="width: 45%; margin: 5px"
                  placeholder="To Date"
                  readonly="true"
                />
              </div>
            </div>
          </div>
          <div class="parameter" style="text-align: center">
            <input
              type="button"
              value="Generate"
              id="generate_report"
              class="btn btn-success btn-sm"
              onclick="view_report()"
            />
          </div>
        </div>
      </div>
      <div>
        <div
          class="page-header table-responsive scrollbar force-overflow"
          id="style-3"
          style="
            margin-bottom: 8px;
            padding: 0px;
            max-height: 373px;
            overflow: auto;
          "
        >
          <table
            style="width: 100%"
            class="table resp_data_table nowrap"
            id="myTable"
          >
            <thead class="thead-light">
              <tr>
                <th>Student</th>
                <th>Team</th>
                <th>Institute</th>
                <th>Duration</th>
                <th>Skill</th>
                <th>Start Date</th>
                <th nowrap="nowrap">Completion Date</th>
                <th>Status</th>
              </tr>
            </thead>

            <tbody id="interns_data"></tbody>
          </table>
          <!--End data table-->
        </div>
        <center>
          <button class="btn btn-success btn-sm" onclick="generatePDF()">
            Download PDF
          </button>
          <button class="btn btn-success btn-sm" onclick="downloadCSV()">
            Download CSV
          </button>
        </center>
        <br />
        <%@include file="modal_common.jsp"%>
      </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.16/jspdf.plugin.autotable.min.js"></script>

    <script>
      function generatePDF() {
        const doc = new jsPDF();

        // Add heading
        doc.setFontSize(24);
        doc.setTextColor(51, 51, 51); // RGB color: #333
        doc.setFont("Arial", "bold");
        doc.text("Skillpilot", 90, 30, { align: "center" });

        // Add subheading
        doc.setFontSize(16);
        doc.setTextColor(102, 102, 102); // RGB color: #666
        doc.setFont("Arial", "normal");
        doc.text("Internship Report", 85, 50, { align: "center" });

        // Add report table
        const table = document.getElementById("myTable");
        const tableData = doc.autoTableHtmlToJson(table);
        doc.autoTable({
          startY: 60,
          head: [tableData.columns],
          body: tableData.data,
        });

        // Save the PDF
        doc.save("company_report.pdf");
      }
    </script>

    <!-- Call downloadCSV function on a button click -->
    <script>
      function downloadCSV() {
        const table = document.getElementById("myTable");
        const rows = table.querySelectorAll("tr");

        let csvContent = "";

        // Extract the first row as a heading
        const headerRow = rows[0];
        const headers = headerRow.querySelectorAll("th, td");
        let headerData = [];
        headers.forEach((header) => {
          headerData.push('"' + header.innerText + '"');
        });
        csvContent += headerData.join(",") + "\n"; // Add the header row to the CSV content

        // Filter and add the remaining rows
        for (let i = 1; i < rows.length; i++) {
          const cols = rows[i].querySelectorAll("td");
          let rowData = [];
          let addRow = true; // Flag to determine if the row should be added

          // Example filter logic: Skip rows where the first column is empty
          if (cols[0] && cols[0].innerText.trim() === "") {
            addRow = false;
          }

          if (addRow) {
            cols.forEach((col) => {
              rowData.push('"' + col.innerText + '"');
            });
            csvContent += rowData.join(",") + "\n";
          }
        }

        // Create a Blob from the CSV content
        const blob = new Blob([csvContent], {
          type: "text/csv;charset=utf-8;",
        });

        // Create a link element to trigger the download
        const link = document.createElement("a");
        if (link.download !== undefined) {
          // feature detection
          const url = URL.createObjectURL(blob);
          link.setAttribute("href", url);
          link.setAttribute("download", "company_report.csv");
          link.style.visibility = "hidden";
          document.body.appendChild(link);
          link.click();
          document.body.removeChild(link);
        }
      }
    </script>

    <script>
      function formatDate(timestamp) {
        if (!timestamp) {
          return "N/A";
        }
        var date = new Date(timestamp);
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return month + "/" + day + "/" + year;
      }

      function view_report() {
        var selectedDepartment = $("#department").val();
        var selectStatus = $("#status").val();
        var selectTechnology = $("#technology").val();
        var selectDuration = $("#duration").val();
        var selectInstitute = $("#institute").val();

        var requestData = {
          department: selectedDepartment,
          status: selectStatus || null,
          technology: selectTechnology || null,
          duration: selectDuration || null,
          college_id: selectInstitute || null,
        };

        $.ajax({
          type: "GET",
          url: "${pageContext.request.contextPath}/getreport",
          data: requestData,
          success: function (response) {
            console.log("Report data:", response);
            $("#interns_data").empty();

            var reports = response; // Directly use response, no need to parse

            if (Array.isArray(reports)) {
              reports.forEach(function (report) {
                var row =
                  "<tr>" +
                  "<td>" +
                  (report.studentName || "") +
                  "</td>" + // Use studentName instead of student_id
                  "<td>" +
                  (report.internship.comp_dept_id || "") +
                  "</td>" +
                  "<td>" +
                  (report.collegeName || "") +
                  "</td>" + // Display collegeName
                  "<td>" +
                  (report.internship.duration || "") +
                  "</td>" +
                  "<td>" +
                  (report.internship.technology || "") +
                  "</td>" +
                  "<td>" +
                  (formatDate(report.internship.date_started) || "") +
                  "</td>" +
                  "<td>" +
                  (formatDate(report.internship.date_completed) || "") +
                  "</td>" +
                  "<td>" +
                  (report.internship.status || "") +
                  "</td>" +
                  "</tr>";
                $("#interns_data").append(row);
              });
            } else {
              console.error("Expected an array but got:", reports);
            }
          },
          error: function (xhr, status, error) {
            console.error("Error:", error);
          },
        });
      }
    </script>
    <!-- for find by single selector -->
    <script>
      function formatDate(timestamp) {
        if (!timestamp) {
          return "N/A";
        }
        var date = new Date(timestamp);
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return month + "/" + day + "/" + year;
      }

      function view_reportsingle() {
        var selectedDepartment = $("#department").val();
        var selectStatus = $("#status").val();
        var selectTechnology = $("#technology").val();
        var selectDuration = $("#duration").val();
        var selectInstitute = $("#institute").val();

        var requestData = {
          department: selectedDepartment,
          status: selectStatus || null,
          technology: selectTechnology || null,
          duration: selectDuration || null,
          college_id: selectInstitute || null,
        };

        $.ajax({
          type: "GET",
          url: "${pageContext.request.contextPath}/getreportsingle",
          data: requestData,
          success: function (response) {
            console.log("Report data:", response);
            $("#interns_data").empty();
            var reports = JSON.parse(response);

            if (Array.isArray(reports)) {
              reports.forEach(function (report) {
                var row =
                  "<tr>" +
                  "<td>" +
                  (report.studentName || "") +
                  "</td>" +
                  "<td>" +
                  (report.internship.comp_dept_id || "") +
                  "</td>" +
                  "<td>" +
                  (report.collegeName || "") +
                  "</td>" +
                  "<td>" +
                  (report.internship.duration || "") +
                  "</td>" +
                  "<td>" +
                  (report.internship.technology || "") +
                  "</td>" +
                  "<td>" +
                  (formatDate(report.internship.date_started) || "") +
                  "</td>" +
                  "<td>" +
                  (formatDate(report.internship.date_completed) || "") +
                  "</td>" +
                  "<td>" +
                  (report.internship.status || "") +
                  "</td>" +
                  "</tr>";
                $("#interns_data").append(row);
              });
            } else {
              console.error("Expected an array but got:", reports);
            }
          },
          error: function (xhr, status, error) {
            console.error("Error:", error);
          },
        });
      }
    </script>

    <!-- js -->
    <%@include file="scriptfiles.jsp"%>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"
      integrity="sha384-NGB9XqFIl/+W9IW/W4V2Ps/DfKf/cuOAIrS86/KO/b4sFaI6sPfzGJvQB5I/iKXIN"
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
  </body>
</html>
