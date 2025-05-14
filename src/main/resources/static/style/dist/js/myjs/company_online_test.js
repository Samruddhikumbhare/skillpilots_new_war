$("#company_test_details").hide();
$("#company_test_form").hide();

$("ul.nav-tabs>li").each(function(){
	if($(this).hasClass('active')){
		test_id = this.id.split("_").pop();
		showtable(test_id);
		alertMsg($("#upload_message").val());
	}
});

//function to show test data form
function ShowPaperSets(val) {
	$("#company_test").trigger("reset");
	$("input[name=test_type_time]").prop('checked',false);
	$("input[name=test_type_cutoff]").prop('checked',false);
	$("input[name=test_type_marks]").prop('checked',false);
	$("#test_submit").val("Create Test");
	$("#company_test_form").show();
}

//function to close test data form
function closeForm() {
	$("#company_test").trigger("reset");
	$("input[name=test_type_time]").prop('checked',false);
	$("input[name=test_type_cutoff]").prop('checked',false);
	$("input[name=test_type_marks]").prop('checked',false);
	$("#company_test_form").hide();
}

//functions to show fields in test data form based on selection of test type
function settimeform(time) {
	if(time=='T') {
		$('#test_time').show();
		$('#test_time').prop("required",true);
		$('#test_time').prop("min",30);
		$('#test_time').prop("max",120);
		
	} else {
		$('#test_time').val(0);
		$('#test_time').prop("required",false);
		$('#test_time').removeAttr("min");
		$('#test_time').removeAttr("max");
		$('#test_time').hide();
	}
}
function setcutoffform(cutoff) {
	if(cutoff=='T') {
		$('#cut_off').show();
		$('#cut_off').prop("required",true);
		$('#cut_off').prop("min",1);
		$('#cut_off').prop("max",100);
	} else {
		$('#cut_off').val(0);
		$('#cut_off').prop("required",false);
		$('#cut_off').removeAttr("min");
		$('#cut_off').removeAttr("max");
		$('#cut_off').hide();
	}
}
function setmarksperquesform(marksperques) {
	if(marksperques=='T') {
		$('#marks_per_ques').show();
		$('#marks_per_ques').prop("required",true);
		$('#marks_per_ques').prop("min",1);
		$('#marks_per_ques').prop("max",20);
	} else {
		$('#marks_per_ques').val(0);
		$('#marks_per_ques').prop("required",false);
		$('#marks_per_ques').removeAttr("min");
		$('#marks_per_ques').removeAttr("max");
		$('#marks_per_ques').hide();
	}
}
//onclick events for test type radio buttons
$("input[name=test_type_time]").change(function(e){
	settimeform($(this).val());
})
$("input[name=test_type_cutoff]").change(function(e){
	setcutoffform($(this).val());
})
$("input[name=test_type_marks]").change(function(e){
	setmarksperquesform($(this).val());
})

function validatetest(){
	var total_ques=$("#total_ques").val();
	var total_marks=$("#total_marks").val();
	var cut_off=$("#cut_off").val();
	var test_mpq = $("#marks_per_ques").val();
	if($("#tst_marks").is(':checked')){
		if(total_marks != total_ques * test_mpq){
			alert("The total marks of the test should be equal to the product of total questions and marks per question");
			return false;
		}
	}
	if($("#tst_ct_marks").is(':checked')){
		if(cut_off > total_marks){
			alert("The test cut-off cannot be greater than the total marks of the test");
			return false;
		}
	}
	return true;
}
//to edit company test data
function edit_Company_Test_Data(test_id) {
	$.ajax({
		type : "GET",
		url : "get_Company_Test_Data?id=" + test_id,
		dataType : 'json',
		success : function(response) {
			//alert(response.test_type);
			$("#company_test_form").hide();
			var JSONObject = JSON.parse(response.test_type);
			var mark_ques = JSONObject["mark_ques"];
			var time = JSONObject["time"];
			var cut_off = JSONObject["cut_off"];
			$("#test_id").val(response.test_id);
			$("#test_name").val(response.test_name);
			$("#total_marks").val(response.total_marks);
			$("#total_ques").val(response.total_ques);
			$("#test_time").val(response.test_time);
			$("#cut_off").val(response.cut_off);
			$("#marks_per_ques").val(response.mark_per_ques);
			if (time == 'T')
				$("#tst_time").prop('checked', true);
			else if (time == 'S')
				$("#sec_time").prop('checked', true);
			
			if (cut_off == 'T')
				$("#tst_ct_marks").prop('checked', true);
			else if (cut_off == 'S')
				$("#sec_ct_marks").prop('checked', true);
			
			if (mark_ques == 'T')
				$("#tst_marks").prop('checked', true);
			else if (mark_ques == 'S')
				$("#sec_marks").prop('checked', true);
			
			settimeform(time);
			setcutoffform(cut_off);
			setmarksperquesform(mark_ques);

			$("#test_submit").val("Update Test");
			$("#company_test_form").show();
			$('.content').animate({scrollTop: 0}, 1000);

		},
		error : function() {
			alert("")

		}
	});
}

