<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>SkillPilots | Internship Requests</title>

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
    </style>
    <style type="text/css">
      .sidebar-menu .dropdown-toggle {
        padding: 15px 12px 15px 54px !important;
        font-size: 15px !important;
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
        <div class="title pb-20 text-center">
          <h5
            class="h4 mb-0 text-center"
            style="
              background: #0f2c7eeb;
              color: white;
              border-radius: 4px;
              padding: 4px 16px 4px 16px;
            "
          >
            Internship's Request
          </h5>
        </div>
        <div class="card-box mb-30">
          <div class="pd-20">
            <table class="data-table table hover table">
              <thead>
                <tr>
                  <th>Request ID</th>
                  <th>Company Name</th>
                  <th>Request Date</th>
                  <th>Interns Group</th>
                  <th>Expiration Date</th>
                  <th>Status</th>
                  <th>Request Message</th>
                </tr>
              </thead>
              <tbody id="tablist">
                <!-- today Date -->
                <jsp:useBean id="now" class="java.util.Date" />
                <c:forEach items="${external_request}" var="external_request">
                  <tr>
                    <td>REQID${external_request[0]}</td>
                    <td>
                      <span class="cmpname" id="${external_request[12]}"
                        >${external_request[13]}</span
                      >
                    </td>
                    <td>${external_request[3]}</td>
                    <td>
                      <span
                        class="pointer intrngrp"
                        onclick="studentId(this);"
                        data-toggle="modal"
                        data-target="#all_interns_details"
                        id="${external_request[4]}"
                        ><strong>Group Details</strong></span
                      >
                    </td>
                    <td>${external_request[11]}</td>
                    <td>
                      <c:if test="${external_request[5] eq 'C'}">
                        <b
                          ><span
                            style="
                              font-size: 16px;
                              color: red;
                              margin-left: 10px;
                            "
                            class="Rcolor"
                            >Canceled</span
                          ></b
                        >
                      </c:if>
                      <c:if test="${external_request[5] eq 'P'}">
                        <c:if
                          test="${external_request[5] eq 'P' && now ge external_request[11]}"
                        >
                          <b><span class="Rcolor">Canceled Request </span></b>
                        </c:if>

                        <c:if
                          test="${external_request[5] eq 'P' && now le external_request[11]}"
                        >
                          <b><span>Pending</span></b>
                          <span
                            title="Cancel Request?"
                            class="fa fa-close pointer"
                            style="
                              font-size: 16px;
                              color: red;
                              margin-left: 10px;
                            "
                            onclick="cancledReq('${external_request[0]}');"
                          ></span>
                        </c:if>
                      </c:if>
                      <c:if
                        test="${external_request[5]  eq 'A' || external_request[5] eq 'S' }"
                      >
                        <b><span>Approved</span></b>
                      </c:if>
                      <c:if
                        test="${external_request[5]  eq 'R' && now le external_request[11]}"
                      >
                        <b
                          ><span class="tooltip"
                            >Rejected<span class="tooltiptext"
                              >${external_request[7]}</span
                            ></span
                          ></b
                        >
                      </c:if>
                      <c:if
                        test="${external_request[5] eq ProjectConstants.request_cancelled_by_system}"
                      >
                        <b
                          ><span
                            style="
                              font-size: 16px;
                              color: red;
                              margin-left: 10px;
                            "
                            title="Internship started in some other company."
                            >Cancelled</span
                          ></b
                        >
                      </c:if>
                      <c:if test="${external_request[5] eq 'T'}">
                        <b><span title="">Test Assigned</span></b>
                      </c:if>
                    </td>
                    <td>${external_request[6]}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>

        <%@include file="modal.jsp"%> <%@include
        file="modalStudentDetails.jsp"%> <%-- <%@include
        file="comp_coll_details_modal.jsp"%> sk--%>
        <div
          class="footer-wrap pd-20 mb-20 card-box"
          style="position: fixed; bottom: 0%; width: 76%"
        >
          <i class="fa fa-copyright" style="font-size: 17px; color: red"></i>
          <script>
            document.write(new Date().getFullYear());
          </script>
          All Rights Reserved SkillPilots | Designed & Developed By
          <a
            href="https://www.cluematrix.com/"
            target="_blank"
            style="color: #2800b4"
            >Cluematrix</a
          >
          Technologies Pvt.Ltd.
        </div>
      </div>
    </div>
    
    
    <!-- js -->
    <%@include file="scriptfiles.jsp"%>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/external_internship_request_college.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
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
    <!-- Datatable Setting js -->
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
    <!-- bootstrap-tagsinput js -->
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/advanced-components.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </body>
</html>
