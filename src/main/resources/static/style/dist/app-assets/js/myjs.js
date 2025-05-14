if ($(".mytable").length) {
	$('.mytable').DataTable({
		"lengthMenu" : [ [ 5, 10, 20, 30, -1 ], [ 5, 10, 20, 30, "All" ] ],
	});
}
if ($(".multiselect-control").length) {
	$('.multiselect-control').multiselect();
}

function setSelectedValue(selectObj, valueToSet) {
    for (var i = 0; i < selectObj.options.length; i++) {
        if (selectObj.options[i].value== valueToSet) {
            selectObj.options[i].selected = true;
            return;
        }
    }
}

function showloader(){
	$(".content-wrapper").fadeTo(100, 0.33 ,function(){
		$(".loader").show();
	});
}

function hideloader(){
	$(".content-wrapper").fadeTo(100, 1 , function(){
		$(".loader").hide();
	});
}

$( document ).ajaxSend(function() {
	showloader();
});

$( document ).ajaxComplete(function() {
	hideloader();
});