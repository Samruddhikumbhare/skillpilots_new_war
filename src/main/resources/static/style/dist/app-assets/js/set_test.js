//required to store which patterns have been selected after selecting random
var patterns = [];

$('#select_lesson').multiselect({
	enableClickableOptGroups:true,
	buttonWidth:'250px',
	dropRight:true,
	enableFiltering: true,
	nonSelectedText: '-- Select Lessons --'
});

var emptable = $('#emptable').DataTable({
	"lengthMenu" : [ [ 5, 10, 20, 30, -1 ], [ 5, 10, 20, 30, "All" ] ],
	'initComplete': function(settings){
		var api = this.api();
		api.cells(
				api.rows(function(idx, data, node){
					return $("#selected_employees").val().includes(data[0]);
				}).indexes(),
				0
		).checkboxes.select();
	},
	'columnDefs': [{
		'targets': 0,
		'checkboxes': {'selectRow': true},
	}],
	'select': {'style': 'multi'},
	'order': [[1, 'asc']]
});

//check if returned after saving test
if(emptable.rows().any()) {
	//alert("employee k liye aaya hun");
	$("#div_set_test").css("display", "none");
	$("#div_select_emp").css("display", "block");
	$("#basic-layout-form").html("Assign Test to Employees");
} else if($("#txt_testname").val()!="") {
	//case when page is opened for edit test
	
	//disable test name and desc
	$("#txt_testname").prop("disabled",true);
	$("#txt_testname").prop("title","Test name cannot be changed for report purposes!");
	$("#txt_testdesc").prop("disabled",true);
	$("#txt_testdesc").prop("title","Test description cannot be changed for report purposes!");
	
	//fix values which are not set by default - show ans/test-key/selected lessons/random pattern handling
	//show ans status
	if($("#show_correct_ans").val()=="true")
		$("#chk_showans").prop('checked',true);

	//test_key
	if ($("#select_testkey").val() == '-1')
		setSelectedValue(document.getElementById("select_testkey"),'TK');
	
	//select lessons
	var selected = $("#edit_lesson").val();
	if(selected!=undefined && selected != ""){
		selected = selected.split(",");
		$("#select_lesson").multiselect('select',selected);
	}
	
	//check if marks/ques of any pattern has changed by comparing the total marks in db to the now calculated ones
	var total_marks = $("#txt_totalmarks").val();
	
	//handling for random pattern
	if($("#select_pattern").val()=='ran') {
		$("#txt_totalq").prop("readonly", true);
		$("#txt_cutoff").prop("readonly", true);
		
		var newtotalmarks=0;
		var qpp = $("#q_per_pattern").val();
		var obj={};
		if(qpp!="") {
			var KeyVal = qpp.split(",");
			for (i in KeyVal) {
				KeyVal[i] = KeyVal[i].split(":");
				obj[KeyVal[i][0]]=KeyVal[i][1];
			}
		}
		//get the patterns from the test details page
		var select = $("#select_pattern option");
		for (var i = 0; i < select.length; i++) {
			//skip the select and random option
			if(select[i].value!='-1' && select[i].value!='ran'){
				//check if the pattern was used
				if(obj[select[i].value] != undefined)
					newtotalmarks += Number(document.getElementById(select[i].value).value)*Number(obj[select[i].value]);
			}
		}
		$("#txt_totalmarks").val(newtotalmarks);
	} else {
		totalMark();
	}
	
	if($("#txt_totalmarks").val() != total_marks){
		alertMsg("The total marks of the test has been updated as the marks per question of a pattern has been changed." +
				"The changes will only reflect once you save the updated test.");
	}
} else {
	//set default values
	setSelectedValue(document.getElementById("select_category"),'ran');
	setSelectedValue(document.getElementById("select_pattern"),'ran');
	setSelectedValue(document.getElementById("select_language"),'ENG');
	$("#txt_totalq").prop("readonly", true);
	$("#txt_cutoff").prop("readonly", true);
	if ($("#user_role").val() == 1) {
		$("#moderator_model").modal({
			backdrop : 'static',
			keyboard : false
		});
		$("#moderator_model").modal("show");
		$("#select_moderator").change(function() {
			var sap_id = $(this).val();
			selectLessonByModerator(sap_id);
			$("#moderator_model").modal("hide");
		});
	}
}

