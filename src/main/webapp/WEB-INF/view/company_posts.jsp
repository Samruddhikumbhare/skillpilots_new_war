<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ page
language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | Internship Advertisements</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
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
<!--     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 -->    
   <!--  <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.14/css/bootstrap-multiselect.css"
      integrity="sha512-EvvoSMXERW4Pe9LjDN9XDzHd66p8Z49gcrB7LCUplh0GcEHiV816gXGwIhir6PJiwl0ew8GFM2QaIg2TW02B9A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    /> -->

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
      
<div  class="title pb-20 text-center" >
          <h6 class="h4 mb-0">
           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#advertisementModal" onclick="resetAdvertisementForm()">
  Add Advertisement
</button>
          </h6>
        </div>

        <div class="card-box mb-30">
          <div class="pd-20">
            <table id=" " class="data-table table hover">
              <thead class="thead-light" style="height: 34px">
                <tr>
                  <th></th>
                  <th>Actions</th>
                  <th hidden>Request ID</th>
                  <th>Title</th>
                  <th>Job Type</th>
                  <th>Working Type</th>
                  <th>Skill</th>
                  <th hidden>Positions</th>
                  <th>Duration</th>
                  <th>Stipend</th>
                  <th hidden>Start Date</th>
                  <th>Description</th>
                  <th>Requirement</th>
                  <th>Location</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${compAdvertisements}" var="item">
                  <tr>
                    <td></td>
                    <td>
                    
          <span
                        class="pointer"
                        style="
                          background: #1b00ff;
                          color: white;
                          padding: 2px 0px 2px 5px;
                          margin-right: 4px;
                          border-radius: 4px;
                        "
                        data-toggle="tooltip"
                        data-placement="top"
                        title="Click Here To Edit Your Advertisement"
                      >
                        <i
                          class="fa fa-pencil-square-o"
                          aria-hidden="true"
                         onclick="editAdvertisements(
      '${item.id}', 
      '${item.adv_title.replace("'", "\\'")}', 
      '${item.technology.replace("'", "\\'")}', 
      '${item.jobType}',
      '${item.workingType}',
      '${item.capacity}', 
      '${item.duration}', 
      '${item.stipend}', 
      '${item.start_date}', 
      '${item.description.replace("'", "\\'")}', 
      '${item.requirement.replace("'", "\\'")}', 
      '${item.location.replace("'", "\\'")}'
    )"
                        ></i>
                      </span>

                      <a
                        href="delete_com_adv?adv_id=${item.id}"
                        style="
                          background: #e4350d;
                          padding: 2px 5px 2px 5px;
                          border-radius: 4px;
                        "
                        data-toggle="tooltip"
                        data-placement="top"
                        title="Click Here To Delete Your Advertisement"
                      >
                        <i style="color: white" class="fa fa-trash"></i>
                      </a>
                    </td>
                    <td hidden><span>${item.id}</span></td>
                    <td>
                      <c:if test="${fn:length(item.adv_title) > 25}">
                        <c:set
                          var="string2"
                          value="${fn:substring(item.adv_title, 0, 15)}"
                        />
                        ${string2}
                        <a
                          href="javascript:void(0);"
                          onclick="readmore(`${item.adv_title}`);"
                          style="font-size: 11px"
                        >
                          read more..</a
                        >
                      </c:if>
                      <c:if test="${fn:length(item.adv_title) <= 25}">
                        ${item.adv_title}
                      </c:if>
                    </td>
                    <%--
                    <td><span>${item.adv_title}</span></td>
                    --%>
                    <td>${item.jobType}</td>
                    <td>${item.workingType}</td>
                    <td><span>${item.technology}</span></td>
                    <td><span>${item.capacity}</span></td>
                    <td hidden><span>${item.duration} Weeks</span></td>
                    <td><span>${item.stipend}</span></td>
                    <td hidden><span>${item.start_date}</span></td>
                    <td>
                      <c:if test="${fn:length(item.description) > 25}">
                        <c:set
                          var="shortDescription"
                          value="${fn:substring(item.description, 0, 15)}"
                        />
                        ${shortDescription}
                        <a
                          href="javascript:void(0);"
                          onclick="readmore('${item.description}');"
                          style="font-size: 11px"
                        >
                          read more..
                        </a>
                      </c:if>
                      <c:if test="${fn:length(item.description) <= 25}">
                        <span>${item.description}</span>
                      </c:if>
                    </td>

                    <td><span>${item.requirement}</span></td>
                    <td><span>${item.location}</span></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
       