//function to show saved test data on click of tab bar
var total = 0;


//validate section data
function validatesectiondata(test_id){
	show_loading();
	var check_extra_data=false;
	var last_row=0;
	var test_total_marks = $("#"+test_id+"_total_marks").html();
	var test_total_ques = $("#"+test_id+"_total_ques").html();
	var test_mark_per_ques = $("#"+test_id+"_mark_per_ques").html();
	var section_total_marks = 0,section_total_ques = 0,section_total_time = 0;
	
	for (i = 0; i <= 4; i++) {
		if ($("#"+test_id+"_sec_name_" + i).is('[readonly]'))
			continue;
		var name = $("#"+test_id+"_sec_name_" + i).val();
		if(name==undefined)
			break;
		var time = $("#"+test_id+"_sec_time_" + i).val();
		var total_ques = $("#"+test_id+"_sec_total_ques_" + i).val();
		var sec_cutoff = $("#"+test_id+"_sec_cutoff_" + i).val();
		var mark_ques = $("#"+test_id+"_sec_mark_ques_" + i).val();
		var row = i+1;
		if(name!="" && !check_extra_data){
			for(j = 0; j<i ; j++){
				if(name == $("#"+test_id+"_sec_name_" + j).val()){
					alert("Two sections cannot have the same name.(At row " + (j+1) +" and " + row + ")");
					hide_loading();
					return false;
				}
			}
			if(total_ques=="" || Number(total_ques) == "0"){
				alert("Fill total question details at row "+row);
				hide_loading();
				return false;
			}else if (!$("#"+test_id+"_sec_time_" + i).is('[readonly]') && (time == "" || Number(time) == "0")){
				alert("Fill time details at row "+row);
				hide_loading();
				return false;
			}else if (!$("#"+test_id+"_sec_cutoff_" + i).is('[readonly]') && (sec_cutoff == "" || Number(sec_cutoff) == "0")){
				alert("Fill sectional cut off details at row "+row);
				hide_loading();
				return false;
			}else if (!$("#"+test_id+"_sec_mark_ques_" + i).is('[readonly]') && (mark_ques == "" || Number(mark_ques) == "0")){
				alert("Fill mark per question details at row "+row);
				hide_loading();
				return false;
			}
			
			//for validation of test as a whole
			section_total_ques += Number(total_ques);
			if(!$("#"+test_id+"_sec_time_" + i).is('[readonly]')){
				section_total_time += Number(time);
			}
			if(!$("#"+test_id+"_sec_mark_ques_" + i).is('[readonly]')){
				section_total_marks += Number(total_ques) * Number(mark_ques);
			}
			if(!$("#"+test_id+"_sec_cutoff_" + i).is('[readonly]')){
				var calc_sec_marks = 0;
				if(!$("#"+test_id+"_sec_mark_ques_" + i).is('[readonly]')){
					calc_sec_marks = Number(total_ques) * Number(mark_ques);
					if(Number(sec_cutoff) > calc_sec_marks){
						alert("Sectional Cut-off for section "+name+" cannot be greater than the total marks of the section.");
						hide_loading();
						return false;
					}
				}else{
					calc_sec_marks = Number(total_ques) * Number(test_mark_per_ques);
					if(sec_cutoff > calc_sec_marks){
						alert("Sectional Cut-off cannot be greater than the total marks of the section.");
						hide_loading();
						return false;
					}
				}
			}
		}else if((name!='' && check_extra_data) || total_ques!="" || time!="" || sec_cutoff!="" || mark_ques!=""){
			if(check_extra_data)
				alert("Please fill section details properly at row "+last_row);
			else
				alert("Please fill section details properly at row "+row);
			hide_loading();
			return false;
		}else{
			//every field is empty in this row - check for extra fields after this row
			check_extra_data=true;
			//only set the first time
			if(last_row==0)
				last_row=row;
		}
	}
	//alert(test_total_ques+" "+section_total_ques);
	//for validation of test as a whole
	if(test_total_ques!=section_total_ques){
		alert("The total number of questions in each section shoud be equal to the total number of questions in the test.");
		hide_loading();
		return false;
	}
	if(!$("#"+test_id+"_sec_time_0").is('[readonly]')){
		if(section_total_time < 30 || section_total_time > 120){
			alert("The total time of test shoud be between 30-120 minutes.");
			hide_loading();
			return false;
		}
	}
	if(!$("#"+test_id+"_sec_mark_ques_0").is('[readonly]')){
		if(test_total_marks != section_total_marks){
			alert("The total marks of each section shoud be equal to the total marks of the test.");
			hide_loading();
			return false;
		}
	}
	hide_loading();
	return true;
}
//inserting section data
function saveSectiondata(test_id) {
	if(!validatesectiondata(test_id))
		return false;

	var insert_str = '';
	
	for (i = 0; i <= 4; i++) {
		var name = $("#"+test_id+"_sec_name_" + i).val();
		if(name=='')
			break;
		var time = $("#"+test_id+"_sec_time_" + i).val();
		var total_ques = $("#"+test_id+"_sec_total_ques_" + i).val();
		var sec_cutoff = $("#"+test_id+"_sec_cutoff_" + i).val();
		var mark_ques = $("#"+test_id+"_sec_mark_ques_" + i).val();
		
		insert_str += "('section_"+i+"','"+test_id+"','"+name+"',"+total_ques+",";
		insert_str += $("#"+test_id+"_sec_time_" + i).is('[readonly]') ? "0"+"," : time+",";
		insert_str += $("#"+test_id+"_sec_cutoff_" + i).is('[readonly]') ? "0"+"," : sec_cutoff+",";
		insert_str += $("#"+test_id+"_sec_mark_ques_" + i).is('[readonly]') ? "0"+")," : mark_ques+"),";
	}
	
	insert_str = insert_str.substring(0, insert_str.length - 2)+ ');';
	$.ajax({
		type : "POST",
		url : "insertsectiondata?sec_data=" + insert_str,
		success : function(response) {
			location.reload();
		},
		error : function() {
			alert("Error Loading..!!!")

		}
	});
}