function selectLessonByModerator(sap_id){
	$.ajax({
		type : 'get',
		url : 'getlessonsforTest?sap_id='+sap_id,
		success : function(response) {
			var options = '';
			//add rest of the options based on course(response[0])
			for(i = 0 ; i < response[0].length ; i++) {
				options += '<optgroup label="'+response[0][i].course_name+'">';
				for(j = 0 ; j < response[1].length ; j++) {
					if(response[0][i].course_id == response[1][j].course_id)
						options += '<option value="'+response[1][j].lesson_id+'">'+response[1][j].lesson_name+'</option>';
				}
				options += '</optgroup>';
			}
			$('#select_lesson').append(options);
			$('#select_lesson').multiselect('rebuild');
		},
		error : function(err) {
			alert(err);
		}
	});
}
$('.input_date').datepicker({
	autoclose: true,
	format: 'yyyy-mm-dd',
	startDate: new Date(),
	todayHighlight: true}).on('changeDate', function(e) {
		$(this).datepicker('hide');
	});

$("#select_pattern").change(function() {
	var pattern = $(this).val();
	if (pattern == 'ran') {
		$("#txt_totalmarks").val('');
		$("#txt_totalq").val('');
		$("#txt_cutoff").val('');
		$("#txt_totalmarks").prop("readonly", true);
		$("#txt_totalq").prop("readonly", true);
		$("#txt_cutoff").prop("readonly", true);
	} else {
		$("#txt_totalq").prop("readonly", false);
		$("#txt_cutoff").prop("readonly", false);
		var total_q = document.getElementById("txt_totalq").value;
		$("#marks_per_pattern").val(document.getElementById(pattern).value);
		if(total_q!=0 ||total_q!=''){
			var marks_per_q = document.getElementById(pattern).value;
			var total_marks = total_q * marks_per_q;
			$("#txt_totalmarks").val(total_marks);
		}
	}
});
$("#chk_showans").change(function(){
	if(this.checked)
		$("#show_correct_ans").val(true);
	else
		$("#show_correct_ans").val(false);
});

function totalMark() {
	var pattern = $("#select_pattern").val();
	if(pattern==null){
		alert("Please select pattern first.");
		$("#txt_totalq").val("");
		return false;
	}
	var total_q = document.getElementById("txt_totalq").value;
	var marks_per_q = document.getElementById(pattern).value;
	var total_marks = total_q * marks_per_q;
	$("#txt_totalmarks").val(total_marks);
}

function validate() {
	if ($("#txt_testname").val().trim() == '') {
		alert('Please enter test name.');
		return false;
	}
	if ($("#txt_testdesc").val().trim() == '') {
		alert('Please enter test description.');
		return false;
	}
	if ($("#select_lesson").val() == null) {
		alert('Please select lesson.');
		return false;
	}
	if ($("#select_category").val() == '-1' || $("#select_category").val() == null) {
		alert('Please select category.');
		return false;
	}
	if ($("#select_pattern").val() == '-1' || $("#select_pattern").val() == null) {
		alert('Please select pattern.');
		return false;
	}
	if ($("#select_language").val() == '-1'
		|| $("#select_language").val() == null) {
		alert('Please select language.');
		return false;
	}
	if ($("#select_pattern").val() != 'ran') {
		if ($("#txt_totalq").val() == '' || $("#txt_totalq").val() == '0') {
			alert('Please enter total questions.');
			return false;
		}
		
		var cut_off = document.getElementById("txt_cutoff").value;
		var total_marks = document.getElementById("txt_totalmarks").value;
		if ($("#txt_cutoff").val() == '' || $("#txt_cutoff").val() == '0') {
			alert('Please enter cut off marks.');
			return false;
		} else if (Number(total_marks) < Number(cut_off)) {
			$("#cutoff_err").html("Please enter below total marks.").show();
			return false;
		}
	}
	if ($("#select_testkey").val() == '-1' || $("#select_testkey").val() == null) {
		alert('Please select test key.');
		return false;
	}
	if ($("#txt_fromdt").val() == '') {
		alert('Please select schedule-from date.');
		return false;
	}
	if ($("#txt_todt").val() == '') {
		alert('Please select schedule-to date.');
		return false;
	}
	if(new Date($("#txt_todt").val()) < new Date($("#txt_fromdt").val())){
		alert('Schedule-to date should be after schedule-from date.');
		return false;
	}
	if ($("#txt_totaltime").val() == '' || $("#txt_totaltime").val() == '0') {
		alert('Please enter total time for test.');
		return false;
	}
	return true;
}

