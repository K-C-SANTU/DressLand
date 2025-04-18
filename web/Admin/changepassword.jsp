<!DOCTYPE html>
<html>
    <head>
        <title>change password</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale==1.0">
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../jqueryui/jquery-ui.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    </head>
    <style>
        body{
            background-image: url(../images/bg/8.png) ;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
    <style>
        #npass-error,#pass-error,#rpass-error
        {
            color: red;
        }
    </style>
    <body class=" user-select-none">
        <%@include file="header.jsp" %>
        <div class="container-fluid bg">
            <div class="row vh-100 justify-content-center align-items-center">
                <div class="col-xl-4 col-md-7 col-sm-8 p-0">
                    <div class="card card-body bg-dark text-light" style="background-color:transparent;margin-top: -150px; border-radius: 10px;">
                        <%                            
                            if (request.getAttribute("error") != null) {
                        %>
                        <div class="alert alert-danger alert-dismissible fade show mt-4 mb-4" role="alert">
                            <%=request.getAttribute("error")%>
                            <button type="button" class="close" data-dismiss="alert" area-label="Close">
                                <span area-hidden="true">&times;</span>
                            </button>
                        </div>

                        <%
                            }
                            if (request.getAttribute("success") != null) {
                        %>
                        <div class="alert alert-success alert-dismissible fade show  mt-4 mb-4" role="alert">
                            <%=request.getAttribute("success")%>
                            <button type="button" class="close" data-dismiss="alert" area-label="Close">
                                <span area-hidden="true">&times;</span>
                            </button>
                        </div> 
                        <%
                            }
                        %>
                        <h2 style="text-align:right" class="text-primary">Change Password</h2>
                        <form method="post" id="form1" action="adminpage?url=change">
                            <label for="npass" class="mt-3"> Old password</label>
                            <input type="password" id="npass" class="form-control" placeholder="Enter Old Password" name="npass"><br>
                            <label for="pass"> New password</label>
                            <input type="password" id="pass" class="form-control" placeholder="Enter New Password" name="pass"><br>
                            <label for="rpass"> Confirm password</label>
                            <input type="password" id="rpass" class="form-control" placeholder="Confirm Password" name="rpass"><br>
                            <button type="submit" class="btn btn-primary mt-3 mb-2" name="change">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
        <script src="../javascript/js.js" type="text/javascript"></script>
        <script src="../bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="../bootstrap/js/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="../jqueryui/jquery-ui.js"></script>
        <script src="../validate/validate.js" type="text/javascript"></script>
        <script>
            $("#form1").validate({
                rules:
                        {
                            npass:
                                    {
                                        required: true,
                                        minlength: 6,
                                        maxlength: 25
                                    },
                            pass:
                                    {
                                        required: true,
                                        minlength: 6,
                                        maxlength: 25
                                    },
                            rpass:
                                    {
                                        required: true,
                                        minlength: 6,
                                        maxlength: 25,
                                        equalTo: "#pass"
                                    }

                        },
                messages:
                        {
                            npass:
                                    {
                                        required: "Please enter your old password",
                                        minlength: "Password length is more than 6 Characters",
                                        maxlength: "Password length is less then 25 Characters"
                                    },
                            pass:
                                    {
                                        required: "Please enter your new password",
                                        minlength: "Password length is more than 6 Characters",
                                        maxlength: "Password length is less then 25 Characters"
                                    },
                            rpass:
                                    {
                                        required: "Please Confirm your password",
                                        minlength: "Password length is more than 6 Characters",
                                        maxlength: "Password length is less then 25 Characters",
                                        equalTo: "Miss Match password"
                                    }
                        }
            });
        </script>
    </body>
</html>
