<%-- 
    Document   : header
    Created on : Apr 22, 2015, 6:31:08 PM
    Author     : Abu Sufian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="#">

        <title>Online Ticket Booking System </title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/justified-nav.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <div class="container">

            <div class="masthead">
                <div>

                    <h3 class="text-muted"style="color: red">Online Bus Reservation System</h3>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <h4 style="text-align: center; color: green;">Admin Panel</h4>
                        </div>
                        <div class="col-md-4" style="text-align: right; float: right;">
                            
                            <a href="logout.jsp"><span class="label label-warning">SignOut: </span> </a>
                        </div>
                    </div>

                </div>

                <nav class="navbar navbar-inverse">
                    <ul class="nav nav-pills">
                        <li class="active"><a href="home.jsp">Home</a></li>
                        <li><a href="addBus.jsp">Add New Bus Details</a></li>
                        <li><a href="addPayment.jsp">Add New Payment Receive Data</a></li>
                        
                        <li><a href="#">Contact</a></li>
                    </ul>
                </nav>
            </div>


        </div> 

    </body></html>