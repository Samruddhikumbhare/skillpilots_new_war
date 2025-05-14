<div id="testResultModal1" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="testResultModal1Label" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header" style="background: #0f2c7e; color: white;">
				<h5 class="modal-title w-100 text-center">Test Result</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<!-- Modal Body -->
			<div class="modal-body">
				<div class="text-center">
					<p id="announcement"></p>
				</div>

				<div class="col-md-12 text-center mt-3">
					<h5 class="p-2 text-white" style="background: cadetblue; border-radius: 12px;">
						Result Analysis
					</h5>

					<table class="table table-bordered mt-3" style="width: 100%;">
						<tbody>
							<tr><td><strong>Correct answers</strong></td><td><span id="spanCA"></span></td></tr>
							<tr><td><strong>Wrong answers</strong></td><td><span id="spanWA"></span></td></tr>
							<tr><td><strong>Questions not attempted</strong></td><td><span id="spanNA"></span></td></tr>
							<tr><td><strong>Marks scored</strong></td><td><span id="spanTotalMarks"></span></td></tr>
							<tr><td><strong>Out Of</strong></td><td><span id="spanOutOf"></span></td></tr>
							<tr><td><strong>Result</strong></td><td><span id="spanResult"></span></td></tr>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Modal Footer -->
			<div class="modal-footer justify-content-center">
				<button class="btn btn-success px-4 py-2" id="approveReqBtn">
    Approve
</button>

				<button class="btn btn-danger px-4 py-2" id="rejectReqBtn">
    Reject
</button>
			</div>
		</div>
	</div>
</div>

<!-- jQuery & Bootstrap Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function () {
		$('#testResultModal1').on('hidden.bs.modal', function () {
			$('body').removeClass('modal-open');  // Fix background issue
			$('.modal-backdrop').remove();        // Remove overlay
		});
	});
</script>
