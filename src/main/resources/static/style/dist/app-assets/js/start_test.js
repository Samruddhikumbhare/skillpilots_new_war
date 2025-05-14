var questionsAndAnsArray=[];
var divs = $('.questiondiv>div');
var current_div = 0; // currently shown div

divs.hide().first().show();

//code goes here that will be run after every interval.  
setInterval(function(){ 
	update("U");   
}, 15000);

//first time add test status to object array
$(function () {
	if($("#resume_status").val()=="") {
		//Question seen status
		$("#seenStatus_"+current_div).css("color", "yellow");
		var value=$("#questionID_0").val()+":S";
		questionsAndAnsArray.push(value);
		for (var i = 1; i < divs.length; i++) {
			var value=$("#questionID_"+i).val()+":P";
			questionsAndAnsArray.push(value);
			if($("#shuffle_opt_"+i).val()=='Y')
				$(".options_"+i).shuffle();
		}
	} else {
		questionsAndAnsArray = $("#resume_status").val().split(",");
		for(i=0; i<questionsAndAnsArray.length; i++){
			var status = questionsAndAnsArray[i].split(":");
			status = status[1];
			if(status == 'P'){
				//nothing to be handled when status is pending
			} else if(status == 'S'){
				$("#seenStatus_"+i).css("color", "yellow");
			} else if(status == 'M'){
				$("#seenStatus_"+i).css("color", "red");
			} else {
				$("input[name='"+$("#category_id_"+i).val()+"_"+i+"']").attr('disabled', true);
				var category = $("#category_id_"+i).val();
				if(category=='SA' || category == 'TF') {
					var options = $("input[name='"+category+"_"+i+"']");
					options.filter("[value='"+status+"']").prop('checked',true);
				} else if(category == 'MA') {
					$("input:checkbox[name='"+category+"_"+i+"']").each(function(){
						if(status.includes(this.value))
							$(this).prop('checked',true);
					});
				}
				if('true' == $('#show_correct_answer').val()){
					show_answer(i);
				}
				$('#btn_later_'+i).hide();
				$('#btn_save_'+i).hide();
				$("#seenStatus_"+i).css("color", "green");

				if($("#shuffle_opt_"+i).val()=='Y')
					$(".options_"+i).shuffle();
			}
		}
	}
});

//sidebar button
$(".question_sidebar_btn").click(function (e) {
	divs.eq(current_div).hide();
	var text = $(this).attr('value'); 
	current_div = Number(text);
	testStatus('S');
	if(handleSidebarOptionColor("yellow"))
		$("#seenStatus_"+current_div).css("color", "yellow");
	divs.eq(current_div).show();
	handlepagebuttons();
});

$("button[name=nextButton]").click(function (e) {
	divs.eq(current_div).hide();
	current_div++;
	testStatus('S');
	divs.eq(current_div).show(); // show next
	if(handleSidebarOptionColor("yellow"))
		$("#seenStatus_"+current_div).css("color", "yellow");
	handlepagebuttons();
});

// previous button code
$("button[name=prevButton]").click(function (e) {
	divs.eq(current_div).hide();
	current_div--;
	testStatus('S');
	divs.eq(current_div).show(); // show prev
	if(handleSidebarOptionColor("yellow"))
		$("#seenStatus_"+current_div).css("color", "yellow");
	handlepagebuttons();
});

function handlepagebuttons(){
	$('.navigation>li').removeClass("open");
	$("#seenStatus_"+current_div).closest("li").addClass("open");
	if(current_div + 1 == divs.length)
		$("button[name=nextButton]").prop("disabled",true);
	else
		$("button[name=nextButton]").prop("disabled",false);
	if(current_div == 0)
		$("button[name=prevButton]").prop("disabled",true);
	else
		$("button[name=prevButton]").prop("disabled",false);
}

//Later button
$('.btn_later').click(function() {
	testStatus('M');
	if(handleSidebarOptionColor("red"))
		$("#seenStatus_"+current_div).css("color", "red");
	update("U");
	if(current_div + 1 != divs.length)
		$("button[name=nextButton]").click();
});

//save button
$('.btn_save').click(function() {
	if(testStatus('A')){
		if('true' == $('#show_correct_answer').val()){
			show_answer(current_div);
		}
		$('#btn_later_'+current_div).hide();
		$(this).hide();
		//disable all the options based on category and div
		$("input[name='"+$("#category_id_"+current_div).val()+"_"+current_div+"']").attr('disabled', true);
		if(handleSidebarOptionColor("green"))
			$('#seenStatus_'+current_div).css("color", "green");
		update("U");
	}
});

