var bookArray=[];
//Prevent White Space On Starting
$("input").on("keypress", function(e) {
	if (e.which === 32 && !this.value.length)
		e.preventDefault();
});

//select multiple book_id using check box
$(document).ready(function() {
	$('#mytable').DataTable({
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
	/*$('.chkbx').click(function() {*/
	$('#mytable tbody').on('click', '.chkbx', function () {
		var text = "";
		var bookId=$(this).val();
		var issueFlag=true;
		$.ajax({
			async: false,
			url : "checkStatus?book_id=" + bookId,
			type : "get",
			success : function(response) {
				if(response == 'issue'){
					alert("This '"+bookId+"' is Alredy Issue");
					issueFlag=false;
				} else {
					
				}
			},error : function(err) {
				alert(error);
			}
		});
		
		//alert("issue flag - "+issueFlag);
		
		if ($(this).is(":checked")){
			if(issueFlag){
				bookArray.push(bookId);
			}else{
				$(this).prop("checked", false);
			}
			//alert("checked - "+bookId);
			
		}else{
			var index = bookArray.indexOf(bookId);
			//alert("unchecked - "+bookId);
			if (index > -1) {
				bookArray.splice(index, 1);
			}
		}
		//alert(bookArray);
		$("#book_id").val(bookArray);
		
	});
});
	/*$('.chkbx').click(function(){
        var book_id = [];
        $.each($("input[name='book_id']:checked"), function(){            
            book_id.push($(this).val());
        });
        alert("Selected Books are: " + book_id.join(", "));
    });*/


$("#from_date").on("keydown", function(e) {
    e.preventDefault();
});
$("#to_date").on("keydown", function(e) {
    e.preventDefault();
});

// Reset All Fields on CANCEL Button
function uncheckAll() {
	$("input[type='checkbox']:checked").prop("checked", false)
	$('input[type="date"]').val("");
	$('input[type="text"]').val("");
}
$('.cancelbtn').on('click', uncheckAll)

function isNumberKey(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;
	return true;
}

