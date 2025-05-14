<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@include file="user_session.jsp" %>

            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>

            <head>
                <!-- Basic Page Info -->
                <meta charset="utf-8">
                <title>SkillPilots | Company Online Test</title>

                <!-- Site favicon -->
                <link rel="apple-touch-icon" sizes="180x180"
                    href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png">
                <link rel="icon" type="image/png" sizes="16x16"
                    href="${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico">

                <!-- Mobile Specific Metas -->
                <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

                <!-- Google Font -->
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                    rel="stylesheet">
                <!-- CSS -->
                <link rel="stylesheet" type="text/css"
                    href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
                <link rel="stylesheet" type="text/css"
                    href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.css">
                <link rel="stylesheet" type="text/css"
                    href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">
                <!-- bootstrap-touchspin css -->
                <link rel="stylesheet" type="text/css"
                    href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
                <link rel="stylesheet" type="text/css"
                    href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
                <link rel="stylesheet" type="text/css"
                    href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
                <link rel="stylesheet" type="text/css"
                    href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
                <!-- After jQuery -->
                <script src="path/to/jquery.mCustomScrollbar.concat.min.js"></script>

                <!-- Global site tag (gtag.js) - Google Analytics -->
                <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
                <script>
                    window.dataLayer = window.dataLayer || [];
                    function gtag() {
                        dataLayer.push(arguments);
                    }
                    gtag('js', new Date());

                    gtag('config', 'UA-119386393-1');
                </script>

                <style type="text/css">
                    .card-header-tabs {
                        margin-right: -.625rem;
                        margin-bottom: -.75rem;
                        margin-left: -.625rem;
                        border-bottom: inherit !important;
                    }

                    textarea.form-control {
                        height: 50%;
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
                        font-family: 'Inter', sans-serif;
                        border-radius: 1px;
                    }

                    .fade:not(.show) {
                        opacity: 1;
                    }

                    .table td {
                        font-size: 14px;
                        font-weight: 500;
                        padding: 0.7rem;
                        /*  line-height: 0.5rem; */
                        border-color: #f1f1f17d;
                    }

                    .t {
                        display: none;
                    }

                    /* Toggle switch styling */
                    .switch {
                        position: relative;
                        display: inline-block;
                        width: 34px;
                        height: 20px;
                    }

                    .switch input {
                        opacity: 0;
                        width: 0;
                        height: 0;
                    }

                    .slider {
                        position: absolute;
                        cursor: pointer;
                        top: 0;
                        left: 0;
                        right: 0;
                        bottom: 0;
                        background-color: #ccc;
                        transition: .4s;
                        border-radius: 34px;
                    }

                    .slider:before {
                        position: absolute;
                        content: "";
                        height: 14px;
                        width: 14px;
                        left: 3px;
                        bottom: 3px;
                        background-color: white;
                        transition: .4s;
                        border-radius: 50%;
                    }

                    input:checked+.slider {
                        background-color: #0099ff;
                    }

                    input:checked+.slider:before {
                        transform: translateX(14px);
                    }
                </style>
            </head>

            <body>
                <div class="pre-loader">
                    <div class="pre-loader-box">
                        <div class="loader-logo">
                            <img src="${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg"
                                alt="">
                        </div>
                        <div class='loader-progress' id="progress_div">
                            <div class='bar' id='bar1'></div>
                        </div>
                        <div class='percent' id='percent1'>0%</div>
                        <div class="loading-text">Loading...</div>
                    </div>
                </div>

                <%@include file="header.jsp" %>

                    <div class="right-sidebar">
                        <div class="sidebar-title">
                            <h3 class="weight-600 font-16 text-blue">
                                Layout Settings <span class="btn-block font-weight-400 font-12">User
                                    Interface Settings</span>
                            </h3>
                            <div class="close-sidebar" data-toggle="right-sidebar-close">
                                <i class="icon-copy ion-close-round"></i>
                            </div>
                        </div>
                        <div class="right-sidebar-body customscroll">
                            <div class="right-sidebar-body-content">
                                <h4 class="weight-600 font-18 pb-10">Header Background</h4>
                                <div class="sidebar-btn-group pb-30 mb-10">
                                    <a href="javascript:void(0);" class="btn btn-outline-primary header-white">White</a>
                                    <a href="javascript:void(0);"
                                        class="btn btn-outline-primary header-dark active">Dark</a>
                                </div>

                                <h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
                                <div class="sidebar-btn-group pb-30 mb-10">
                                    <a href="javascript:void(0);"
                                        class="btn btn-outline-primary sidebar-light">White</a> <a
                                        href="javascript:void(0);"
                                        class="btn btn-outline-primary sidebar-dark active">Dark</a>
                                </div>

                                <div class="reset-options pt-30 text-center">
                                    <button class="btn btn-danger" id="reset-settings">Reset
                                        Settings</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="left-side-bar">
                        <div class="brand-logo">
                            <a href="#">
                                <img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg'
                                    alt="Deskapp Logo" class="dark-logo">
                                <img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg'
                                    alt="Skillpilot Logo" class="light-logo">
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
                            <c:if test="${func_value eq ProjectConstants.func_status_func_value_on}">
                                <div class="title pb-20">
                                    <h5 class="h4 mb-0 text-center"><span
                                            style="background: #1b00ff;color: white;border-radius: 4px;padding: 4px 16px 4px 16px;">Your
                                            Online Tests</span>
                                        <span><button class="btn btn-primary btn-sm" onclick="ShowPaperSets()"
                                                title="Add more Tests"
                                                style="background: #1b00ff;color: white;border-radius: 4px;padding:5px 6px 6px 6px;float: right;"
                                                id="addbtn"><i class="fa fa-plus"></i>&nbsp;Create Test</button></span>
                                    </h5>
                                </div>
                                <div class="card-box mb-30 testdiv content">
                                    <div class="pd-20">
                                        <div style="">

                                        </div>

                                        <form modelAttribute="companytest" id="company_test"
                                            action="${pageContext.request.contextPath}/saveCompanyTestData"
                                            method="post" onsubmit="">
                                            <div class="col-xs-12" id="company_test_form">
                                                <div class="box">
                                                    <div class="box-body">
                                                        <span class="fa fa-close" onclick="closeForm();"
                                                            data-toggle="tooltip" data-placement="top"
                                                            title="Click Here To Close This Section" id="clsbtn"
                                                            style="float: right; cursor: pointer;color: red;"></span>
                                                    </div>
                                                    <div class="box-body">
                                                        <div class="row">
                                                            <input id="test_id" name="test_id" type="hidden" value="">
                                                            <div class="form-group col-md-6" style="width:40%;">
                                                                <label><b>Test Name</b></label><br>
                                                                <input id="test_name" name="test_name"
                                                                    style="height: 60%;"
                                                                    placeholder="Enter a name for the test"
                                                                    class="form-control" required="true" type="text"
                                                                    value="">
                                                            </div>
                                                            <div class="form-group col-md-3" style="width:20%;">
                                                                <label><b>Total Marks</b></label><br>
                                                                <input id="total_marks" name="total_marks"
                                                                    title="Enter total marks of the test" min="20"
                                                                    max="100" style="height: 60%;" type="number"
                                                                    class="form-control" required="true" value="0">
                                                            </div>
                                                            <div class="form-group col-md-3" style="width:20%;">
                                                                <label><b>Total Questions</b></label><br>
                                                                <input id="total_ques" name="total_ques"
                                                                    title="Enter total questions in the test" min="20"
                                                                    max="99" style="height: 60%;" type="number"
                                                                    class="form-control" required="true" value="0">
                                                            </div>
                                                        </div>
                                                        <h5
                                                            style="border-radius: 5px;text-align: center;background: #0073b7;color: white;margin: 10px 0;padding: 5px;">
                                                            <span>Test Setup</span></h5>
                                                        <div class="row text-center"
                                                            style="height:90px;text-align: center;">
                                                            <br>
                                                            <div class="form-group col-md-4"
                                                                style="background: #ecf0f4;border-radius: 14px;margin: 0px 0 0 28px;">
                                                                <label><b>Time (in minutes)</b></label><br>
                                                                <input type="radio" name="test_type_time" id="tst_time"
                                                                    value="T" required="">Test-wise
                                                                <input type="radio" name="test_type_time" id="sec_time"
                                                                    value="S">Section-wise

                                                                <input id="test_time" name="test_time"
                                                                    title="Enter Test time" min="30" max="120"
                                                                    style="display:none;height:34%;" type="number"
                                                                    class="form-control" value="0">
                                                            </div>
                                                            <div class="form-group col-md-3"
                                                                style="background: #ecf0f4;border-radius: 14px;margin: 0px 0 0 50px;">
                                                                <label><b>Cut-off Marks</b></label><br>
                                                                <input type="radio" name="test_type" id="tst_ct_marks"
                                                                    value="T" required="">Test-wise
                                                                <input type="radio" name="test_type" id="sec_ct_marks"
                                                                    value="S">Section-wise
                                                                <input id="cut_off" name="cut_off"
                                                                    title="Enter cut off marks" min="1" max="100"
                                                                    style="height: 34%;" type="number"
                                                                    class="form-control" value="0" required="">
                                                            </div>
                                                            <div class="form-group col-md-3"
                                                                style="background: #ecf0f4;border-radius: 14px;padding-bottom: 9px;margin: 2px 0 1px 45px;">
                                                                <label><b>Marks/Question</b></label><br>
                                                                <input type="radio" name="test_type_marks"
                                                                    id="tst_marks" value="T" required="">Test-wise
                                                                <input type="radio" name="test_type_marks"
                                                                    id="sec_marks" value="S">Section-wise

                                                                <input id="marks_per_ques" name="mark_per_ques"
                                                                    title="Enter Marks" min="1" max="20"
                                                                    style="display:none;height:34%;" type="number"
                                                                    class="form-control" value="0">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="status"
                                                        value="${ProjectConstants.company_test_status_inactive}">
                                                    <div class="box-body text-center">
                                                        <input type="submit" class="btn btn-success" id="test_submit"
                                                            value="Create Test" />
                                                    </div>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                                <div class="pd-20 card-boxcard card-box text-center">
                                    <div class="card-body">
                                        <ul class="nav nav-tabs card-header-tabs" role="tablist"
                                            style="background: #e8ecf0;">
                                            <c:forEach var="list_tab" items="${comTest_list}">
                                                <li id="tab_head_${list_tab.test_id}"
                                                    class="${status.index == 0 ? 'active' : ''}"
                                                    onclick="logTestId('${list_tab.test_id}')">

                                                    <a class="nav-link ${status.index == 0 ? 'active' : ''}"
                                                        data-toggle="tab" href="#tab_pane">
                                                        ${list_tab.test_name}
                                                    </a>
                                                    <input type="hidden" id="test_type_${list_tab.test_id}"
                                                        value='${list_tab.test_type}'>
                                                    <c:if test="${activeTest eq list_tab.test_id}">
                                                        <input type="hidden" id="upload_message"
                                                            value='${upload_message}'>
                                                    </c:if>
                                                </li>
                                            </c:forEach>

                                        </ul>


                                        <div class="tab-content">
                                            <c:forEach var="list_tab" items="${comTest_list}">
                                                <div id="tab_pane" class="tab-pane fade in "><br>


                                                    <center>
                                                        <h5 style="color:#1b00ff">Test Section Details</h5>
                                                    </center>
                                                    <table class="table table-bordered" style="margin-top: 7px;">

                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>Test Name</th>
                                                                <th>Total Marks</th>
                                                                <th>Total Question</th>
                                                                <th>Test Time</th>
                                                                <th>Cut off</th>
                                                                <th>Marks/Question</th>
                                                                <th>Actions</th>
                                                                <th>Active</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody id="cmptest_tablist">
                                                            <!-- <tr>
											<td>${list_tab.test_name}</td>
											<td id="${list_tab.test_id}_total_marks">${list_tab.total_marks}</td>
											<td id="${list_tab.test_id}_total_ques">${list_tab.total_ques}</td>
											<td>${list_tab.test_time}</td>
											<td>${list_tab.cut_off}</td>
											<td id="${list_tab.test_id}_mark_per_ques">${list_tab.mark_per_ques}</td>
											<td style="text-align:center;">
												<c:if test="${list_tab.status eq 'A'}">
													<span class="fa fa-pencil-square-o" style="font-size: 19px;color: #1b00ff;" id="${list_tab.test_id}"  
														title="An active test cannot be edited."></span></c:if>
												<c:if test="${list_tab.status eq 'I'}">
													<span class="fa fa-pencil-square-o" style="font-size: 19px;color: #1b00ff;" id="${list_tab.test_id}" 
														onclick="edit_Company_Test_Data('${list_tab.test_id}');"
														title="Click to edit Test format."></span></c:if>
											</td>
											<td style="text-align:center;">
												<label class="switch" style="margin-bottom: 0rem">
													<%-- <input type="checkbox" class="switch-btn" data-switchery="true" data-toggle="switch" id="${list_tab.test_id}_status"
														onclick="manage_Status(this,'${list_tab.test_id}')"
														<c:if test="${list_tab.status eq ProjectConstants.company_test_status_active}">
														checked </c:if>> --%>
														<input type="checkbox" class="switch-btn"
											data-size="small" data-color="#0099ff"
											style="display: none;" data-secondary-color="#28a745"
											data-switchery="true"
											onclick="manage_Status(this,'${list_tab.test_id}')"
											<c:if test="${list_tab.status eq 'A'}">
														checked </c:if>> 
										<span class="slider round"></span>
									</label>
											</td>
										</tr> -->
                                                        </tbody>
                                                    </table>

                                                    <p>
                                                        Total Number of Questions : <strong><span
                                                                id="ques_per_section_${list_tab.test_id}">${list_tab.total_ques}</span><span>/75</span></strong>
                                                    </p>
                                                    <table class="table table-bordered nowrap"
                                                        id="sec_table_${list_tab.test_id}"
                                                        style="margin-top: 7px;white-space: nowrap;">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>Section Name</th>
                                                                <th>Total Question</th>
                                                                <th>Section Time (Minutes)</th>
                                                                <th>Sectional cut off</th>
                                                                <th>Marks/Question</th>
                                                                <th id="id_check_${list_tab.test_id}">Questions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="section_details">

                                                        </tbody>

                                                    </table>

                                                    <div class="col-md-4" style="padding-left: 0px;">
                                                        <div id="xldownload${list_tab.test_id}"
                                                            style="display: none;background: #e9ecefc2;padding: 3px 10px 3px 10px;border-radius: 10px;"
                                                            class=" pull-left">
                                                            <span style="font-size: 12px; font-weight: 600">
                                                                * To add multiple Test Questions at once,
                                                                <br>Download, fill and upload the file from here.</span>
                                                            <br>
                                                            <a href="/uploadedxls/Online Test Questions.xlsx" class=""
                                                                style="padding: 0px !important;margin: 0 25% 0 0!important;"
                                                                download>
                                                                Download <i class="fa fa-download"></i>
                                                            </a>

                                                            <form method="post"
                                                                action="onlineTestQuestionsXL?testid=${list_tab.test_id}"
                                                                enctype="multipart/form-data" style="display:contents;">
                                                                <div class="btn"
                                                                    style="padding:0px !important;margin:0px !important;color:#0773c7"
                                                                    title="Please upload excel after filling the downloaded file from left hand side.">
                                                                    Upload <i class="fa fa-upload"></i>
                                                                    <input type="file" name="fileUpload"
                                                                        onchange="this.form.submit()"
                                                                        accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                                                                        style="position: absolute; font-size: 16px; opacity: 0; left:173px;width: 29%;" />
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" id="edit_test_id" value="">
                                                    <input type="hidden" id="marks_per_ques" value="">
                                                    <input type="hidden" id="cut_off" value="">
                                                    <input type="hidden" id="time" value="">
                                                    <div class="col-md-12" style="text-align:center">
                                                        <input type="button" id="sbtn" class="btn btn-primary "
                                                            onclick="sbtn()" value="Submit" />

                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <br>
                            <%@include file="modal_common.jsp" %>
                                <%@include file="modal_online_test.jsp" %>
                                    <%@include file="footer.jsp" %>
                        </div>
                    </div>
                    <!-- Include jQuery library if not already included -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

                    <!-- js -->
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>
                    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/alert.js"></script>
                    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
                    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/projectConstants.js"></script>
                    <script type="text/javascript"
                        src="${pageContext.request.contextPath}/style/dist/js/myjs/company_online_test.js"></script>
                    <script src="${pageContext.request.contextPath}/style/dist/js/myjs/form_elements.js"></script>
                    <script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.print.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.html5.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/buttons.flash.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/pdfmake.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/vfs_fonts.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/switchery/switchery.min.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/advanced-components.js"></script>
                    <script
                        src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/datatable-setting.js"></script>
                    <script>

                        function sbtn(testId) {

                            console.log(testId)
                            var testId = $('#edit_test_id').val(); // Get the test_id value

                            var sectionData = [];
                            $('#section_details tr').each(function () {
                                var secName = $(this).find('input[name^="sec_name"]').val();
                                var secTotalQues = $(this).find('input[name^="sec_total_ques"]').val();
                                var secTime = $(this).find('input[name^="sec_time"]').val();
                                var secCutoff = $(this).find('input[name^="sec_cutoff"]').val();
                                var secMarkQues = $(this).find('input[name^="sec_mark_ques"]').val();


                                if (secName) { // Assuming secName is mandatory for a row to be valid
                                    sectionData.push({
                                        testId: testId, // Use the same testId for all sections
                                        secName: secName,
                                        secTotalQues: secTotalQues,
                                        secTime: secTime,
                                        secCutoff: secCutoff,
                                        secMarkQues: secMarkQues,

                                    });
                                }
                            });

                            // AJAX call to your server-side script
                            $.ajax({
                                url: '${pageContext.request.contextPath}/insertsectiondata', // URL for your server-side script
                                type: 'POST',
                                contentType: 'application/json', // Specify content type as JSON
                                data: JSON.stringify(sectionData), // Convert sectionData array to JSON string
                                success: function (response) {
                                    // Show SweetAlert success message
                                    Swal.fire({
                                        title: "Success",
                                        text: "Sections added successfully!",
                                        icon: "success",
                                        confirmButtonText: "OK"
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            window.location.reload(); // Reload page on OK click
                                        }
                                    });
                                },
                                error: function (xhr, status, error) {
                                    // Show SweetAlert error message
                                    Swal.fire({
                                        title: "Error",
                                        text: "Error saving data",
                                        icon: "error",
                                        confirmButtonText: "OK"
                                    });
                                    console.error(error); // Log the error
                                }
                            });


                        };


                    </script>


                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                    <script>

                        async function logTestId(testId) {
                            console.log("Selected test ID:", testId);
                            var element = document.getElementById("edit_test_id");
                            if (element) {
                                element.value = testId;
                            } else {
                                console.log("Element with id 'edit_test_id' not found.");
                            }

                            try {
                                // First fetch request to get section data
                                const sectionResponse = await fetch('${pageContext.request.contextPath}/get_sec_data?testId=' + testId);
                                const existingData = await sectionResponse.json();
                                console.log("Section Data:", existingData);

                                let rowsHtml = '';
                                if (existingData && existingData.length > 0) {
                                    // Populate rows with existing data
                                    existingData.forEach(function (rowData) {
                                        rowsHtml += '<tr>' +
                                            '<td>' + rowData.secName + '</td>' +
                                            '<td>' + rowData.secTotalQues + '</td>' +
                                            '<td>' + rowData.secTime + '</td>' +
                                            '<td>' + rowData.secCutoff + '</td>' +
                                            '<td>' + rowData.secMarkQues + '</td>' +
                                            '<td style="text-align:center;white-space: nowrap;">' +
                                            '<span class="fa fa-plus-circle" onclick="show_ques_modal(' + rowData.section_id + ')" id="add_ques_btn" style="margin:0px 5px;background: #1b00ff;color: white;padding: 3px 5px 2px 5px;border-radius: 3px;" title="Click to add questions to this section."></span>' +
                                            '<span class="fa fa-pencil" onclick="edit_questions_modal(' + rowData.section_id + ')" style="background: #1b00ff;color: white;padding: 3px 4px 2px 4px;border-radius: 3px;" id="edit_ques_btn" title="Click to edit questions of this section."></span>' +
                                            '</td>' +
                                            '</tr>';
                                    });
                                } else {
                                    // Create blank rows if no data exists
                                    for (let i = 0; i < 5; i++) {
                                        rowsHtml += '<tr>' +
                                            '<td><input type="text" class="form-control" name="sec_name_' + i + '" id="sec_name_' + i + '" maxlength="20" onkeypress="return onlyAlphabets(event,this)"></td>' +
                                            '<td><input type="text" class="form-control" name="sec_total_ques_' + i + '" id="sec_total_ques_' + i + '" onkeypress="return isNumberKey(event)" maxlength="2"></td>' +
                                            '<td><input type="text" class="form-control" name="sec_time_' + i + '" id="sec_time_' + i + '" onkeypress="return isNumberKey(event)" maxlength="3"></td>' +
                                            '<td><input type="text" class="form-control" name="sec_cutoff_' + i + '" id="sec_cutoff_' + i + '" onkeypress="return isNumberKey(event)" maxlength="3"></td>' +
                                            '<td><input type="text" class="form-control" name="sec_mark_ques_' + i + '" id="sec_mark_ques_' + i + '" onkeypress="return isNumberKey(event)" maxlength="2"></td>' +
                                            '<td style="text-align:center;white-space: nowrap;">' +
                                            '<span id="no_of_ques_sec" style="font-weight:bold;background: #1b00ff;color: white;padding: 1px 5px 1px 5px;border-radius: 3px;">0</span>' +
                                            '<span class="fa fa-plus-circle" id="add_ques_btn" style="margin:0px 5px;background: #1b00ff;color: white;padding: 3px 5px 2px 5px;border-radius: 3px;" title="Click to add questions to this section."></span>' +
                                            '<span class="fa fa-pencil" style="background: #1b00ff;color: white;padding: 3px 4px 2px 4px;border-radius: 3px;" id="edit_ques_btn" title="Click to edit questions of this section."></span>' +
                                            '</td>' +
                                            '</tr>';
                                    }
                                }
                                // Insert rows into the section details table
                                $('#section_details').html(rowsHtml);

                                // Nested fetch request to get company test data
                                const companyTestResponse = await fetch('${pageContext.request.contextPath}/get_Company_Test_Data?id=' + testId);
                                const response = await companyTestResponse.json();
                                console.log("Received response:", response);

                                if (response) {
                                    var companyRowsHtml = '<tr>' +
                                        '<td>' + (response.test_name || '') + '</td>' +
                                        '<td>' + (response.total_marks || '') + '</td>' +
                                        '<td>' + (response.total_ques || '') + '</td>' +
                                        '<td>' + (response.test_time || '') + '</td>' +
                                        '<td>' + (response.cut_off || '') + '</td>' +
                                        '<td>' + (response.mark_per_ques || '') + '</td>' +
                                        //                 '<td style="text-align:center;white-space: nowrap;">' +
                                        // //'<span class="fa fa-plus-circle" onclick="show_ques_modal(' + (response.section_id || '') + ')" style="margin:0px 5px;background: #1b00ff;color: white;padding: 3px 5px 2px 5px;border-radius: 3px;" title="Click to add questions to this section."></span>' +
                                        //                  //   '<span class="fa fa-pencil" onclick="edit_questions_modal(' + (response.section_id || '') + ')" style="background: #1b00ff;color: white;padding: 3px 4px 2px 4px;border-radius: 3px;" title="Click to edit questions of this section."></span>' +
                                        //                 '</td>' +
                                        '<td style="text-align:center;">' +
                                        // Conditionally render edit icon based on the status
                                        (response.status === 'A'
                                            ? '<span class="fa fa-pencil-square-o" style="font-size: 19px;color: #1b00ff;" id="' + response.test_id + '" title="An active test cannot be edited."></span>'
                                            : '<span class="fa fa-pencil-square-o" style="font-size: 19px;color: #1b00ff;" id="' + response.test_id + '" onclick="edit_Company_Test_Data(\'' + response.test_id + '\');" title="Click to edit Test format."></span>') +
                                        '</td>' +
                                        '<td style="text-align:center;">' +
                                        '<label class="switch" style="margin-bottom: 0rem">' +
                                        '<input type="checkbox" class="switch-btn" ' +
                                        'data-size="small" data-color="#0099ff" ' +
                                        'data-secondary-color="#28a745" data-switchery="true" ' +
                                        'onclick="manage_Status(this, \'' + response.test_id + '\')" ' +
                                        (response.status === 'A' ? 'checked' : '') + '>' +
                                        '<span class="slider round"></span>' +
                                        '</label>' +
                                        '</td>'
                                        +
                                        '</tr>';

                                    // Populate the table with id 'cmptest_tablist'
                                    $('#cmptest_tablist').html(companyRowsHtml);
                                } else {
                                    console.log("No data found for the given test ID.");
                                }
                            } catch (error) {
                                console.error('Error fetching data:', error);
                            }
                        }

                        // Example call
                        //logTestId(test_id);

                    </script>
                    <!-- SweetAlert CDN -->
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script>
                        // Function to show the edit question modal

                        function edit_questions_modal(section_id) {
                            $('#edit_questions_modal').modal('show');

                            $.ajax({
                                type: 'GET',
                                url: '${pageContext.request.contextPath}/get_questions',
                                data: {
                                    section_id: section_id
                                },
                                success: function (response) {
                                    // Clear existing table data
                                    $('#edit_ques_details').empty();

                                    // Loop through the received data and add rows to the table
                                    for (var i = 0; i < response.length; i++) {
                                        var question = response[i];

                                        // Construct table row
                                        var row = $('<tr>');


                                        // JavaScript code to populate the table with hidden input fields for sectionId and questionId
                                        row.append($('<td class="t">').html('<input type="hidden" class="form-control " value="' + question.sectionId + '">'));
                                        row.append($('<td class="t">').html('<input type="hidden" class="form-control " value="' + question.questionId + '">'));

                                        row.append($('<td>').html('<input type="text" class="form-control" value="' + question.question + '">'));
                                        row.append($('<td>').html('<input type="text" class="form-control" value="' + question.optionA + '">'));
                                        row.append($('<td>').html('<input type="text" class="form-control" value="' + question.optionB + '">'));
                                        row.append($('<td>').html('<input type="text" class="form-control" value="' + question.optionC + '">'));
                                        row.append($('<td>').html('<input type="text" class="form-control" value="' + question.optionD + '">'));
                                        row.append($('<td>').html('<input type="text" class="form-control" value="' + question.quesTime + '">'));
                                        row.append($('<td>').html('<input type="text" class="form-control" value="' + question.mark_per_ques + '">'));
                                        row.append($('<td>').html('<input type="text" class="form-control" value="' + question.ans + '">'));
                                        row.append($('<td>').html('<button class="btn btn-danger" onclick="delQuestion(' + question.questionId + ')">X</button>'));


                                        // Append row to the table
                                        $('#edit_ques_details').append(row);
                                    }
                                },

                                error: function (xhr, status, error) {
                                    // Handle error here
                                    console.error(xhr.responseText);
                                }
                            });

                        }

                    </script>
                    <script>

                        // Function to show the modal
                        function show_ques_modal(section_id) {
                            $('#questions_modal').modal('show');

                            // Set the value of the input element with id 'section_id'
                            document.getElementById('section_id').value = section_id;

                            // Make AJAX request
                            $.ajax({
                                type: 'GET',
                                url: '${pageContext.request.contextPath}/get_questions',
                                data: {
                                    section_id: section_id
                                },
                                success: function (response) {

                                    console.log("Response:", JSON.stringify(response));
                                    // Clear existing rows
                                    $('#question_details').empty();

                                    // Iterate over the response data
                                    $.each(response, function (index, item) {
                                        // Create a new row
                                        var newRow = $('<tr>');

                                        // Add columns with data
                                        newRow.append('<td>' + item.question + '</td>');
                                        // Assuming options are available in the response data, modify this accordingly
                                        newRow.append('<td>' + item.optionA + '</td>');
                                        newRow.append('<td>' + item.optionB + '</td>');
                                        newRow.append('<td>' + item.optionC + '</td>');
                                        newRow.append('<td>' + item.optionD + '</td>');
                                        newRow.append('<td>' + item.quesTime + '</td>');
                                        newRow.append('<td>' + item.mark_per_ques + '</td>');
                                        newRow.append('<td>' + item.ans + '</td>');

                                        // Add a delete button as the last column
                                        newRow.append('<td><button onclick="delQuestion(' + item.questionId + ')" class="btn btn-danger">Delete</button></td>');

                                        // Append the new row to the table body
                                        $('#question_details').append(newRow);
                                    });
                                },

                                error: function (xhr, status, error) {
                                    // Handle error here
                                    console.error(xhr.responseText);
                                }
                            });
                        }


                    </script>


                    <script>
                        function insert_question() {
    var questionData = {
        sectionId: $("#section_id").val(),
        question: $("#id_question").val(),
        quesType: "SomeType", // Replace this as needed
        quesTime: $("#time_for_ques").val(),
        markPerQues: $("#mark_per_ques").val(),
        optionA: $("#option_for_ques_A").val(),
        optionB: $("#option_for_ques_B").val(),
        optionC: $("#option_for_ques_C").val(),
        optionD: $("#option_for_ques_D").val(),
        ans: $("input[name='ans']:checked").val()
    };

    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "${pageContext.request.contextPath}/questions",
        data: JSON.stringify(questionData),
        success: function (response) {
            console.log("Question saved successfully", response);

            // Append to table using + sign
            var newRow = "<tr>" +
                "<td>" + questionData.question + "</td>" +
                "<td>" + questionData.quesType + "</td>" +
                "<td>" + questionData.quesTime + "</td>" +
                "<td>" + questionData.markPerQues + "</td>" +
                "<td>" + questionData.optionA + "</td>" +
                "<td>" + questionData.optionB + "</td>" +
                "<td>" + questionData.optionC + "</td>" +
                "<td>" + questionData.optionD + "</td>" +
                "<td>" + questionData.ans + "</td>" +
            "</tr>";

            $("#ques_table").append(newRow); // Ensure your table <tbody> has this ID

            Swal.fire({
                title: "Success",
                text: "Question added successfully!",
                icon: "success",
                confirmButtonText: "OK"
            });

            // Clear form fields
            $("#id_question").val("");
            $("#time_for_ques").val("");
            $("#mark_per_ques").val("");
            $("#option_for_ques_A").val("");
            $("#option_for_ques_B").val("");
            $("#option_for_ques_C").val("");
            $("#option_for_ques_D").val("");
            $("input[name='ans']").prop("checked", false);
        },
        error: function (error) {
            console.log("Error saving question", error);
            Swal.fire({
                title: "Error",
                text: "Failed to add question!",
                icon: "error",
                confirmButtonText: "OK"
            });
        }
    });
}


                    </script>

                    <script>

                        function delQuestion(questionId) {
                            console.log("Question ID: " + questionId);

                            Swal.fire({
                                title: "Are you sure?",
                                text: "Do you really want to delete this question?",
                                icon: "warning",
                                showCancelButton: true,
                                confirmButtonColor: "#d33",
                                cancelButtonColor: "#3085d6",
                                confirmButtonText: "Yes, delete it!",
                                cancelButtonText: "Cancel"
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $.ajax({
                                        type: 'DELETE',
                                        url: '${pageContext.request.contextPath}/delquestions/' + questionId,
                                        success: function (response) {
                                            console.log('Record deleted successfully');
                                            Swal.fire(
                                                "Deleted!",
                                                "The question has been deleted.",
                                                "success"
                                            );
                                            // Optionally, hide the modal or refresh the table to reflect the deletion
                                            $('#edit_questions_modal').modal('hide');
                                        },
                                        error: function (xhr, status, error) {
                                            console.log("Error deleting question", error);
                                            Swal.fire(
                                                "Deleted!",
                                                "The question has been deleted.",
                                                "success"
                                            )

                                                .then((result) => {

                                                    location.reload(); // Reload the page on OK click

                                                });
                                        }
                                    });
                                }
                            });
                        }




                        function saveQuestions() {


                            var questions = [];

                            $('#edit_ques_details tr').each(function () {
                                var question = {
                                    sectionId: $(this).find('td:eq(0) input[type="hidden"]').val(),
                                    questionId: $(this).find('td:eq(1) input[type="hidden"]').val(),
                                    question: $(this).find('td:eq(2) input').val(),
                                    optionA: $(this).find('td:eq(3) input').val(),
                                    optionB: $(this).find('td:eq(4) input').val(),
                                    optionC: $(this).find('td:eq(5) input').val(),
                                    optionD: $(this).find('td:eq(6) input').val(),
                                    quesTime: $(this).find('td:eq(7) input').val(),
                                    markPerQues: $(this).find('td:eq(8) input').val(),
                                    ans: $(this).find('td:eq(9) input').val()
                                };
                                questions.push(question);
                            });

                            // Send this data to the backend
                            $.ajax({
                                url: '${pageContext.request.contextPath}/updateQuestions', // Update this URL to your actual update endpoint
                                type: 'POST',
                                contentType: 'application/json',
                                data: JSON.stringify(questions),
                                success: function (response) {
                                    alert('Questions updated successfully');
                                    $('#edit_questions_modal').modal('hide');
                                },
                                error: function (xhr, status, error) {
                                    console.error('Error updating questions: ' + xhr.responseText);
                                }
                            });
                        }

                    </script>
            </body>

            </html>