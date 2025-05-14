// intially disabled
//Parikshit :- if condition check if already exist message displayed disable submit button
$('#sbtn').prop('disabled',true);
$(function () {
	  $('#term_conditions').click(function () {
		$('#sbtn').prop('disabled',true);
	    if($("#maillabel").text() == email_exist || $("#maillabel2").text() == email_exist){
	    	$("#sbtn").prop('disabled', true);
	    }else{
	    	$('#sbtn').prop('disabled', !$('#term_conditions:checked').length);
	    }
	    if($('#term_conditions').is(":checked")){
	    	$("#terms_conditions").tooltip("hide");
		}
	  });
	});

//pdf viewer
document.querySelector(".embed-link").addEventListener("click", function (e){

	e.preventDefault();

	//this.setAttribute("class", "show");

	var options = {
		pdfOpenParams: {
			pagemode: "thumbs",
			navpanes: 0,
			toolbar: 0,
			statusbar: 0,
			view: "FitP"
		}
	};
	var myPDF = PDFObject.embed($('#terms_condsn_path').val(), "#pdf-body", options);
	
	$('#pdf').modal('show');
	$('#madal_title').html("Terms and Conditions");
	//var el = document.querySelector("#results");
	//el.setAttribute("class", (myPDF) ? "success" : "fail");
	//el.innerHTML = (myPDF) ? "PDFObject successfully added an &lt;embed> element to the page!" : "Uh-oh, the embed didn't work.";

});

document.querySelector(".embed-link-privacy").addEventListener("click", function (e){

	e.preventDefault();

	//this.setAttribute("class", "show");

	var options = {
		pdfOpenParams: {
			pagemode: "thumbs",
			navpanes: 0,
			toolbar: 0,
			statusbar: 0,
			view: "FitP"
		}
	};

	var myPDF = PDFObject.embed($('#private_polcy_path').val(), "#pdf-body", options);
	
	$('#pdf').modal('show');
	$('#madal_title').html("Privacy Policy");
	//var el = document.querySelector("#results");
	//el.setAttribute("class", (myPDF) ? "success" : "fail");
	//el.innerHTML = (myPDF) ? "PDFObject successfully added an &lt;embed> element to the page!" : "Uh-oh, the embed didn't work.";

});

/*<!-- analytics, unrelated to any example code presented on this page -->*/
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	ga('create', 'UA-1394306-6', 'auto');
	ga('send', 'pageview');
	
	