//disable all fields on view question modal
$(".questions_modal_body :input").prop('disabled',true);
//called when view details of question is clicked 
function viewquestion(question_id){
	clearform();
	$.ajax({
		type : 'get',
		url : "getquestion?question_id=" + question_id,
		success : function(response){
			$("#question").text(response[0].question);
			$("#course_name").val(response[1].course_name);
			$("#lesson_id").val($('#select_lesson option[value="' + response[0].lesson_id + '"]').text());
			$("#category_id").val($('#select_category option[value="' + response[0].category_id + '"]').text());
			$("#pattern_id").val($('#select_pattern option[value="' + response[0].pattern_id + '"]').text());
			$("#language").val($('#select_language option[value="' + response[0].language + '"]').text());
			if (response[0].category_id == 'SA') {
				$('.sa_option').show();
				$('.ma_option').hide();
				$(".true-false-div").hide();
				$("#options_div").show();
			    var $radios = $('input:radio[class=sa_option]');
		        $radios.filter('[value='+response[0].ans+']').prop('checked', true);
			} else if (response[0].category_id == 'MA') {
				$('.sa_option').hide();
				$('.ma_option').show();
				$(".true-false-div").hide();
				$("#options_div").show();
				$('input:checkbox[class=ma_option]').each(function(){
					if(response[0].ans.includes(this.value))
						$(this).prop('checked',true);
				});
			} else {
				$(".true-false-div").show();
				$('.sa_option').hide();
				$('.ma_option').hide();
				$("#options_div").hide();
				$("#opt1").val(" ");
				$("#opt2").val(" ");
				$("#opt3").val(" ");
				$("#opt4").val(" ");
			    var $radios = $('input:radio[class=true_false]');
		        $radios.filter('[value='+response[0].ans.toUpperCase()+']').prop('checked', true);
			}
			
			if(response[0].shuffle_opt=='Y')
				$("#shuffle_ques").prop('checked',true);
			else
				$("#shuffle_ques").prop('checked',false);

			if (response[0].category_id == 'SA' || response[0].category_id == 'MA') {
				$("#opt1").val(response[0].opt_1);
				$("#opt2").val(response[0].opt_2);
				$("#opt3").val(response[0].opt_3);
				$("#opt4").val(response[0].opt_4);
			}
		}, error : function(err) {
			console.log(err);
		} 
		});
}

function clearform(){
	$("#question").text("");
	$("#lesson_id").val("");
	$("#category_id").val("");
	$("#pattern_id").val("");
	$("#language").val("");
	$("#options_div").hide();
	$("#opt1").val(" ");
	$("#opt2").val(" ");
	$("#opt3").val(" ");
	$("#opt4").val(" ");
	$('input:radio[class=sa_option]').each(function(){
		$(this).prop('checked',false);
	});
	$('input:checkbox[class=ma_option]').each(function(){
			$(this).prop('checked',false);
	});
	$('input:radio[class=true_false]').each(function(){
		$(this).prop('checked',false);
	});
	$("#shuffle_ques").prop('checked',false);
}

