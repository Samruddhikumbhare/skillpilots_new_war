/*function confirmAdversemnt(tech,cmp,duration,adv_id){
	$('.modal-body #tech').text(tech);
	$('.modal-body #company').text($('#'+cmp).text());
	$('#hid').val(adv_id);
	$('#redirect_page').val('company_adv_forcollege');
	$('.modal-body #duration').text(duration);
	$('#confirmAdvertisement').modal('toggle');

}*/

//for page no navigation since first page is shown on dashboard hence 2
var active_page_no = 2;

function getpageno(pgno) {
	active_page_no = pgno;
}
function advertisementLoad() {
	$
	.ajax({
		type : "GET",
		url : "getAllCompanyPosts",
		success : function(response) {

			if (response[1] != '0') {
				$('.box-footer clearfix').show();
			} else {
				$('.box-footer clearfix').hide();
			}

			$('#box').html('<p align="center" style="color:#0073b7"><Strong>Loading...</Strong></p>');
			$("#box").height("700");

			dispadvertisement(response);
			return response;
		},
		error : function() {
			alert(error_fetch);
		}
	});

}

//pagination button click
/*function getnextAdvertisement(data, pgno) {

	var cities = [];
	$.each($("input[name='location']:checked"), function() {
		cities.push($(this).val());
	});
	var dept = [];
	$.each($("input[name='dept']:checked"), function() {
		//since dept name has symbols in it so its value wasn't saved properly. so removed symbols in value of input 
		//and saved it as label id instead 
		var label = $("#lbl_"+$(this).val());
		dept.push($(label).text());
	});

	var technology = [];
	$.each($("input[name='tech']:checked"), function() {
		//since technology has symbols in it so its value wasn't saved properly. so removed symbols in value of input 
		//and saved it as label id instead
		var label = $("#lbl_"+$(this).val());
		technology.push($(label).text());
	});
	//alert(technology);
	var paid_type = [];
	$.each($("input[name='stipend']:checked"), function() {
		paid_type.push($(this).val());
	});
	var duration_arr = [], duration_val = 0;
	$.each($("input[name='duration']:checked"), function() {
		duration_arr.push($(this).val());
		duration_val = $('#duration_val').val();
		if (duration_val == '') {
			duration_arr.pop();
		} else {
			duration_arr.push(duration_val);
		}
	});

	$('#box').empty();
	$('ul li').click(function() {
		$('li').removeClass("active");
		$(this).addClass("active");
	});

	$.ajax({
		type : "GET",
		url : "nxtpage?from_id=" + data + "&page_no=" + pgno
		+ "&location=" + cities + "&department=" + dept
		+ "&technology=" + technology + "&paid_type="
		+ paid_type + "&duration=" + duration_arr,
		success : function(response) {

			if (response[1] === '0' || response[1] === 0) {
				$('.box-footer clearfix').hide();
			} else {
				$('.box-footer clearfix').show();
			}
			$('#box').html('<p align="center" style="color:#0073b7"><Strong>Loading...</Strong></p>');
			$("#box").height("700");

			dispadvertisement(response);
			return response;
		},
		error : function() {
			alert(error_fetch);
		}
	});
}*/

