<%-- 
    Document   : index
    Created on : Apr 22, 2015, 6:57:20 PM
    Author     : Mahabub Alam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="header.jsp"/>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/myStyle.css" rel="stylesheet">
        <script src="js/bootstrap-datepicker.min.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="container">

            <div id="carousel-example-generic" class="carousel slide slider" data-ride="carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="image/bus-1.jpg" alt="..." width="1024" height="600">
                        <div class="carousel-caption">
                            <h3 style="color: #00cc00">Online Seat Booking Now ...</h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/bus-2.jpg" alt="..." width="960" height="400">
                        <div class="carousel-caption">
                            <h3 style="color: #009900">Booking your Bus Ticket by Online</h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/bus-3.jpg" alt="..." width="1024" height="500">
                        <div class="carousel-caption">
                            <h3 style="color: #000">Any Time Any Where You Can Bus Seat Booking ..</h3>
                        </div>
                    </div>
                    <div class="item">
                        <img src="image/bus-4.jpg" alt="..." width="1024" height="500">
                        <div class="carousel-caption">
                            <h3 style="color: #009900">Now Bus Reservation is Easy by Online</h3>
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="row srcPanel">
                <div class="col-lg-6 srcImage">
                    <img src="image/bus-online.gif" class="img-responsive">
                </div>

                <div class="col-lg-6 searcBox">
                    <div class="srcboxHeader" style="color:#000">
                        <h3>Search your desired Bus</h3>
                    </div>
                    <form action="searchBus.jsp" method="post">
                        <div class="form-group">
                            <label for="InputSrcFrom">From</label>
                            <input type="text" class="form-control" name="srcFrom" id="srcFrom" placeholder="Enter from where you will travel">
                        </div>
                        <div class="form-group">
                            <label for="InputSrcTo">To</label>
                            <input type="text" class="form-control" name="srcTo" id="srcTo" placeholder="Enter the location you want to travel">
                        </div>
                        <div class="form-group">
                            <label for="inputSrcDate">Departure Date</label>
                            <input type="text" class="form-control" name="srcDate" id="srcDate" placeholder="yyyy/mm/dd">
                        </div>

                        <button type="submit" class="btn btn-lg btn-primary button" id="submit" value="Login">Search</button>
                    </form>

                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>