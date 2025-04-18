<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Add items</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../jqueryui/jquery-ui.css">
        <link href="../animate/animate.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="../bootstrap/bootstrap-steps.min.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background-image: url(../images/bg/7.jfif) ; 
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
        </style>
        <style>
            #second,#third
            {
                display:none;
            }
            .form-control:focus{
                box-shadow: 0 0 0 0.1rem rgba(0, 123, 255, 0.25);
            }
            .form-control1{
                box-shadow: 0 0 0 0.05rem red !important;
            }
            .error{
                color: red;
                margin-top: 2px;
                padding: 0px 2px;
                background-color: white;
            }
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input[type=number] {
                -moz-appearance: textfield;
            }
            .card1{
                transition: 0.5s;
            }
            .card1:hover{
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
                transform: scale(1.02);
            }
            .dot {
                height: 100px;
                width: 90%;
                border-radius: 10px;
                margin: auto;
                margin-bottom: 20px;
                display: inline-block;
            }
            .wid{
                width: 90% !important;
            }              
            @media screen and (max-width: 500px)
            {
                .wid
                {
                    width: 70% !important;
                }
            }
            .plus{
                box-shadow: 0 1px 2px rgba(0,0,0,0.15);
                transition: box-shadow 0.3s ease-in-out;
                font-size: 50px;
                cursor: pointer;
            }

            .plus:hover {
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
                background-color:rgba(0,0,0,0.03);

            }
            .plus::after {
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
                opacity: 0;
                transition: opacity 0.3s ease-in-out;
            }
            .plus:hover::after {
                opacity: 1;
            }
            @media screen and (min-width:500px)
            {
                .step-content{
                    min-width: 8rem !important;
                }
                .step-circle::before{
                    width: calc(8rem + 1rem - 1.5rem) !important;
                }
            }
            @media screen and (min-width:750px)
            {
                .step-content{
                    min-width: 14rem !important;
                }
                .step-circle::before{
                    width: calc(14rem + 1rem - 1.5rem) !important;
                }
            }
            @media screen and (min-width:900px)
            {
                .step-circle{
                    width : 2.5rem !important;
                    height: 2.5rem !important;
                }
                .step-content{
                    min-width: 16rem !important;
                }
                .step-circle::before{
                    width: calc(16rem + 1rem - 2.5rem) !important;
                }
            }
            .ch .close{
                opacity: 0;
                transition: 0.5s;
            }
            .ch:hover .close{
                opacity: 1;
            }
            @media screen and (min-width:1200px)
            {
                .step-circle{
                    width : 3.5rem !important;
                    height: 3.5rem !important;
                }
                .step-content{
                    min-width: 18rem !important;
                }
                .step-circle::before{
                    width: calc(18rem + 1rem - 3.5rem) !important;
                }
            }
        </style>
    </head>
    <body class=" user-select-none">
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <div class="row d-flex justify-content-center mt-5">
                <div class="col-xl-10 mt-5 mb-5">
                    <%
                        if(request.getAttribute("error")!=null)
                        {
                            %>
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <%=request.getAttribute("error")%>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <%
                        }
                        if(request.getAttribute("success")!=null)
                        {
                            %>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <%=request.getAttribute("success")%>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <%
                        }
                    %>
                    <ul class="steps">
                        <li class="step first">
                          <div class="step-content">
                            <span class="step-circle">1</span>
                            <span class="step-text">Items Details</span>
                          </div>
                        </li>
                        <li class="step second">
                          <div class="step-content">
                            <span class="step-circle">2</span>
                            <span class="step-text">More Details</span>
                          </div>
                        </li>
                        <li class="step third">
                          <div class="step-content">
                            <span class="step-circle">3</span>
                            <span class="step-text">File Upload</span>
                          </div>
                        </li>
                      </ul>
                    <form class="form-horizontal" method="POST" id="myform" action="AddItems" name="formupload" enctype="multipart/form-data">
                        <fieldset id="first">
                            <hr class="border-primary">
                            <div class="card card-body p-5 border-bottom-0 border-top-0 border-primary">
                                <label for="title">Title</label>
                                <textarea class="form-control" name="title" id="title" required rows="3" placeholder="Enter item title Here"></textarea><br>
                                <label for="cost">Cost</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">&#x20b9</span>
                                    </div>
                                    <input name="cost" type="number" class="form-control wid" id="cost" required placeholder="800.50">
                                </div><br>
                                <label for="brand">Brand</label>
                                <input name="brand" type="text" class="form-control" id="brand" required placeholder="fassion"><br>
                                <label for="size">Size <span class="text-muted">(Optional)</span></label>
                                <input name="size" type="text" class="form-control" id="size" placeholder="Enter size">
                                <label class="text-muted">Each sizes are separated by ('space') eg: 22,24 etc..</label><br>
                                <label for="age">Age <span class="text-muted">(Optional)</span></label>
                                <input name="age" type="text" class="form-control" id="age" placeholder="Enter age">
                                <label class="text-muted">Age is separated by ('space') eg: 10-12, 14-16 etc..</label><br>
                                <label for="type">Select Type</label>
                                <select name="type" id="type" class="form-control" required>
                                    <option value="">Select Type</option>
                                    <option value="kidboy">Kid Boy</option>
                                    <option value="kidgirl">Kid Girl</option>
                                    <option value="men">Men</option>
                                    <option value="women">Women</option>
                                </select><br>
                                <label for="images">Upload a main Image</label>
                                <input name="mainimage" type="file" class="form-control-file" required id="images"><br>                                
                                <label for="searchs">Search keywords</label>
                                <textarea class="form-control" name="searches" id="title" required rows="3" placeholder="Enter Search Key"></textarea>
                                <label class="text-muted">Each keywords are separated by('space')</label><br>
                            </div>
                            <hr class="border-primary">
                            <p><a class="btn btn-primary next float-right text-uppercase mb-5 text-light">next</a></p>
                        </fieldset>

                        <fieldset id="second">
                            <hr class="border-primary">
                            <div class="card card-body p-5 border-bottom-0 border-top-0 border-primary">

                                <div class="mb-4">
                                    <input type="button" id="addnewrow" class="btn btn-success" style="width: 200px;" value="Inset row">
                                    <input type="button" id="deleterow" class="btn btn-danger" value="Delete last row" style="width: 200px;">
                                </div>

                                <table class="table table-hover">
                                    <input type="hidden" name="details" id="details">
                                    <thead>
                                        <tr class="text-center">
                                            <th scope="col">Sl.No</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Details</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table><br><hr class="mt-5 border-info" style="border: 3px solid ;">
                                <input type="hidden" name="noofcolor" value="" id="noofcolor">
                                <p class="ml-lg-5 text-danger font-weight-bold">Please Choose the Colors in proper way, and make sure the selected colors are applied for the given box.</p>
                                <h1 class="ml-lg-5" style="text-shadow: 0 0 3px #FF0000;"> Pick up Colors</h1>
                                <div id="colors" class="row d-flex justify-content-center">
                                    <div onclick="addcolor()" class="col-lg-2 col-md-3 col-sm-6 m-1 mb-5 card card-body card1 text-center align-items-center plus justify-content-center" style="height: 367px;">
                                        <i class="fas fa-plus"></i>
                                    </div>
                                </div><br>

                            </div>                            
                            <hr class="border-primary">
                            <p><a class="btn btn-primary next float-right text-uppercase text-light">next</a></p>
                            <p><a class="btn btn-primary previous float-left text-uppercase text-light">Previous</a></p>
                        </fieldset>

                        <fieldset id="third">
                            <hr class="border-primary">
                            <div class="card card-body p-5 border-bottom-0 border-top-0 border-primary">
                                <p class="h1 " style="text-shadow: 0 0 3px #FF0000, 0 0 5px #0000FF;">Upload a files as type of colors</p>
                                <div class="row resize" id="colorfile"></div>

                            </div>
                            <hr class="border-primary">
                            <p><input class="btn btn-success float-right text-uppercase text-light" type="submit" name="itemupload" value="submit"></p>
                            <p><a class="btn btn-primary previous float-left text-uppercase text-light">Previous</a></p>
                        </fieldset>
                        <input type="hidden" name="page" id="pages">
                    </form>
                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
        <script src="../javascript/js.js"></script>
        <script src="../bootstrap/js/bootstrap.bundle.js"></script>
        <script src="../bootstrap/js/bootstrap.js"></script>
        <script src="../jqueryui/jquery-ui.js"></script>
        <script src="../validate/validate.js"></script>
        
        <script>
            var i = 1;
            var mis = 0;
            var mis1 = 0;
            function addcolor()
            {
                if (mis != 0)
                {
                    mis1 = i;
                    i = mis;
                }
                var s = '';
                s = s + '<div class="col-lg-2 col-md-3 col-sm-6 m-1 mb-5 card card-body ch card1 color' + i + ' text-center align-items-center">';
                s = s + '<button type="button" class="close ml-auto justify-content-end bg-light rouded-pill" onclick="dele(\'color' + i + '\',' + i + ')"><span aria-hidden="true">&times;</span></button>';
                s = s + '<label for="color' + i + '" class="font-weight-bold bg-light p-1">Color' + i + ' </label><br>';
                s = s + '<input type="color" onchange="bg(\'color' + i + '\',this.value)" name="color' + i + '" class="form-control form-control-lg" style="width: 100px; height: 90px; padding:0px !important;" id="color' + i + '"> ';
                s = s + '<lable for="stock' + i + '" class="mt-5 bg-light p-1">Available stocks</lable><input type="number" required name="stock' + i + '" class="form-control mt-2" style="width: 100px; height: 30px;" id="stock' + i + '"> ';
                s = s + '</div>';
                
                if (mis != 0)
                {
                    $("#noofcolor").val(i);
                    i = mis1;
                    
                    mis = 0;
                } else
                {
                    $("#noofcolor").val(i);
                    i++;
                }
                $("#colors").append(s);
            }
            var img = 0;
            function dele(data, i)
            {
                mis = i;
                $('.' + data).remove();
                $('.c' + data).remove();
            }
            function bg(ele, data)
            {
                img++;
                $("." + ele).css("background-color", data);
                addfiles(ele, data);

            }
            function addfiles(element, data)
            {
                $(".c" + element).remove();
                var imgs = '';
                imgs = imgs + '<div class="col-xl-12 col-md-12 col-sm-12 mt-3 c' + element + '">';
                imgs = imgs + '     <div class="card card-body card1">';
                imgs = imgs + '         <span class="dot text-center d-flex justify-content-center align-items-center " style="background-color:' + data + ' !important;border:1px solid #b9b5b58a;"><span class="bg-light pl-1 pr-1 rounded">Images for ' + element + '</span></span>';
                var k = 1;
                var req = 1;
                for (var l = 1; l <= 10; l++)
                {
                    if (req == 1 || req == 2)
                    {
                        imgs = imgs + '          <div class="m-2">';
                        imgs = imgs + '              <input type="file" required class="form-control-file" name="' + element + l + '">';
                        imgs = imgs + '          </div>';
                        req++;
                    } else
                    {
                        imgs = imgs + '          <div class="m-2">';
                        imgs = imgs + '              <input type="file" class="form-control-file" name="' + element + l + '">';
                        imgs = imgs + '          </div>';
                        req++;
                    }
                }
                imgs = imgs + '     </div>';
                imgs = imgs + '</div>';
                $("#colorfile").append(imgs);
            }
        </script>
        <script>
            var a = 1;
            $("#addnewrow").click(function () {
                var s = '<tr id="row' + a + '"><td class="text-center">' + a + '</td><td><input type="text" name="description' + a + '" placeholder="Description" required class="form-control"></td><td><input type="text" name="details' + a + '" placeholder="Description" required class="form-control"></td></tr>';
                $("#details").val(a);
                a++;
                $("table tbody").append(s);
            });
            $("#deleterow").click(function () {
                
                if (a < 2 || a== 1)
                {
                    alert("No rows are there");
                } 
                else
                {
                    a--;
                    $("#row" + a).remove();  
                    $("#details").val(a);
                }
            });
        </script>
        <script>
            $(document).ready(function () {
                $(".first").addClass("step-active");
                $(".next").click(function () {
                    window.scrollTo(0, 0); 
                    var form = $("#myform");
                    form.validate({
                        errorElement: 'span',
                        errorClass: 'error',
                        highlight: function (element, errorClass, validClass) {
                            $(element).closest('.form-control').addClass("form-control1");
                        },
                        unhighlight: function (element, errorClass, validClass) {
                            $(element).closest('.form-control').removeClass("form-control1");
                        },
                        rules: {
                            cost: {
                                number: true
                            }
                        }
                    });
                    if (form.valid() === true) 
                    {
                        if ($('#first').is(":visible")) {
                            $(".first").removeClass("step-active step-error");
                            $(".first").addClass("step-success");
                            $(".second").addClass("step-active");
                            current_fs = $('#first');
                            next_fs = $('#second');
                        } else if ($('#second').is(":visible")) {
                            $(".second").addClass("step-success");
                            $(".second").removeClass("step-active step-error");
                            $(".third").addClass("step-active");
                            current_fs = $('#second');
                            next_fs = $('#third');
                            $("#pages").val("1");
                        }
                        next_fs.slideDown();
                        current_fs.slideUp();
                    }
                    else
                    {
                        if ($('#first').is(":visible")) {
                            $(".first").addClass("step-error");
                        } else if ($('#second').is(":visible")) {
                            $(".second").addClass("step-error");
                        }
                    }
                });
                $('.previous').click(function () {
                    window.scrollTo(0, 0); 
                    if ($('#second').is(":visible")) {
                        $(".second").removeClass('step-active step-success step-error');
                        $(".first").addClass('step-active step-success');
                        current_fs = $('#second');
                        next_fs = $('#first');
                    } else if ($('#third').is(":visible")) {
                        $(".third").removeClass('step-active step-success step-error');
                        $(".second").addClass('step-active step-success');
                        current_fs = $('#third');
                        next_fs = $('#second');
                    }
                    next_fs.slideDown();
                    current_fs.slideUp()();
                });
            });
        </script>
    </body>
</html>