function createQuesTable(pattern){
	var lang = $("#select_language").val();
	var category = $("#select_category").val();
	var lesson = $("#select_lesson").val();
	var selected_questions = $("#questions").val();
	if(pattern=='Random')
		pattern = patterns;
	$.ajax({
		type : 'get',
		url : "getQuestionSet?pattern=" + pattern + "&category=" + category + "&lesson=" + lesson + "&language=" + lang,
		success : function(response) {
			$("#qcontent").empty();
			var divIndex = 1;
			$ .each(response,function(patrn_id, item) {
				var stStyle='';
				if (divIndex != 1) {
					stStyle = 'style="display: none;"';
				}
				var patternnam = $('#select_pattern option[value="' + patrn_id + '"]').text();
				var patternque = '';
				//get total ques for pattern based on flow (particular pattern or ramdom pattern)
				if(pattern.constructor === Array)
					patternque = $("#ques_"+patrn_id).val();
				else
					patternque = $("#txt_totalq").val();
				//Create Div for each pattern with separate questions
				var tableDiv = '<div class="randomquesdiv" id="tab'+divIndex+'" ' + stStyle + '>'
				+ '<div id="pattern-info" style="padding-left:30px;text-align:center;">'
				+ '<strong>Pattern : </strong>'+patternnam
				+ '&nbsp&nbsp<strong>Minimum questions to be selected : </strong>' + patternque 
				+ '&nbsp&nbsp<span class="error" id="questionmsg'+divIndex+'"></div>'
				+ '<table class="table table-bordered mb-0" id="qtable_'+divIndex+'">'
				+ '<thead><tr><th>#</th><th>Question</th><th>Lesson</th><th>Category</th>'
				+ '<th>Details <input type="hidden" id="selectedRandomQues'+patrn_id+'" value=""></th>'
				+ '</tr></thead><tbody></tbody></table></div>';

				$("#qcontent").append(tableDiv);
				//Initialise datatable
				//'createdcell' event function for when page is opened for edit test, select the questions again
				var ques_table = $("#qtable_"+divIndex).DataTable({
					"lengthMenu" : [ [ 5, 10, 20, 30, -1 ], [ 5, 10, 20, 30, "All" ] ],
					'columnDefs': [{
						'targets': 0,
						'checkboxes': {'selectRow': true},
						'createdCell': function (td, cellData, rowData, row, col){
							if(selected_questions.includes(cellData)){
								this.api().cell(td).checkboxes.select();
							}
						}
					}],
					'select': {'style': 'multi'},
					'order': [[1, 'asc']]
				});

				//add rows to datatable
				for (var i = 0; i < item.length; i++) {
					var category = item[i].category_id=="SA"?"Single Answer":
						item[i].category_id=="MA"?"Multi Answer":
							item[i].category_id=="TF"?"True False":"N/A";
					ques_table.row.add([item[i].question_id,item[i].question,item[i].lesson_name,category,
						'<span data-toggle="modal" data-target="#view_quesDetails_modal" onclick="viewquestion(\''
						+ item[i].question_id + '\')" title="View Details"><i class="icon-file-text"></i></span>']).draw(false);
				}
				
				//when particular patern was selected pattern will not be an array and buttons wont be required
				if(pattern.constructor === Array){
					var divAction = '<div class="form-actions" style="text-align:center;margin-top:0px;padding:10px;">';
					//Prev button handling for each division except first
					if (divIndex != 1) 
						divAction += '<button type="button" class="btn btn-sm btn-primary" onClick="prevPatternDiv('+divIndex+');">Prev</button>';

					//Next button handling for each division except last
					if (divIndex != pattern.length)
						divAction += '<button type="button" class="btn btn-sm btn-primary" onClick="nextPatternDiv('+divIndex+',\''+patrn_id+'\');"'
						+ 'style="margin-left:10px;">Next Pattern</button></div>';

					//Add buttons to division
					$("#tab"+divIndex).append(divAction);
					divIndex += 1;
				}
			});
		},
		error : function(err) {
			console.log(err);
		}
	});
}

