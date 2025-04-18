<%@page import="com.classes.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Welcome Page</title>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../jqueryui/jquery-ui.css">
        <link href="../animate/animate.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://fonts.googleapis.com/css2?family=Syne+Tactile&display=swap" rel="stylesheet">
        <style>
            .height
            {
                min-height: 300px !important;
                transition: 0.4s ease-out;
                position: relative;
            }
            .height:hover
            {
                box-shadow: 0 30px 20px -10px rgba(31, 31, 31, 0.5) !important;
                transition: all 0.3s ease;
                transform: translateY(-10px);
            }
            .height1
            {
                height: 100% !important;
            }
            @media screen and (min-width:1000px)
            {
                .height1{
                    height: 90vh !important;
                }
            }
        </style>
    </head>
    <body class=" user-select-none" style="background-image: url(../images/bg/7.jfif) ;background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">
        <%@include file="header.jsp" %>
        <%
            connection con = new connection();
            String size = con.getallsize();
            String type[] = size.split(" ");
        %>
        <div class="container-fluid">
            <div class="row d-flex linearg justify-content-center align-items-center height1">
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 m-2" style="cursor: pointer; min-height: 200px;">
                    <a href="adminpage?url=Users" class="text-decoration-none">
                        <div class="card text-white shadow card-body bg-primary height border border-warning">
                            <h1><i class="far fa-user"></i> All Users</h1>
                            <div class="text-center p-4">
                                <p style="font-size: 100px; font-family: 'Syne Tactile', cursive;"><%=type[2] %></p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 m-2" style="cursor: pointer; min-height: 200px;">
                    <a href="adminpage?url=PendingLists" class="text-decoration-none">
                        <div class="card text-white shadow card-body bg-success height border border-warning">
                            <h1><i class="far fa-shopping-bag"></i> Pending Orders</h1>
                            <div class="text-center p-4">
                                <p style="font-size: 100px; font-family: 'Syne Tactile', cursive;"><%=type[3] %></p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 m-2" style="cursor: pointer; min-height: 200px;">
                    <a href="adminpage?url=ItemLists" class="text-decoration-none">
                        <div class="card text-white shadow card-body bg-info height border border-warning">
                            <h1><i class="far fa-sitemap"></i> Item List</h1>
                            <div class="text-center p-4">
                                <p style="font-size: 100px; font-family: 'Syne Tactile', cursive;"><%=type[1] %></p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    <%@include file="footer.html" %>
    <script src="../javascript/js.js"></script>
    <script src="../bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../jqueryui/jquery-ui.js"></script>
    <script src="../validate/validate.js"></script>
    </body>
</html>