</div>
      <div class="modal fade" id="comp_advt_details_modal" role="dialog">
        <div class="modal-dialog" style="width: 750px">
          <!-- Modal content-->
          <div class="modal-content">
            <div class="panel-heading">
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
   <div class="modal fade" id="advertisementModal" tabindex="-1" role="dialog" aria-labelledby="advertisementModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content shadow-lg border-0">
      <div class="modal-header text-black">
        <h5 class="modal-title" id="advertisementModalLabel">
          <i class="fas fa-bullhorn mr-2"></i> Add Advertisement
        </h5>
        <button type="button" class="close text-black" data-dismiss="modal" aria-label="Close" onclick="closeAdvertisementModal()">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body p-4">
        <form id="schedform" action="${pageContext.request.contextPath}/add_advertisment" method="post" onsubmit="return validateAdvertisementForm();">
          <!-- Hidden Inputs -->
          <input type="hidden" name="id" id="advertisement_id" value="" />
          <input type="hidden" name="companyId" id="company_id" value="${user.id}" />
          <input type="hidden" name="companyName" id="companyName" value="${user.username}" />
          <!-- Advertisement Details -->
          <h6 class="mb-3 text-primary font-weight-bold">Advertisement Details</h6>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label><i class="fas fa-heading"></i> Title *</label>
              <input type="text" name="adv_title" id="adv_title" class="form-control" maxlength="50" placeholder="Advertisement title">
            </div>
            <div class="form-group col-md-4">
              <label><i class="fas fa-cogs"></i> Skill *</label>
              <select class="form-control" id="technology_name" name="technology_name" multiple style="height: 100px;">
                <c:forEach var="tech" items="${allTechnology}">
                  <option value="${tech}">${tech}</option>
                </c:forEach>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label><i class="fas fa-users"></i> No. of Positions *</label>
              <input type="text" class="form-control" name="capacity" id="capacity" placeholder="e.g. 5">
              <span id="errmsgcap" style="color: red; display: none">Number Only</span>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-4">
              <label><i class="fas fa-clock"></i> Duration (Weeks) *</label>
              <input type="text" class="form-control" name="duration" id="duration" maxlength="15" placeholder="e.g. 6">
              <span id="errmsg"></span>
            </div>
            <div class="form-group col-md-4 d-none">
              <label>Start Date</label>
              <input type="date" name="start_date" id="startdate" class="form-control">
            </div>
            <div class="form-group col-md-4">
              <label><i class="fas fa-money-bill-wave"></i> Stipend</label>
              <input type="text" class="form-control" name="stipend" id="stipend" value="0.0" placeholder="e.g. 5000">
            </div>
            <div class="form-group col-md-4">
              <label><i class="fas fa-briefcase"></i> Job Type *</label>
              <select class="form-control" name="jobType" id="jobType" required>
                <option disabled selected>-- Select Job Type --</option>
                 <option value="Part Time">Part Time</option>
                  <option value="Full Time">Full Time</option>
              </select>
            </div>
            <div class="form-group col-md-4">
              <label><i class="fas fa-briefcase"></i> Working Type *</label>
              <select class="form-control" name="workingType" id="workingType" required>
                <option disabled selected>-- Select Working Type --</option>
                <option value="Work From Home">Work From Home</option>
                <option value="Hybrid">Hybrid</option>
                <option value="On Site">On Site</option>
              </select>
            </div>
            <div class="form-group col-md-4">
  <label><i class="fas fa-map-marker-alt"></i> Location</label>
  <input type="text" class="form-control" name="location" id="location" placeholder="Location">