function getnextAdvertisement(data) {
	var cities = [];
	$.each($("input[name='location']:checked"), function() {
		cities.push($(this).val());
	});
	var dept = [];
	$.each($("input[name='dept']:checked"), function() {
		//since dept name has symbols in it so its value wasn't saved properly. so removed symbols in value of input 
		//and saved it as label id instead 
		var label = $("#lbl_"+$(this).val());
		dept.push($(label).text());
	});

	var technology = [];
	$.each($("input[name='tech']:checked"), function() {
		//since technology has symbols in it so its value wasn't saved properly. so removed symbols in value of input 
		//and saved it as label id instead
		var label = $("#lbl_"+$(this).val());
		technology.push($(label).text());
	});
	//alert(technology);
	var paid_type = [];
	$.each($("input[name='stipend']:checked"), function() {
		paid_type.push($(this).val());
	});
	var duration_arr = [], duration_val = 0;
	$.each($("input[name='duration']:checked"), function() {
		duration_arr.push($(this).val());
		duration_val = $('#duration_val').val();
		if (duration_val == '') {
			duration_arr.pop();
		} else {
			duration_arr.push(duration_val);
		}
	});

	$('.disp').empty();
	$('ul li').click(function() {
		$('li').removeClass("active");
		$(this).addClass("active");
	});
	$.ajax({
		type : "GET",
		url : "nxtpage?location=" + cities + "&department=" + dept
		+ "&technology=" + technology + "&paid_type="
		+ paid_type + "&duration=" + duration_arr,
		success : function(response) {
			if (response[1] === '0' || response[1] === 0) {
				$('.box-footer clearfix').hide();
			} else {
				$('.box-footer clearfix').show();
			}
			$('.disp').html('<p align="center" style="color:#0073b7"><Strong>Loading...</Strong></p>');
			$("#box").height("700");

			dispadvertisement(response);
			return response;
		},
		error : function() {
			alert(error_fetch);
		}
	});
}

