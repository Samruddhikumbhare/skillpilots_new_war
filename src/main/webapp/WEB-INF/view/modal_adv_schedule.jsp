<!--This modal opens from college/student dashboard/list of advertisements and while comp_internal_req scheduled for editing -->
<div class="modal fade bs-example-modal-lg show" tabindex="-1" id="schedule_modal" role="dialog">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="panel-heading">
				<c:if test="${ log_type eq ProjectConstants.user_initials_college || inst_type eq ProjectConstants.user_initials_college || log_type eq ProjectConstants.user_initials_student}">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</c:if>
				<c:if test="${ inst_type eq ProjectConstants.user_initials_company }">
					<button type="button" id="cancel_schedule_modal" class="close" data-dismiss="modal">&times;</button>
				</c:if>
				<h5 class="modal-title" style="background: #0073b7;color: white;padding-left: 15px;">Plan for Internship</h5>
			</div>
			<div class="modal-body">
				<div class="box">
					<div class="box-body">
						<div class="col-sm-12">
							<div class="col-sm-12">
								<div class="box-body" id="weekly_form">
									<table>
										<thead id="weekly_thead">
											<tr>
												<th style="width:5%;"><b style="margin-left:-10px;">Weeks</b></th>
												<th style="width:95%;text-align:center"><b>Weekly Assignments</b></th>
											</tr>
										</thead>
										<tbody id="weekly_schd">
	
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<input type="hidden" name="adv_id" id="adv_id" value="0" />
						<input type="hidden" name="group_id" id="group_id" value="0" />
						<input type="hidden" name="duration" id="duration" value="0" />
						<input type="hidden" name="weekly_data_str" id="weekly_data_str" value="" />
					</div>
				</div>
			</div>
			<c:if test="${ inst_type eq ProjectConstants.user_initials_company }">
				<div class="modal-footer">
					<input id="sbtn" class="btn btn-primary pull-right" value="Submit" onclick="saveschedule();" />
					<button type="button" id="close_schedule_modal" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</c:if>
		</div>
	</div>
</div>