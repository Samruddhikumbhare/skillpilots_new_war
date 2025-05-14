<!-- company feedback against student start -->
<!-- <div class="modal fade" id="feebackModal" role="dialog">
		<div class="modal-dialog"
			style="width: 90%; margin: 4% auto;">
			Modal content
			<div class="modal-content">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<span>Feedback</span>
				</div>
				<div class="modal-body" style="overflow:scroll; max-height: 75%;">
					<div class="box">
						<div class="box-body" id="feedbackContentDiv">
							<table class="table table-hover">
								menu
								<tr class="header success" id="myHeader">
									<th>Week</th>
									<th>Interest</th>
									<th>Punctuality</th>
									<th>Problem Solving</th>
									<th>Communication Skills</th>
									<th>Professionalism</th>
									<th>Team Work / Leadership</th>
									<th>Knowledge</th>
									<th>Quality</th>
									<th style="color: #065f0d;">Average</th>
									<th></th>
								</tr>
								end menu
								Start Data
								<tbody id="feedbackBody">
								</tbody>
								End data
							</table>
							<input type="hidden" id="txt_internship_id"> <input
								type="hidden" id="total_weeks">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div> -->
	<!-- company feedback against student end -->
	
	<!-- students feedback against company start -->
	<div class="modal fade bs-example-modal-xl show" id="feebackForCompModal" role="dialog">
		<div class="modal-dialog modal-xl modal-dialog-centered"
			style="max-height: 95%; overflow: auto;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<span>Feedback</span>
				</div>
				<div class="modal-body" style="padding-bottom:0px;">
					<div class="box">
						<div class="box-body" id="feedForCompContentDiv">
							<table class="table">
								<tr>
								<th></th>
								<th></th>
								<th>Very Good</th>
								<th>Good</th>
								<th>Fair</th>
								<th>Poor</th>
								<th>Very Poor</th>
								</tr>
								<tr>
								<th>1</th>
									<th title="Was the internship planned and structured?">Organized</th>
									<td><div class="radio"><label><input type="radio" name="q1opt" value="5" checked="checked"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q1opt" value="4"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q1opt" value="3"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q1opt" value="2"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q1opt" value="1"></label></div></td>
								</tr>
								<tr>
								<th>2</th>
									<th title="Were the fellow workers helpful & cooperative ?">Environment</th>
									<td><div class="radio"><label><input type="radio" name="q2opt" value="5" checked="checked"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q2opt" value="4"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q2opt" value="3"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q2opt" value="2"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q2opt" value="1"></label></div></td>
								</tr>
								<tr>
								<th>3</th>
									<th title="Did you get the opportunity to use your skills & creativity ?">Innovative</th>
									<td><div class="radio"><label><input type="radio" name="q3opt" value="5" checked="checked"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q3opt" value="4"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q3opt" value="3"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q3opt" value="2"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q3opt" value="1"></label></div></td>
								</tr>
								<tr>
								<th>4</th>
									<th title="Did you get the opportunity to develop your skills and was the work experience related to your career goals?">Beneficial</th>
									<td><div class="radio"><label><input type="radio" name="q4opt" value="5" checked="checked"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q4opt" value="4"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q4opt" value="3"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q4opt" value="2"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q4opt" value="1"></label></div></td>
								</tr>
								<tr>
								<th>5</th>
									<th title="Did the work provide levels of responsibility consistent with your ability and growth?">Trusted with responsible work</th>
									<td><div class="radio"><label><input type="radio" name="q5opt" value="5" checked="checked"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q5opt" value="4"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q5opt" value="3"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q5opt" value="2"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q5opt" value="1"></label></div></td>
								</tr>
								<tr>
								<th>6</th>
									<th title="How adequately did the employer supervise/provide feedback on your progress and abilities?">Efforts taken by the company</th>
									<td><div class="radio"><label><input type="radio" name="q6opt" value="5" checked="checked"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q6opt" value="4"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q6opt" value="3"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q6opt" value="2"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q6opt" value="1"></label></div></td>
								</tr>
								<tr>
								<th>7</th>
									<th title="Did you get the opportunity to problem solve, develop critical thinking skills?">Learning experience</th>
									<td><div class="radio"><label><input type="radio" name="q7opt" value="5" checked="checked"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q7opt" value="4"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q7opt" value="3"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q7opt" value="2"></label></div></td>
									<td><div class="radio"><label><input type="radio" name="q7opt" value="1"></label></div></td>
								</tr>
								<tr>
								<th>8</th>
									<th title="Would you like to suggest the company for others?">Suggest</th>
									<td><div class="radio"><label><input type="radio" name="q8opt" value="1" checked="checked">YES</label></div></td>
									<td><div class="radio"><label><input type="radio" name="q8opt" value="2">NO</label></div></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				<span class="info-label">* Move mouse on feedback point for details.</span>
				<c:if test="${user.role eq '0'}"><input type="button" class="btn btn-success" value="Submit Feedback" onclick="submitFeedback('${user.role}');"></c:if>
				<c:if test="${user.role ne '0'}"><input type="button" class="btn btn-success" value="Submit Feedback" onclick="submitFeedback('${user.role}');"></c:if>
				</div>
				<input type="hidden" id="txt_internshipid">
			</div>
		</div>
	</div>
	<!-- students feedback against company END -->
	<%@include file="user_session.jsp"%>
	<!-- view students feedback start -->
	