function dispadvertisement(response){
	setTimeout(
			function() {
				$('.disp').empty();
				if (response[0].length == 0) {
					$('.disp').append('<lable><center><strong>No Advertisement Found</strong></center></lable>');
				}
				for (var i = 0; i < response[0].length; i++) {
					var stipend_str = '';
					if (response[0][i].stipend != 0)
						stipend_str = 'Stipend : ' + response[0][i].stipend;
					else
						stipend_str = 'Unpaid';
					var role='';
				
					var student='';
					if($("#role").val()==1){
						$('.disp').append(
								'<div class="height-100-p pd-20" style="position: relative; max-height: 100%; overflow: auto;padding-bottom: 0px;'
								+ 'id="'+response[0][i].advertisement_id+'">'
								+'<div class="row">'
								+'<div class="col-md-9">'
								+'<h6 class="h5 mb-20" data-toggle="tooltip" data-placement="top" title="Description of internship" style="font-weight: 100; background: #e9edf1cc; padding-left: 9px; color: #0c0c0c; font-weight: 400; border-radius: 12px;">'
								+response[0][i].adv_title
								+'</h6></div>'
								+'<div class="col-md-3 text-center"> <img class="img-thumbnail" style="max-width: 70px; max-height: 78px;" src="/get_logos?id?id='+ response[0][i].company_id +'"/>'
								+'</div></div>'
								+ '<div class="row">'
								+'<div class="col-md-3">'
								+'<h6 class="h6 mb-20" style="font-weight: 100;"><i class="fa fa-map-marker" style="color: red"></i>&nbsp;'
								+response[0][i].location
								+'</h6>'
								+'</div>'
								+'<div class="col-md-9 truncate-normal">'
								+'<a href="javascript:void(0);"><span class="pointer cmpname cmp' + response[0][i].company_id + '"onclick="getCompanyDetails('+"'"+response[0][i].company_id+"'"+');" id="'+ response[0][i].company_id +'" style="color: #33a6f8;"></span></a>'
								+'</div></div>'
								+'<div class="row">'
								+'<div class="col-md-3">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-play-circle-o"></i>&nbsp;START DATE</span><br>Immediately'
								+'</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-clock-o"></i>&nbsp;DURATION</span><br>'+response[0][i].duration +'&nbsp;Week</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-rupee"></i>&nbsp;STIPEND</span><br> <i class="fa fa-rupee"></i>&nbsp;'
								+ stipend_str
								+'</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-users"></i>&nbsp;CAPACITY</span><br>'
								+ response[0][i].capacity
								+'</div></div><br>'
								+'<div class="row">'
								+'<div class="col-md-6">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-briefcase"></i>&nbsp;SKILL/TECHNOLOGY</span><br>'
								+ response[0][i].technology_name
								+'</div>'
								+'<div class="col-md-3 text-center"></div>'
								+'<div class="col-md-3 text-center"><br>'
								+'<button type="button" id="s_skill_wise" onclick="show_schedule_modal('+"'"+ response[0][i].advertisement_id +'\','+"'"+response[0][i].duration + '\',\'ADV\');" class="btn btn-sm testme" style="background: #213c87; padding: 2px 6px 3px 6px; color: white;">'
								+'View Schedule&nbsp;<i class="fa fa-angle-double-right"></i></button></div>'
								+'<div class="col-md-3 text-center"><br>'
								+'</div></div>'
								+'<hr>'
								+ ($("#role").val()==hod_Role || $("#role").val()==dept_incharge_Role? role : '')
								+ ($("#student_log").val()==user_initials_student ? student : '')
								+ '</div>'
								+ '</div>'
								+ '</div>'
						);
					}
					if($("#role").val()==2){
						$('.disp').append(
								'<div class="height-100-p pd-20" style="position: relative; max-height: 100%; overflow: auto;padding-bottom: 0px;'
								+ 'id="'+response[0][i].advertisement_id+'">'
								+'<div class="row">'
								+'<div class="col-md-9">'
								+'<h6 class="h5 mb-20" data-toggle="tooltip" data-placement="top" title="Description of internship" style="font-weight: 100; background: #e9edf1cc; padding-left: 9px; color: #0c0c0c; font-weight: 400; border-radius: 12px;">'
								+response[0][i].adv_title
								+'</h6></div>'
								+'<div class="col-md-3 text-center"> <img class="img-thumbnail" style="max-width: 70px; max-height: 78px;" src="/get_logos?id='+ response[0][i].company_id +'"/>'
								+'</div></div>'
								+ '<div class="row">'
								+'<div class="col-md-3">'
								+'<h6 class="h6 mb-20" style="font-weight: 100;"><i class="fa fa-map-marker" style="color: red"></i>&nbsp;'
								+response[0][i].location
								+'</h6>'
								+'</div>'
								+'<div class="col-md-9 truncate-normal">'
								+'<a href="javascript:void(0);"><span class="pointer cmpname cmp' + response[0][i].company_id + '"onclick="getCompanyDetails('+"'"+response[0][i].company_id+"'"+');" id="'+ response[0][i].company_id +'" style="color: #33a6f8;"></span></a>'
								+'</div></div>'
								+'<div class="row">'
								+'<div class="col-md-3">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-play-circle-o"></i>&nbsp;START DATE</span><br>Immediately'
								+'</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-clock-o"></i>&nbsp;DURATION</span><br>'+response[0][i].duration +'&nbsp;Week</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-rupee"></i>&nbsp;STIPEND</span><br> <i class="fa fa-rupee"></i>&nbsp;'
								+ stipend_str
								+'</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-users"></i>&nbsp;CAPACITY</span><br>'
								+ response[0][i].capacity
								+'</div></div><br>'
								+'<div class="row">'
								+'<div class="col-md-6">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-briefcase"></i>&nbsp;SKILL/TECHNOLOGY</span><br>'
								+ response[0][i].technology_name
								+'</div>'
								+'<div class="col-md-3 text-center"><br>'
								+'<button type="button" id="s_skill_wise" onclick="show_schedule_modal('+"'"+ response[0][i].advertisement_id +'\','+"'"+response[0][i].duration + '\',\'ADV\');" class="btn btn-sm testme" style="background: #213c87; padding: 2px 6px 3px 6px; color: white;">'
								+'View Schedule&nbsp;<i class="fa fa-angle-double-right"></i></button></div>'
								+'<div class="col-md-3 text-center"><br>'
								+'<button type="button" style="background: #213c87;padding: 2px 8px 3px 8px;font-size: 14px;color: white;class=;border: aliceblue;border-radius: 4px; color: white; class="btn btn-sm margin" id="'+ response[0][i].company_id +'"'
								+'data-toggle="modal" data-target="#raised_Modal" onclick="setCompanyData(this,\''+response[0][i].technology_name + "','" + response[0][i].duration + "','" + response[0][i].advertisement_id + '\');">Apply'
								+'<div class="ripple-container"></div>'
								+'</button>'
								+'</div></div>'
								+'<hr>'
								+ ($("#role").val()==hod_Role || $("#role").val()==dept_incharge_Role? role : '')
								+ ($("#student_log").val()==user_initials_student ? student : '')
								+ '</div>'
								+ '</div>'
								+ '</div>'
						);
					}
					if($("#student_log").val()=="ST"){
						$('.disp').append(
								'<div class="height-100-p pd-20" style="position: relative; max-height: 100%; overflow: auto;padding-bottom: 0px;'
								+ 'id="'+response[0][i].advertisement_id+'">'
								+'<div class="row">'
								+'<div class="col-md-9">'
								+'<h6 class="h5 mb-20" data-toggle="tooltip" data-placement="top" title="Description of internship" style="font-weight: 100; background: #e9edf1cc; padding-left: 9px; color: #0c0c0c; font-weight: 400; border-radius: 12px;">'
								+response[0][i].adv_title
								+'</h6></div>'
								+'<div class="col-md-3 text-center"> <img class="img-thumbnail" style="max-width: 70px; max-height: 78px;" src="${pageContext.request.contextPath}/?id='+ response[0][i].company_id +'"/>'
								+'</div></div>'
								+ '<div class="row">'
								+'<div class="col-md-3">'
								+'<h6 class="h6 mb-20" style="font-weight: 100;"><i class="fa fa-map-marker" style="color: red"></i>&nbsp;'
								+response[0][i].location
								+'</h6>'
								+'</div>'
								+'<div class="col-md-9 truncate-normal">'
								+'<a href="javascript:void(0);"><span class="pointer cmpname cmp' + response[0][i].company_id + '"onclick="getCompanyDetails('+"'"+response[0][i].company_id+"'"+');" id="'+ response[0][i].company_id +'" style="color: #33a6f8;"></span></a>'
								+'</div></div>'
								+'<div class="row">'
								+'<div class="col-md-3">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-play-circle-o"></i>&nbsp;START DATE</span><br>Immediately'
								+'</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-clock-o"></i>&nbsp;DURATION</span><br>'+response[0][i].duration +'&nbsp;Week</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-rupee"></i>&nbsp;STIPEND</span><br> <i class="fa fa-rupee"></i>&nbsp;'
								+ stipend_str
								+'</div>'
								+'<div class="col-md-3 text-center">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-users"></i>&nbsp;CAPACITY</span><br>'
								+ response[0][i].capacity
								+'</div></div><br>'
								+'<div class="row">'
								+'<div class="col-md-6">'
								+'<span style="font-size: 12px; color: gray;"><i class="fa fa-briefcase"></i>&nbsp;SKILL/TECHNOLOGY</span><br>'
								+ response[0][i].technology_name
								+'</div>'
								+'<div class="col-md-3 text-center"><br>'
								+'<button type="button" id="s_skill_wise" onclick="show_schedule_modal('+"'"+ response[0][i].advertisement_id +'\','+"'"+response[0][i].duration + '\',\'ADV\');" class="btn btn-sm testme" style="background: #213c87; padding: 2px 6px 3px 6px; color: white;">'
								+'View Schedule&nbsp;<i class="fa fa-angle-double-right"></i></button></div>'
								+'<div class="col-md-3 text-center"><br>'
								+'<button type="button" class="btn btn-sm margin" id="'+ response[0][i].company_id +'"'
								+'onclick="getAdvertisementStatus('+"'"+response[0][i].technology_name+'\','+"'"+response[0][i].company_id+"'"+','+"'"+response[0][i].duration +'\','+"'"+response[0][i].advertisement_id+"'"+');"'
								+'style="background: #213c87; padding: 2px 6px 2px 6px; color: white;">Apply'
								+'<div class="ripple-container"></div>'
								+'</button>'
								+'</div></div>'
								+'<hr>'
								+ ($("#role").val()==hod_Role || $("#role").val()==dept_incharge_Role? role : '')
								+ ($("#student_log").val()==user_initials_student ? student : '')
								+ '</div>'
								+ '</div>'
								+ '</div>'
						);
					}
					
				}showResponseData()
			}, 4000);

	$('#page_list1').empty();
	//alert("pages - " + response[1]);
	/*for (var p = 1; p <= response[1]; p++) {
		if (active_page_no == p) {
			$('#page_list1').append('<li class="active scrollToTop" id="li'+p+'"><a class="scrollToTop" href="#">'+p+'</a></li>');
		} else {
			$('#page_list1').append('<li class="pagination_li" id="li'+p+'"><a class="scrollToTop" href="javascript:void(0)"' + 
					'onclick="getpageno('+p+');getnextAdvertisement(' +(p-1)*limit+ ','+p+');">'+p+'</a></li>');
		}
	}*/
}

