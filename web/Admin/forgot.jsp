<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../jqueryui/jquery-ui.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <style>
            .error
            {
                color: red;
            }
        </style>
    </head>
    <body class=" user-select-none">
        <%--<%@include file="header.jsp" %>--%>
            <div clsss="bg-dark">
                <div class="container-fluid">
                    <div class="row vh-100 d-flex justify-content-center align-items-center" >
                        <img src="../images/white.jpg">
                        <div class=" col-xl-4 col-lg-8 col-md-10 col-sm-12 p-0">
                            <div class="card p-3 bg-dark text-white m-3">
                                
                                <div class="text-warning h2 d-flex justify-content-lg-end" >Reset Your Password</div><hr class="border bor">
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
                                <form method="post" action="adminpage?url=sendlink">
                                    <label for="input1" class="mt-4">Email </label>

                                    <input type="text" id="input1" name="email" class="form-control"  required placeholder="Enter your email"><br>

                                    <button type="submit" class="btn btn-primary btn mb-4 mt-2" name="sendlink">Reset my Account</button>
                                    <hr class="border-info">
                                    <a href="/itemdelivery/Admin" class="alert-link text-decoration-none text-success">Back to login</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                <%@include file="footer.html" %>
        <script src="../javascript/js.js" type="text/javascript"></script>
        <script src="../bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="../bootstrap/js/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="../validate/validate.js" type="text/javascript"></script>
        <script src="../jqueryui/jquery-ui.js"></script>
        <script>
            jQuery.validator.addMethod("santosh", function (value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value.trim());
            }, "Enter valid email id.");
            $("form").validate({
                rules: {
                    email: {
                        required: true,
                        santosh: true
                    }
                },
                messages: {
                    email: {
                        required: "Please Enter your Email Id here"
                    }
                }

            });
        </script>
    </body>
</html>
