//Date picker

//set default drowp down first element blank
document.getElementById("technology_name").selectedIndex = -1;
$('#comp_adv_form').hide();
$("#comp_schedule_form").hide();

function showAdversementForm(){
	$('#schedform').trigger("reset");
	document.getElementById("technology_name").selectedIndex = -1;
	$("#nxtbtn").prop('disabled', true);
	$("#comp_schedule_form").hide();
	$('#comp_adv_form').show();
	//for scrolling
	$('.content-wrapper').animate({scrollTop: $(document).height()}, 1000);
}

function closeForm(){
	$('#schedform').trigger("reset");
	document.getElementById("technology_name").selectedIndex = -1;
	$('#comp_adv_form').hide();
	$("#comp_schedule_form").hide();
	tab = document.getElementById("weekly_schd");
	while (tab.hasChildNodes()) {
		tab.removeChild(tab.lastChild);
	}
}

function saveadvdata(){
	$("#getskipval").val("no");
	getschddata();
	$("#schedform").submit();
}

function editAdvertisement(com_adv_id,duration){
	$('#comp_adv_form').show();
	$("#comp_schedule_form").hide();
	$.ajax({
		type:"GET",
		url:"editCompAdvertisement?adv_id="+com_adv_id,
		success:function(response){
			$('#advertisement_id').val(response.advertisement_id);
			$('#technology_name').val(response.technology_name);
			$('#description').val(response.description);
			$('#capacity').val(response.capacity);
			$('#duration').val(response.duration);
			$('#startdate').val(response.start_date);
			$('#adv_title').val(response.adv_title);
			$('#stipend').val(response.stipend);
			
			$("#skip_sbtn").replaceWith('<input type="button" id="nxtbtn" class="btn btn-primary pull-right" disabled="disabled"'+
				' onclick="showCompanyScheduleform($(\'#advertisement_id\').val(),$(\'#duration\').val());" value="Next" />');

			if(response.requirement!=null){
				var selectedOptions = response.requirement.split(",");
				$("#select_requirements").multiselect('select',selectedOptions);
			}
			
			validate_form();
			
			//for scrolling
			$('.content-wrapper').animate({scrollTop: $(document).height()}, 1000);

		},
		error:function(){
			alert('Oops! Some error occured while fetching the advertisement details.');
		}
	});
}

function readmore(val){
	$("#advt_details").html(val);
	$("#comp_advt_details_modal").modal("show");
}

// acccept only number
$(document).ready(function () {
	//called when key is pressed in textbox
	$("#duration").keypress(function (e) {
		//if the letter is not digit then display error and don't type anything
		if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			/* display error message */
			$("#errmsg").html("Number Only").show().fadeOut("slow");
			return false;
		}
	});

	$("#capacity").keypress(function (e) {
		//if the letter is not digit then display error and don't type anything
		if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
			/* display error message */
			$("#errmsgcap").html("Number Only").show().fadeOut("slow");
			return false;
		}
	});

	$("#select_requirements").multiselect({
		enableCaseInsensitiveFiltering: true,
		enableCollapsibleOptGroups: true,
        collapseOptGroupsByDefault: true,
		onChange: function(option, checked) {
			//Get selected options.
			var selectedOptions = $('#select_requirements option:selected');

			if (selectedOptions.length >= 9) {
				//Disable all other checkboxes.
				var nonSelectedOptions = $('#select_requirements option').filter(function() {
					return !$(this).is(':selected');
				});

				nonSelectedOptions.each(function() {
					var input = $('input[value="' + $(this).val() + '"]');
					input.prop('disabled', true);
					input.parent('li').addClass('disabled');
				});
			}
			else {
				//Enable all checkboxes.
				$('#select_requirements option').each(function() {
					var input = $('input[value="' + $(this).val() + '"]');
					input.prop('disabled', false);
					input.parent('li').addClass('disabled');
				});
			}
		}});
});


//validation for next button
var toValidate = [$('#adv_title'), $('#technology_name'), $('#description'), $('#capacity'), $('#duration')];
toValidate.forEach(function (element) {
	element.data('valid', false);
	element.change(function () {
		validate_form();
	});
});

function validate_form(){
	var valid = true;
	toValidate.forEach(function (element) {
		if (element.val()==null || element.val().length == 0) {
			valid=false;
		}
	});
	if(valid == true && $('#duration').val() > 0 && $('#capacity').val() > 0){
		$("#nxtbtn").prop('disabled', false);
	}else{
		$("#nxtbtn").prop('disabled', true);
	}
}

function showCompanyScheduleform(com_adv_id,duration){
	$('#comp_adv_form').hide();
	//get_schedule(com_adv_id,"INLINE");
	$("#comp_schedule_form").show();
	//for scrolling
	$('.content-wrapper').animate({scrollTop: $(document).height()}, 1000);
}

function SkipSchdl_form(){
	$("#comp_schedule_form").hide();
	$("#nxtbtn").replaceWith('<input type="submit" id="skip_sbtn" onclick="getdataskip()" class="btn btn-primary pull-right" value="Submit"/>');
	$('#comp_adv_form').show();
}

function back(){
	$("#comp_schedule_form").hide();
	$('#comp_adv_form').show();
}

function getdataskip(){
	$("#getskipval").val("yes");
	$("#schedform").submit();
}