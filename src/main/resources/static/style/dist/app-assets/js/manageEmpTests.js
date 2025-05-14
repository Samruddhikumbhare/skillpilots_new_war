var testKey;
var currentTestDataId;

$('.employee_test_table').DataTable({
	"lengthMenu" : [ [ 5, 10, 20, 30, -1 ], [ 5, 10, 20, 30, "All" ] ],
	responsive : true,
	columnDefs: [
        { responsivePriority: 1, targets: 0 },
        { responsivePriority: 2, targets: 1 },
        { responsivePriority: 3, targets: -1 }
    ]
});

function startTestModelData(testDataId,test_key,emp_test_key) {
	currentTestDataId=testDataId;
	$("#testName").text($("#testname_"+testDataId).text());
	$("#testDuration").text($("#testtime_"+testDataId).text());
	$("#numberOfQuestions").text($("#testtotques_"+testDataId).text());
	if(test_key != 'EK'){
		testKey=test_key;
		$("#show_test_key").html(" (to be given by the Test Controller)"); 
	} else{
		testKey=emp_test_key;
		$("#show_test_key").html(" "+emp_test_key+" ");
	}
} 

function checkTestKey() {
	if(testKey == $('#entered_test_key').val()){
		$("#testId").attr("href", "test_start_dashboard?test_data_id="+currentTestDataId); 
	} else
		$("#message").text("Please enter correct key");
}

function resumeTest(testDataId) {
	$("#resumeTest").attr("href", "test_start_dashboard?test_data_id="+testDataId);
}

function scoreCalculator(test_data_id) {
	$.ajax({
		type : 'get',
		url : 'getReport?test_data_id='+test_data_id,
		success : function(response) {
			$("#correct_answers").html(response[0]);
			$("#wrong_answers").html(response[1]);
			$("#questions_not_attempted").html(response[2]);
			$("#marks_scored").html(response[3]);
			$("#out_of").html(response[4]);
			$("#result").html(response[5]);
		},
		error : function(err) {
			alert(err);
		}
	});
}

