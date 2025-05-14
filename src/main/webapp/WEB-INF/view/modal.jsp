

<c:if test="${log_type eq ProjectConstants.user_initials_student}">
	<div class="modal fade" id="internshipPending" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content modelfix">
				<div class="panel-heading">
					<button type="button" class="close" id="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Internship Status</h4>
				</div>
				<div class="modal-body">
					<span><strong>You have already <strong>applied</strong>
							for this internship please wait for the company's response.
					</strong> </span>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>

	<div class="modal fade" id="internshipApproved" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content modelfix">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Internship Status</h4>
				</div>
				<div class="modal-body">
					<span><strong> Already Approved Request </strong> </span>
				</div>
				<div class="modal-footer"></div>
			</div>

		</div>
	</div>

	<!--  modal for ready to apply Internhsip from  Student  -->
	<!-- <div class="modal fade" id="confirmAdvertisement" role="dialog">
		<div class="modal-dialog">
			Modal content
			<div class="modal-content modelfix">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Confirm</h4>
				</div>
				<div class="modal-body">
					<span>You are applying for internship in <strong><span
							id="tech"></span></strong> at <strong> <span id="company"></span>
					</strong> for <strong><span id="duration"></span> weeks</strong> are you
						sure?
					</span>
				</div>
				<div class="modal-footer">
					<form action="applyInterns_req" method='post'>
						<input type="hidden" name='hid' id="hid" value=""> <input
							type="hidden" name="redirect_page" id="redirect_page" value="">
						<button type="submit" class="btn btn-primary btn-xs">Confirm</button>
					</form>
				</div>
			</div>
		</div>
	</div> -->
</c:if>

<c:if
	test="${inst_type eq ProjectConstants.user_initials_company || inst_type eq ProjectConstants.user_initials_college}">
	<div class="modal fade" id="rejectModelfor_External_req" role="dialog"
		style="z-index: 1060;">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content modelfix">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Rejection Message</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" id="rejection_id">
					<textarea class="form-control" rows="5" id="rejection_msg"
						placeholder="enter reason here"></textarea>
				</div>
				<div class="modal-footer">
					<a type="submit" class='btn btn-primary' onclick="sendRejection();">Confirm</a>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="student_req_reject" style="z-index: 1070;"
		role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content modelfix">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h6 class="modal-title" style="background: red; color: white; padding: 5px 0px 5px 15px;">Rejecting</h6>
				</div>
				<form role="form" onsubmit="return false;"> <!-- Prevent form submission -->
					<div class="modal-body">
						<input type="hidden" id="txt_request_id">
						<h3>Are You Sure?</h3>
						<div class="form-group">
							<label for="txt_rejection_msg">Enter Rejected Reason (optional):</label>
							<textarea class="form-control" rows="3" style="height: 100px !important;" id="txt_rejection_msg"></textarea>
						</div>
						<div class="modal-footer" style="border-top: 0px">
							<input type="hidden" id="internship_id_txt">
							<button type="button" class="btn btn-primary btn-sm pull-right" id="send" onclick="cancelInternshipByStud()">Confirm</button>
						</div>
					</div>
				</form>
			</div>
			
		</div>
	</div>

	<!-- for student group details -->
	<div class="modal fade show" id="all_interns_details" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header" style="background: #317c9ee3;padding-top: 3px;padding-bottom: 2px;">
					<h5 class="modal-title" id="myLargeModalLabel" style="color: white;">Interns Group Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">x</button>
				</div>
				<div id="reject_id" class="modal-body rid">
					<table class="table table-bordered table-sm">
						<thead class="thead-light">
							<tr>
								<th>Student Name</th>
							</tr>
						</thead>
						<!-- <tbody id="tablist"> -->
						<tbody id="s_data">
						</tbody>
					</table>
				</div>
				<div class="modal-footer" style="border-top: 0px;padding: 0rem"></div>
			</div>
		</div>
	</div>
