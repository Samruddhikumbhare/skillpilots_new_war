var student_ids;
var company_radio_id = '', avd_id = '';

function sendInterns() {
    var technology_name = $('#selecttechnology :selected').val();
    var duration_week = $('#duration_week :selected').val();

    if (technology_name == '-1' || duration_week == '-1') {
        var msg = '';
        if (technology_name == '-1') {
            if (duration_week == '-1') {
                msg = raise_req_conf_msg_tech_dur;
            } else {
                msg = raise_req_conf_msg_tech;
            }
        } else {
            msg = raise_req_conf_msg_dur;
        }

        confirmDialog(function(resp) {
            if (resp == button_yes) {
                var checkedIds = $(".student_chk:checked").map(function() {
	console.log("HHHHHhhhh"+checkedIds)
                    return this.id;
                }).toArray();
                var student_ids = checkedIds.join(",");
                	console.log("HHHHHhhhh"+student_ids)

                if (student_ids == '') {
                    alert('Please select a student.');
                } else {
                    sendStudentReq(student_ids);
                }
            } else {
                return;
            }
        }, 'Confirmation', msg, button_yes, button_no);
    } else {
        var checkedIds = $(".student_chk:checked").map(function() {
            return this.id;
        }).toArray();
        var student_ids = checkedIds.join(",");
        if (student_ids == '') {
            alert('Please select a student.');
        } else {
            sendStudentReq(student_ids);
        }
    }
}


function sendStudentReq(student_ids) {
    var company_id = company_radio_id;
    var technology_name = $('#selecttechnology :selected').val();
    var duration_week = $('#duration_week :selected').val();

    if (technology_name == '-1') {
        technology_name = '';
    }
    if (duration_week == '-1') {
        duration_week = 0;
    }

    if (company_id == '') {
        company_id = $("#comp_hid").val();
    }

    var req_msg = $('#req_msg').val();
    var com_avd_id = avd_id;

    $.ajax({
        type: "GET",
        url: "sendInternsReqFromRole",
        data: {
            student_id: student_ids,
            company_id: company_id,
            technology_name: technology_name,
            duration_week: duration_week,
            req_msg: req_msg,
            adv_id: com_avd_id
        },
        success: function(response) {
	console.log("dgdgdghjj"+response)
            if (response == "success") {
                location.reload();
            } else {
                  location.reload();
            }
        },
        error: function() {
            alert('Error occurred');
        }
    });
}


// call when close model 
$("#raised_Modal").on("hidden.bs.modal",function() {
	company_radio_id = '';
	$("#raised_Modal .modal-body").find('input:radio, input:checkbox').prop('checked',false);
	}
);