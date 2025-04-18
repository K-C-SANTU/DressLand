<%@page import="com.classes.connection"%>
<%@page contentType="text/html" session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Users Account</title>
        <link href="../bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="../jqueryui/jquery-ui.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="../datatable/css.css" rel="stylesheet" type="text/css"/>
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
            .page-link:focus
            {
                box-shadow: none;
            }
            .form-control-sm
            {
                width: 300px !important;
                height: 50px;
                font-size: 20px;
            }
            .form-control
            {
                padding: 7px 11px 8px 11px !important;
            }
            .form-control-sm:focus
            {
                box-shadow: 0 0 10px 0.1rem rgba(0, 123, 255, 0.25) !important;
            }
            div.table-responsive>div.dataTables_wrapper>div.row{
                margin: 10px 10px 0px 10px;
            }
            div.dataTables_wrapper div.dataTables_length select
            {
                width: 70px;
                display: inline-block;
                height: 40px
            }
        </style>
    </head>
    <body class="user-select-auto">
    <%@include file="header.jsp" %>
    <div class="container-fluid">
        <div class="row d-flex justify-content-center align-items-center align-self-center">
            <div class="col-xl-11 col-lg-11 col-md-11 col-sm-12">
                <div class="card p-2 mt-5 mb-5 rounded">
                    <div class="table-responsive">
                        <table id="example" class="table table-hover">
                            <thead class="table-info h6 text-center text-uppercase font1">
                                <tr><th>User ID</th><th>FNAME</th><th>LNAME</th><th>E-MAIL</th><th>PHONE</th><th>GENDER</th><th>PASSWORD</th><th>DATE</th><th>Action</th></tr>
                            </thead>
                            <tbody class="text-center font2">
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.html" %>
    <script src="../javascript/js.js"></script>
    <script src="../bootstrap/js/bootstrap.bundle.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../jqueryui/jquery-ui.js"></script>
    <script src="../datatable/js.js" type="text/javascript"></script>
    <script src="../bootstrap/toast/toast.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function(){
            var table = $('#example'); 
            table.DataTable({
                "processing": true,
                "serverSide": true,
                "order": [[ 0, "desc" ]],
                language: {
                        "lengthMenu": "<span class='invisible' style='display:none;'>_MENU_</span>",
                        "sSearch": "",
                        "sSearchPlaceholder": "Search All"	
                    },
                "columnDefs":[
                    {
                        "targets": [8],
                        "sortable":false
                    }
                ],
                "ajax": "../loadtabledata?type=loadallusers"
            });
        });
    </script>
    <script>
        function deleteuser(data)
        {
            var s = confirm("Do you want to remove this account permanantly");
            if(s)
            {
                var parantdiv = $(".datas"+data).parent().parent();
                $.ajax({
                    url: "../loadajax",
                    data: "type=deleteuser&id="+data,
                    type: 'POST',
                    success: function (data1) 
                    {
                        if(data1!="fail")
                        {
                            parantdiv.slideUp();
                            toslaalert("top-right","success",'<i class="far fa-check-circle"></i> Success','User Account has been Deleted Successfully');
                        }
                        else
                        {
                            toslaalert("top-right","errpr",'<i class="far fa-exclamation-triangle"></i> Warning','Something went\'s Wrong');
                        }
                    }
                });
            }
        }
    </script>
    
    </body>
</html>
