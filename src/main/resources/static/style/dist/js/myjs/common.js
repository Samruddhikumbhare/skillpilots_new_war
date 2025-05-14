$(document).ajaxStart(function() {
	$('#loadmodal').modal('show'); // show the gif image when ajax starts
}).ajaxStop(function() {
	 $('#loadmodal').modal('hide'); // hide the gif image when ajax completes
});

function setOptionbyvalue(selectElement, value) {
    var options = selectElement.options;
    for (var i = 0; i < options.length; i++) {
        if (options[i].value == value) {
            selectElement.selectedIndex = i;
            return true;
        }
    }
    return false;
}

function setOptionbytext(selectElement, text) {
    var options = selectElement.options;
    for (var i = 0; i < options.length; i++) {
        if (options[i].text == text) {
            selectElement.selectedIndex = i;
            return true;
        }
    }
    return false;
}

function start_tutorial(){
	//alert($("#tutorial_set").val() + " " + $('#tutorial_inst_type').val() + " " + $('#tutorial_log_type').val() + " " + $('#tutorial_role').val());
	if($("#tutorial_set").val()=='false'){
		var video_src ='';
		if ($('#tutorial_inst_type').val() == 'CL') {
			if ($('#tutorial_role').val() == iii_Role){
				video_src = tutorial_video_link_coll_role_1;
			}else if ($('#tutorial_role').val() == hod_Role){
				video_src = tutorial_video_link_coll_role_2;
			}else if ($('#tutorial_role').val() == dept_incharge_Role){
				video_src = tutorial_video_link_coll_role_3;
			}
		}else if ($('#tutorial_inst_type').val() == 'CP') {
			if ($('#tutorial_role').val() == '1'){
				video_src = tutorial_video_link_comp_role_1;
			}else if ($('#tutorial_role').val() == '2'){
				video_src = tutorial_video_link_comp_role_2;
			}else if ($('#tutorial_role').val() == '3'){
				video_src = tutorial_video_link_comp_role_3;
			}
		}
		if ($('#tutorial_log_type').val() == 'ST'){
			video_src = tutorial_video_link_student;
		}
		$('#tutorial_video').append('<video id="tutorial" style="width: 100%; height: 100%" controls type="video/mp4"\
			controlsList="nodownload" oncontextmenu="return false;" src="'+video_src+'">\
			Your browser does not support HTML5 video.</video>');

		$("#tutorial_set").val("true");
		$('#tutorial').get(0).play();
	}
}

function isNumberKey(event){
	var charCode = (event.which) ? event.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;
	return true;
}

function onlyAlphabets(e, t) {
	var charCode=0;
	try {
		if(window.event) {
			charCode = window.event.keyCode;
		}else if(e) {
			charCode = e.which;
		}else{ 
			return true; 
		}
		if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
			return true;
		else
			return false;
	}catch (err) {
		alert(err.Description);
	}
}

function escapeHtml4PGSQL(text) {
	return encodeURIComponent(text.replace(/'/g, "''"));
}

var page_no=0,page_no2=0;;
var stop_loading=false,stop_loading2=false;
jQuery(function($) {
    $('#notifications_div').on('scroll', function() {
        if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
        	page_no+=notif_offset;
        	if(!stop_loading){
        		$.get("getNextNotifPage?page_no="+page_no, function(data, status){
           		 if(data.length>0){
           			 $("#loding_content").show();
           			 for(var i=0;i<data.length;i++){
               			 var notification=data[i];
               			 var notif_message=notification.notif_msg;
               			 notif_message=notif_message.substring(0,100);
               			 var notif='<a class="list-group-item ';
               			 if(notification.status==notifications_status_unread){
               				 notif+='unread' ;
               			 }
               			 notif=notif+'data-toggle="popover" data-content="'+notification.notif_msg+'" href="redirect_notif_url?notif_id='+notification.notification_id+'">'+notif_message;
               			 if(notification.notif_msg.length>100){
               				 notif+="...";
               			 }
               			 notif+='<span style="float:right;font-size: 10px !important;margin-top: 10px;">'+notification.creation_date+':'+notification.creation_time+'</span></a>';
               			           		 
               			 $("#notif_list").append(notif);
               			 $("#loding_content").hide();
               		 }
           		 }else{
           			 stop_loading=true;
           		 }
           		 
           	    });
        	}
        }
    })
});

jQuery(function($) {
    $('#noti_div').on('scroll', function() {
        if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
        	page_no2+=notif_offset;
        	if(!stop_loading2){
        		$("#all_notif_load_notif").show();
        		$.get("getNextNotifPage?page_no="+page_no2, function(data, status){
           		 if(data.length>0){
           			 for(var i=0;i<data.length;i++){
               			 var notification=data[i];
               			
               			 var notif='<tr><td><a href="redirect_notif_url?notif_id='+notification.notification_id+'" class="notif ';
               			if(notification.status==notifications_status_unread){
              				 notif+='unread">' ;
              			 }else{
              				notif+='">' ;
              			 }
               			
               			 notif+='<span><i class="fa fa-square notif_msg_style"></i>  '+notification.notif_msg+'</span></a>';
               			 /*notif+='  '+notification.notif_msg+'';*/
               			 
               			if(notification.status==notifications_status_unread){
               				notif+='<span id="'+notification.notification_id+'" class="mark-as-read">&nbsp;&nbsp;Mark as read</span>';
               			}else{
               				notif+='&nbsp;&nbsp;<i class="fa fa-check" aria-hidden="true" style="color:#44f544;"></i>';
               			}
               			notif+='</td></tr>';
               			               			           		 
               			 $("#all_notif_body").append(notif);
               		 }
           		 }else{
           			 stop_loading2=true;
           		 }
           		 
           	    });
        		//setTimeout(function(){}, 3000);
        		$("#all_notif_load_notif").hide();
        	}
        }
    })
});

function show_loading(){
	if(!$('#loadmodal').length)
		$('#loadmodal').modal('show');
}

function hide_loading(){
	if($('#loadmodal').length)
		$('#loadmodal').modal('hide');
}