<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.classes.connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register form</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../jqueryui/jquery-ui.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <style>
            body{
                background-image: url(../images/bg.jpg) ; 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
        </style>
        <style>
            .error{
                color: red;
            }
            select option{
                color: black;
            }
        </style>
    </head>
    <body class=" user-select-none">
        <%@include file="header.jsp" %>
        <div class="container mt-5 mb-5">
            <div class="row vh-10 d-flex justify-content-center align-items-center">
                <div class="col-xl-8 col-lg-8 col-md-10 col-sm-10 p-0">
                    <div class="card card-body" style="background-color: black;border-radius:18px;box-shadow:0 0 30px black;">
                        <%
                            if(request.getAttribute("error")!=null)
                            {
                        %>
                        <div class="mb-3 alert alert-warning alert-dismissible fade show" role="alert">
                            <strong><i class=" text-danger fas fa-exclamation-triangle"></i></strong>
                            <%=request.getAttribute("error") %>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <%
                            }
                            if(request.getAttribute("success")!=null)
                            {   
                        %>
                        <div class="mb-3 alert alert-success alert-dismissible fade show" role="alert">
                            <strong><i class=" text-success fas fa-check-circle"></i></strong>
                            <%=request.getAttribute("success") %>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <%  } %>
                        <form class="text-light text-capitalize" action="spregister" id="form1" method="post" enctype="multipart/form-data">
                            <div class="h2 text-uppercase d-flex justify-content-end text-warning">Registration form</div>
                            <hr class="border border-info">
                            <div class="row mt-4">
                                <div class="col-6">
                                    <label for="fname">fname</label>
                                    <input type="text" id="fname" name="fname" class="form-control" placeholder="Enter your first name"><br>
                                </div>
                                <div class="col-6">
                                    <label for="lname=">lname</label>
                                    <input type="text" id="lname" name="lname" class="form-control" placeholder="Enter your last name"><br>
                                </div>
                            </div>
                            <label for="email">Email ID</label>
                            <input type="email" id="email" name="email" class="form-control"  placeholder="Enter your Email ID"><br>
                            <div class="row">
                                <div class="col-6">
                                    <label for="phone">phone number</label>
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="Enter your mobile number" size="10"><br>
                                </div>
                                <div class="col-6">
                                    <label for="aphone">ph.no(Optional)</label>
                                    <input type="text" class="form-control" name="aphone" id="aphone" placeholder="Alternate mobile number" size="10"><br>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <label for="country">Country</label>
                                    <select class="form-control" name="country" onchange="states(this.value)" id="country">
                                        <option value="">Country</option>
                                        <%
                                            connection con = new connection();
                                            Statement st;
                                            ResultSet rs;
                                            st = con.con.createStatement();
                                            String s = "SELECT * FROM `countries` WHERE id LIKE '101'";
                                            rs = st.executeQuery(s);
                                            while (rs.next()) {
                                        %>
                                        <option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
                                        <%
                                            }
                                        %>
                                    </select><br>
                                </div>
                                <div class="col-4">
                                    <label for="state">State</label>
                                    <select class="form-control d-block w-100" id="state" onchange="cities(this.value)" name="state">
                                        <option value="">Choose...</option>
                                    </select><br>
                                </div>
                                <div class="col-4">
                                    <label for="state">City</label>
                                    <select class="form-control d-block w-100" id="dist" required name="dist">
                                        <option value="">Choose...</option>
                                    </select><br>
                                </div>  
                            </div>

                            <label for="address">permanent Address</label>
                            <textarea name="address" rows="3" id="address" class="form-control" placeholder="Enter your permanent address"></textarea><br>
                            <label for="aaddress">current address(Optional)</label>
                            <textarea name="aaddress" rows="3" id="aaddress" class="form-control" placeholder="Enter your current address"></textarea><br>
                            <div class="row">
                                <div class="col-6">
                                    <label for="password">Password</label>
                                    <input type="text" id="password" name="password" class="form-control" placeholder="Please enter the password"><br>
                                </div>
                                <div class="col-6">
                                    <label for="password">Confirm Password</label>
                                    <input type="text" id="cpassword" name="cpassword" class="form-control" placeholder="Confirm Password"><br>
                                </div>
                            </div>
                            <label for="categery">Category</label>
                            <input type="text" placeholder="Please enter category type" class="form-control" name="category" id="category" autocomplete="off"><br>
                            <label for="idprofile">ID Proof <small class="text-warning">(Adhar,Voter-id,Pan-card,etc..)</small></label>
                            <input type="file" id="idprofile" required name="idprofile" class="form-control">
                            <hr class="border border-warning mt-4">
                            <div class="float-right">
                                <input type="reset" class="btn btn-secondary mt-4 ml-2" name="reset" value="RESET">
                                <input type="submit" class="btn btn-primary mt-4" name="submitr" value="SIGN UP">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
        <script src="../javascript/js.js" type="text/javascript"></script>
        <script src="../bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="../bootstrap/js/bootstrap.bundle.js" type="text/javascript"></script>
        <!--<script src="../validate/validate.js" type="text/javascript"></script>-->
        <script src="../jqueryui/jquery-ui.js"></script>
        <script>
            function states(state)
            {
                if(state!="")
                {
                    $.ajax({
                        url: "../addressajax",
                        type: 'POST',
                        data: "state="+state,
                        success: function (data) 
                        {
                            
                            $("#state").html(data);
                        }
                    });
                }
                else
                {
                    $("#state").html("<option value=''>Choose Country</option>");
                    $("#dist").html("<option value=''>Choose State</option>");
                }
            }
            function cities(city)
            {
                $.ajax({
                    url: "../addressajax",
                    type: 'POST',
                    data: "city="+city,
                    success: function (data) 
                    {
                        $("#dist").html(data);
                    }
                });
            }
        </script>
        <script>
            $(document).ready(function () {


                jQuery.validator.addMethod("email", function (value, element)
                {
                    return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value.trim());
                }, "Enter valid email id.");

                jQuery.validator.addMethod("number1", function (value, element) {
                    return /^[6789][0-9]{9}$/.test(value.trim());
                }, "Enter valid mobile number.");
                $("#form1").validate({
                    rules:
                            {
                                fname:
                                        {
                                            required: true,
                                            minlength: 3
                                        },
                                lname:
                                        {
                                            required: true,
                                            minlength: 3
                                        },
                                email:
                                        {
                                            required: true
                                        },
                                phone:
                                        {
                                            number1: true,
                                            number: true,
                                            required: true,
                                            minlength: 10,
                                            maxlength: 10

                                        },
                                aphone:
                                        {
                                            number: true,
                                            minlength: 10,
                                            maxlength: 10
                                        },
                                address:
                                        {
                                            required: true,
                                            minlength: 5
                                        },
                                aaddress:
                                        {
                                            minlength: 5
                                        },
                                idprofile:
                                        {
                                            required: true
                                        },
                                password: {
                                    required: true,
                                    minlength: 6,
                                    maxlength: 25
                                },
                                cpassword: {
                                    required: true,
                                    minlength: 6,
                                    equalTo: "#password",
                                    maxlength: 25
                                },
                                country:
                                {
                                    required:true
                                },
                                state:
                                {
                                    required:true
                                },
                                dist:
                                {
                                    required:true
                                }
                            },
                    messages:
                            {
                                fname:
                                        {
                                            required: "Please Enter your First Name",
                                            minlength: "Minimum length should be 3 Characters"
                                        },
                                lname:
                                        {
                                            required: "Please Enter your Last Name",
                                            minlength: "Minimum length should be 3 Characters"
                                        },
                                email:
                                        {
                                            required: "Enter Your email ID"
                                        },
                                phone:
                                        {
                                            required: "Enter Phone number",
                                            number: "Characters are not allowed please enter your mobile number",
                                            minlength: "Please enter valid Mobile number",
                                            maxlength: "Please enter valid Mobile number"
                                        },
                                aphone:
                                        {
                                            number: "Characters are not allowed please enter your mobile number",
                                            minlength: "Please enter valid Mobile number",
                                            maxlength: "Please enter valid Mobile number"
                                        },
                                address:
                                        {
                                            required: "Please enter your Permanent address",
                                            minlength: "Please enter your address with valid land mark"
                                        },
                                aaddress:
                                        {
                                            minlength: "Please enter your address with valid land mark"
                                        },
                                idprofile:
                                        {
                                            required: "Please Provide your Id proof"
                                        },
                                password: {
                                    required: "Please enter password",
                                    minlength: "Minimum length should be 6 Characters",
                                    maxlength: "Maximum length is 25 Characters"
                                },
                                cpassword: {
                                    required: "Please Re-Enter password",
                                    equalTo: "Miss match password",
                                    minlength: "Minimum length should be 6 Characters",
                                    maxlength: "Maximum length is 25 Characters"
                                },
                                country:
                                {
                                    required:"Please select your countrie"
                                },
                                state:
                                {
                                    required:"Please select state"
                                },
                                dist:
                                {
                                    required:"Please select your state"
                                }
                            }
                });
            });
        </script>
    </body>
</html>
