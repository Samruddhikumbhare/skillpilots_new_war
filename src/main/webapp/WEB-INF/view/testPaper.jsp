<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@include file="user_session.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SkillPilots | Online Test</title>

<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/dist/dash/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/dist/dash/vendors/images/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.css" integrity="sha512-qGaAtuKvSCWSaqGi3MX0T+h3SYcOUlrwpURUWgIgCsLQ92cBVzNCDtIvvB0/NDawwH2RcHAYvzEYS25+jzMTnQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f1f1f1;
	font-size:18px;
}

#regForm {
	background-color: #ffffff;
	margin: 30px 20 20px 45px;
	font-family: Raleway;
	padding: 0px;
	width: 50%;
	min-width: 300px;
}

h1 {
	text-align: center;
}

input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
	display: none;
	min-height: 300px;
}

button {
	background-color: #4CAF50;
	color: #ffffff;
	border: none;
	padding: 5px 10px;
	font-size: 17px;
	font-family: Raleway;
	cursor: pointer;
	margin-top: 10px;
}

button:hover {
	opacity: 0.8;
}

#prevBtn {
	background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}

.step.active {
	opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #4CAF50;
}

.secHeading {
	background-color: #6dbdec;
	color: white;
	padding: 10px;
	font: inherit;
	font-size: 21px;
	margin-bottom: 10px;
}

.rightContent {
	float: right;
	margin-right: 20px;
	font-family: inherit;
	font-weight: bold;
}
 .radio label {
    display: block;
}

.radio input[type="radio"] {
    margin-right: 5px;
    margin-top:5px;
}

/* Move radio buttons in front of options */
.radio input[type="radio"]+label {
    display: inline-block;
}
.radio input[type="radio"]+label {
    display: inline-block;
}
</style>
</head>
<%@include file="header.jsp"%>
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
		
	<div class="left-side-bar">
		<div class="brand-logo">
			
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
				</ul>
			</div>
		</div>
	</div>
	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="javascript:;"> <img
				src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg' alt="" class="dark-logo"> 
				<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg' alt="" class="light-logo">
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
				<h2 class="h3 mb-0"
					style="background: #0f2c7eeb; color: white; border-radius: 5px;">
					<span>SkillPilots Test</span>
				</h2>
			</div>

			<div class="row">
				<div class="col-xl-12 mb-30">
					<div class="card-box height-100-p pd-20">
						<div style="margin-top: 20px;">
							<span class="notif-head" style="margin-left: 20px;font-size:24px;margin-bottom: 15px;"><b>SkillPilots
								Test</b></span> <span class="Timer rightContent"></span> <span
								class="rightContent">Total Marks : 
								${companyTest.total_marks}</span> <input type="hidden" id="testdataid"
								value="${test_data_id}"> <input type="hidden"
								id="current_page" value="${currentPage}">
							<hr style="margin: 0px !important">
						</div>
						<form id="regForm" action="#">
				<!-- One "tab" for each step in the form: -->
				<div class="secHeading">
					<span id="spanSecName">${testSections[0].section_name}</span>
				</div>
				<c:set var="marksPerQ" value="${companyTest.mark_per_ques}"/>
			 <c:forEach var="sec" items="${testSections}" varStatus="sCount">
            <div class="qSectionDiv" id="${sec.section_id}">
                <c:set var="questions" value="${questionSet[sec.section_name]}" />
                <c:if test="${testType.mark_ques eq 'S'}">
                    <c:set var="marksPerQ" value="${sec.mark_per_ques}" />
                </c:if>
                <c:forEach var="que" items="${questions}" varStatus="count">
                    <c:if test="${testType.mark_ques eq 'T'}">
                        <c:set var="marksPerQ" value="${que.mark_per_ques}" />
                    </c:if>
                    
                    <div class="tab" id="${que.questionId}/${sec.section_name}">
                        <span><strong>Q.${count.index + 1} :</strong> ${que.question}</span>
                        <br>
                        <c:if test="${not empty que.optionA}">
                            <div class="radio" style="margin-top: 20px;">
                             <div class="row">
                            <div class="col-md-2">
                                <input type="radio" name="${que.questionId}" id="radio_a_${que.questionId}" value="A/${marksPerQ}/${que.ans}">
                                 </div>
                                <div class="col-md-10">
                                <label for="radio_a_${que.questionId}">${que.optionA}</label>
                                 </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty que.optionB}">
                            <div class="radio">
                            <div class="row">
                            <div class="col-md-2">
                                <input type="radio" name="${que.questionId}" id="radio_b_${que.questionId}" value="B/${marksPerQ}/${que.ans}">
                                </div>
                                <div class="col-md-10">
                                <label for="radio_b_${que.questionId}">${que.optionB}</label>
                                </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty que.optionC}">
                            <div class="radio">
                            <div class="row">
                            <div class="col-md-2">
                                <input type="radio" name="${que.questionId}" id="radio_c_${que.questionId}" value="C/${marksPerQ}/${que.ans}">
                                </div>
                                <div class="col-md-10">
                               <label for="radio_c_${que.questionId}">${que.optionC}</label>
                               </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty que.optionD}">
                            <div class="radio">
                            <div class="row">
                            <div class="col-md-2">
                                <input type="radio" name="${que.questionId}" id="radio_d_${que.questionId}" value="D/${marksPerQ}/${que.ans}">
                                 </div>
                                <div class="col-md-10">
                                <label for="radio_d_${que.questionId}">${que.optionD}</label>
                                </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
				<div style="overflow: auto;">
					<div style="float: left;">
						<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
						<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
					</div>
					<div style="float: right;">
						<button type="button" id="finishBtn" onclick="submitTest('n')">Finish
							Test</button>
					</div>
				</div>
			</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--End Content Wrapper. Contains page content-->
