function ShowMore(start) {
    var hide;

    $.ajax(
    {
        type: "POST",
        async: true,
        url: 'EditProfile.ashx?id=1&start=' + start,
        data: $("#mail").val(),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {

            console.log("SUCCESS!");

            for (var i = 0; i < response.length; i++) {
                if (response[i]["Hide"]) {
                    var image = ""
                } else {
                    var image = "<image  style='width: 90%; height: 80%;'  src='" + response[i]["Image"] + "'/>"
                }
                var Image = decodeURI(response[i]["Image"]);
                $("#Posts").append(" <div class='PostBox' style='width:90%;text-align:center;margin-left:5%;'>" +
                    "<h6 style='text-align:right;color:#650e0e;opacity:0.8;'>" + response[i]["User"] +
                    "<a style='width: 40px; height: 40px; display: inline-block;' href='Profile.aspx?id=" + response[i]["Code"] + "' class='ImgUserInPost'>" +
                    "<image class='ImgUserInPost' src='" + response[i]["UserImage"] + "' Width='40px' Height='40px' /></a></h6>" +
                    image +
                    // + "' hidden='" + response[i]["Hide"] + "
                    "<p style='text-align: right;'>" + response[i]["Body"] + "</p>" +
                    "<p style='text-align: left; font-size: 50%;'>" +
                    "<p style='text-align: left; font-size: 50%;'>" +
                    "<input class='ImgButtons' type='image' style='height:20px;width:20px;' src='../ImgLike.png' onclick='Like(" +
                    +response[i]["intID"] +
                    "); return false;' >" +
                    "<span class='Like" + response[i]["intID"] + "'>" + response[i]["LikeCount"] + "</span>" +
                    //Like goes here add onclick 
                    "<input class='ImgButtons' type='image' style='height:20px;width:20px;' src='../ImgComment.png'>" +
                    //Comment goes here add onclick 
                    "<input class='ImgButtons' type='image' style='height:20px;width:20px;' src='../ImgShare.png'>" +
                    //Share goes here add onclick 
                    "</p><hr /></div>");

            }

            //removes and recreates the link:
            $("#me").remove();
            $("#Posts").append("<a id='me' href='#me' onclick='ShowMore(" + (start + response.length) + ")' class='SubmitButtons'>بیشتر</a>");
        },
        error: function (msg) {
            console.log("error:" + msg);
        }
    });

}

function ShowMoreFriends(start) {
    var hide;

    $.ajax(
    {
        type: "POST",
        async: true,
        url: 'EditProfile.ashx?id=2&start=' + start,
        data: $("#mail").val(),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {

            console.log("SUCCESS!");

            for (var i = 0; i < response.length; i++) {

                $("#Friends").append(" <div class='PostBox' style='width:90%;text-align:center;margin-left:5%;'>" +
                    "<h6 style='text-align:right;color:#650e0e;opacity:0.8;'>" + response[i]["Name"] +
                    "<image class='ImgUserInPost' src='" + response[i]["UserImage"] + "' Width='40px' Height='40px' /></h6>" +
                    "<hr /></div>");
            }

            //removes and recreates the link:
            $("#me").remove();
            $("#Friends").append("<a id='me' href='#me' onclick='ShowMore(" + (start + response.length) + ")' class='SubmitButtons'>بیشتر</a>");
        },
        error: function (msg) {
            console.log("error:" + msg);
        }
    });
}

//Accepting the Friend Request
function Accept(start, hi) {
    var hide;

    $.ajax(
    {
        type: "POST",
        async: true,
        url: 'EditProfile.ashx?id=3&start=' + start,
        success: function (msg) {

            console.log("SUCCESS!");

            //removes and recreates the link:
            var request = "#" + hi;
            $(request).remove();

        },
        error: function (msg) {
            console.log("error:" + msg);
        }
    });
}


//Rejecting the Friend Request
function Decline(start, hi) {
    var hide;
    $.ajax(
    {
        type: "POST",
        async: true,
        url: 'EditProfile.ashx?id=4&start=' + start,
        success: function (msg) {

            console.log("SUCCESS!");

            //removes and recreates the link:
            var request = "#" + hi;
            $(request).remove();

        },
        error: function (msg) {
            console.log("error:" + msg);
        }
    });
}


//
function LoadPostInfo(start) {
    var hide;

    $.ajax(
    {
        type: "POST",
        async: true,
        url: 'EditProfile.ashx?id=6&start=' + start,
        data: $("#mail").val(),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {

            console.log("SUCCESS!");
            $("." + "Like" + start).text(response[0]["LikeCount"]);


            // $("." + "Comment" + start).text(response[0]["LikeCount"]);
            //$("." + "Share" + start).text(response[0]["LikeCount"]);
        },
        error: function (msg) {
            console.log("error:" + msg);
        }
    });

}

//Like
function Like(start){
var hide;

$.ajax(
{
    type: "POST",
    async: true,
    url: 'EditProfile.ashx?id=5&start=' + start,
    data: $("#mail").val(),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function (response) {

        console.log("SUCCESS!");
        var classname = "Like" + start;
        $("." + classname).text(response[0]["LikeCount"]);
    },
    error: function (msg) {
        console.log("error:" + msg);
    }
});

}


//Share

//Comment