$(document).ready(
		function() {
			$('#location_reset').hide();
			$('#dept_reset').hide();
			$('#tech_reset').hide();
			$('#sti_reset').hide();
			$('#duration_reset').hide();
			//Location/Department/Technology Search
			$('.search_control').keyup(function() {
				var input, filter, i, j;
				input = $.trim(this.value);
				//alert(input);
				filter = input.toUpperCase().replace(')', '').replace('(', '').replace('&', '').replace('.', '').replace(' ', '')
							.replace('#', '').replace('/', '').replace('\'', '');
				if(filter.length>0){
					$("#div_"+this.id+" input[name='"+this.id+"']").each(function() {
						var values = this.value;
						//console.log('input:-'+input.toUpperCase());
						for (j = 0; j <= (values.length - filter.length); j++) {
						//alert("value=>"+values+"\nvalue of j=>"+j+"\n"+"comparing=>"+filter+"&"+values.substring(j,j+filter.length));
							if (filter == values.substring(j,j+filter.length).toUpperCase()) {
								$('[id=lbl_' + values + "]").show();
								break;
							}
						}
						if (j == (values.length - filter.length + 1)) {
							$('[id=lbl_' + values + "]").hide();
						}
					});
				}else{
					$("#div_"+this.id+" input[name='"+this.id+"']").each(function() {
						var values = this.value;
						$('[id=lbl_' + values + "]").show();
					});
				}	
			});
			
			$(".filter_checkbox").click(function() {
				var name = this.name;
				if ($(this).is(":checked")) {
					$('#'+name+'_reset').show();
				} else if ($('#div_'+name+' :checkbox:checked').length == 0) {
					$('#'+name+'_reset').hide();
				}
			});

			$(".sti_check").click(function() {
				if ($(this).is(":checked")) {
					$('#sti_reset').show();
				} else {
					$('#sti_reset').hide();
				}
			});

			$(".duration_check").click(function() {
				if ($(this).is(":checked")) {
					$('#duration_reset').show();
				} else {
					$('#duration_reset').hide();
				}
			});
		});