//on edit button remove readonly properties
function editSectionData(test_id){
	
	var tst_type = $("#test_type_"+test_id).val();
	var JSONObject = JSON.parse(tst_type);
	var time = JSONObject["time"];
	var marksperques = JSONObject["mark_ques"];
	var cut_off = JSONObject["cut_off"];
	
	$("#id_check_"+test_id).replaceWith('<th>Action</th>');
	var rows_count = document.getElementById("section_details_"+test_id).rows.length;
	$("#edit_btn_"+test_id).replaceWith('<input type="button" id="sbtn_'+test_id+'" onclick="updateSectiondata(\''+test_id
			+'\')" class="btn btn-primary btn-sm" value="Submit"/>')
	$("#row_btn_"+test_id).append('<input type="button" id="add_row_btn" onclick="addrow(\''+test_id
			+'\')" class="btn btn-primary btn-sm" value="Add Row"/>');
	document.getElementById("xldownload"+test_id).style.display="none";
	for(var i=0;i<rows_count;i++){
		document.getElementById(test_id+'_sec_name_'+i).removeAttribute('readonly');
		document.getElementById(test_id+'_sec_total_ques_'+i).removeAttribute('readonly');
		if(time =='S'){
			document.getElementById(test_id+'_sec_time_'+i).removeAttribute('readonly');
		}
		if(cut_off !='T'){
			document.getElementById(test_id+'_sec_cutoff_'+i).removeAttribute('readonly');
		}
		if(marksperques !='T'){
			document.getElementById(test_id+'_sec_mark_ques_'+i).removeAttribute('readonly');
		}
		
		var section_id=$("#"+test_id+"_sec_id_"+i).val();
		document.getElementById("no_of_ques_sec_"+section_id).style.display = 'none';
		document.getElementById("add_ques_btn_"+section_id).style.display = 'none';
		document.getElementById("edit_ques_btn_"+section_id).style.display = 'none';
		$("#add_ques_btn_"+section_id).replaceWith('<span class="fa fa-minus-circle" id="dlt_row_btn'+section_id+
				'" onclick="disablesectionRow(this,\''+test_id+'\',\''+i+'\')" title="Delete Row"></span>');
	}
}

