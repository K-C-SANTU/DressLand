<%@page import="java.sql.ResultSet"%>
<%@page import="com.classes.connection"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.classes.allitem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Item Details</title>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <link href="../bootstrap/toast/toast.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Abel&family=Archivo+Black&family=Baloo+Tammudu+2:wght@400;500;600;700;800&family=Bebas+Neue&family=Cabin:wght@400;500;600;700&family=Cardo:wght@400;700&family=Chakra+Petch:wght@300;400;500;600;700&family=Cinzel:wght@400;500;600;700;800;900&family=Cuprum:wght@400;500;600;700&family=El+Messiri:wght@400;500;600;700&family=Fira+Sans:wght@100;200;300;400;500;600;700;800;900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Mina:wght@400;700&family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Nunito:wght@200;300;400;600;700;800;900&family=Oxygen:wght@300;400;700&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&family=Trispace:wght@100;200;300;400;500;600;700;800&family=Vidaloka&family=Volkhov:wght@400;700&display=swap" rel="stylesheet">
        <link href="../bootstrap/css/font.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background-image: url(../images/bg/7.jfif) ;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
            .pointer
            {
                cursor: pointer;
                display: none;
            }
            .form-control:focus
            {
                box-shadow: 0 0 10px 0.1rem rgba(0, 123, 255, 0.55) !important;
            }
            .height
            {
                min-height: 50vh !important;
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </head>
    <body class=" user-select-none">
        <%@include file="header.jsp" %>
        <div class="container-fluid">
            <div class="row justify-content-end">
                <a class="no-text-decoration text-light" href="adminpage?url=unavailableitems"><button class="btn btn-danger m-2">Unavailable Items</button></a>
            </div>
            <div class="row mt-2 mb-2">
                <%
                    connection con = new connection();
                    ResultSet rs = con.getitemdetails("in");
                    while(rs.next())
                    {
                    %>
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 mt-4 animate__animated" id="cardid<%=rs.getString("id") %>">
                            <div class="card card-body height"  style="min-height: 500px !important;">
                                <div class="row">
                                    <div class="col-xl-5 col-lg-12 col-md-12 col-sm-12 text-center  pointer<%=rs.getString("id") %>">
                                        <img src="../<%=rs.getString("images") %>" alt="" class="img-fluid" style="height: 300px !important;">
                                        <p class="mt-3 h4"><span class="pointer font2" onclick="moreinfo('<%=rs.getString("id") %>')">More Edit</span></p>
                                    </div>
                                    <div class="col-xl-7 col-lg-12 col-md-12 col-lg-12 pointer<%=rs.getString("id") %>">
                                        <p id="title<%=rs.getString("id") %>" class="h3 fonttitle font-weight-600"><strong>TITLE :</strong> 
                                            <span class="updatemsg<%=rs.getString("id") %>1"><%=rs.getString("title") %></span> 
                                            <span class="ml-2 pointer" onclick="changes('1','<%=rs.getString("id")%>','')"><i class="far fa-pencil-alt"></i></span>
                                        </p>
                                        <p id="cost<%=rs.getString("id") %>" class="h4 fontprice font-weight-400"><strong>PRICE :</strong> <span>&#x20b9</span><span class="updatemsg<%=rs.getString("id") %>2"><%=rs.getString("cost") %></span><span class="ml-2 pointer" onclick="changes('2','<%=rs.getString("id")%>','')"><i class="far fa-pencil-alt"></i></span></p>
                                        <p id="brand<%=rs.getString("id") %>" class="h4 fontbrand"><strong>BRAND :</strong> <span class="updatemsg<%=rs.getString("id") %>3"><%=rs.getString("brand") %></span><span class="ml-2 pointer" onclick="changes('3','<%=rs.getString("id")%>','')"><i class="far fa-pencil-alt"></i></span></p>
                                        <p id="size<%=rs.getString("id") %>" class="h4 fontsize font-weight-400"><strong>SIZE :</strong> <span class="updatemsg<%=rs.getString("id") %>4"><%=rs.getString("size") %></span><span class="ml-2 pointer" onclick="changes('4','<%=rs.getString("id")%>','')"><i class="far fa-pencil-alt"></i></span></p>
                                        <p id="type<%=rs.getString("id") %>" class="h4 fontitemtype"><strong>TYPE :</strong> <span class="updatemsg<%=rs.getString("id") %>5"><%=rs.getString("type") %></span><span class="ml-2 pointer" onclick="changes('5','<%=rs.getString("id")%>','')"><i class="far fa-pencil-alt"></i></span></p>
                                        <p id="searchkeyword<%=rs.getString("id") %>" class="h4 font8"><strong>Search keywords :</strong> <span class="updatemsg<%=rs.getString("id") %>6"><%=rs.getString("searches") %></span><span class="ml-2 pointer" onclick="changes('6','<%=rs.getString("id")%>','')"><i class="far fa-pencil-alt"></i></span></p>
                                        <p id="available<%=rs.getString("id") %>" class="h4 font1"><strong>Available :</strong> <span class="updatemsg<%=rs.getString("id") %>7">Yes</span><span class="ml-2 pointer" onclick="changes('7','<%=rs.getString("id")%>')"><i class="far fa-pencil-alt"></i></span></p>
                                        <button class="float-right btn btn-info mt-2" onclick="edit('<%=rs.getString("id") %>')">Edit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                    }
                %>
            </div>
        </div>
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog model-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-success" style="display: none;" id="successalert">
                            <i class="fal fa-check-circle"></i><span id="successmsg"></span>
                        </div>
                        <div class="alert alert-warning" style="display: none;" id="erroralert">
                            <i class="fal fa-exclamation-triangle"></i><span id="errormsg"></span>
                        </div>
                        <input type="hidden" name="hitemid" id="hitemid">
                        <input type="hidden" name="hcolumnid" id="hcolumnid">
                        <div id="inputtype">
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="update()">Update</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" style="background-image: url(../images/bg.jpg) ; background-repeat: no-repeat;background-attachment: fixed;background-size: cover;" id="subimage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Different Colors</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row d-flex justify-content-center align-items-center">
                            <div class="col-xl-12 col-lg-10 col-md-8 col-sm-12">
                                <p class="text-muted">Please Click on the bottom color on the to Toggle btw the show or hide the items for the customers</p>
                                <div class="row d-flex justify-content-around" id="subimg">
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.html" %>
        <script src="../javascript/js.js"></script>
        <script src="../bootstrap/js/bootstrap.bundle.js"></script>
        <script src="../bootstrap/js/bootstrap.js"></script>
        <script src="../bootstrap/toast/toast.min.js" type="text/javascript"></script>
        <script>
            function updateimg()
            {
                $("#colorcodes").toggleClass("bg-success bg-warning");
            }
            var idd='';
            function edit(id)
            {
                if(idd===id || idd =='')
                {
                    if(idd=='')
                    {
                        $(".pointer").fadeOut();
                    }
                    $(".pointer"+id+" p .pointer").fadeToggle();
                    idd=id;
                }
                else
                {
                    idd='';
                    if(idd!=id)
                    {
                        $(".pointer").fadeOut();
                    }
                    $(".pointer"+id+" p .pointer").fadeToggle();
                }
            }
            function changes(itemtype,id)
            {
                if(itemtype=="1")
                {
                    textbox(itemtype,id,"Change Title");
                    $("#hitemid").val(id);
                    $("#hcolumnid").val(itemtype);
                }
                if(itemtype=="2")
                {
                    textbox(itemtype,id,"Change Price");
                    $("#hitemid").val(id);
                    $("#hcolumnid").val(itemtype);
                }
                if(itemtype=="3")
                {
                    textbox(itemtype,id,"Change Brand Name");
                    $("#hitemid").val(id);
                    $("#hcolumnid").val(itemtype);
                }
                if(itemtype=="4")
                {
                    textbox(itemtype,id,"Change Size");
                    $("#hitemid").val(id);
                    $("#hcolumnid").val(itemtype);
                }
                if(itemtype=="5")
                {
                    selectmenu(itemtype,id,"Choose Type");
                    $("#hitemid").val(id);
                    $("#hcolumnid").val(itemtype);
                }
                if(itemtype=="6")
                {
                    textareabox(itemtype,id,"Search Keywords");
                    $("#hitemid").val(id);
                    $("#hcolumnid").val(itemtype);
                }
                if(itemtype=="7")
                {
                    selectavailabel(itemtype,id,"Item Status");
                    $("#hitemid").val(id);
                    $("#hcolumnid").val(itemtype);
                }
            }
            function textbox(itemtype,id,title)
            {
                $("#inputtype").html('<input name="update" class="form-control" id="updatemsg" value="'+$(".updatemsg"+id+""+itemtype).html()+'">');
                $("#staticBackdropLabel").html(title);
                $('#staticBackdrop').modal('show');
            }
            function textareabox(itemtype,id,title)
            {
                $("#inputtype").html('<textarea name="update" class="form-control" id="updatemsg" rows="5"> '+$(".updatemsg"+id+""+itemtype).html()+'</textarea>');
                $("#staticBackdropLabel").html(title);
                $('#staticBackdrop').modal('show');
            }
            function selectmenu(itemtype,id,title)
            {
                $("#inputtype").html('<select name="update" id="updatemsg" class="form-control"><option value="" disabled selected>'+$(".updatemsg"+id+""+itemtype).html()+'</option><option value="men">Men</option><option value="women">Women</option><option value="kidgirl">Kid Girl</option><option value="kidboy">Kid Boy</option></select>');
                $("#staticBackdropLabel").html(title);
                $('#staticBackdrop').modal('show');
            }
            function selectavailabel(itemtype,id,title)
            {
                $("#inputtype").html('<select name="update" id="updatemsg" class="form-control"><option value="in" disabled selected>Available</option><option value="out">Not available</option></select>');
                $("#staticBackdropLabel").html(title);
                $('#staticBackdrop').modal('show');
            }
            function update()
            {
                $("#erroralert").fadeOut();
                $("#successalert").fadeOut();
                var column = $("#hcolumnid").val();
                var itemid = $("#hitemid").val();
                var msg = $("#updatemsg").val();
                $.ajax({
                    url: "../updateitem",
                    type: 'POST',
                    data: "itemupdate=true&column="+column+"&itemid="+itemid+"&msg="+msg,
                    success: function (data) 
                    {
                        if(data!="success")
                        {
                            $("#erroralert").fadeIn();
                            $("#errormsg").html("Something is Wrong");
                            var times =  setTimeout(hidealert,3000);
                            function hidealert()
                            {
                                $("#erroralert").fadeOut();
                                clearTimeout(times);
                            }
                        }
                        else
                        {
                            if(column==7)
                            {
                                $(".updatemsg"+itemid+""+column).html(msg);
                                $("#successalert").fadeIn();
                                $("#cardid"+itemid).addClass("animate__backOutRight animate__delay-2s animate__slow");
                                $("#successmsg").html("Updated Successfully.");
                                var delay = setTimeout(kc , 4000);
                                function kc()
                                {
                                    $("#cardid"+itemid).remove();
                                    clearTimeout(delay);
                                }
                                var times =  setTimeout(hidealert,2000);
                                function hidealert()
                                {
                                    $("#staticBackdrop").modal("hide");
                                    $("#successalert").fadeOut();
                                    clearTimeout(times);
                                }
                            }
                            else
                            {
                                $(".updatemsg"+itemid+""+column).html(msg);
                                $("#successalert").fadeIn();
                                $("#successmsg").html("Updated Successfully.");
                                var times =  setTimeout(hidealert,3000);
                                function hidealert()
                                {
                                    $("#staticBackdrop").modal("hide");
                                    $("#successalert").fadeOut();
                                    clearTimeout(times);
                                }
                            }
                        }
                    }
                });
            }
            function moreinfo(itemid)
            {
                $("#subimg").html("");
                $.ajax({
                   url: "../updateitem",
                   type: 'POST',
                   data: "getsubimages=yes&itemid="+itemid,
                   dataType: 'json',
                   success: function (data) 
                   {
                       if(data.list)
                       {
                           var s = '';
                           $.each(data.list,function (key,value){
                                s = s + '<div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 mt-4">\n\
                                            <div class="card p-3">\n\
                                                <div class="m-auto" style="width: 160px !important;">\n\
                                                <input type="hidden" name="itemstatus'+itemid+''+value.id+'" id="itemstatus'+itemid+''+value.id+'" value="'+value.status+'">';
        
                                    if(value.status=="in")
                                    {
                                        s = s + '<img src="../'+value.img+'"  class="img-fluid" id="img'+itemid+''+value.id+'">\n\
                                                <div style="height: 70px; cursor: pointer;" onclick="updateimg('+itemid+','+value.id+')" id="colorcodes'+itemid+value.id+'" class="bg-primary  mt-3 text-white d-flex justify-content-center h5 align-items-center">Available</div>';
                                    }
                                    else
                                    {
                                        s = s + '<img src="../'+value.img+'"  class="img-fluid" id="img'+itemid+''+value.id+'" style="opacity: 0.5;">\n\
                                                <div style="height: 70px; cursor: pointer;" onclick="updateimg('+itemid+','+value.id+')" id="colorcodes'+itemid+value.id+'" class="bg-warning mt-3 d-flex justify-content-center h5 align-items-center">Not Available</div>';
                                    }
                                s = s + '</div>\n\
                                    </div>\n\
                                </div>';
                           });
                           $("#subimg").append(s);
                           $("#subimage").modal("show");
                       }
                   }
                });
            }
            function updateimg(itemid,id)
            {
                var changestatus='';
                var status = $("#itemstatus"+itemid+id).val();
                if(status==="in")
                {
                    changestatus = 'out';
                }
                else
                {
                    changestatus = 'in';
                }
                var ids = $("#itemid"+itemid+id).val();
                $.ajax({
                   url: "../updateitem",
                   data: "subimgstatus=true&status="+changestatus+"&itemid="+itemid+"&colorid="+id,
                   type: 'POST',
                   success: function (data) 
                   {
                        if(data=="fail")
                        {
                            alert("Something went's Wrong");
                        }
                        else
                        {
                            $("#itemstatus"+itemid+id).val(changestatus);
                            if(status==='in')
                            {
                                $("#img"+itemid+id).css("opacity","0.5");
                                $("#colorcodes"+itemid+id).removeClass("bg-primary text-white");
                                $("#colorcodes"+itemid+id).addClass("bg-warning");
                                $("#colorcodes"+itemid+id).html("Not Available");
                                toslaalert("top-right","info",'<i class="far fa-check-circle"></i> Updated','Item Not Available!!','2000');
                            }
                            else
                            {
                                $("#img"+itemid+id).css("opacity","1");
                                $("#colorcodes"+itemid+id).addClass("bg-primary text-white");
                                $("#colorcodes"+itemid+id).removeClass("bg-warning");
                                $("#colorcodes"+itemid+id).html("Available");
                                toslaalert("top-right","success",'<i class="far fa-check-circle"></i> Updated','Item Available !!','2000');
                            }
                        }
                   }
                });
            }
        </script>
    </body>
</html>