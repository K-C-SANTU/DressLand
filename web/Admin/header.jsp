<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% 
    if(session.getAttribute("adminid")==null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<style>
    @media screen and (min-width: 992px) 
    {
        .navbar .dropdown:hover .dropdown-menu, .navbar .dropdown .dropdown-menu:hover 
        {
            display:block;
            visibility: visible;
            opacity: 1;
            transition: visibility 0s, opacity 0.3s linear;
        }
        .dropdown-menu::after
        {
            left: -20px;
        }
        .dropdown-menu
        {
            left: -20%;
        }
        .navbar .dropdown-menu 
        {
            margin-right:10px;
            border: 1px solid rgba(0,0,0,.15);
            box-shadow: 0 0 20px black;
            background-color: #fff;
        }
        .text-decoration-none
        {
            text-decoration: none;
        }
        .vh-50{
            height: 50vh !important;
        }
    }
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="Home"><img src="../images/3.png"  style="height: 70px !important; margin-left: 20px;"  class="img-fluid"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="adminpage?url=AddItem">Add Items <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    More
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="adminpage?url=carousel"> Carousel</a>
                    <a class="dropdown-item" href="adminpage?url=ComplaintBox"> Contact us</a>
                </div>
            </li>
<!--            <li class="nav-item">
                <a class="nav-link" href="adminpage?url=register">Service man</a>
            </li>-->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Welcome <%=session.getAttribute("name")%>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="adminpage?url=changepassword"><i class="fal fa-lock"></i> Change Password</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="adminpage?url=logout"><i class="fal fa-sign-out-alt"></i> Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>