//add rows in section table
function addrow(test_id){
	var myTable = document.getElementById("sec_table_" + test_id);
	var row =  $("#sec_table_" + test_id +" tr").length - 1; //includes one row for the header
	var tst_type = $("#test_type_"+test_id).val();
	var JSONObject = JSON.parse(tst_type);
	var time = JSONObject["time"];
	var marksperques = JSONObject["mark_ques"];
	var cut_off = JSONObject["cut_off"];
	var newCell=null;	
	if(row < 5){
		var currentRow = myTable.insertRow(-1);
		var sec_name_field = document.createElement("input");
		sec_name_field.setAttribute("type", "text");
		sec_name_field.setAttribute("name", "sec_name_" + row);
		sec_name_field.setAttribute("class", "form-control");
		sec_name_field.setAttribute("style","height:50%;");
		sec_name_field.setAttribute("id", test_id + "_sec_name_" + row);
		sec_name_field.setAttribute("onkeypress", "return onlyAlphabets(event,this)");
		sec_name_field.setAttribute("maxlength", "20");

		var sec_time_field = document.createElement("input");
		sec_time_field.setAttribute("type", "text");
		sec_time_field.setAttribute("name", "sec_time_"+row);
		sec_time_field.setAttribute("class", "form-control");
		sec_time_field.setAttribute("style","height:50%;");
		sec_time_field.setAttribute("id", test_id + "_sec_time_"+row);
		sec_time_field.setAttribute("onkeypress", "return isNumberKey(event)");
		sec_time_field.setAttribute("maxlength", "3");
		if(time=='T'){
			sec_time_field.setAttribute("value","0");
			sec_time_field.setAttribute("readonly","readonly");
			sec_time_field.setAttribute("title","Time is set Test-wise.");
		}
		
		var sec_total_ques = document.createElement("input");
		sec_total_ques.setAttribute("type", "text");
		sec_total_ques.setAttribute("name", "sec_total_ques_" + row);
		sec_total_ques.setAttribute("class", "form-control");
		sec_total_ques.setAttribute("style","height:50%;");
		sec_total_ques.setAttribute("id", test_id + "_sec_total_ques_" + row);
		sec_total_ques.setAttribute("onkeypress", "return isNumberKey(event)");
		sec_total_ques.setAttribute("maxlength", "2");

		var sec_cutoff_field = document.createElement("input");
		sec_cutoff_field.setAttribute("type", "text");
		sec_cutoff_field.setAttribute("name", "sec_cutoff_" + row);
		sec_cutoff_field.setAttribute("class", "form-control");
		sec_cutoff_field.setAttribute("style","height:50%;");
		sec_cutoff_field.setAttribute("id", test_id + "_sec_cutoff_" + row);
		sec_cutoff_field.setAttribute("onkeypress", "return isNumberKey(event)");
		sec_cutoff_field.setAttribute("maxlength", "3");
		if(cut_off=='T'){
			sec_cutoff_field.setAttribute("value","0");
			sec_cutoff_field.setAttribute("readonly", "readonly");
			sec_cutoff_field.setAttribute("title","Cut-off is set Test-wise.");
		}
		
		var sec_marks_ques_field = document.createElement("input");
		sec_marks_ques_field.setAttribute("type", "text");
		sec_marks_ques_field.setAttribute("class", "form-control");
		sec_marks_ques_field.setAttribute("style","height:50%;");
		sec_marks_ques_field.setAttribute("name", "sec_mark_ques_" + row);
		sec_marks_ques_field.setAttribute("id", test_id + "_sec_mark_ques_" + row);
		sec_marks_ques_field.setAttribute("onkeypress", "return isNumberKey(event)");
		sec_marks_ques_field.setAttribute("maxlength", "2");
		if(marksperques=='T'){
			sec_marks_ques_field.setAttribute("value","0");
			sec_marks_ques_field.setAttribute("readonly", "readonly");
			sec_marks_ques_field.setAttribute("title","Marks/Question is set Test-wise.");
		}
		
		var del_ques_button = document.createElement("span");
		del_ques_button.setAttribute("class", "fa fa-minus-circle");
		del_ques_button.setAttribute("id", "dlt_row_btn_" + row);
		del_ques_button.setAttribute("onclick", "deletesectionRow('"+test_id+"',"+row+")");
		del_ques_button.setAttribute("title","Delete Row?");

		var array = [sec_name_field,sec_total_ques,sec_time_field,sec_cutoff_field,sec_marks_ques_field];
		
		array.forEach(function(element){
			newCell = currentRow.insertCell(-1);
			newCell.appendChild(element);
		});

		newCell = currentRow.insertCell(-1);
		newCell.setAttribute("style","text-align:center;");
		newCell.appendChild(del_ques_button);
	}else{
		alert("A test can not have more than 5 Sections at one point. " +
				"If you have deleted a section please save it before adding another.");
		return false;
	}
}