</div>
            
          </div>
          <!-- Description and Requirements -->
          <h6 class="mt-4 text-primary font-weight-bold">Details</h6>
          <div class="form-row">
            <div class="form-group col-md-6">
              <label><i class="fas fa-align-left"></i> Description *</label>
              <textarea name="description" id="description" rows="4" class="form-control" placeholder="Describe the advertisement..."></textarea>
            </div>
            <div class="form-group col-md-6">
              <label><i class="fas fa-check-square"></i> Requirements</label>
              <select class="form-control" name="requirement" id="select_requirements" multiple style="height: 100px;">
                <option selected value="Any Field">Any Field</option>
                <c:forEach var="deptName" items="${deptName}">
                  <option value="${deptName}">${deptName}</option>
                </c:forEach>
              </select>
            </div>
          </div>
          <!-- Next Button -->
          <div class="form-group text-right mt-3">
            <input type="button" id="nxtbtn" class="btn btn-outline-primary" value="Next" onclick="showCompanyScheduleform($('#edited_comadv_id').val(), $('#edited_comadv_duration').val());">
          </div>
          <!-- Schedule Plan Section -->
          <div id="comp_schedule_form" style="display: none">
            <div class="border rounded p-3">
              <h5 class="text-center mb-4 text-secondary">Plan for Internship</h5>
              <div class="box-body" id="weekly_form">
                <table class="table table-bordered">
                  <thead id="weekly_thead">
                    <tr></tr>
                  </thead>
                  <tbody id="weekly_schd"></tbody>
                </table>
              </div>
              <input type="hidden" id="weekly_data_str" name="weekly_data_str" value="">
              <input type="hidden" id="getskipval" name="getskipval" value="">
              <div class="form-group text-right mt-3">
                <button type="button" class="btn btn-secondary mr-2" id="bckbtn" onclick="back()">Back</button>
                <button type="submit" class="btn btn-success" id="sbtn" onclick="saveadvdata()">Submit</button>
                <a href="#" id="skiplink" onclick="SkipSchdl_form()" class="btn btn-link ml-2">Skip</a>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
      <div class="modal fade" id="comp_advt_details_modal" role="dialog">
  <div class="modal-dialog modal-dialog-centered" style="max-width: 750px;">
    <div class="modal-content">
      <div class="panel-heading" style="background: #0f2c7eeb; padding: 8px 16px; color: white;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <span class="modal-title">Advertisement Description</span>
      </div>
      <div class="modal-body" style="max-height: 300px; overflow-y: auto;">
        <p id="advt_details" style="white-space: pre-wrap;"></p>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

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
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
 
 <script >
 
 document.addEventListener('DOMContentLoaded', function () {
	  const nextButton = document.getElementById('nxtbtn');
	  
	  // Ensure the button is always enabled
	  if (nextButton) {
	    nextButton.disabled = false; // Explicitly enable it
	  }
	});

 
 </script>
  <script>
  
  function validateAdvertisementForm() {
	  const advTitle = document.getElementById("adv_title").value.trim();
	  const technologyNameSelect = document.getElementById("technology_name");
	  const selectedTechnologies = Array.from(technologyNameSelect.options)
	    .filter(option => option.selected)
	    .map(option => option.value);
	  const capacity = document.getElementById("capacity").value.trim();

	  if (!advTitle) {
	    Swal.fire({
	      icon: 'error',
	      title: 'Validation Error',
	      text: 'Advertisement Title is required.',
	    });
	    return false;
	  }

	  if (selectedTechnologies.length === 0) {
	    Swal.fire({
	      icon: 'error',
	      title: 'Validation Error',
	      text: 'Please select at least one technology.',
	    });
	    return false;
	  }

	  if (!capacity || isNaN(capacity) || parseInt(capacity) <= 0) {
	    Swal.fire({
	      icon: 'error',
	      title: 'Validation Error',
	      text: 'Number of Positions is required and must be a positive number.',
	    });
	    return false;
	  }

	  // Add any additional validation here
	  return true; // Submit the form if validation passes
	}

  
  function editAdvertisements(
		  id, advTitle, technology,jobType,workingType, capacity, duration, stipend, startDate, description, requirement, location
		) {
		  resetAdvertisementForm(); // Clear the form before populating

		  // Populate the form fields
		  $('#advertisement_id').val(id);
		  $('#adv_title').val(advTitle);
		  $('#technology_name').val(technology.split(',')); // Split if multiple values
		  $('#capacity').val(capacity);
		  $('#duration').val(duration);
		  $('#stipend').val(stipend);
		  $('#startdate').val(startDate);
		  $('#description').val(description);
		  $('#select_requirements').val(requirement.split(',')); // Split if multiple values
		  $('#location').val(location);

		  $('#jobType').val(jobType);
		  $('#workingType').val(workingType);
		  // Update Modal Title
		  $('#advertisementModalLabel').text('Edit Advertisement');

		  // Show Advertisement Form and Hide Schedule Form
		  $('#comp_adv_form').show();
		  $('#comp_schedule_form').hide();

		  // Open the Modal
		  $('#advertisementModal').modal('show');
		}

  
  function resetAdvertisementForm() {
	  // Reset form fields
	  $('#schedform')[0].reset();

	  // Clear dynamic content
	  $('#weekly_thead').empty();
	  $('#weekly_schd').empty();
	  $('#weekly_data_str').val('');
	  $('#getskipval').val('');

	  // Set default values if needed
	  $('#stipend').val('0.0');

	  // Show Advertisement Form and Hide Schedule Form
	  $('#comp_adv_form').show();
	  $('#comp_schedule_form').hide();

	  // Update Modal Title
	  $('#advertisementModalLabel').text('Add Advertisement');
	}

  
  
  function openAdvertisementModal() {
	  $('#advertisementModal').modal('show'); // For Bootstrap
	}

	function closeAdvertisementModal() {
	  $('#advertisementModal').modal('hide'); // For Bootstrap
	}

  </script>
  
  
    <script type="text/javascript">
      function setRejection_id(id) {
        $("#txt_request_id").val(id);
      }
      function rejectReqId(req_id) {
        $("#rejection_id").val(req_id);
      }

      function assigned_test(request_id, student_id) {
        $.ajax({
          type: "GET",
          url: "getAssignedTestName?request_id=" + request_id,
          success: function (response) {
            $("#student_test_id").val(response[0]);
            $("#test_name_" + student_id).text(response[1]);
            $(".assigned_test_name" + request_id).tooltip({
              title: response[1],
            });
          },
          error: function () {
            alert("not assigned");
          },
        });
      }
      $(".date-picker").datepicker({
        autoclose: true,
        format: "yyyy-mm-dd",
        startDate: new Date(),
        todayHighlight: true,
      });

      $("#comp_adv_form").hide();
      function showAdversementForm() {
        $("#schedform").trigger("reset");
        document.getElementById("technology_name").selectedIndex = -1;
        $("#nxtbtn").prop("disabled", true);
        $("#comp_schedule_form").hide();
        $("#comp_adv_form").show();
        $(".content-wrapper").animate(
          { scrollTop: $(document).height() },
          1000
        );
      }
      function closeForm() {
        $("#schedform").trigger("reset");
        document.getElementById("technology_name").selectedIndex = -1;
        $("#comp_adv_form").hide();
        $("#comp_schedule_form").hide();
      }

      function SkipSchdl_form() {
        $("#comp_schedule_form").hide();
        $("#nxtbtn").replaceWith(
          '<input type="submit" id="skip_sbtn" onclick="getdataskip()" class="btn btn-primary pull-right" value="Submit"/>'
        );
        $("#comp_adv_form").show();
      }

      function type_of_schedule(adv_id, duration) {
        console.log("working");
        var advertisement_id = adv_id;
        $.ajax({
          type: "GET",
          url: "getInternshipByAdv_id?adv_id=" + advertisement_id,
          success: function (response) {
            console.log("response" + response);
            if (response == "D") {
              $("#chk_daily").prop("checked", true);

              $("#weekly_form").hide();
              var duration_val = document.getElementById("duration").value;
              var tab = document.getElementById("test_daily");
              while (tab.hasChildNodes()) {
                tab.removeChild(tab.lastChild);
              }
              for (var i = 1; i <= duration_val; i++) {
                $("#test_daily").append("<tr>");
                $("#test_daily").append(
                  '<td style="font-weight: bold;">#' + i + "</td>"
                );
                for (j = 1; j <= 7; j++) {
                  $("#test_daily").append(
                    '<td><textarea onkeyup="testempty()"  maxlength="45" style="width:125px" id="D' +
                      i +
                      "" +
                      j +
                      '"></textarea></td>'
                  );
                  $("#test_daily").append("</tr>");
                }
              }

              $.ajax({
                type: "GET",
                dataType: "json",
                url: "getInternshipScheduleByAdv_id?adv_id=" + advertisement_id,
                success: function (response) {
                  for (var i = 0; i < response.internshipSchedule.length; i++) {
                    schedule_1 =
                      '{"' + response.internshipSchedule[i].schedule_1 + '"}';
                    schedule_2 =
                      '{"' + response.internshipSchedule[i].schedule_2 + '"}';
                    schedule_3 =
                      '{"' + response.internshipSchedule[i].schedule_3 + '"}';
                    schedule_4 =
                      '{"' + response.internshipSchedule[i].schedule_4 + '"}';

                    $.each($.parseJSON(schedule_1), function (k, v) {
                      $("#" + k).val(v);
                    });
                    $.each($.parseJSON(schedule_2), function (k, v) {
                      $("#" + k).val(v);
                    });
                    $.each($.parseJSON(schedule_3), function (k, v) {
                      $("#" + k).val(v);
                    });
                    $.each($.parseJSON(schedule_4), function (k, v) {
                      $("#" + k).val(v);
                    });
                  }
                  $("#daily_form").show();
                },
                error: function () {},
              });
            } else if (response == "W") {
              $("#chk_weekly").prop("checked", true);
              var week_1 = "",
                week_2 = "",
                week_3 = "",
                week_4 = "";

              $("#daily_form").hide();
              var duration_val = document.getElementById("duration").value;
              var tab = document.getElementById("test_weekly");
              while (tab.hasChildNodes()) {
                tab.removeChild(tab.lastChild);
              }
              for (var i = 1; i <= duration_val; i++) {
                $("#test_weekly").append("<tr>");
                $("#test_weekly").append(
                  '<td style="font-weight: bold;">#' + i + "</td>"
                );
                for (j = 1; j <= 1; j++) {
                  $("#test_weekly").append(
                    '<td><textarea onkeyup="testempty()" maxlength="345" style="width:800px; margin-left: 10px; height: 65px;" id="W' +
                      i +
                      "" +
                      j +
                      '"></textarea></td>'
                  );
                  $("#test_weekly").append("</tr>");
                }
              }

              $.ajax({
                type: "GET",
                dataType: "json",
                url: "getInternshipScheduleByAdv_id?adv_id=" + advertisement_id,
                success: function (response) {
                  for (var i = 0; i < response.internshipSchedule.length; i++) {
                    week_1 = response.internshipSchedule[i].schedule_1
                      .replace(/\"/g, "")
                      .split(":");
                    week_2 = response.internshipSchedule[i].schedule_2
                      .replace(/\"/g, "")
                      .split(":");
                    week_3 = response.internshipSchedule[i].schedule_3
                      .replace(/\"/g, "")
                      .split(":");
                    week_4 = response.internshipSchedule[i].schedule_4
                      .replace(/\"/g, "")
                      .split(":");

                    $("#" + week_1[0]).val(week_1[1]);
                    $("#" + week_2[0]).val(week_2[1]);
                    $("#" + week_3[0]).val(week_3[1]);
                    $("#" + week_4[0]).val(week_4[1]);
                  }
                  $("#weekly_form").show();
                },
                error: function () {},
              });
            }
          },
          error: function () {
            //alert('error');
          },
        });
      }

      function readmore(val) {
        $("#advt_details").text(val);
        $("#comp_advt_details_modal").modal("show");
      }

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
      // Set the current date as the minimum date for the input field
      const interviewDateInput = document.getElementById("startdate");
      const today = new Date();
      const formattedDate = today.toISOString().split("T")[0]; // Format as YYYY-MM-DD
      interviewDateInput.min = formattedDate;
    </script>
    <script>
      function editAdvertisement(
        id,
        advTitle,
        technology,
        capacity,
        duration,
        stipend,
        startDate,
        description,
        requirement,
        location
      ) {
        // Set values for the fields in the hidden form
        document.getElementById("advertisement_id").value = id;
        document.getElementById("company_id").value = "CP0000000002"; // Change this to the actual company ID
        document.getElementById("adv_title").value = advTitle;
        document.getElementById("technology_name").value = technology;
        document.getElementById("capacity").value = capacity;
        document.getElementById("duration").value = duration;
        document.getElementById("startdate").value = startDate;
        document.getElementById("stipend").value = stipend;
        document.getElementById("description").value = description;

        var selectedTechnologies = technology.split(","); // Assuming technology is a comma-separated string
        var technologySelect = document.getElementById("technology_name");

        // Iterate through the options in the 'technology_name' select box and mark the selected ones
        for (var i = 0; i < technologySelect.options.length; i++) {
          technologySelect.options[i].selected = selectedTechnologies.includes(
            technologySelect.options[i].value
          );
        }

        // For multi-select box (requirements)
        var selectedRequirements = requirement.split(","); // Assuming requirement is a comma-separated string
        var selectRequirements = document.getElementById("select_requirements");
        for (var i = 0; i < selectRequirements.options.length; i++) {
          selectRequirements.options[i].selected =
            selectedRequirements.includes(selectRequirements.options[i].value);
        }

        // Show the hidden form
        document.getElementById("comp_adv_form").style.display = "block";
        $.ajax({
          type: "GET",
          url: "editCompAdvertisement?adv_id=" + id,
          async: false, // Note: "asynch" corrected to "async"
          success: function (response) {
            // Handle the response here
            console.log("Success! Response:", response);
            // Do something with the response
          },
          error: function (xhr, status, error) {
            // Handle errors here
            console.error("Error:", error);
          },
        });
      }
      function setSkipValue() {
        console.log("sjsjsj");

        document.getElementById("getskipval").value = "no";
      }
    </script>
  </body>
</html>
