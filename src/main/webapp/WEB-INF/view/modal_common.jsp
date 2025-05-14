<div class="modal fade bs-example-modal-lg show"
	id="help_tutorial" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-modal="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header" style="padding: 2px 5px 5px 11px;border-bottom: 0px;">
				<h5 class="modal-title" id="myLargeModalLabel">Help Tutorials</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<input type="hidden" id="tutorial_role" value="${role}" />
			<input type="hidden" id="tutorial_inst_type" value="${inst_type}" />
			<input type="hidden" id="tutorial_log_type" value="${log_type}" />
			<input type="hidden" id="tutorial_set" value="false" />
			<div class="modal-body" id="tutorial_video" style="height: 80%;"></div>
	</div>
</div></div>


<script type="text/javascript">
function pausetutorial() {
	$('#tutorial').get(0).pause();
}
</script>