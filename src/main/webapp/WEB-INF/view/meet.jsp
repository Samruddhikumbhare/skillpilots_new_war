<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
<title>SkillPilots Meeting</title>
    <script src="https://meet.jit.si/external_api.js"></script>
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
    
    .watermark, .jitsi-logo, .powered-by {
            display: none !important;
        }
      .sidebar-menu .dropdown-toggle {
        padding: 15px 12px 15px 54px !important;
        font-size: 15px !important;
      }
      .table td {
        padding: 0.4rem;
      }
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
      .table-bordered {
        border: 0.5px solid #e9efee5c !important;
      }
      .table-bordered td,
      .table-bordered th {
        border: 0.5px solid #e9efee5c !important;
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
        <!-- Jitsi Meet will render here -->
        <div id="meet" style="width: 100%; height: 700px;"></div>
    </div>

    <script>
        // Initialize Jitsi Meet API
        const domain = "meet.jit.si"; // Use the public Jitsi server
        const options = {
            roomName: "SkillPilotsRoom", // Replace with your desired room name
            width: "100%",
            height: 700,
            parentNode: document.querySelector("#meet"),
            configOverwrite: {
                disableDeepLinking: true, // Disable app redirection prompts
            },
            interfaceConfigOverwrite: {
                SHOW_JITSI_WATERMARK: false, // Disables the Jitsi watermark in the video conferencing UI.
                SHOW_BRAND_WATERMARK: false, // Disables the branding watermark (if any custom branding was added).
                SHOW_POWERED_BY: false, // Hides the "Powered by Jitsi" text.
                SHOW_PROMOTIONAL_CLOSE_PAGE: false, // Prevents showing the promotional page after the meeting ends.
                DEFAULT_LOGO_URL: '${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg', 
                // Sets your custom logo. Make sure this path is accessible and points to your logo file.
                DEFAULT_WELCOME_PAGE_LOGO_URL: '' 
                // Removes the logo on the welcome page (if applicable).
            },

        };
        const api = new JitsiMeetExternalAPI(domain, options);

        // Optional: Add any event listeners if needed
        api.addEventListener('videoConferenceJoined', () => {
            console.log('Joined the meeting successfully!');
        });
    </script>
    <!-- js -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.debug.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/jspdf/addimage.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/jspdf/png.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/jspdf/zlib.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/jspdf/png_support.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/certificate.js"></script>
    s
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
    <!-- Datatable Setting js -->
    <!-- bootstrap-tagsinput js -->
    <script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
  </body>
</html>
