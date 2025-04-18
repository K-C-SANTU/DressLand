<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Hello, world!</title>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../jqueryui/jquery-ui.css">
        <link href="../animate/animate.css" rel="stylesheet" type="text/css"/>
        <!--<link rel="stylesheet" href="../fontawesome/fontawesome.css"/>-->
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <style>
            body{
                background-image: url(../images/bg/8.png) ;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
        </style>
        <style>
            .error
            {
                color: red;
            }
            .login{
                margin-top: -80px !important;
            }
            .card1
            {
                background-color: black !important;
            }
            .dangers
            {
                background-color: #dc3545 !important;
            }
            .green
            {
                background-color: #28a745 !important;
            }
        </style>
    </head>
    <body class=" user-select-none">
        <div class="bg-dark vh-100">
            <div class="container-fluid">
                <div class="row vh-100 d-flex justify-content-center align-items-center">
                    <div class="col-xl-4 col-md-8 col-sm-11 login">  
                        <div class="text-center mb-5">
                            <img src="../images/3.png" class="img-fluid">
                        </div><br>
                        <div class="alert alert-success mb-5 alert-dismissible text-light p-4 m-2" style="display: none;" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="alert-heading"><i class="fas fa-exclamation-triangle"></i> Alert !!!</h4>
                            Invalid Login Id and Password
                        </div>
                        <div class="card card-body"  id="color" style="background-color: black; border-radius: 15px; box-shadow: 0 0 44px white; ">    
                            <h1 class="d-flex justify-content-lg-end mb-4 text-uppercase text-warning">Admin Login</h1>           
                            <form id="kc" method="post" action="/itemdelivery/Admin/adminpage?url=login">                                
                                <label for="name" class="text-light">Email</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" title="See yout password"><i class="fal fa-user"></i></span>    
                                    </div>
                                    <input type="email" value="santosh@gmail.com" tabindex="1" id="name" minlength="2" name="name" class="form-control" autocomplete="off"  required placeholder="Enter Your name">
                                </div><br>
                                <label for="pass" class="text-light">Password</label>
                                <div class="input-group">
                                    <div class="input-group-prepend pass" style="cursor: pointer;">
                                        <span class="input-group-text"><i class="fal fa-eye"></i></span>    
                                    </div>
                                    <input type="password" value="123456" tabindex="2" id="pass" name="password" class="form-control " required placeholder="Enter Your Password">
                                </div>
                                <%! String s = null;%>
                               
                                
                                <%                                    
                                    try 
                                    {
                                        s = (String) request.getAttribute("error");
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                    if (s == "y") 
                                    {
                                %>
                                        <p class="text-light mt-3">
                                            <a href="adminpage?url=forgot" class="text-uppercase text-danger text-decoration-none">forgot Password?</a>
                                        </p>
                                <% } %>
                                <input type="submit" tabindex="3" class="btn btn-primary btn-lg mt-5 btn-block text-uppercase text-center mb-4" name="submitlogin" value="Login">
                            </form>
                            <div class="text-light text-center mt-1 no-text-decoration" id="color1">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
    </body>
    <script src="../javascript/js.js"></script>
    <script src="../bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../jqueryui/jquery-ui.js"></script>
    <script src="../validate/validate.js"></script>
    <script>
        $(".text-danger").hover(function () {
            $(this).toggleClass("font-weight-bold");
        });
    </script>
    <%
        try
        {
            request.setAttribute("error", "no");
            String check = "y";
            if (s == check) 
            {
    %>
                    <script>
                        $(document).ready(function () 
                        {
                            $(".alert").slideDown("slow");
                            $('.alert').addClass("dangers");
                            var alert = setTimeout(alertmethod, 25000);
                            function alertmethod()
                            {
                                $(".alert").slideUp();
                            }
                        });
                    </script>
    <%      }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    %>
    <script>
        var a = true;
        var b = true;
        $(".pass").click(function () 
        {
            if (a == true)
            {
                $('#pass').attr('type', 'text');
                $(".pass i ").removeClass("fa-eye");
                $(".pass i ").addClass("fa-eye-slash");

                a = false;
            } else
            {
                $('#pass').attr('type', 'password');
                $(".pass i ").removeClass("fa-eye-slash");
                $(".pass i ").addClass("fa-eye");
                a = true;
            }
        });
        $(".form-control").focus(function () {
            $(this).animate({height: "50px"}, 200);
        });
        if($("#pass").val().trim()!="")
        {
            $("#pass").animate({height: "50px"}, 200);
        }
        if($("#name").val().trim()!="")
        {
            $("#name").animate({height: "50px"}, 200);
        }
        $(".form-control").blur(function () {
            var b = $(this).val();
            if (b === "")
            {
                $(this).animate({height: "38px"}, 200);
            }
        });
    </script>
    <script>

        $(document).ready(function () {
            jQuery.validator.addMethod("email", function (value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value.trim());
            }, "&nbsp&nbspEnter valid email id.");

            var validator = $("#kc").validate({
                errorPlacement: function (error, element)
                {
                    $(element).closest("form").find("label[for='" + element.attr("id") + "']").append(error);
                },
                errorElement: "span",
                ignore: [],
                rules:
                        {
                            name: {
                                required: true
                            },
                            password: {
                                required: true,
                                minlength: 6,
                                maxlength: 25
                            }
                        },
                messages:
                        {
                            name:
                                    {
                                        required: " &nbsp&nbsp(required)"
                                    },
                            password:
                                    {
                                        required: " &nbsp&nbsp(required)",
                                        minlength: " &nbsp&nbsp(Enter at least 6 Character)",
                                        maxlength: "&nbsp&nbsp(maximum lenght is 25 characters)"
                                    }
                        }
            });
        });
    </script>
</html>