//deletes newly added rows from section table
function deletesectionRow(test_id,id){
	//copy details of all the next rows to previous one and delete only the last one
	while($('#dlt_row_btn_'+(Number(id)+1)).val() != undefined){
		var name = $("#" + test_id + "_sec_name_" + (id+1)).val();
		var time = $("#" + test_id + "_sec_time_" + (id+1)).val();
		var total_ques = $("#" + test_id + "_sec_total_ques_" + (id+1)).val();
		var sec_cutoff = $("#" + test_id + "_sec_cutoff_" + (id+1)).val();
		var mark_ques = $("#" + test_id + "_sec_mark_ques_" + (id+1)).val();
		$("#" + test_id + "_sec_name_" + id).val(name);
		$("#" + test_id + "_sec_time_" + id).val(time);
		$("#" + test_id + "_sec_total_ques_" + id).val(total_ques);
		$("#" + test_id + "_sec_cutoff_" + id).val(sec_cutoff);
		$("#" + test_id + "_sec_mark_ques_" + id).val(mark_ques);
		id++;
	}
	$('#dlt_row_btn_'+id).closest('tr').remove();
}

//disable or remove already present rows in database from section 
function disablesectionRow(elem,test_id,row){
	$("#"+elem.id).replaceWith('<span class="fa fa-times-circle" id="cross_btn" style="margin-top: 7px; color:red;"></span>');
	var array = [];
	array.push(document.getElementById(test_id + '_sec_name_'+row));
	array.push(document.getElementById(test_id + '_sec_time_'+row));
	array.push(document.getElementById(test_id + '_sec_total_ques_'+row));
	array.push(document.getElementById(test_id + '_sec_cutoff_'+row));
	array.push(document.getElementById(test_id + '_sec_mark_ques_'+row));
	
	array.forEach(function(element){
		element.setAttribute("readonly", "readonly");
		element.setAttribute("title", "Row has been deleted");
	});
}

//updation and deletion of section data
function updateSectiondata(test_id) {
	if(!validatesectiondata(test_id))
		return false;
	var str_insert="",str_update="",str_delete="";
	var rows_count = document.getElementById("section_details_"+test_id).rows.length;
	for (i = 0; i < rows_count; i++) {
		var name = $("#" + test_id + "_sec_name_" + i).val();
		var time = $("#" + test_id + "_sec_time_" + i).val();
		var total_ques = $("#" + test_id + "_sec_total_ques_" + i).val();
		var sec_cutoff = $("#" + test_id + "_sec_cutoff_" + i).val();
		var mark_ques = $("#" + test_id + "_sec_mark_ques_" + i).val();
		//Fix to stop counting if row is found which is not deleted but has not been filled.
		if(!$("#" + test_id + "_sec_name_" + i).is('[readonly]') && name=='')
			break;

		if($("#" + test_id + "_sec_id_"+i).val()==undefined){
			str_insert += "('section_"+i+"','"+test_id+"','"+name+"',"+total_ques+","+time+","+sec_cutoff+","+mark_ques+"),";
		}else{
			var section_id = $("#" + test_id + "_sec_id_"+i).val();
			if($("#" + test_id + "_sec_name_" + i).is('[readonly]')){
				//update section id initial from TS to DS
				var upd_section_id = section_id.replace(/^.{2}/g, 'DS');
				str_delete += "('"+section_id+"','"+upd_section_id+"'),";
			}else{
				str_update += "('"+section_id+"','"+section_id+"','"+test_id+"','"+name+"',"+total_ques+","+time+","
					+sec_cutoff+","+mark_ques+"),";
			}  
		}
	}
	if(str_insert==""){
		str_insert = str_insert.substring(0, str_insert.length - 2)+ '';
	}else{
		str_insert = str_insert.substring(0, str_insert.length - 2)+ ');';
	}
	if(str_delete==""){
		str_delete = str_delete.substring(0, str_delete.length - 2)+ '';
	}else{
		str_delete = str_delete.substring(0, str_delete.length - 2)+ ')';
	}
	if(str_update==""){
		str_update = str_update.substring(0, str_update.length - 2)+ '';
	}else{
		str_update = str_update.substring(0, str_update.length - 2)+ ')';
	}
	$.ajax({
		type : "POST",
		url : "update_section_data?insert_str=" + str_insert+"&update_str="+str_update+"&delete_str="+str_delete,
		success : function(response) {
			location.reload();
		},
		error : function() {
			alert("Oops there was some error saving the data. Please try again!");
			location.reload();
		}
	});
}