</c:if>


	<div class="modal fade show" id="raised_Modal" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header" style="height: 48px; background: #0f2c7eeb;">
					<h6 class="modal-title text-center" id="myLargeModalLabel"
						style="color: white;">Apply Internhship</h6>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">x</button>
				</div>
				<div class="modal-body">
					<div class="col-sm-12 form-inline">
						<div class="col-md-6" style="height: 313px;">
							<div class="card card-box">
								<div class="card-header"
									style="padding: 5px; text-align: center;">Company List</div>
								<div class="card-body" id="companyList"
									style="max-height: 280px; overflow: auto; padding: 0px">
									<blockquote class="blockquote mb-0">
										<table class="table">
											<thead style="text-align: center;">
												<tr>
													<th>Select</th>
													<th style="float: left;">Company Name</th>
												</tr>
											</thead>
											<tbody id="tablist">
												<input type="hidden" id="comp_hid">
												<c:forEach items="${com_list}" var="item">
													<tr class="test${item.company_id}">
														<td style="text-align: center;"><input type="radio"
															name="cmp_radiobtn" id="${item.company_id}" /></td>
														<td class='pointer cmp${item.company_id}'
															onclick="getcomId('${item.company_id}');"
															data-toggle="modal" data-target="#com_advertisement">
															<span>${item.company_name}</span>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</blockquote>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card card-box">
								<div class="card-header"
									style="padding: 5px; text-align: center;">Student List</div>
								<div class="card-body" id="style-3"
									style="max-height: 280px; overflow: auto; padding: 0px">
									<blockquote class="blockquote mb-0">
										<c:if test="${not empty approve_students  }">
											<table class="table">
												<thead>
													<tr style="text-align: center;">
														<th>Select</th>
														<th style="float: left;">Student Name</th>
													</tr>
												</thead>
												<tbody id="tablist">
													<c:forEach items="${approve_students}" var="item">
														<tr>
															<td style="text-align: center;"><span><input
																	type="checkbox" id="${item.student_id}" class="student_chk" /></span></td>
															<td class='pointer'
																onclick="dispStudentData('${item.student_id}')"
																data-toggle="modal" data-target="#studentDetailsModal"><span>${item.student_name}</span></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</c:if>
										<c:if test="${empty approve_students  }">
											<lable>No Student Found!</lable>
										</c:if>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="col-sm-12 form-inline">
						<div class="col-sm-4">
							<select id="selecttechnology" class="form-control" data-toggle="tooltip" title="Please Select Skill From Here"
								style="margin-top: 5px; border-radius: 5px;width: 100%">
								<option selected value="-1" disabled>Select a Skill</option>
								<c:forEach items="${technologies}" var="technology">
									<option value="${technology.technology_name}">${technology.technology_name}</option>
								</c:forEach>
							</select> <label id="tech_missing" style="color: red;"></label>
						</div>
						<div class="row col-sm-4">
							<select id="duration_week" class="form-control" data-toggle="tooltip" title="Please Select Internship Duration  From Here"
								style="margin-top: 5px; border-radius: 5px;width: 100%">
								<option selected value="-1" disabled>Select no of Weeks</option>
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
							</select> <label id="duration_missing" style="color: red;"></label>
						</div>
						
						<div class="row col-sm-4" style="margin-left: 10px;">
    <textarea id="req_msg" placeholder="Add a note for Industry" class="form-control" data-toggle="tooltip" title="Add a note for Industry If You Want."
        style="margin-left: 30px;
    width: 173px;
    height: 46px;
    margin-top: 7px;"></textarea>
</div>

					</div>
				</div>
				<div class="modal-footer" style="border-top: 0px!important;margin-right: 34px;">
					<button id="send_interns" type="button" class="btn btn-primary btn-sm" style="background: #0f2c7eeb;"
						onclick="sendInterns(); ">Send Request</button>
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- model for sent interns Group -->

	<div class="modal fade" id="rejectionModal" role="dialog">
		<div class="modal-dialog">
			Modal content
			<div class="modal-content modelfix">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Rejection Message</h4>
				</div>
				<div id="reject_id" class="modal-body rid">
					<input id="rejection_hid" type="hidden" value="">
					<textarea id="msg_send"
						style="margin: 0px; width: 500px; height: 87px;"></textarea>
				</div>
				<div class="modal-footer">
					<button class="btn-warning"
						onclick="sendRequest(document.getElementById('rejection_hid'),document.getElementById('msg_send'))">Send</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Rejection model  /*end*/ -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		
			document.getElementById('close').addEventListener('click', function() {
				// Redirect to the desired URL
				location.reload();
			});
		});

		
	</script>
<script>
	function cancelInternshipByStud() {
		// Display SweetAlert loader
		swal({
			title: "Processing...",
			text: "Please wait while we process your request.",
			icon: "info",
			buttons: false, // Hide the buttons
			timer: 10000 // Set the timer to 10 seconds
		});
	
		// Force reload the page after 10 seconds
		setTimeout(() => {
			location.reload(); // This reloads the current page
		}, 1000); // 10000 milliseconds = 10 seconds
	}
	</script>