<%@include file="footer.jsp"%>
	<%@include file="modal_common.jsp"%>
	<%@include file="testResult.jsp"%>
	<%@include file="testRules.jsp"%>
	<!-- footer-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.js" integrity="sha512-rmeGgGFs1GsDm4pB4vQNn7ZJLQv9s8gVlaEbn+u+k+nKU0UVyRcEsfrNXxOZ6Wznx4oOOYfUCWUhmsFuc2PAbw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/userDetails.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/common.js"></script>
	<script src="https://unpkg.com/sweetalert/style/dist/sweetalert.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/showmore_or_showless.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/internship_schedule.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/js/myjs/companyadvforcollege.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/core.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/script.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/process.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/layout-settings.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/apexcharts/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/style/dist/dash/vendors/scripts/dashboard3.js"></script>
	<script type="text/javascript">
		$('#testRulesModal').modal({
		    backdrop: 'static',
		    keyboard: false
		});
		
		$("#test_ins_total_ques").text(${companyTest.total_ques});
		$("#test_ins_total_marks").text(${companyTest.total_marks});
		$("#testRulesModal").modal("show");
		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the crurrent tab
		var testTime = '${testType["time"]}';
		var testSec = ${testSecJson};
		var qSet = ${qSetJson};
		var qMap = ${qMapJson};
		var currentSection = $("#spanSecName").text();
		var start = new Date;
		var min = 0;
		
		if (testTime == 'T') {
			min = parseInt('${companyTest["test_time"]}') - 1;
		} else if (testTime == 'S') {
			min = testSec[currentSection].section_time - 1;
		} else {
			min = qSet[currentSection][0].ques_time - 1;
		}
		var sec = 59;
		//alert(testSec[currentSection].section_name+"   "+testSec[currentSection].section_time);
		//alert(qSet[currentSection][0].optionA+"   "+qSet[currentSection][0].ques_time);

		var currentTab = 0; // Initialize current tab index

function nextPrev(n) {
    var x = document.getElementsByClassName("tab");
    x[currentTab].style.display = "none"; // Hide current tab

    currentTab += n; // Update current tab index
    console.log("ssdd "+currentTab)
    if (currentTab >= x.length) {
        currentTab = x.length - 1;
    } else if (currentTab < 0) {
        currentTab = 0;
    }

    var s = x[currentTab].id.split("/");
    // Update section name display
    $("#spanSecName").text(s[1]);

    if (testTime == 'S') {
        if (currentSection != s[1]) {
            min = testSec[currentSection].section_time - 1;
            sec = 59;
        }
    }
    if (testTime == 'Q') {
        min = qMap[s[0]].ques_time - 1;
        sec = 59;
    }

    showTab(currentTab); // Display the selected tab
}

function showTab(n) {
    var x = document.getElementsByClassName("tab");
    x[n].style.display = "block"; // Show the selected tab

    var nextBtn = document.getElementById("nextBtn");
    // Hide next button if the last tab is reached
    if (n == (x.length - 1)) {
        nextBtn.style.display = "none";
    } else {
        nextBtn.style.display = "inline";
    }
}



		
var min = 5; // Starting with 5 minutes
var sec = 0; // Start with 0 seconds
var stopwatch;

function startTimer() {
    stopwatch = setInterval(setTime, 1000);
}

function setTime() {
    sec -= 1;
    if (sec < 0) {
        sec = 59;
        min -= 1;
    }
    if (min == 1 && sec == 0) {
        $(".Timer").css("color", "red");
    }
    if (min == 0 && sec == 0) {
        clearInterval(stopwatch);
        alert("Your time is up.");
        // Add logic here to handle when time is up
    }
    
    // Format seconds with leading zero if necessary
    var second = ("0" + sec).slice(-2);
    
    // Update the timer display
    $(".Timer").text("Time Left: " + min + ":" + second);
}