//add questions function
function show_ques_modal(){
	//alert(action+" "+test_id+" "+sec_id+" "+marksperques+" "+time);
	$("#ques_modal_sec_time").val(time);
	$("#ques_modal_sec_mpq").val(marksperques);
	$("#ques_modal_sec_id").val(sec_id);
	$("#ques_modal_test_id").val(test_id);
	(marksperques==online_test_type_for_question) ? $("#col_marks_for_ques").show() : $("#col_marks_for_ques").hide();
	(time==online_test_type_for_question) ? $("#col_time_for_ques").show() : $("#col_time_for_ques").hide();
	
	if(action=='add'){
		$("#div_add_question").show();
		$("#save_edited_ques").hide();
		$("#col_ques_action").hide();
		(marksperques==online_test_type_for_question) ? $("#div_marks_for_ques").show() : $("#div_marks_for_ques").hide();
		(time==online_test_type_for_question) ? $("#div_time_for_ques").show() : $("#div_time_for_ques").hide();
	}else{
		$("#div_add_question").hide();
		$("#save_edited_ques").show();
		$("#col_ques_action").show();
	}

	$.ajax({
		type : "GET",
		url : "getQuestions_per_section?sec_id="+sec_id,
		success : function(response) {
			$('#question_details').empty();
			for(var i=0;i<response.length;i++){
				var row = '';
				if(action=='add'){
					row = "<tr><td>"+response[i].question+"</td><td>"+response[i].option_a+"</td><td>"+response[i].option_b
						+"</td><td>"+response[i].option_c+"</td><td>"+response[i].option_d+"</td>";
					if (marksperques==online_test_type_for_question)
						row += "<td>"+response[i].mark_per_ques+"</td>";
					if (time==online_test_type_for_question)
						row+="<td>"+response[i].ques_time+"</td>"
					row += "<td>"+response[i].ans+"</td></tr>";
				}else{
					row = "<tr><td style='width:50%'><textarea class='form-control' id='ques_"+i+"' maxlength='950' required='required'>"+response[i].question+"</textarea></td>"
						+"<td><textarea class='form-control' id='opt_a_"+i+"' maxlength='250' required='required'>"+response[i].option_a+"</textarea></td>"
						+"<td><textarea class='form-control' id='opt_b_"+i+"' maxlength='250' required='required'>"+response[i].option_b+"</textarea></td>"
						+"<td><textarea class='form-control' id='opt_c_"+i+"' maxlength='250' required='required'>"+response[i].option_c+"</textarea></td>"
						+"<td><textarea class='form-control' id='opt_d_"+i+"' maxlength='250' required='required'>"+response[i].option_d+"</textarea></td>";
					if (marksperques==online_test_type_for_question)
						row += "<td><textarea class='form-control' id='qs_time_"+i+"'>"+response[i].mark_per_ques+"</textarea></td>";
					if (time==online_test_type_for_question)
						row+="<td><textarea class='form-control' id='mpq_"+i+"'>"+response[i].ques_time+"</textarea></td>"
					row += "<td><textarea class='form-control' id='ans_"+i+"'>"+response[i].ans+"</textarea></td>"
						+"<td><span class='fa fa-times-circle' id='cross_btn' data-toggle='tooltip' data-placement='top' title='Click Here To Delete This Question'"
						+"onclick='del_ques_row("+i+")' style='margin-top:0%;font-size: 20px; margin-left:45%; color:red;'></span></td>"
						+"<input type='hidden' id='ques_id_"+i+"' value='"+response[i].question_id+"'/>"
						+"<input type='hidden' id='ques_type_"+i+"' value='"+response[i].type+"'/></tr>";
				}
				$('#question_details').append(row);
			}
			$("#questions_modal").modal("show");
			$('.questions_modal').animate({scrollTop: 0}, 1000);
		},
		error : function(){
			$("#questions_modal").modal("show");
			alert("Error...")
			
		}

	});
}

