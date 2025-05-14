<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!DOCTYPE html>
		<html>

		<head>
			<!-- Basic Page Info -->
			<meta charset="utf-8">
			<title>SkillPilots | Student Dashboard</title>

			<!-- Site favicon -->
			<link rel="apple-touch-icon" sizes="180x180"
				href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/apple-touch-icon.png'>
			<link rel="icon" type="image/png" sizes="16x16"
				href='${pageContext.request.contextPath}/style/dist/dash/vendors/images/favicon.ico'>

			<!-- Mobile Specific Metas -->
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

			<!-- Google Font -->
			<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
				rel="stylesheet">
			<!-- CSS -->
			<link rel="stylesheet" type="text/css"
				href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/core.css'>
			<link rel="stylesheet" type="text/css"
				href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/icon-font.min.css'>
			<link rel="stylesheet" type="text/css"
				href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/dataTables.bootstrap4.min.css'>
			<link rel="stylesheet" type="text/css"
				href='${pageContext.request.contextPath}/style/dist/dash/src/plugins/datatables/css/responsive.bootstrap4.min.css'>
			<link rel="stylesheet" type="text/css"
				href='${pageContext.request.contextPath}/style/dist/dash/vendors/styles/style.css'>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/2.0.0/jquery-confirm.min.css"
				integrity="sha512-qGaAtuKvSCWSaqGi3MX0T+h3SYcOUlrwpURUWgIgCsLQ92cBVzNCDtIvvB0/NDawwH2RcHAYvzEYS25+jzMTnQ=="
				crossorigin="anonymous" referrerpolicy="no-referrer" />
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
				.sidebar-menu .dropdown-toggle {
					padding: 15px 12px 15px 54px !important;
					font-size: 15px !important;
				}

				.user-notification .dropdown-toggle .badge {
					position: absolute;
					right: 5px;
					top: 7px;
					/* background: #ffffff; */
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

				.pointer {
					cursor: pointer;
				}

				#style-3::-webkit-scrollbar {
					width: 6px;
					background-color: #F5F5F5;
				}

				#style-3::-webkit-scrollbar-thumb {
					background-color: #0f2c7eeb;
				}

				#div_location::-webkit-scrollbar-track {
					-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
					background-color: #F5F5F5;
				}

				#div_location::-webkit-scrollbar {
					width: 6px;
					background-color: #0f2c7eeb;
				}

				#div_location::-webkit-scrollbar-thumb {
					background-color: #0f2c7eeb;
				}

				#div_tech::-webkit-scrollbar-track {
					-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
					background-color: #F5F5F5;
				}

				#div_tech::-webkit-scrollbar {
					width: 6px;
					background-color: #F5F5F5;
				}

				#div_tech::-webkit-scrollbar-thumb {
					background-color: #0f2c7eeb;
				}

				#div_dept::-webkit-scrollbar-track {
					-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
					background-color: #F5F5F5;
				}

				#div_dept::-webkit-scrollbar {
					width: 6px;
					background-color: #F5F5F5;
				}

				#div_dept::-webkit-scrollbar-thumb {
					background-color: #0f2c7eeb;
				}

				hr {
					border-top-width: medium;
					background: #0f2c7eeb;
				}
			</style>


			<style>
				/* Optional: Animation */
				@-webkit-keyframes spin {
					0% {
						-webkit-transform: rotate(0deg);
					}

					100% {
						-webkit-transform: rotate(360deg);
					}

				}

				@keyframes spin {
					0% {
						transform: rotate(0deg);
					}

					100% {
						transform: rotate(360deg);
					}
				}

				.green {
					background-color: green;
					color: white;
					text-align: center;
					padding: 5px;
					display: inline-block;
					margin: 7px;
					width: 50px;
				}

				.red {
					background-color: red;
					color: white;
					text-align: center;
					padding: 5px;
					display: inline-block;
					margin: 7px;
					width: 50px;
				}

				.custom-nav {
					display: inline-flex;
				}

				.right {
					display: inline-flex;
					gap: 30px;



				}

				body {
					font-style: normal;
				}

				.modal-content {

					left: 40%;
					top: 20%;
					padding: 25px;
					width: 50%;
				}

				.modal-footer {
					display: inline-block;
					position: relative;
					left: 80%;
					top: 12%;
					border: 1px solid;
				}
			</style>
		</head>

		<body>
			<!-- <div class="pre-loader">
					<div class="pre-loader-box">
						<div class="loader-logo">
							<img src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logos.svg'
								alt="">
						</div>
						<div class='loader-progress' id="progress_div">
							<div class='bar' id='bar1'></div>
						</div>
						<div class='percent' id='percent1'>0%</div>
						<div class="loading-text">Loading...</div>
					</div>
				</div> -->

	

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
								<a href="javascript:void(0);" class="btn btn-outline-primary sidebar-light ">White</a>
								<a href="javascript:void(0);"
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
						<a href="javascript:;"> <img
								src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/deskapp-logo.svg'
								alt="" class="dark-logo"> <img
								src='${pageContext.request.contextPath}/style/dist/dash/vendors/images/skillpilot_white.svg'
								alt="" class="light-logo">
						</a>
						<div class="close-sidebar" data-toggle="left-sidebar-close">
							<i class="ion-close-round"></i>
						</div>
					</div>
					<div class="menu-block customscroll">
						<div class="sidebar-menu">
							<ul id="accordion-menu">
								<li><span class="dropdown-toggle no-arrow">


								</li>


							</ul>
						</div>
					</div>
				</div>
				<div class="mobile-menu-overlay"></div>

				<div class="main-container">
					<div class="xs-pd-20-10 pd-ltr-20 height-100-p">
						<div class="title pb-20 text-center">
							<h2 class="h3 mb-0" style="background: #0f2c7eeb; color: white; border-radius: 5px;">
								<span></span>
								<nav class="" style="display: inline-flex;">
									<div class="container">
										<div class="aa">
											<ul id="nav-mobile" class="right hide-on-med-and-down">
												<li><a href="#" style="color: #FFFFFF;">Test Name: ${test.testName}</a>
												</li>
												<li><a href="#" style="color: #FFFFFF;">Max
														Questions:${test.total_que}</a></li>
												<li><a href="#" style="color: #FFFFFF;">Total Marks:
														${test.total_mark}</a></li>
												<li>
													<div>Time left: <span id="time"></span></div>
												</li>

											</ul>
										</div>
									</div>
								</nav>
							</h2>
						</div>

						<div class="row">
							<div class="col-xl-4 mb-30" style="height: 440px;">
								<div class="card-box height-100-p pd-20 scrollbar force-overflow" id="style-3"
									style="position: relative; max-height: 100%; overflow-y: auto; padding-bottom: 20px;">

									<h4>Answer Status</h4>
									<br>

									<div id="answerStatus"></div>

									<div style="height: 300px;"></div> <!-- To simulate other content -->

									<hr>
									<p style="color: black;">
										<span style="background-color: white;">
											Note: Red - Not Attempted
										</span>
										<br>
										<span style="background-color: white;">
											Note: Green - Attempted
										</span>
									</p>

								</div>
							</div>

							<div class="col-xl-8 mb-30" style="height: 440px;">
								<div class="card-box  " id="style-3"
									style="position: relative; max-height: 100%; overflow: auto;padding: 1em;">
									<form id="testForm">
										<div id="question-container"
											style="border: 2px solid black; padding: 20px; margin-bottom: 20px;">
											<c:forEach var="question" items="${questions}" varStatus="loop">
												<div class="question-container ${loop.index == 0 ? 'active' : ''}"
													id="question-${loop.index}"
													style="display: ${loop.index == 0 ? 'block' : 'none'};">
													<p style="font-weight: 1000;">Question ${loop.index + 1}:
														${question.text}</p>
													<hr />
													<c:choose>
														<c:when test="${question.type eq 'SINGLE_CHOICE'}">
															<p>
																<label>
																	<input type="radio" name="answer_${question.id}"
																		value="${question.option1}" />
																	<span>${question.option1}</span>
																</label>
															</p>
															<p>
																<label>
																	<input type="radio" name="answer_${question.id}"
																		value="${question.option2}" />
																	<span>${question.option2}</span>
																</label>
															</p>
															<p>
																<label>
																	<input type="radio" name="answer_${question.id}"
																		value="${question.option3}" />
																	<span>${question.option3}</span>
																</label>
															</p>
															<p>
																<label>
																	<input type="radio" name="answer_${question.id}"
																		value="${question.option4}" />
																	<span>${question.option4}</span>
																</label>
															</p>
														</c:when>
														<c:when test="${question.type eq 'MULTIPLE_CHOICE'}">
															<p>
																<label>
																	<input type="checkbox"
																		name="answers[answer_${question.id}]"
																		value="${question.option1}" />
																	<span>${question.option1}</span>
																</label>
															</p>
															<p>
																<label>
																	<input type="checkbox"
																		name="answers[answer_${question.id}]"
																		value="${question.option2}" />
																	<span>${question.option2}</span>
																</label>
															</p>
															<p>
																<label>
																	<input type="checkbox"
																		name="answers[answer_${question.id}]"
																		value="${question.option3}" />
																	<span>${question.option3}</span>
																</label>
															</p>
															<p>
																<label>
																	<input type="checkbox"
																		name="answers[answer_${question.id}]"
																		value="${question.option4}" />
																	<span>${question.option4}</span>
																</label>
															</p>
														</c:when>
														<c:when test="${question.type eq 'TRUE_FALSE'}">
															<p>
																<label>
																	<input type="radio" name="answer_${question.id}"
																		value="True" />
																	<span>True</span>
																</label>
															</p>
															<p>
																<label>
																	<input type="radio" name="answer_${question.id}"
																		value="False" />
																	<span>False</span>
																</label>
															</p>
														</c:when>
													</c:choose>
												</div>
											</c:forEach>
										</div>
										<input type="hidden" name="testId" value="10">
										<div class="btn-container">
											<button class="btn btn-primary waves-effect waves-light" id="prevButton"
												type="button">Previous</button>
											<button class="btn btn-primary waves-effect waves-light" id="nextButton"
												type="button">Next</button>
											<button class="btn btn-success waves-effect waves-light" id="submitButton"
												type="button">Submit Test</button>
										</div>
									</form>
								</div>


								<div id="answerStatus"></div>
								<!-- Loader -->


								<div id="loader">
									<div class="preloader-wrapper big active">
										<div class="spinner-layer spinner-blue">
											<div class="circle-clipper left">
												<div class="circle"></div>
											</div>
											<div class="gap-patch">
												<div class="circle"></div>
											</div>
											<div class="circle-clipper right">
												<div class="circle"></div>
											</div>
										</div>
									</div>
								</div>

								<!-- Modal Structure -->
								<div id="resultModal" class="modal">
									<div class="modal-content">
										<center>
											<h4>Test Results</h4>
										</center>
										<hr>

										<div id="resultDetails" style="display: none;">
											<p>Marks Obtained: <span id="marksObtained"></span></p>
											<!--                 <p>Total Marks: <span id="totalMarks"></span></p>
                                     -->
											<p>Correct Answers: <span id="correctAnswers"></span></p>
											<p>Wrong Answers: <span id="wrongAnswers"></span></p>
											<p hidden>Unanswered: <span id="unanswered"></span></p>
											<p>Result Status: <span id="resultStatus"></span></p>
										</div>
									</div>
									<div class="modal-footer">
										<a href="assessment_test"
											class="modal-close waves-effect waves-green btn-flat">Close</a>
									</div>
								</div>


							</div>
						</div>
					</div>
				</div>
				</div>



				</div>
				<%@include file="footer.jsp" %>
					</div>



					<script>
						document.addEventListener('DOMContentLoaded', function () {
							const totalQuestions = ${ questions.size()
						};

						const answerStatus = document.getElementById('answerStatus');
						generateAnswerStatusTable(totalQuestions, answerStatus);
						updateAnswerStatus();
						var isDisqualified = false;
						var hasSubmitted = false;



						const testId = 10;


						// --------------------------

						function generateAnswerStatusTable(totalQuestions, container) {
							const table = document.createElement('table');
							table.setAttribute('border', '1');
							table.style.width = '100%';

							let row = document.createElement('tr');
							for (let i = 1; i <= totalQuestions; i++) {
								if (i % 5 === 1 && i !== 1) {
									container.appendChild(row);
									row = document.createElement('tr');
								}
								const cell = document.createElement('td');
								const index = i - 1; // Adjusted index for zero-based indexing
								cell.id = 'question-status-' + index;
								cell.className = 'red';
								cell.innerText = 'Q' + i;
								cell.style.cursor = 'pointer'; // Make the cell clickable
								cell.onclick = function () {
									jumpToQuestion(index); // Call jumpToQuestion function on click
								};
								row.appendChild(cell);
							}
							container.appendChild(row);
						}

						function jumpToQuestion(index) {
							// Hide all questions
							const questionContainers = document.querySelectorAll('.question-container');
							questionContainers.forEach(container => {
								container.style.display = 'none';
							});

							// Show the selected question
							const questionId = 'question-' + index;
							const selectedQuestion = document.getElementById(questionId);
							if (selectedQuestion) {
								selectedQuestion.style.display = 'block';
							}
						}
						function updateAnswerStatus() {
							const questionContainers = document.querySelectorAll('.question-container');
							questionContainers.forEach((container, index) => {
								const inputs = container.querySelectorAll('input');
								let isAttempted = false;
								inputs.forEach(input => {
									if (input.checked) {
										isAttempted = true;
									}
								});
								const statusCell = document.getElementById('question-status-' + index);
								if (isAttempted) {
									statusCell.className = 'green';
								} else {
									statusCell.className = 'red';
								}
							});
						}

						document.querySelectorAll('input').forEach(input => {
							input.addEventListener('change', updateAnswerStatus);
						});

						function startTimer(duration, display) {
							var timer = duration, minutes, seconds;
							var intervalId = setInterval(function () {
								minutes = parseInt(timer / 60, 10);
								seconds = parseInt(timer % 60, 10);

								minutes = minutes < 10 ? "0" + minutes : minutes;
								seconds = seconds < 10 ? "0" + seconds : seconds;

								display.textContent = minutes + ":" + seconds;

								if (--timer < 0) {
									clearInterval(intervalId); // Stop the timer when it reaches zero
									document.getElementById("testForm").submit();
								}
							}, 1000);
						}
						function startTimer(duration, display) {
							var timer = duration, minutes, seconds;
							var intervalId = setInterval(function () {
								minutes = parseInt(timer / 60, 10);
								seconds = parseInt(timer % 60, 10);

								minutes = minutes < 10 ? "0" + minutes : minutes;
								seconds = seconds < 10 ? "0" + seconds : seconds;

								display.textContent = minutes + ":" + seconds;

								if (--timer < 0) {
									clearInterval(intervalId); // Stop the timer when it reaches zero
									document.getElementById("testForm").submit();
								}
							}, 1000);
						}

						window.onload = function () {
							var time = 60 * ${ testTime }; // Fetch dynamic test duration from the model
							var display = document.querySelector('#time');
							startTimer(time, display);
						};



						// Display the next question
						function showNextQuestion() {
							const currentQuestionIndex = getCurrentQuestionIndex();
							if (currentQuestionIndex < totalQuestions - 1) {
								document.getElementById('question-' + currentQuestionIndex).style.display = 'none';
								document.getElementById('question-' + (currentQuestionIndex + 1)).style.display = 'block';
							}
						}

						// Display the previous question
						function showPrevQuestion() {
							const currentQuestionIndex = getCurrentQuestionIndex();
							if (currentQuestionIndex > 0) {
								document.getElementById('question-' + currentQuestionIndex).style.display = 'none';
								document.getElementById('question-' + (currentQuestionIndex - 1)).style.display = 'block';
							}
						}

						// Get the current question index
						function getCurrentQuestionIndex() {
							const questionContainers = document.querySelectorAll('.question-container');
							let currentIndex = 0;
							questionContainers.forEach((container, index) => {
								if (container.style.display !== 'none') {
									currentIndex = index;
								}
							});
							return currentIndex;
						}

						function submitTestForm(studentId, testId, disqualified = false) {
							if (hasSubmitted) return; // Prevent multiple submissions
							hasSubmitted = true;

							var formData = new FormData();
							const urlParams = new URLSearchParams(window.location.search);
							const studentIdss = urlParams.get('studentId');
							formData.append('studentId', studentIdss);
							formData.append('testId', 10);
							formData.append('disqualified', disqualified);

							// Collect all answers
							document.querySelectorAll('input[type="radio"]:checked, input[type="checkbox"]:checked').forEach(function (input) {
								var questionId = input.name.split('_')[1]; // Extract question ID from input name
								formData.append('answers[answer_' + questionId + ']', input.value);
							});

							// Show loader
							var loader = document.getElementById('loader');
							loader.style.display = 'block';

							fetch('submitDrive', {
								method: 'POST',
								body: formData
							})
								.then(response => response.json())
								.then(result => {
									// Log the result to check its structure
									console.log('API Response:', result);

									// Hide the loader
									loader.style.display = 'none';

									// Show Swal alert for submission success
									Swal.fire({
										title: 'Success!',
										text: 'You have successfully submitted the test.',
										icon: 'success',
										confirmButtonText: 'OK',
										
										
									}).then(() => {
										// Check if the expected fields exist in the result
										const resultMessage = `
            <strong>Result Will be decalre soon</strong><br>
   
        `;

										// Show the result in another SweetAlert
										Swal.fire({
											title: 'Test Results',
											html: resultMessage, // Using `html` to allow formatting
											icon: 'info',
											confirmButtonText: 'Close'
										});
										window.location.href="${pageContext.request.contextPath}/drive_login"
									});
								})
								.catch(error => {
									loader.style.display = 'none'; // Hide the loader in case of error
									console.error('Error:', error);
									Swal.fire({
										title: 'Error!',
										text: 'There was an error submitting the test. Please try again.',
										icon: 'error',
										confirmButtonText: 'OK'
									});
								});

						}

						//Example usage in the form
						function onSubmitButtonClick() {
							submitTest(studentId, testId);
						}
						// Add event listeners for buttons
						document.getElementById('nextButton').addEventListener('click', showNextQuestion);
						document.getElementById('prevButton').addEventListener('click', showPrevQuestion);
						document.getElementById('submitButton').addEventListener('click', submitTestForm);
							});
					</script>









					<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


					<!-- Import jQuery before materialize.js -->
					<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


		</body>

		</html>