//finish button
$('#btn_finish').click(function() {
	update("F");
});

function testStatus(status) {
	//check for current status added as statuses were being reverted back to S when next/prev button was clicked
	var current_status=(questionsAndAnsArray[current_div].split(":"))[1];
	if(status == 'S' && current_status=='P') {
		questionsAndAnsArray[current_div]=$("#questionID_"+current_div).val()+":S";
		return true;
	} else if(status == 'M' && current_status == 'S') {
		questionsAndAnsArray[current_div]=$("#questionID_"+current_div).val()+":M";
		return true;
	} else if(status == 'A' && (current_status == 'S' || current_status == 'M')) {
		if ('TF' == $("#category_id_"+current_div).val()){
			var tfValue = $("input[name='TF_"+current_div+"']:checked").val();
			if(tfValue != null){
				questionsAndAnsArray[current_div]=$("#questionID_"+current_div).val()+":"+tfValue;
				return true;
			} else {
				alertMsg("Please Select an option!");
				return false;
			}
		} else if('SA' == $("#category_id_"+current_div).val()){
			var saValue = $("input[name='SA_"+current_div+"']:checked").val();
			if(saValue != null){
				questionsAndAnsArray[current_div]=$("#questionID_"+current_div).val()+":"+saValue;
				return true;
			}else {
				alertMsg("Please select an option!");
				return false;
			}
		} else if ('MA' == $("#category_id_"+current_div).val()) {
			var options = [];
			$.each($("input[name='MA_"+current_div+"']:checked"), function(){
				options.push($(this).val());
			});
			if(options.length != 0){
				console.log(options);
				options.sort();
				console.log(options);
				questionsAndAnsArray[current_div]=$("#questionID_"+current_div).val()+":"+options.toString().replace(/,/g,"$");
				return true;
			}else {
				alertMsg("Please select atleast one option!");
				return false;
			}
		}
	}
}

function handleSidebarOptionColor(colortobeassigned) {
	var status = (questionsAndAnsArray[current_div].split(":"))[1];
	console.log("status : "+status+" color : "+colortobeassigned);
	var colors = {'black':true,'yellow':true,'red':true,'green':true};
	if(status == 'P') {
		colors['black']=false;
	} else if (status == 'S') {
		colors['black']=false;
	} else if (status == 'M') {
		colors['black']=false;
		colors['yellow']=false;
	} else {
		colors['black']=false;
		colors['yellow']=false;
		colors['red']=false;
	}
	if(colors[colortobeassigned])
		return true;
	else
		return false;
}

function show_answer(div) {
	//since options will be shuffled, in correct ans we need to show the options and not just A/B/C/D
	var correct_ans = $('#correct_ans_'+div).text();
	correct_ans=correct_ans.split(",");
	var ans_displayed="";
	for(i=0; i<correct_ans.length; i++)
		if(ans_displayed==="")
			ans_displayed += $("#"+correct_ans[i]+"_"+$("#category_id_"+div).val()+"_option_"+div).text();
		else
			ans_displayed += ","+$("#"+correct_ans[i]+"_"+$("#category_id_"+div).val()+"_option_"+div).text();
	$('#correct_ans_'+div).text(ans_displayed);
	$('#show_answer_'+div).show();
}
//update method call every five second 
function update(status){
	var finishStatus=false,disqualified=false;
	var time_laps = $("#time").html();
	if(status=="F") {
		finishStatus = true;
		document.removeEventListener("visibilitychange", tabchangedhandler);
	}
	if(status=="D") {
		disqualified = true;
		document.removeEventListener("visibilitychange", tabchangedhandler);
	}

	$.ajax({
		type : 'get',
		url : 'updateTestData?time_laps='+time_laps + "&finishStatus="+finishStatus + "&testStatus="+questionsAndAnsArray.toString()+"&disqualifiedTest="+disqualified,
		async: false,
	}).success(function() {
		if(finishStatus || disqualified)
			window.location.replace("employee_existing_test");
	}).responseText; 
}

//check for page refresh.
if (performance.navigation.type == 1) {
	console.info("This page is reloaded1");
	disqualified=true;
	update("D");
} else {
	console.info("This page is reloaded2");
}

//disqualified if window mininize or tab changed
function tabchangedhandler() {
	if (document.visibilityState == 'hidden') {
		console.info("tab changed");
		update("D");
	}
}
document.addEventListener("visibilitychange", tabchangedhandler);

jQuery.fn.shuffle = function () {
    var j;
    for (var i = 0; i < this.length; i++) {
        j = Math.floor(Math.random() * this.length);
        $(this[i]).before($(this[j]));
    }
    return this;
};
