$(document).ready(function() {
	var ques_table=$('#existing_ques_table').DataTable({
		 responsive: true,
		"lengthMenu" : [ [ 5, 10, 20, 30, -1 ], [ 5, 10, 20, 30, "All" ] ],
		dom: 'Blfrtip',
        buttons: [
        	{
        		extend:'excel',
        		text:'<b>   Download All Que. </b>',
        		className: 'custom-btn fa fa-download   ',
        		title: 'KTC All Questions',
        		
        	exportOptions: {
	                columns: [1, 2, 3 , 4, 5, 6, 7, 8]
	            },
        	}
        ],
		'columnDefs': [
			{
				'targets': 0,
				'checkboxes': {
					'selectRow': true
				}
			}
			],
		'select': {
			'style': 'multi'
		},
		'order': [[1, 'asc']]
	});
	
	$(".options").hide();
	$(".true-false-div").hide();
	$("#shuffle_option_div").hide();
	$('#categoryid').change(function() {
		$("#add_ansvalue").val("");
		var v = $(this).val();
		if (v == 'SA') {
			$('.sa_add_option').show();
			$('.ma_add_option').hide();
			$(".true-false-div").hide();
			$("#shuffle_option_div").show();
			$(".options").show();
		} else if (v == 'MA') {
			$('.sa_add_option').hide();
			$('.ma_add_option').show();
			$(".true-false-div").hide();
			$("#shuffle_option_div").show();
			$(".options").show();
		} else {
			$(".true-false-div").show();
			$('.sa_add_option').hide();
			$('.ma_add_option').hide();
			$("#shuffle_option_div").hide();
			$(".options").hide();
			$("#option1").val(" ");
			$("#option2").val(" ");
			$("#option3").val(" ");
			$("#option4").val(" ");
		}
	});

	$('.sa_add_option').click(function() {
		if ($('.sa_add_option').is(":checked")) {
			$("#add_ansvalue").val($(this).val());
		}
	});

	$('.ma_add_option').click(function() {
		var val = [];
		var i = 0;
		$('.ma_add_option:checked').each(function() {
			val[i] = $(this).val();
			i++;
		});
		$("#add_ansvalue").val(val.toString());
	});
	
	$('.add_true_false').click(function() {
		if ($('.add_true_false').is(":checked")) {
			$("#add_ansvalue").val($(this).val());
		}
	});

	$('#shuffle_per_ques').change(function() {
		if ($(this).is(":checked")) {
			$("#" + this.id + "_hidden").val("Y");
		} else {
			$("#" + this.id + "_hidden").val("N");
		}
	});
	
	$('#edit_categoryid').change(function() {
		$("#edit_ansvalue").val("");
		var v = $(this).val();
		if (v == 'SA') {
			$('.sa_edit_option').show();
			$('.ma_edit_option').hide();
			$(".edit_true-false-div").hide();
			$(".edit_options").show();
			$("#shuffle_edit_option_div").show();
		} else if (v == 'MA') {
			$('.sa_edit_option').hide();
			$('.ma_edit_option').show();
			$(".edit_true-false-div").hide();
			$(".edit_options").show();
			$("#shuffle_edit_option_div").show();
		} else {
			$(".edit_true-false-div").show();
			$('.sa_edit_option').hide();
			$('.ma_edit_option').hide();
			$("#shuffle_edit_option_div").hide();
			$(".edit_options").hide();
			$("#edit_option1").val(" ");
			$("#edit_option2").val(" ");
			$("#edit_option3").val(" ");
			$("#edit_option4").val(" ");
		}
	});
	
	$('.sa_edit_option').click(function() {
		if ($('.sa_edit_option').is(":checked")) {
			$("#edit_ansvalue").val($(this).val());
		}
	});

	$('.ma_edit_option').click(function() {
		var val = [];
		var i = 0;
		$('.ma_edit_option:checked').each(function() {
			val[i] = $(this).val();
			i++;
		});
		$("#edit_ansvalue").val(val.toString());
	});

	$('.edit_true_false').click(function() {
		if ($('.edit_true_false').is(":checked")) {
			$("#edit_ansvalue").val($(this).val());
		}
	});

	$('#shuffle_edit_ques').change(function() {
		if ($(this).is(":checked")) {
			$("#" + this.id + "_hidden").val("Y");
		} else {
			$("#" + this.id + "_hidden").val("N");
		}
	});

	$('.courseid').change(function(lesson) {
		var select = this;
		var course_id = select.options[select.selectedIndex].value;
		$.ajax({
			url : "get_course_lessons?course_id="+course_id,
			type : "get",
			success : function(response) {
				var lesson_select = document.getElementById($(select).attr('id')+"_lessonid");
				//reset the select and add first disabled option
				lesson_select.options.length=0;
				lesson_select.options[lesson_select.options.length] = new Option("--Select Lesson--","");
				
				//add rest of the options based on course
				for(i=0 ; i<response.length ; i++) {
					lesson_select.options[lesson_select.options.length] = new Option(response[i].lesson_name, response[i].lesson_id);
				}
				if(lesson_edit_question != "") {
					setSelectedValue(document.getElementById("edit_lessonid"),lesson_edit_question);
					lesson_edit_question = '';
				}
			},error : function(err) {
				alert(err);
			}
		});
	});
	
	$('#add_languageid').change(function() {
		var selectedLanguage = this.value;
		if (selectedLanguage == 'HIN') {
			control.setLanguagePair('en','hi');
			if(!control.isTransliterationEnabled())
				control.enableTransliteration();
		} else if (selectedLanguage == 'MAR') {
			control.setLanguagePair('en','mr');
			if(!control.isTransliterationEnabled())
				control.enableTransliteration();
		} else {
			/*if(control.isTransliterationEnabled())
				control.disableTransliteration();*/
		}
	});
	//option disabled but code runs first time to set language of all fields
	$('#edit_languageid').change(function() {
		var selectedLanguage = this.value;
		if (selectedLanguage == 'HIN') {
			edit_control.setLanguagePair('en','hi');
			if(!edit_control.isTransliterationEnabled())
				edit_control.enableTransliteration();
		} else if (selectedLanguage == 'MAR') {
			edit_control.setLanguagePair('en','mr');
			if(!edit_control.isTransliterationEnabled())
				edit_control.enableTransliteration();
		} else {
			/*if(edit_control.isTransliterationEnabled())
				edit_control.disableTransliteration();*/
		}
	});

	$('.filters').change(function() {
		var category = $('#cateid').val();
		var language = $('#langid').val();
		var pattern = $('#pattid').val();
		var course_id = $('#filt').val();
		var lesson = $('#filt_lessonid').val();
		$.ajax({
			url : "getquestionbasedoncategory?category="+category+"&language="+language+"&pattern="+pattern
				+"&lesson="+lesson+"&course_id="+course_id,
			type : "get",
			datatype : "xml",
			success : function(response) {
				ques_table.clear().draw(false);
				ques_table.column(0).checkboxes.deselectAll();
				if(response.length>0){
					for (var i = 0; i < response.length; i++) {
						ques_table.row.add([response[i].question_id,response[i].course_name,response[i].lesson_name,response[i].question,
						                    response[i].opt_1,response[i].opt_2,response[i].opt_3,response[i].opt_4,response[i].ans,
							"<button class='btn btn-primary btn-sm' data-toggle='modal' data-target='#questions_modal'" 
							+ "onclick=\"editquestion('" + response[i].question_id + "')\"> Edit </button>"]).draw(false);
					}
				}
			},error : function(err) {
				alert(err);
			}
		});
	});

	$("#deletebt").click(function() {
		var selectedIds = [];
		var rows_selected = ques_table.column(0).checkboxes.selected();
		
		rows_selected.each(function(index,rowId){
			selectedIds.push(index);
		});
		if(selectedIds.length==0){
			alert("Please select questions to delete");
			return false;
		}
		$('<form action="deleteQuestions" method="POST"><input type="text" value="'
				+ selectedIds + '" name="qid"></form>').appendTo('body').submit();
	});

	$('#cateid').change();
});
var lesson_edit_question = '';
function editquestion(q_id){
	$.ajax({
		url : "getquestion?question_id=" + q_id,
		type : "get",
		success : function(response) {
			$("#edit_question_id").val(response[0].question_id);
			//get course from lesson object in response
			setSelectedValue(document.getElementById("edit"),response[1].course_id);
			$('#edit').change();
			lesson_edit_question = response[0].lesson_id;
			setSelectedValue(document.getElementById("edit_categoryid"),response[0].category_id);
			setSelectedValue(document.getElementById("edit_patternid"),response[0].pattern_id);
			setSelectedValue(document.getElementById("edit_languageid"),response[0].language);
			document.getElementById("edit_languageid").disabled=true;
			if(response[0].language=='MAR'){
				$("#edit_option1").val(response[0].opt_1);
				$("#edit_option2").val(response[0].opt_2);
				$("#edit_option3").val(response[0].opt_3);
				$("#edit_option4").val(response[0].opt_4);
				//setSelectedValue(document.getElementById("edit_ansvalue"),response[0].ans);
				$("#edit_ansvalue").html(response[0].ans);
			}
			$("#edit_question").text(response[0].question);
			//Trigger change events to set the UI
			$('#edit_categoryid').change();
			$('#edit_languageid').change();
			
			$("#edit_ansvalue").val(response[0].ans);
			if(response[0].shuffle_opt=='Y'){
				$("#shuffle_edit_ques").prop('checked',true);
				$("#shuffle_edit_ques_hidden").val('Y');
			}
			if (response[0].category_id == 'SA') {
			    var $radios = $('input:radio[class=sa_edit_option]');
		        $radios.filter('[value='+response[0].ans+']').prop('checked', true);
			} else if (response[0].category_id == 'MA') {
				$('input:checkbox[class=ma_edit_option]').each(function(){
					if(response[0].ans.includes(this.value))
						$(this).prop('checked',true);
					else
						$(this).prop('checked',false);
				});
			} else {
			    var $radios = $('input:radio[class=edit_true_false]');
		        $radios.filter('[value='+response[0].ans.toUpperCase()+']').prop('checked', true);
			}
			if (response[0].category_id == 'SA' || response[0].category_id == 'MA') {
				$("#edit_option1").val(response[0].opt_1);
				$("#edit_option2").val(response[0].opt_2);
				$("#edit_option3").val(response[0].opt_3);
				$("#edit_option4").val(response[0].opt_4);
			}
		},error : function(err) {
			alert(err);
		}
	});
}