$("#test_details_btn_next").click(function() {
	var pattern = $("#select_pattern").val();
	var qpp = $("#q_per_pattern").val();
	var obj={};
	if (validate()){
		if (pattern == 'ran') {
			$("#div_set_q_per_pattern").css("display", "block");
			$("#div_set_test").css("display", "none");
			//edit test flow
			if(qpp!="") {
				var KeyVal = qpp.split(",");
				for (i in KeyVal) {
					KeyVal[i] = KeyVal[i].split(":");
					obj[KeyVal[i][0]]=KeyVal[i][1];
				}
			}
			
			//check if already created patterns page
			if ($(".pattern_type")[0]) {
			} else {
				var marks_per_pattern="";
				//get the patterns from the test details page
				var select = $("#select_pattern option");
				for (var i = 0; i < select.length; i++) {
					//skip the select and random option
					if(select[i].value!='-1' && select[i].value!='ran'){
						var elem = "<div class='col-md-3 form-group'>"
							+ "<label for='patternname'>" + select[i].text + "</label>"
							+ "<input type='number' id='ques_" + select[i].value
							+ "' class='form-control pattern_type' value='";
						elem += obj != '' ? obj[select[i].value] != undefined ? obj[select[i].value] : 0 : 0
						elem += "' onkeyup='totalqm()'></div>";
						$("#append_patterns").append(elem);
						//save marks_per_pattern for each pattern
						if(marks_per_pattern=="")
							marks_per_pattern += select[i].value +":"+ document.getElementById(select[i].value).value;
						else
							marks_per_pattern += "," + select[i].value +":"+ document.getElementById(select[i].value).value;
					}
				}
				$("#marks_per_pattern").val(marks_per_pattern);
			}
			//if q per patterns have been added already for edit test flow then calculate total marks and ques too
			if(qpp!="") {
				totalqm();
				$("#random_pattern_txt_cutoff").val($("#txt_cutoff").val());
			}
		} else {
			$("#cutoff_err").html("").hide();
			$("#marks_per_pattern").val(document.getElementById(pattern).value);
			createQuesTable(pattern);
			$("#div_select_questions").css("display", "block");
			$("#div_set_test").css("display", "none");
		}
	}
});

function totalqm() {
	var total_marks = parseInt(0);
	var total_q = parseInt(0);

	$(".pattern_type").each(function() {
		var pattern_id = this.id.split('_')[1];
		var marks = $("#"+pattern_id).val();
		var qcount = $(this).val();
		if (qcount != '') {
			marks = parseInt(marks) * parseInt(qcount);
			total_q = parseInt(total_q) + parseInt(qcount);
			total_marks = parseInt(total_marks) + parseInt(marks);
		}
	});

	$("#random_pattern_tot_marks").val(total_marks);
	$("#random_pattern_tot_q").val(total_q);
	$("#txt_totalmarks").val(total_marks);
	$("#txt_totalq").val(total_q);
}

//to validate ques_per_pattern page
function randomPatternValidate() {
	if ($("#random_pattern_tot_q").val() == '' || $("#random_pattern_tot_q").val() == '0') {
		alert('The total questions in a test cannot be 0. Please add questions per pattern-wise.');
		return false;
	}else if ($("#random_pattern_txt_cutoff").val() == '' || $("#random_pattern_txt_cutoff").val() == '0') {
		alert('Please enter cut off marks.');
		return false;
	} else {
		var cut_off = document.getElementById("random_pattern_txt_cutoff").value;
		var total_marks = document.getElementById("random_pattern_tot_marks").value;
		if (Number(total_marks) < Number(cut_off)) {
			$("#random_pattern_cutoff_err").html("Please enter below total marks.").show();
			return false;
		} else {
			//to be saved while form submit
			$("#txt_cutoff").val($("#random_pattern_txt_cutoff").val());
			return true;
		}
	}
}

$("#ques_per_pattern_btn_prev").click(function() {
	$("#txt_cutoff").val($("#random_pattern_txt_cutoff").val());
	$("#div_set_q_per_pattern").css("display", "none");
	$("#div_set_test").css("display", "block");
	$("#div_select_emp").css("display", "none");
});

