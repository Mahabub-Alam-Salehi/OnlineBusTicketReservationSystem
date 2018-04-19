<%-- 
    Document   : register
    Created on : Apr 22, 2015, 6:31:08 PM
    Author     : Mahabub Alam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="myPkg.SeatBooking"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
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
        <script src="js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>  

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <div class="container">
            <%

                String bName0 = request.getParameter("seatNumber0");
                String bName1 = request.getParameter("seatNumber1");
                String bName2 = request.getParameter("seatNumber2");
                String bName3 = request.getParameter("seatNumber3");
                String bName4 = request.getParameter("seatNumber4");
                String bName5 = request.getParameter("seatNumber5");
                String rowSeat = bName0 + "," + bName1 + "," + bName2 + "," + bName3 + "," + bName4 + "," + bName5;
                String bSeat = rowSeat.replaceAll(",null", "");

                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                Date date = new Date();
                System.out.println(dateFormat.format(date)); //2014/08/06 15:59:48
%>


            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <h2 style="color: green;">Enter Your Booking Information</h2>
                </div>
                <div class="col-md-3"></div>

            </div>

            <form action="booking.jsp" method="POST" id="emailForm" class="form-horizontal"
                  data-fv-framework="bootstrap"
                  data-fv-icon-valid="glyphicon glyphicon-ok"
                  data-fv-icon-invalid="glyphicon glyphicon-remove"
                  data-fv-icon-validating="glyphicon glyphicon-refresh">
                <div class="row">

                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        <h3>Write Down your details here..</h3>
                        <div class="form-group">
                            <label for="InputSrcFrom">Name</label>
                            <input type="text" class="form-control" name="usrName" placeholder="Enter Your Name Here.." required="yes">
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Email</label>
                            <input type="text" class="form-control" name="email" placeholder="Enter Your Email Address.." required="yes" data-fv-emailaddress="true"
                                   data-fv-emailaddress-message="The value is not a valid email address"/>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Address</label>
                            <input type="text" class="form-control" name="usrAddress" placeholder="Enter Your Address.." required="yes">
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Mobile</label>
                            <input type="text" class="form-control" name="usrMobile" placeholder="Enter Your Mobile Number " required="yes" >
                        </div>
                        <div class="form-group">
                            <label for="selectZone">Gender</label>
                            <select type="text" name="gender" class="form-control">
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-1"></div>

                    <div class="col-md-4">
                        <h3>Booking Bus Details</h3>
                        <div class="form-group">
                            <label for="InputSrcFrom">Bus Code</label>
                            <input type="text" class="form-control" name="busCode" value="<%= request.getParameter("busID")%>"/>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Seat Numbers</label>
                            <input type="text" class="form-control" name="busSeatNumber" value="<%= bSeat%>"/>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Total Seat</label>
                            <input type="text" class="form-control" name="busTotalSeat" value="<%= request.getParameter("totalSeat")%>"/>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Total Price</label>
                            <input type="text" class="form-control" name="busTotalPrice" value="<%= request.getParameter("totalAmount")%>"/>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Booking Date</label>
                            <input type="text" class="form-control" name="bookDate" value="<%= dateFormat.format(date)%>">
                        </div>

                    </div>

                    <div class="col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-md-9"></div>
                    <div class="col-md-1">
                        <input class="btn btn-lg btn-warning" type="submit" id="busBooking" value="Booking"/>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </form>
            <script>
                $(document).ready(function() {
                    $('#emailForm').formValidation();
                });
            </script>

            <jsp:include page="footer.jsp"/>
        </div> 




    </body></html>