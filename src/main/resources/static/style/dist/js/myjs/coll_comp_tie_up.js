
function acceptReject(elem) {
	var v = elem.id;
	$.ajax({
		type : "GET",
		url : "accept_reject_req?req_id=" + v,
		success : function(response) {
			if(response=="success"){
				location.reload();
			}
			return response;
		},
		error : function() {
            alert(error_save);
		}
	});
}



$("#btn_agree").click(function(){
		var fid=$("#hidden_form_id").val();
		submitTieUp(fid);
});

function submitTieUp(formid){
	confirmDialog(function(resp){
		if(resp==button_yes){
			$("#"+formid).submit();
		}else{
			return false;
		}
	},'Send Request To Company ','Do you really want to apply?',button_yes,button_no);
}

function confirmDialog(callback, title, message, buttonYes, buttonNo) {
	  // Implement your confirmation logic here
	  var userResponse = window.confirm(message);
	  if (userResponse) {
	    callback(buttonYes);
	  } else {
	    callback(buttonNo);
	  }
	}


function viewAgreement(college_id,company_id,requested_by,tieup_dt){
	console.log("workingeeeeeee");
	/*document.getElementById("approver_logo").src ="";
	document.getElementById("requester_logo").src = "";*/
	$('#tieup_dt').text(tieup_dt);
	if(requested_by=='CL'){
		jQuery.ajax({
	        url: "getCollegeDetails?college_id="+college_id,
	        success: function (result) {
	        	var clgDetails=result.college;
	        	console.log(clgDetails);
	        	$(".req_name").text(clgDetails.college_name);
	        	if(clgDetails.logo!=null && clgDetails.logo!=""){
	        	document.getElementById("requester_logo").src = "data:image/png;base64,"+clgDetails.logo;
	        	}
	        },
	        global: false,
	        async: false
	    });
		
		jQuery.ajax({
	        url: "getCompanyDetails?company_id="+company_id,
	        success: function (result) {
		console.log(result.text);
	        	$(".app_name").text(result.company_name);
	        	if(result.logo!=null && result.logo!=""){
	        	document.getElementById("approver_logo").src = "data:image/png;base64,"+result.logo;
	        	}
	        },
	        global: false,
	        async: false
	    });
	}else{
		jQuery.ajax({
	        url: "getCollegeDetails?college_id="+college_id,
	        success: function (result) {
	        	var clgDetails=result.college;
	        	$(".app_name").text(clgDetails.college_name);
	        	if(clgDetails.logo!=null && clgDetails.logo!=""){
	        	document.getElementById("approver_logo").src = "data:image/png;base64,"+clgDetails.logo;
	        	}
	        },
	        global: false,
	        async: false
	    });
		
		jQuery.ajax({
	        url: "getCompanyDetails?company_id="+company_id,
	        success: function (result) {
	        	$(".req_name").text(result.company_name);
	        	if(result.logo!=null && result.logo!=""){
	        	document.getElementById("requester_logo").src = "data:image/png;base64,"+result.logo;
	        	}
	        },
	        global: false,
	        async: false
	    });
	}
	downloadAgreement();
	//$("#tieup_terms_and_condition_pdf").modal("show");
}


function downloadAgreement() {   
	 var pdf = new jsPDF('p', 'pt', 'a4');
	 var img = new Image;
	 var reqImg = new Image;
	 var appImg = new Image;
	 var img_err=true;
	    reqImg=$('#requester_logo').attr('src');
	    appImg=$('#approver_logo').attr('src');
	    img.src = $('#po_logo').attr('src');
	    
	    source = document.getElementById("content");
	    specialElementHandlers = {
	      
	    };
	    margins = {
	       top: 40,
	        bottom: 30,
	        left: 35,
	        width: 522
	    };
	    img.onload = function(){
	    	pdf.addImage(img,'png', 223, 20, 130, 33);
	    	if($('#requester_logo').attr('src')!=""){
	    		try{
	    			img_err=false;
		    		pdf.addImage(reqImg,'png', 70, 60, 50, 60);
	    		}catch(err){
	    			img_err=true;
					$("#errorText1").text(err.message);
					$("#errorBox1").show();
	    		}
	    	}
	    	if(img_err){
	    		pdf.setFontSize(10);
	    		pdf.text(85, 80,'Logo');
	    		pdf.text(88, 95,'Not');
	    		pdf.text(75, 110,'Available');
	    	}
	    	if($('#approver_logo').attr('src')!=""){
	    		try{
	    			img_err=false;
	    			pdf.addImage(appImg,'png', 450, 60, 50, 60);
	    		}catch(err){
	    			img_err=true;
					$("#errorText1").text(err.message);
					$("#errorBox1").show();
	    		}
	    	}
	    	if(img_err){
	    		pdf.setFontSize(10);
	    		pdf.text(465, 80,'Logo');
	    		pdf.text(468, 95,'Not');
	    		pdf.text(455, 110,'Available');
	    	}
	    	
	    	pdf.fromHTML(
	    		    source, // HTML string or DOM elem ref.
	    		    margins.left, // x coord
	    		    margins.top, { // y coord
	    		        'width': margins.width, // max width of content on PDF
	    		        'elementHandlers': specialElementHandlers
	    		    },
	    		   function (dispose) {
	    		        pdf.save('tieup_agreement.pdf');
	    		    });
	    }
};

$(".close").click(function() {
	$(".errorBox").hide();
});