$("#ques_per_pattern_btn_next").click(function() {
	if (randomPatternValidate()) {
		$("#random_pattern_cutoff_err").html("").hide();
		var q_per_pattern="";
		patterns = [];
		var lang = $("#select_language").val();
		var category = $("#select_category").val();
		var lesson = $("#select_lesson").val();
		//get the patterns from the test details page
		var select = $("#select_pattern option");

		$(".pattern_type").each(function() {
			var pattern_id = this.id.split('_')[1];
			var q_for_this_pattern = this.value;

			//check if this pattern has to be included
			if(q_for_this_pattern != '' && q_for_this_pattern != '0'){
				//add to q_per_pattern column
				if(q_per_pattern=='')
					q_per_pattern=this.id.split('_')[1]+':'+this.value;
				else
					q_per_pattern+=","+this.id.split('_')[1]+':'+this.value;
				//populate global variable to be used when creating divisions and later when submitting
				patterns.push(pattern_id);
			}
		});
		$("#q_per_pattern").val(q_per_pattern);
		createQuesTable('Random');
		$("#div_select_questions").css("display", "block");
		$("#div_set_q_per_pattern").css("display", "none");
		$("#div_select_emp").css("display", "none");
	}
});

//functions for moving between pattern division of random pattern
function prevPatternDiv(divid) {
	var pd = divid - 1;
	$("#tab" + divid).css("display", "none");
	$("#tab" + pd).css("display", "block");
}

function nextPatternDiv(divid, ptId) {
	var selectedIds = [];
	var ques_for_this_pattern = $("#ques_"+ptId).val();
	var rows_selected = $("#qtable_"+divid).DataTable().column(0).checkboxes.selected();
	
	if(rows_selected.length<ques_for_this_pattern) {
		$("#questionmsg"+divid).html("Insufficient questions selected!").show();
		return false;
	}
	
	$("#questionmsg"+divid).html("").hide();
	var pd = divid + 1;
	$("#tab" + divid).css("display", "none");
	$("#tab" + pd).css("display", "block");
}

$("#ques_page_btn_prev").click(function() {
	if ($("#select_pattern").val() == 'ran') {
		$("#div_select_questions").css("display", "none");
		$("#div_set_q_per_pattern").css("display", "block");
		$("#div_select_emp").css("display", "none");
	} else {
		$("#div_select_questions").css("display", "none");
		$("#div_set_test").css("display", "block");
		$("#div_select_emp").css("display", "none");
	}
});

$("#ques_page_btn_save").click(function() {
	var pattern = $("#select_pattern").val();
	if (pattern == 'ran') {
		for(i=0; i<patterns.length; i++){
			var divIndex = i+1;
			var selectedIds = [];
			var rows_selected = $("#qtable_"+divIndex).DataTable().column(0).checkboxes.selected();
			var ques_for_this_pattern = $("#ques_"+patterns[i]).val();
			
			if(rows_selected.length<ques_for_this_pattern) {
				$("#questionmsg"+divIndex).html("Insufficient questions selected!").show();
				return false;
			}
			
			rows_selected.each(function(index,rowId){
				selectedIds.push(index);
			});
			
			if(i==0)
				$("#questions").val(patterns[i]+":"+selectedIds);
			else
				$("#questions").val($("#questions").val() + ";" + patterns[i] + ":" + selectedIds);
		}
	} else {
		//since single pattern was choosen for test 
		var divIndex = 1;
		var selectedIds = [];
		var rows_selected = $("#qtable_"+divIndex).DataTable().column(0).checkboxes.selected();
		var ques_for_this_pattern = $("#txt_totalq").val();

		if(rows_selected.length<ques_for_this_pattern) {
			$("#questionmsg"+divIndex).html("Insufficient selected questions").show();
			return false;
		}
		
		rows_selected.each(function(index,rowId){
			selectedIds.push(index);
		});
		$("#questions").val(selectedIds);
	}
	$("#submittest").submit();

});

$("#save_emp_next_btn").click(function() {
	var selectedIds = [];
	var rows_selected = emptable.column(0).checkboxes.selected();
	if(rows_selected.length==0) {
		alert("Please select atleast one Employee before assigning test!")
		return false;
	}

	rows_selected.each(function(index,rowId){
		$("#submittestdata").append($('<input>').attr('type', 'hidden').attr('name', 'sap_id').val(index));
	});
	$("#submittestdata").submit();
});