<%@page import="java.sql.ResultSet"%>
<%@page import="com.classes.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale==1.0">
        <title>Edit Corosel images</title>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="../bootstrap/css/bootstrap-reboot.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="../bootstrap/toast/toast.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .upload
            {
                display:none
            }
            .btn:focus
            {
                box-shadow: none;
            }
            body{
                background-image: url(../images/bg/8.png) ;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
              .loader {
                height: 20px;
                width: 250px;
                opacity: 1;
                position: absolute;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                margin: auto;
                z-index: 1111;
              }
              .loader--dot {
                animation-name: loader;
                animation-timing-function: ease-in-out;
                animation-duration: 3s;
                animation-iteration-count: infinite;
                height: 20px;
                width: 20px;
                border-radius: 100%;
                background-color: black;
                position: absolute;
                border: 2px solid white;
              }
              .loader--dot:first-child {
                background-color: #8cc759;
                animation-delay: 0.5s;
              }
              .loader--dot:nth-child(2) {
                background-color: #8c6daf;
                animation-delay: 0.4s;
              }
              .loader--dot:nth-child(3) {
                background-color: #ef5d74;
                animation-delay: 0.3s;
              }
              .loader--dot:nth-child(4) {
                background-color: #f9a74b;
                animation-delay: 0.2s;
              }
              .loader--dot:nth-child(5) {
                background-color: #60beeb;
                animation-delay: 0.1s;
              }
              .loader--dot:nth-child(6) {
                background-color: #fbef5a;
                animation-delay: 0s;
              }
              .loader--text {
                position: absolute;
                top: 200%;
                left: 0;
                right: 0;
                width: 4rem;
                margin: auto;
              }
              .loader--text:after {
                content: "Loading";
                font-weight: bold;
                animation-name: loading-text;
                animation-duration: 3s;
                animation-iteration-count: infinite;
              }

              @keyframes loader {
                15% {
                  transform: translateX(0);
                }
                45% {
                  transform: translateX(230px);
                }
                65% {
                  transform: translateX(230px);
                }
                95% {
                  transform: translateX(0);
                }
              }
              @keyframes loading-text {
                0% {
                  content: "Loading";
                }
                25% {
                  content: "Loading.";
                }
                50% {
                  content: "Loading..";
                }
                75% {
                  content: "Loading...";
                }
              }
        </style>
    </head>
    <body class=" user-select-none">
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <div class="row m-lg-5">
                <%!int i = 0; %>
                <%
                    connection con = new connection();
                    ResultSet rs = con.getcoroseldetails("main");
                    int count=0;
                    while(rs.next())
                    {
                %>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 mt-5" id="rowid<%=rs.getString("id")%>" style="min-height: 500px; max-height: 600px;">
                            <div class="card shadow">
                                <div class="card-body p-0 d-flex justify-content-center align-items-center" style="height: 350px !important;">
                                    <div class="bg-light"  id="loader<%=rs.getString("id") %>" style="margin-top: 150px; display: none;">
                                        <div class='loader'>
                                            <div class='loader--dot'></div>
                                            <div class='loader--dot'></div>
                                            <div class='loader--dot'></div>
                                            <div class='loader--dot'></div>
                                            <div class='loader--dot'></div>
                                            <div class='loader--dot'></div>
                                            <div class='loader--text'></div>
                                        </div>
                                    </div>
                                    <div id="imgajaxload<%=rs.getString("id")%>">
                                        <img src="../<%=rs.getString("location")%>" id="imgsrc<%=rs.getString("id")%>" class="img-fluid"
                                        <% 
                                            if(rs.getString("visible").equals("no")) 
                                            { 
                                                out.print(" style='opacity:0.5;'"); 
                                            }
                                        %>
                                        >
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-between">
                                    <input  class="upload" id="upload<%=rs.getString("id")%>" name="filename<%=rs.getString("id")%>" onchange="fileupload('<%=rs.getString("id")%>')" type="file"/>
                                    <button class="btn btn-info" onclick="triggerinput('<%=rs.getString("id") %>')"  data-toggle="tooltip" data-placement="top" title="Upload A new Image fot the place <%=++count%>"><i class="fal fa-upload"></i></button>
                                    <input type="hidden" id="order<%=rs.getString("id")%>" name="order<%=rs.getString("id")%>" value="<%=rs.getString("orderlist")%>">
                                    <button  data-toggle="tooltip" data-placement="top" title="Hide or Show this image" class="btn btn-primary" onclick="hidecorosel('<%=rs.getString("id")%>')"><i class="togglecls<%=rs.getString("id") %> fal 
                                        <% 
                                            if(!rs.getString("visible").equals("no"))
                                                out.print(" fa-eye ");
                                            else
                                                out.print(" fa-eye-slash");
                                        %>" 
                                        id="eyebtn<%=rs.getString("id")%>"></i></button>
                                        <input type="hidden" name="visiblestatus<%=rs.getString("id") %>" id="visiblestatus<%=rs.getString("id") %>" value="<%=rs.getString("visible") %>">
                                    <button class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Delete this image " onclick="deletecorosel('<%=rs.getString("id")%>')"><i class="fal fa-trash-alt"></i></button>
                                </div>
                            </div>
                        </div>
                <%
                        i = rs.getInt("orderlist");
                    }
                %>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12" style="min-height: 400px;">
                    <div class="card card-body d-flex justify-content-center align-items-center shadow h-100" data-toggle="modal" data-target="#exampleModal" style="cursor: pointer;">
                        <i class="fal fa-plus fa-10x" id="eyebtn"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" style="background-image: url(../images/bg.jpg) ; background-repeat: no-repeat;background-attachment: fixed;background-size: cover;" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Upload a new image</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="../curosel" method="post" enctype="multipart/form-data">
                            <div class="row d-flex justify-content-center align-items-center">
                                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-10">
                                    <img id="blah" src="" alt="your image" class="img-fluid" style="display: none;"/>
                                </div>
                                <input type="hidden" name="orderno" value="<%=++i %>">
                                <input type='file' name="file" id="imgInp" required class="form-control-file m-5"/>
                                <input type="submit" name="newfile" value="Upload new Photo" class="btn btn-primary"> 
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
        <script src="../bootstrap/toast/toast.min.js" type="text/javascript"></script>
        <script>
            function readURL(input) 
            {
                if (input.files && input.files[0]) 
                {
                    var reader = new FileReader();
                    reader.onload = function (e) 
                    {
                        $('#blah').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                    $("#blah").fadeIn();
                }
            }
            $("#imgInp").change(function () 
            {
                readURL(this);
            });
        </script>
        <script>
            function triggerinput(id) 
            {
                $("#upload"+id).trigger('click');
            }
            function fileupload(id)
            {
                var fd = new FormData();
                var files = $('#upload'+id)[0].files;
                if(files.length > 0 )
                {
                   $("#imgsrc"+id).hide();
                   $("#loader"+id).fadeIn();
                   fd.append('admincorosel',"yes");
                   fd.append('type',"fileupload");
                   fd.append('id',id);
                   fd.append('file',files[0]);
                   $.ajax(
                    {
                        url: '../curosel',
                        type: 'post',
                        data: fd,
                        contentType: false,
                        processData: false,
                        success: function(response)
                        {
                            if(response!="fail")
                            {
                                $('#imgsrc'+id).attr('src', "../"+response);
                                var times = setTimeout(showimg,8000);
                                function showimg()
                                {
                                    $("#loader"+id).fadeOut();
                                    $("#imgajaxload"+id).html('<img src="../'+response+'" id="imgsrc'+id+'" class="img-fluid">');
                                    clearTimeout(times);
                                }
                            }
                        }
                    });
                }
                else
                {
                   alert("Please select a file.");
                }
            }
            function imageExists(image_url)
            {
                try
                {
                    var http = new XMLHttpRequest();
                    http.open('HEAD', image_url, false);
                    http.send();
                    return  http.status != 404;
                }
                catch(err)
                {
                    return false;
                }
            }
        </script>
        <script>
            function deletecorosel(id)
            {
                var s = confirm("Are you Sure!!!");
                if(s)
                {
                    $.ajax({
                        url: "../curosel",
                        type: 'POST',
                        data: "admincorosel=yes&type=delete&id="+id,
                        success: function (data) 
                        {
                            if(data!="fail")
                            {
                                $("#rowid"+id).slideUp();
                                toslaalert("top-right","success",'<i class="far fa-check-circle"></i> Done !!','Deleted Successfully !!','2000');
                            }
                        }
                    });
                }
            }
            function hidecorosel(id)
            {
                var changestatus = "yes";
                var status = $("#visiblestatus"+id).val();
                if(status=="yes")
                {
                    changestatus="no";
                }
                else
                {
                    changestatus="yes";
                }
                $.ajax({
                   url: "../curosel",
                   type: 'POST',
                   async: false,
                   data: "admincorosel=yes&type=hideshow&id="+id+"&status="+changestatus,
                   success: function (data) 
                   {
                        if(data!="fail")
                        {                            
                            if(changestatus=="yes")
                            {
                                $("#visiblestatus"+id).val(changestatus);
                                $(".togglecls"+id).toggleClass("fa-eye fa-eye-slash");
                                $("#imgsrc"+id).css("opacity","1");
                                toslaalert("top-right","info",'<i class="far fa-check-circle"></i> Updated','Visible!!','2000');
                            }
                            else
                            {
                                $("#visiblestatus"+id).val(changestatus);
                                $(".togglecls"+id).toggleClass("fa-eye fa-eye-slash");
                                $("#imgsrc"+id).css("opacity","0.5");
                                toslaalert("top-right","success",'<i class="far fa-check-circle"></i> Updated','Not Visible !!','2000');
                            }
                        }
                   }
                });
            }
        </script>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
             });
        </script>
    </body>
</html>
