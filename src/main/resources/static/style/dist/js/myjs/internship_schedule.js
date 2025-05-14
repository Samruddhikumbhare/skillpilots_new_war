function get_schedule(advertisement_id, source) {
    var duration = $("#duration").val();
    var tab = document.getElementById("weekly_schd");
    console.log("advertising ID: " + advertisement_id);
    console.log("Table: " + tab);

    // Clear previous schedule rows
    while (tab.hasChildNodes()) {
        tab.removeChild(tab.lastChild);
    }

    // Create new schedule rows
    for (var i = 1; i <= duration; i++) {
        var row = '<tr><td style="font-weight:bold;width:5%;">#' + i + '</td>';
        row += '<td style="padding-left: 30px;padding-bottom: 15px;"><textarea class="form-control" onkeyup="testempty()" maxlength="345" style="width:100%; height:65px;" id="W' + i + '_1"';
        if (source === 'ADV') {
            row += ' disabled=true';
        }
        row += '></textarea></td>';
        row += '</tr>';
        $('#weekly_schd').append(row);
    }

    console.log("Response:");
    if (advertisement_id != null && advertisement_id !== "") {
        $.ajax({
            type: "GET",
            dataType: 'json',
            url: "getInternshipScheduleByAdv_id?adv_id=" + advertisement_id,
            success: function(response) {
                console.log("Response received:", response); // Log the response to verify data

                if (!response.empty && response.internshipSchedule && response.internshipSchedule.length > 0) {
                    var schedule = response.internshipSchedule[0];
                    for (var key in schedule) {
                        if (schedule.hasOwnProperty(key) && key.startsWith("schedule_")) {
                            var week = key.split('_')[1];
                            var textareaId = "W" + week + "_1";
                            var value = schedule[key];

                            // Log the value to check its type
                            console.log("Processing key:", key, "with value:", value);

                            // Ensure value is a string before splitting
                            if (typeof value === "string") {
                                value = value.split(":")[1].replace(/\"/g, ""); // Get value and remove quotes
                            } else {
                                console.warn("Expected string but got:", typeof value);
                                continue;
                            }

                            $("#" + textareaId).val(value);
                        }
                    }
                }

                if (source === 'ADV') {
                    $('#schedule_modal').modal('show');
                }
            },
            error: function(xhr, status, error) {
                console.error("Error response:", xhr.responseText);
            }
        });
    }

    $("#weekly_form").show();
}



//save schedule internship
function getschddata(){
	var str = "";
	var duration_val = $("#duration").val();	
	for (var i=1;i<=duration_val;i++){
		for(var j =1; j<=1; j++){
			var id = "W"+i+""+j;
			$('#'+id).each(function(){
				str += '"'+id+'"'+":"+'"'+$('#'+id).val()+'"'+",";
			});
		}
	}
	$("#weekly_data_str").val(str);
}

function show_schedule_modal(advertisement_id,duration,source){
		  console.log("Response:");

	$("#duration").val(duration);
	get_schedule(advertisement_id,source);
}

function testempty(){
	$("#sbtn").prop('disabled', false);
}

$('#close_schedule_modal').on('click', function(){location.reload();});
$('#cancel_schedule_modal').on('click', function(){location.reload();});

function saveschedule(){
	getschddata();
	var adv_id = $('#adv_id').val();
	var group_id = $('#group_id').val();
	var weekly_data_str = $("#weekly_data_str").val();

	$.ajax({
		type : "POST",
		url : "saveschedule",
		data: {adv_id:adv_id,group_id:group_id,weekly_data_str:weekly_data_str},
		success : function(response) {
			$('#schedule_modal').modal('hide');
			location.reload();
			return response;
		},
		error : function() {
			alert('oops! Some error occured while saving data. Please try again after sometime.');
		}
	});
}