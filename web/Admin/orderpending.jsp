<%@page import="java.util.Iterator"%>
<%@page import="com.classes.orderlist"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.classes.connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Order list</title>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <link href="../bootstrap/toast/toast.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Abel&family=Archivo+Black&family=Baloo+Tammudu+2:wght@400;500;600;700;800&family=Bebas+Neue&family=Cabin:wght@400;500;600;700&family=Cardo:wght@400;700&family=Chakra+Petch:wght@300;400;500;600;700&family=Cinzel:wght@400;500;600;700;800;900&family=Cuprum:wght@400;500;600;700&family=El+Messiri:wght@400;500;600;700&family=Fira+Sans:wght@100;200;300;400;500;600;700;800;900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Mina:wght@400;700&family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Nunito:wght@200;300;400;600;700;800;900&family=Oxygen:wght@300;400;700&family=Roboto+Slab:wght@100;200;300;400;500;600;700;800;900&family=Trispace:wght@100;200;300;400;500;600;700;800&family=Vidaloka&family=Volkhov:wght@400;700&display=swap" rel="stylesheet">
        <link href="../bootstrap/css/font.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background-image: url(../images/bg/8.png) ;
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
        </style>
        <style>
            .ss
            {
                transition: all 1s linear;
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
        <div class="d-flex mt-5 mb-5 justify-content-end mr-4">
            <a class="text-decoration-none text-light" href="adminpage?url=OrderedLists">
                <button class="btn btn-info">SHIPPED LIST</button>
            </a>
        </div>
        <div class="container-fluid">
            <div class="row d-flex justify-content-center align-items-center">
                <%
                connection con = new connection();
                ArrayList<orderlist> list = con.getorderlist(-1);
                if(list.size()>0)
                {
                    Iterator<orderlist> itr = list.iterator();
                    while(itr.hasNext())
                    {    
                        orderlist ord = itr.next();
                %>
                <div class="col-xl-6 col-lg-6 ss col-md-12-col-sm-12 shadow animate__animated height" id="remove<%=ord.getId() %>" >
                    <div class="card card-body m-2 border border-primary" style="min-height: 600px !important;">
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 d-flex  justify-content-around flex-column align-items-center">
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 ">
                                        <img src="../<%=ord.getLocation()%>" alt="" class="img-fluid" style="height:250px;width: auto;">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                        <button class="fontbuynow btn animate__animated btn-primary" style="font-size: 20px;" id="parcelsend<%=ord.getId()%>" onclick="sendparcel('<%=ord.getId()%>')">ORDER SHIP</button>  
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
                                <h4 class="h3 fonttitle font-weight-700"><%=ord.getTitle()%></h4>
                                <div class="card mb-1 p-2">
                                    <h5 class="fontbrand">Brand :<%=ord.getBrand()%>,</h5>
                                    <h5 class="fontsize">Size : <%=ord.getSize()%>, </h5>
                                    <h5 class="fontquantity">Quantity : <%=ord.getQuantity()%>,</h5>
                                    <h5 class="fontprice font-weight-700">Price : <span>&#x20b9</span><%=ord.getPrice()%></h5>                                   
                                </div>
                                <div class="card">
                                    <div class="card-header font6">
                                        <h4>Address</h4>
                                    </div>
                                    <div class="card-body font5 font-weight-700">
                                        <h5><%=ord.getAddress() %>,</h5>
                                        <h5>zip-code:<%=ord.getZip()%>,</h5>
                                        <h5>Phone:<%=ord.getPhone()%>,</h5>
                                        <h5>State:<%=ord.getState()%>,</h5>
                                        <h5>city:<%=ord.getCity()%></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                }
                %>
            </div>
        </div>
    <%@include file="footer.html" %>
    <script src="../javascript/js.js"></script>
    <script src="../bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../bootstrap/toast/toast.min.js" type="text/javascript"></script>
    <script>
        function sendparcel(data)
        {
            $.ajax({
                url: "../loadajax",
                data: "type=updatestatus&id="+data,
                type: 'POST',
                success: function (data1) 
                {
                    if(data1!="fail")
                    {
                        $("#remove"+data).addClass("animate__backOutRight");
                        var s = setTimeout(removeid,700);
                        function removeid()
                        {
                            $("#remove"+data).slideUp();
                            toslaalert("top-right","success",'<i class="far fa-check-circle"></i> Success','Item Shipped Successfully');
                        }
                    }
                }
            });
        }
    </script>
    </body>
</html>
