function confirmDialog(getConfirmation,title_msg,content_msg,btn_confirm,btn_cancel){
	$.confirm({
		title: title_msg,
		content: content_msg,
		animationBounce: 1.5,
		buttons: {
			confirm: {
				text: btn_confirm,
				btnClass: 'btn-blue',
				keys: ['enter', 'shift'],
				action: function(){
					getConfirmation(btn_confirm);
				}
			},
			cancel: {
				text: btn_cancel,
				btnClass: 'btn-red',
				action: function(){
					getConfirmation(btn_cancel);
				}
			},

		}
	});

}

//alert box
/*function alertMsg(msg){
	$.dialog('<b style="color:red;">'+msg+'</b>');
}*/