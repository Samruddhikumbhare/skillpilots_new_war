<div class="modal fade show" id="testRulesModal" role="dialog" style="background:rgba(0, 0, 0, 0.9)">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content modelfix">
			<div class="panel-heading">
				<h6 class="modal-title" style="background: #015ba9;color: white;padding-left: 12px;">Test Instructions</h6>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<span style="background: #07f5a5;color: black; padding: 3px 9px 3px 9px; border-radius: 5px;">The test consists of 
						<span id="test_ins_total_ques"></span> questions and is of 
						<span id="test_ins_total_marks"></span> marks.</span>
				</div>
				<br>
				<div>
					<i class="fa fa-dot-circle-o"></i>&nbsp;<span>Please read following points carefully before you
						start the test.</span>
				</div>
				<ol>
					<li><i class="fa fa-dot-circle-o"></i>&nbsp;Once you start the test, you can not leave.</li>
					<li><i class="fa fa-dot-circle-o"></i>&nbsp;If you Change the tab / Refresh the page / Close the window / Right Click 
						you will be disqualified without warning.</li>
					<li><i class="fa fa-dot-circle-o"></i>&nbsp;If the timer runs out, the test will be automatically submitted.





 .</li>
				</ol>
			</div>
			<div class="modal-footer" style="border-top: 0px;">
				<div style="overflow: auto;">
					<div style="float: right;">
						<button type="button" class="btn-danger btn-sm" id="cancelBtn" onclick="cancelTest();">Cancel</button>
						<button type="button" class="btn-sm" onclick="startTest();">Start Test</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>