<div class="modal fade bs-example-modal-lg show" id="viewStudsFeedModal" tabindex="-1"
	role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header" style="background: #0f2c7eeb;;padding: 1px 8px 2px 18px;">
				<h5 class="modal-title" id="myLargeModalLabel" style="color: white;">Student FeedBack</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">X</button>
			</div>
			<div class="modal-body">
				<div class="card card-box">
						<div class="box-body">
							<table class="table">
								<tr>
								<th>1</th>
									<th title="Was the internship planned and structured?">Organized</th>
									<th id="tdOpt1"></th>
								</tr>
								<tr>
								<th>2</th>
									<th title="Were the fellow workers helpful & cooperative ?">Environment</th>
									<th id="tdOpt2"></th>
								</tr>
								<tr>
								<th>3</th>
									<th title="Did you get the opportunity to use your skills & creativity ?">Innovative</th>
									<th id="tdOpt3"></th>
								</tr>
								<tr>
								<th>4</th>
									<th title="Did you get the opportunity to develop your skills and was the work experience related to your career goals?">Beneficial</th>
									<th id="tdOpt4"></th>
								</tr>
								<tr>
								<th>5</th>
									<th title="Did the work provide levels of responsibility consistent with your ability and growth?">Trusted with responsible work</th>
									<th id="tdOpt5"></th>
								</tr>
								<tr>
								<th>6</th>
									<th title="How adequately did the employer supervise/provide feedback on your progress and abilities?">Efforts taken by the company</th>
									<th id="tdOpt6"></th>
								</tr>
								<tr>
								<th>7</th>
									<th title="Did you get the opportunity to problem solve, develop critical thinking skills?">Learning experience</th>
									<th id="tdOpt7"></th>
								</tr>
								<tr>
								<th>8</th>
									<th title="Would you like to suggest the company for others?">Suggest</th>
									<th id="tdOpt8"></th>
								</tr>
							</table>
						</div>
					</div>
			</div>
			<div class="modal-footer" style="padding: 4px 75px 6px 0;">
				<span class="info-label" style="color: #0c85ef;">* Move mouse on feedback point for details.</span>
			</div>
		</div>
	</div>
</div>
<!-- view students feedback end -->
	
	
	<div class="modal fade bs-example-modal-xl" id="feebackModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-xl modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header" style="padding: 2px 0 2px 15px;background: #317c9e;">
											<h5 class="modal-title" id="myLargeModalLabel" style="color: white;">Feedback</h5>
											<button type="button" class="close mr-1 text-white" data-dismiss="modal" aria-hidden="true">x</button>
										</div>
										<div class="modal-body" style="max-width: 100%;overflow-x: auto;">
											<div class="box">
						<div class="box-body" id="feedbackContentDiv">
							<table class="table table-hover nowrap">
								<!--menu-->
								<thead class="thead-light">
								<tr class="success" id="myHeader" style="white-space: nowrap;">
									<th>Week</th>
									<th>Interest</th>
									<th>Punctuality</th>
									<th>Problem Solving</th>
									<th>Communication Skills</th>
									<th>Professionalism</th>
									<th>Team Work / Leadership</th>
									<th>Knowledge</th>
									<th>Quality</th>
									<th style="color: #065f0d;">Average</th>
									<th></th>
								</tr>
								</thead>
								<!--end menu -->
								<!--Start Data -->
								<tbody id="feedbackBody" style="text-align: center;">
								</tbody>
								<!--End data-->
							</table>
							<input type="hidden" id="txt_internship_id"> <input
								type="hidden" id="total_weeks">
						</div>
					</div>
										</div>
									</div>
								</div>
							</div>
							
								
							