function validate(flow){
	if($("#"+flow+"_ansvalue").val()==null || $("#"+flow+"_ansvalue").val()==''){
		alert("Please choose a option as correct answer!");
		return false;
	}
	document.getElementById("edit_languageid").disabled=false;
	return true;
}

google.load("elements", "1", {packages : "transliteration"});

var control,edit_control;
function onLoad() {
	var options = {
			sourceLanguage : google.elements.transliteration.LanguageCode.ENGLISH,
			destinationLanguage : [ google.elements.transliteration.LanguageCode.HINDI ],
			shortcutKey : 'ctrl+g',
			transliterationEnabled : false
	};

	control = new google.elements.transliteration.TransliterationControl(options);
	control.makeTransliteratable([ 'transliterateTextarea' ]);
	control.makeTransliteratable([ 'option1' ]);
	control.makeTransliteratable([ 'option2' ]);
	control.makeTransliteratable([ 'option3' ]);
	control.makeTransliteratable([ 'option4' ]);
	
	edit_control = new google.elements.transliteration.TransliterationControl(options);
	edit_control.makeTransliteratable([ 'edit_question' ]);
	edit_control.makeTransliteratable([ 'edit_option1' ]);
	edit_control.makeTransliteratable([ 'edit_option2' ]);
	edit_control.makeTransliteratable([ 'edit_option3' ]);
	edit_control.makeTransliteratable([ 'edit_option4' ]);
}

google.setOnLoadCallback(onLoad);