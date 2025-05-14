<%-- <div class="modal fade " id="testTableModal" role="dialog">
	<div class="modal-dialog ">
		<div class="modal-content modelfix">
			<div class="panel-heading">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Available Tests</h4>
			</div>
			<div class="modal-body" style="max-height: 70%; overflow-x: auto">
				<input type="hidden" id="testAgainstReq">
				<table class="table table-bordered">
    <thead>
        <tr>
            <th></th>
            <th>Test Name</th>
            <th>Total Questions</th>
            <th>Total Marks</th>
            <th>Total Time</th>
            <th>Cut-Off</th>
        </tr>
    </thead>
    <tbody id="setTestBody">
		${compTestList}
        <c:forEach items="${compTestList}" var="test">
            <tr>
                <td>
                    <div class="radio" style="margin-bottom: 0px; margin-top: 0px;">
                        <label style="padding-left: 30px;">
                            <input type='radio' class='pointer' name='testRadio' value='${test.test_id}' id='testCheked_${test.test_id}'>
                        </label>
                    </div>
                </td>
                <td>${test.test_name}</td>
                <td>${test.total_ques}</td>
                <td>${test.total_marks}</td>
                <td>${test.test_time}</td>
                <td>${test.cut_off}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

			</div>

			<div class="modal-footer">
				<div style="overflow: auto; display:;" id="footer1">
					<div style="float: right;">
						<button type="button" class="btn btn-success" id="setTestBtn"
							onclick="assignTest();">Set Test</button>
					</div>
				</div>
				<div style="overflow: auto; display: none;" id="footer2">

					<div style="float: right;">
						<button type="button" class="btn btn-success" id=""
							onclick="reassignedTest()">Reassigned Test</button>
						<div style="overflow: auto; display: none;" id="student_reject">
							<button id="reject_btn1" class="btn btn-danger"
								data-toggle="modal" data-target="#student_req_reject"
								onclick="setRejection_id(this.name)" name=""
								style="margin-left: -5px !important;">
								<i class="fa fa-times" aria-hidden="true"></i>Reject
							</button>
						</div>

						<div style="overflow: auto; display: none;"
							id="student_group_reject">
							<button id="reject_btn2" class="btn btn-danger"
								data-toggle="modal" data-target="#rejectModelfor_External_req"
								onclick="rejectReqId(this.name)" name=""
								style="margin-left: -5px !important;">
								<i class="fa fa-times" aria-hidden="true"></i>Reject
							</button>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
</div> --%>