function insert_question() {
	var question = $("#id_question").val();
	var option_a = $("#option_for_ques_A").val();
	var option_b = $("#option_for_ques_B").val();
	var option_c = $("#option_for_ques_C").val();
	var option_d = $("#option_for_ques_D").val();
	var ques_time = $("#time_for_ques").val();
	var mark_per_ques = $("#mark_per_ques").val();
	var ans = $("input[name='ans']:checked").val();
	var section_id = $("#ques_modal_sec_id").val();
	var test_id = $("#ques_modal_test_id").val();
	var time = $("#ques_modal_sec_time").val();
	var marksperques = $("#ques_modal_sec_mpq").val();

	var tot_ques_obj = document.getElementById("ques_per_section_"+test_id);
	var tot_ques = Number(tot_ques_obj.textContent);
	if(tot_ques==75){
		alert("Max question limit(75) reached for a basic test.");
		return false;
	}
	
	if(question==undefined||question=='' || option_a==undefined||option_a=='' || option_b==undefined||option_b==''
		|| option_c==undefined||option_c=='' || option_d==undefined||option_d=='' || ans==undefined||ans=='' ||
		(time==online_test_type_for_question && (ques_time==undefined||ques_time=='')) ||
		(marksperques==online_test_type_for_question && (mark_per_ques==undefined||mark_per_ques==''))){
		alert("Please fill all the fields correctly.");
		return false;
	}

	$.ajax({
		type : "POST",
		url : "save_questions_data?sec_id=" + section_id + "&question="	+ escapeHtml4PGSQL(question) 
			+ "&option_a=" + escapeHtml4PGSQL(option_a) + "&option_b=" + escapeHtml4PGSQL(option_b) 
			+ "&option_c=" + escapeHtml4PGSQL(option_c) + "&option_d=" + escapeHtml4PGSQL(option_d) 
			+ "&ans=" + ans + "&ques_time=" + ques_time	+ "&ques_mark=" + mark_per_ques,
		success : function(response) {
			alert(response);
			var row = "<tr><td>"+question+"</td><td>"+option_a+"</td><td>"+option_b
				+"</td><td>"+option_c+"</td><td>"+option_d+"</td>";
			if (marksperques==online_test_type_for_question)
				row += "<td>"+mark_per_ques+"</td>";
			if (time==online_test_type_for_question)
				row+="<td>"+ques_time+"</td>"
			row += "<td>"+ans+"</td></tr>";
			$('#question_details').append(row);
			$("#id_question").val('');
			$("#option_for_ques_A").val('');
			$("#option_for_ques_B").val('');
			$("#option_for_ques_C").val('');
			$("#option_for_ques_D").val('');
			$("#time_for_ques").val('');
			$("#marks_for_ques").val('');
			$("input[name='ans']:checked").prop('checked',false);
			
			var tot_sec_ques_obj = document.getElementById("no_of_ques_sec_"+section_id);
			var tot_sec_ques = Number(tot_sec_ques_obj.textContent);
			tot_sec_ques_obj.textContent=tot_sec_ques+1;
			if(tot_sec_ques==0){
				var edit_btn = document.getElementById('edit_ques_btn_'+section_id);
				$('#edit_ques_btn_'+section_id).prop("title","Click to edit questions of this section.");
				edit_btn.setAttribute('onclick','show_ques_modal(\'edit\',\''+test_id+'\',\''+section_id
					+'\',\''+mark_per_ques+'\',\''+time+'\');');
			}
			tot_ques_obj.textContent=tot_ques+1;
			
		},
		error : function() {
			alert("Error Loading..!!!")
		}
	});

}

//to delete questions
function del_ques_row(row) {
	var array = [];
	array.push($("#ques_" + row));
	array.push($("#opt_a_" + row));
	array.push($("#opt_b_" + row));
	array.push($("#opt_c_" + row));
	array.push($("#opt_d_" + row));
	array.push($("#qs_time_" + row));
	array.push($("#mpq_" + row));
	array.push($("#ans_" + row));
	
	array.forEach(function(element){
		element.prop("required", "false");
		element.prop("readonly", "readonly");
		element.prop("title", "Row has been deleted");
	});
	$("#ques_" + row).closest('tr').addClass("readonly");
}

