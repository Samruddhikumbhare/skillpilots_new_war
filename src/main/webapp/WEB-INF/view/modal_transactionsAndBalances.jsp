<%-- <div class="modal fade" id="detailsModal" role="dialog">
		<div class="modal-dialog" style="width: 80%;">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="panel-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="modal-heading"></h4>
				</div>
				<div class="modal-body">
					<div id="pkg_details_table_div" style="display: none;">
						<table class="table table-striped">
							<tr>
								<th>Package Name</th>
								<th>Amount</th>
								<c:if test="${inst_type eq ProjectConstants.user_initials_college}"><th>No of Departments</th></c:if>
								<th>No of Internships</th>
								<th>Validity(days)</th>
							</tr>
							<tbody id="pkg_details_body">
							</tbody>
						</table>
					</div>

					<div id="bal_details_table_div" style="display: none;">
						<table class="table table-striped">
							<tr>
								<th>Department Name</th>
								<th>Creation Date</th>
								<th>Expiration Date</th>
								<th>Status</th>
							</tr>
							<tbody id="bal_details_body">
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div> --%>

<div class="modal fade bs-example-modal-lg show" id="detailsModal"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-modal="true" style="padding-right: 17px;">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header" style="background: #0f2c7eeb;">
				<h6 class="modal-title" id="myLargeModalLabel" style="color: white;">Balance Usage Details</h6>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
				<div id="pkg_details_table_div" style="display: none;">
					<table class="table table-striped">
						<tr>
							<th>Package Name</th>
							<th>Amount</th>
							<c:if
								test="${inst_type eq ProjectConstants.user_initials_college}">
								<th>No of Departments</th>
							</c:if>
							<th>No of Internship's</th>
							<th>Validity(days)</th>
						</tr>
						<tbody id="pkg_details_body">
						</tbody>
					</table>
				</div>
				<div id="bal_details_table_div" style="display: none;">
					<table class="table table-striped">
						<tr>
							<th>Department Name</th>
							<th>Creation Date</th>
							<th>Expiration Date</th>
							<th>Status</th>
						</tr>
						<tbody id="bal_details_body">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer" style="border-top: 0px;"></div>
		</div>
	</div>
</div>