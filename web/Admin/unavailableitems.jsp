<%@page import="java.sql.ResultSet"%>
<%@page import="com.classes.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Unavailable items</title>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../jqueryui/jquery-ui.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://fonts.googleapis.com/css2?family=Syne+Tactile&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <link href="../datatable/css.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Abel&family=Archivo+Black&family=Baloo+Tammudu+2:wght@400;500;600;700;800&family=Bebas+Neue&family=Cabin:wght@400;500;600;700&family=Cardo:wght@400;700&family=Chakra+Petch:wght@300;400;500;600;700&family=Cinzel:wght@400;500;600;700;800;900&family=Cuprum:wght@400;500;600;700&family=El+Messiri:wght@400;500;600;700&family=Fira+Sans:wght@100;200;300;400;500;600;700;800;900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Mina:wght@400;700&family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Nunito:wght@200;300;400;600;700;800;900&family=Oxygen:wght@300;400;700&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&family=Trispace:wght@100;200;300;400;500;600;700;800&family=Vidaloka&family=Volkhov:wght@400;700&display=swap" rel="stylesheet">
        <link href="../bootstrap/css/font.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background-image: url(../images/bg/8.png) ;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
            .pointer
            {
                cursor: pointer;
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
                <a class="no-text-decoration text-light" href="adminpage?url=ItemLists"><button class="btn btn-primary m-2">Available Items</button></a>
            </div>
            <div class="row mt-2 mb-2">
                <%
                    connection con = new connection();
                    ResultSet rs = con.getitemdetails("out");
                    int i = 0;
                    while(rs.next())
                    {
                        i++;
                    %>
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 mt-4 animate__animated" id="cardid<%=rs.getString("id") %>">
                            <div class="card card-body height"  style="min-height: 500px !important;">
                                <div class="row">
                                    <div class="col-xl-5 col-lg-12 col-md-12 col-sm-12 text-center">
                                        <img src="../<%=rs.getString("images") %>" alt="" class="img-fluid" style="height: 300px !important;">
                                    </div>
                                    <div class="col-xl-7 col-lg-12 col-md-12 col-lg-12 pointer<%=rs.getString("id") %>">
                                        <p class="h3 fonttitle font-weight-600"><strong>TITLE :</strong> <%=rs.getString("title") %></p>
                                        <p class="h4 fontprice font-weight-400"><strong>PRICE :</strong>  <span>&#x20b9</span><%=rs.getString("cost") %></p>
                                        <p class="h4 fontbrand"><strong>BRAND :</strong>  <%=rs.getString("brand") %></p>
                                        <p class="h4 fontsize font-weight-400"><strong>SIZE :</strong> <%=rs.getString("size") %></p>
                                        <p class="h4 fontitemtype"><strong>TYPE :</strong> <%=rs.getString("type") %></p>
                                        <p class="h4 font8"><strong>Search keywords :</strong> <%=rs.getString("searches") %></p>
                                        <p class="h4 font1"><strong>Available :</strong> Not Available<span class="ml-2 pointer" onclick="changes('<%=rs.getString("id")%>')"><i class="far fa-pencil-alt"></i></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                    }
                %>
            </div>
            <%
                if(i==0)
                {
                    %>

                    <div class="row d-flex justify-content-center align-items-center" style="height: 78vh !important;">
                        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12">
                            <p class="text-center h1 text-info">Not Found..</p>
                        </div>
                    </div>

                    <%
                }
                else
                {   
            %>
                    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog model-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Choose Option</h5>
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
                                    <input type="hidden" name="hcolumnid" id="hcolumnid" value="7">
                                    <select name="update" id="updatemsg" class="form-control">
                                        <option value="out" selected disabled>Item UnAvailable</option>
                                        <option value="in">Item Available</option>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="update()">Update</button>
                                </div>
                            </div>
                        </div>
                    </div>
            <%
                }
            %>
        </div>
    <%@include file="footer.html" %>
    <script src="../javascript/js.js"></script>
    <script src="../bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../jqueryui/jquery-ui.js"></script>
    <script src="../datatable/js.js" type="text/javascript"></script>
    <script>
        function changes(id)
        {
            $("#staticBackdrop").modal('show');
            $("#hitemid").val(id);
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
                            $("#cardid"+itemid).addClass("animate__backOutLeft animate__delay-2s animate__slow");
                            $("#successmsg").html("Updated Successfully.");
                            var delay = setTimeout(kc , 4000);
                            function kc()
                            {
                                $("#cardid"+itemid).remove();
                                clearTimeout(delay);
                            }
                            var times =  setTimeout(hidealert,3000);
                            function hidealert()
                            {
                                $("#successalert").fadeOut();
                                clearTimeout(times);
                                $("#staticBackdrop").modal("hide");
                            }
                        }
                    }
                }
            });
        }
    </script>
    </body>
</html>
