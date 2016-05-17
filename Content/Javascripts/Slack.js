$(document).ready(function () {
    $("#form-email").submit(function (e) {
        e.preventDefault();
        if ($("#input-email").val() != "") {
            $.ajax({
                type: "POST",
                url: "<azure funtion url>>",
                contentType: 'application/json; charset=utf-8',
                data: "{email: '" + $("#input-email").val() + "'}",
                dataType: "json",
                success: success
            })
    	$(".btn").hide();
    	$(".form-email-container").slideUp();
	$(".confirm").show();
        } else {
            alert("Please enter a valid email address.")
        }
    })
})

function success() {
    $(".btn").hide();
    $(".form-email-container").slideUp();
    $(".confirm").show();
}