function updateQuestionData() {
	var rows_count = document.getElementById("question_details").rows.length;
	//added another loop since too many questions when saved at once failed with 'Request header is too large'
	//so saving 10 questions at once
	for (i = 0; i < rows_count;) {
		var str_update = '';
		for (j = 0; j < 10 && i < rows_count; j++,i++) {
			var ques = escapeHtml4PGSQL($("#ques_" + i).val());
			var opt_a = escapeHtml4PGSQL($("#opt_a_" + i).val());
			var opt_b = escapeHtml4PGSQL($("#opt_b_" + i).val());
			var opt_c = escapeHtml4PGSQL($("#opt_c_" + i).val());
			var opt_d = escapeHtml4PGSQL($("#opt_d_" + i).val());
			var ques_time = $("#qs_time_" + i).val();
			var mpq = $("#mpq_" + i).val();
			var ans = $("#ans_" + i).val();
			var ques_id = $("#ques_id_" + i).val();
			var ques_type = $("#ques_type_" + i).val();
			var sec_id = $("#ques_modal_sec_id").val();
			var upd_ques_id = ques_id;
			if(	$("#ques_" + i).is('[readonly]')){
				upd_ques_id = ques_id.replace(/^.{1}/g, 'D');
			}
			
			ques_time = ques_time==undefined?0:ques_time;
			mpq = mpq==undefined?0:mpq;
			if(str_update=='')
				str_update = "('"+ques_id+"','"+upd_ques_id+"','"+sec_id+"','" +ques+"','"+ques_type+"',"+ques_time
					+","+mpq+",'"+opt_a+"','"+opt_b+"','"+opt_c+"','"+opt_d+"','"+ans+"')";
			else
				str_update += ",('"+ques_id+"','"+upd_ques_id+"','"+sec_id+"','" +ques+"','"+ques_type+"',"+ques_time
					+","+mpq+",'"+opt_a+"','"+opt_b+"','"+opt_c+"','"+opt_d+"','"+ans+"')";
		}
	
		$.ajax({
			type : "POST",
			url : "update_question_data?ques_update_str=" + str_update,
			success : function(response) {
				location.reload();
			},
			error : function() {
				alert("Error Loading..!!!")
	
			}
		});
	}
}

//manage status of test Inactive or Acctive
function manage_Status(elem,test_id){
	var status = $(elem).is(':checked');
		$.ajax({
			type : "POST",
			url : "update_status_of_company_test?test_id="+test_id+"&status="+status,
			success : function(response) {
				alert(response);
				if(response.includes('Success')){
					$(elem).prop("checked",status);
					//enable/disable edit buttons
					if(status){
						$("#edit_btn_"+test_id).replaceWith('<input type="button" id="edit_btn_'+test_id+'" class='
							+'"btn btn-primary" value="Edit" disabled="disabled" title="An active test cannot be edited."/>');
						document.getElementById(test_id).onclick=function(){};
						$("#"+test_id).prop("title","An active test cannot be edited.");
						document.getElementById("xldownload"+test_id).style.display="none";
						for(var i=0;i<5;i++){
							var section_id = $("#" + test_id + "_sec_id_"+i).val();
							if(section_id != undefined) {
								$('#add_ques_btn_'+section_id).prop("title","An active test cannot be edited.");
								document.getElementById('add_ques_btn_'+section_id).onclick=function(){};
								$('#edit_ques_btn_'+section_id).prop("title","An active test cannot be edited.");
								document.getElementById('edit_ques_btn_'+section_id).onclick=function(){};
							} else
								break;
						}
					}else{
						$("#edit_btn_"+test_id).replaceWith('<input type="button" id="edit_btn_'+test_id
							+'" onclick="editSectionData(\''+test_id+'\');" class="btn btn-primary" value="Edit"/>');
						document.getElementById(test_id).onclick=function(){edit_Company_Test_Data(test_id);};
						//$("#"+test_id).setAttribute("onclick","edit_Company_Test_Data('"+test_id+"');");
						$("#"+test_id).prop("title","Click to edit Test format.");
						document.getElementById("xldownload"+test_id).style.display="";
						var mark_ques = $("#"+test_id+"_marks_per_ques").val();
						var time = $("#"+test_id+"_time").val();
						for(var i=0;i<5;i++){
							var section_id = $("#" + test_id + "_sec_id_"+i).val();
							if(section_id != undefined) {
								var add_btn = document.getElementById('add_ques_btn_'+section_id);
								$('#add_ques_btn_'+section_id).prop("title","Click to add questions to this section.");
								add_btn.setAttribute('onclick','show_ques_modal(\'add\',\''+test_id+'\',\''+section_id
									+'\',\''+mark_ques+'\',\''+time+'\');');
								
								var edit_btn = document.getElementById('edit_ques_btn_'+section_id);
								$('#edit_ques_btn_'+section_id).prop("title","Click to edit questions of this section.");
								edit_btn.setAttribute('onclick','show_ques_modal(\'edit\',\''+test_id+'\',\''+section_id
									+'\',\''+mark_ques+'\',\''+time+'\');');
							} else
								break;
						}
					}
				}
				else
					$(elem).prop("checked",!status);
			},error : function() {
				alert("Error Loading..!!!")
	
			}
		});
	
}