function startTest() {
    $("#testRulesModal").modal("show");
    $("#testRulesModal").modal("hide");
    $.ajax({
        url: 'updateTestData',
        type: 'get',
        data: {
            "test_data_id": $("#testdataid").val(),
            "status": 'D'
        },
        success: function(response) {
            // Success function code here
        },
        error: function(err) {
            console.log(err);
        }
    });
    
    // Start the timer
    startTimer();
}

// Call startTest() function to initiate the test and start the timer
startTest();


		//disqualified if window mininize or tab changed
		document.addEventListener("visibilitychange", function() {
			if (stopwatch) {
				if (document.visibilityState == 'hidden') {
					clearInterval(stopwatch);
					stopwatch = false;
					submitTest('D');
				}
			}
		}, false);

		//check for page refresh.
		if (window.performance) {
			console.info("window.performance works fine on this browser");
		}
		if (performance.navigation.type == 1) {
			if (stopwatch) {
				clearInterval(stopwatch);
				stopwatch = false;
				submitTest(test_disqualified);
			}
			console.info("This page is reloaded");
			//if student refresh test student is disqualified and redirect current page
			if($("#current_page").val() == 'rs'){  //rs Requests Status's 
				window.location = 'appliedCompanies';
			}else if($("#current_page").val() == 'th'){ // th Test History
				window.location = 'stud_testHistory';
			}
			
			
		} else {
		}

		 function submitTest(testStatus) {
        clearInterval(stopwatch);
        stopwatch = false;
        if (testStatus == 'w') {
            $.ajax({
                url: 'submitTest?',
                type: 'get',
                data: {
                    "test_data_id": $("#testdataid").val(),
                    "testStatus": testStatus
                },
                success: function(response) {
                    if (response == null || response == '') {
                        alert("You are disqualified.");
                        window.location = 'appliedCompanies';
                    }
                },
                error: function(err) {
                    console.log(err);
                }
            });
        } else {
            var x = document.getElementsByClassName("tab");
            var sections = document.getElementsByClassName("qSectionDiv");
            var ansSet = {};
            for (var i = 0; i < sections.length; i++) {
                var sec_id = sections[i].id;
                var childDivs = $("#" + sec_id).children(".tab");
                var qAns = {};
                for (var j = 0; j < childDivs.length; j++) {
                    var val = 'none';
                    var radioName = $(childDivs[j]).attr('id').split("/")[0];
                    if ($("input[name='" + radioName + "']:checked").length) {
                        val = $("input[name='" + radioName + "']:checked")
                            .val();
                    }
                    qAns[radioName] = val;
                }
                ansSet[sec_id] = qAns;
            }
            console.log(JSON.stringify(ansSet));
            $("#nextBtn").prop('disabled', true);
            $("#finishBtn").prop('disabled', true);
            $("#divLoading").show();
            $.ajax({
                url: 'submitTest',
                type: 'get',
                data: {
                    "test_data_id": $("#testdataid").val(),
                    "testStatus": 'C',
                    "ans": JSON.stringify(ansSet)
                },
                success: function(response) {
                    var form = '<input type="hidden" name="correctAns" value="' + response.correctAns + '">';
                    form += '<input type="hidden" name="wrongAns" value="' + response.wrongAns + '">';
                    form += '<input type="hidden" name="noAns" value="' + response.noAns + '">';
                    form += '<input type="hidden" name="outof" value="' + response.outof + '">';
                    form += '<input type="hidden" name="totalMarks" value="' + response.totalMarks + '">';
                    form += '<input type="hidden" name="testResult" value="' + response.testResult + '">';
                    $('<form action="view_test_result" method="POST">' + form + '</form>').appendTo('body').submit();
					window.location = 'appliedCompanies';

                },
                error: function(err) {
                    console.log(err);
                }
            });
        }
    }
		
		
		// function startTest(){
			
		// 	$("#testRulesModal").modal("show");
		// 	$("#testRulesModal").modal("hide");
		// 	$.ajax({
		// 		url : 'updateTestData',
		// 		type : 'get',
		// 		data : {
		// 			"test_data_id" : $("#testdataid").val(),
		// 			"status" : 'D'
		// 		},
		// 		success : function(response) {
		// 		},
		// 		error : function(err) {
		// 			console.log(err);
		// 		}
		// 	});
			
		// 	startTimer();
		// }
		function cancelTest(){
			window.location="stud_testHistory";
		};
		$('#testResultModal').on('hidden.bs.modal', function () {
			window.location="stud_home";
			});
	</script>
</body>
</html>