function resetSearch(param, id) {
	$("input[name='" + param + "']:checked").removeAttr('checked');
	active_page_no = 1;
	advertisementLoad();
	$('#' + id).hide();
	$('#duration_val').val('');
}
var company_radio_id = '', avd_id = '';
function setCompanyData(company_id,tech_name,duration,adv_id){
	company_radio_id=company_id.id;
	avd_id=adv_id;
	$("#companyList input[name='cmp_radiobtn']").each(function() {
		if($(this).attr('id')===company_id.id){
			var com_id=$(this).attr('id');
			$('input[name="cmp_radiobtn"][id="'+com_id+'"]').prop('checked', true);
			$('#selecttechnology').val(tech_name);
			$('#duration_week').val(duration);
			$('#selecttechnology').prop('disabled', true);
			$('#duration_week').prop('disabled', true);
			$('input[name="cmp_radiobtn"][id="'+com_id+'"]').show();
			$('.test'+com_id).show()
		}else{
			var com_id=$(this).attr('id');
			$('input[name="cmp_radiobtn"][id="'+com_id+'"]').hide();
			$('.test'+com_id).hide();
		}
	});
}

//call when close model 
$("#raised_Modal").on(
		"hidden.bs.modal",
		function() {
			// $('#itemList').empty();
			company_radio_id = '';
			$("#raised_Modal .modal-body").find(
			'input:radio, input:checkbox').prop('checked',
					false);
			$('#req_msg').val('');
		 $('#send_interns').attr("disabled","disabled");
		}
);