<div class="modal fade bs-example-modal-lg" id="testTableModal"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header"
				style="background: #0f2c7eeb; padding-bottom: 9px;">
				<h5 class="modal-title" id="myLargeModalLabel" style="color: white;">Available
					Tests</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">X</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="testAgainstReq">
				<table class="table table-sm" style="margin-bottom: 0rem;">
					<thead class="thead-light">
						<tr>
							<th></th>
							<th>Test Name</th>
							<th>Total Questions</th>
							<th>Total Marks</th>
							<th>Total Time</th>
							<th>Cut-Off</th>
						</tr>
					</thead>
					<tbody id="setTestBody">
						<c:forEach items="${compTestList}" var="test">
							<tr>
								<td>
									<div class="radio" style="margin-bottom: 0px; margin-top: 0px;">
										<label style="padding-left: 30px;"> <input
											type='radio' class='pointer' name='testRadio'
											value='${test.test_id}' id='testCheked_${test.test_id}'>
										</label>
									</div>
								</td>
								<td>${test.test_name}</td>
								<td class="text-center">${test.total_ques}</td>
								<td class="text-center">${test.total_marks}</td>
								<td class="text-center">${test.test_time}</td>
								<td class="text-center">${test.cut_off}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="modal-footer" style="border-top: 0px;">
				<div style="overflow: auto; display:;" id="footer1">
					<div style="float: right;">
						<button type="button" class="btn btn-success btn-sm" id="setTestBtn"
							onclick="assignTest();">Set Test</button>
					</div>
				</div>
				<div style="overflow: auto; display: none;" id="footer2">

					<div>
						<button type="button" class="btn btn-success btn-sm" id="" style="float: left;padding: 4px 5px 4px 5px;margin-right: 8px;"
							onclick="reassignedTest()">Reassigned Test</button>
						<div style="overflow: auto; display: none;float: left;" id="student_reject">
							<button id="reject_btn1" class="btn btn-danger btn-sm"
								data-toggle="modal" data-target="#student_req_reject"
								onclick="setRejection_id(this.name)" name=""
								style="padding: 4px 5px 4px 5px; margin-right: 8px;">
								<i class="fa fa-times" aria-hidden="true"></i>Reject
							</button>
						</div>

						<div style="overflow: auto; display: none;"
							id="student_group_reject">
							<button id="reject_btn2" class="btn btn-danger btn-sm"
								data-toggle="modal" data-target="#rejectModelfor_External_req"
								onclick="rejectReqId(this.name)" name=""
								style="margin-left: -5px !important;">
								<i class="fa fa-times" aria-hidden="true"></i>Reject
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--   for external
 -->
 <div class="modal fade bs-example-modal-lg" id="testTableModal1"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header"
				style="background: #0f2c7eeb; padding-bottom: 9px;">
				<h5 class="modal-title" id="myLargeModalLabel" style="color: white;">Available
					Tests</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">�</button>
			</div>
			<div class="modal-body">
				<input type="hidden" id="testAgainstReq">
				<table class="table table-sm" style="margin-bottom: 0rem;">
					<thead class="thead-light">
						<tr>
							<th></th>
							<th>Test Name</th>
							<th>Total Questions</th>
							<th>Total Marks</th>
							<th>Total Time</th>
							<th>Cut-Off</th>
						</tr>
					</thead>
					<tbody id="setTestBody">
						<c:forEach items="${compTestList}" var="test">
							<tr>
								<td>
									<div class="radio" style="margin-bottom: 0px; margin-top: 0px;">
										<label style="padding-left: 30px;"> <input
											type='radio' class='pointer' name='testRadio'
											value='${test.test_id}' id='testCheked_${test.test_id}'>
										</label>
									</div>
								</td>
								<td>${test.test_name}</td>
								<td class="text-center">${test.total_ques}</td>
								<td class="text-center">${test.total_marks}</td>
								<td class="text-center">${test.test_time}</td>
								<td class="text-center">${test.cut_off}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="modal-footer" style="border-top: 0px;">
				<div style="overflow: auto; display:;" id="footer1">
					<div style="float: right;">
						<button type="button" class="btn btn-success btn-sm" id="setTestBtn"
							onclick="assignTest1();">Set Test</button>
					</div>
				</div>
				<div style="overflow: auto; display: none;" id="footer2">

					<div>
						<button type="button" class="btn btn-success btn-sm" id="" style="float: left;padding: 4px 5px 4px 5px;margin-right: 8px;"
							onclick="reassignedTest()">Reassigned Test</button>
						<div style="overflow: auto; display: none;float: left;" id="student_reject">
							<button id="reject_btn1" class="btn btn-danger btn-sm"
								data-toggle="modal" data-target="#student_req_reject"
								onclick="setRejection_id(this.name)" name=""
								style="padding: 4px 5px 4px 5px; margin-right: 8px;">
								<i class="fa fa-times" aria-hidden="true"></i>Reject
							</button>
						</div>

						<div style="overflow: auto; display: none;"
							id="student_group_reject">
							<button id="reject_btn2" class="btn btn-danger btn-sm"
								data-toggle="modal" data-target="#rejectModelfor_External_req"
								onclick="rejectReqId(this.name)" name=""
								style="margin-left: -5px !important;">
								<i class="fa fa-times" aria-hidden="true"></i>Reject
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
