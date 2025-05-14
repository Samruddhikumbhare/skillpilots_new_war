<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade show" id="details_modal" tabindex="-1"
	role="dialog" aria-labelledby="myLargeModalLabel"
	aria-modal="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="panel-heading"
				style="font-size: 18px; background: #0f2c7eeb; color: whitesmoke; text-align: center;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<span class="modal-title" id="det_title"></span>
			</div>
			<div class="modal-body comp_col_info_modal_body">
				<div id="div_logo" style="text-align: center">
					<img id="item_logo" alt="" src=""
						style="max-height: 120px;">
				</div>
				<br>
				<div class="row">
					<div class="col-md-3" id="about_us_para">
						<strong><span>About Us : </span><br></strong>
					</div>
					<div class="col-md-9">
						<strong><span id="det_about_us"
							style="font: status-bar; line-height: 1.5rem; font-size: 14px;"></span></strong>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-3">
						<strong>Estd. Date : </strong>
					</div>
					<div class="col-md-9">
						<strong><span id="det_est"></span></strong>
					</div>
				</div>
				<br>
				<div class="row" id="coll_details_dept" style="display: none">
					<div class="col-md-3">
						<strong>Departments  </strong>
					</div>
					<div class="col-md-9">
						<strong><span id="deptDetailsBody"></span></strong>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<strong>Web-site : </strong>
					</div>
					<div class="col-md-9">
						<strong><a id="det_weburl_link" target="new"><span
								id="det_weburl"></span></a></strong>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

