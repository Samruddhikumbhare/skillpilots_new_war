function checkOldPass(elem) {
    // ... your existing code ...

    $.ajax({
        type: "GET",
        url: "check_old_pass?old_pass=" + input_val,
        success: function (response) {
            if (response == "failed") {
                old_pass_er = 'yes';
                $("#old_pass_error_lbl").text("Wrong password!");
            } else if (response == "success") {
                old_pass_er = 'no';
                $("#old_pass_error_lbl").text("Correct");
                // Display the new password input fields and hide the old password input field
                $("#old_pass").hide();
                $("#pass").show();
                $("#confirm_pass").show();
            }
        },
        error: function () {
            alert(error_verify);
        }
    });
}

/*function submit_form() {
    checkConfirmPass();
    
    // Check if the old password input is hidden, which means the user is setting a new password
    if ($("#old_pass").is(":hidden")) {
        // Handle the submission of the new password here
        // You can send an AJAX request to update the password on the server
        $.ajax({
            type: "POST",
            url: "change_password", // Replace with the actual URL of your controller method
            data: {
                old_password: $("#old_pass").val(),
                new_password: $("#pass").val()
            },
            success: function (response) {
                // Handle the success response (e.g., show a success message)
                console.log("Password changed successfully");
            },
            error: function () {
                alert("Error changing password");
            }
        });
    }
}*/
