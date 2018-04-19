<%-- 
    Document   : booking
    Created on : Apr 22, 2015, 6:31:08 PM
    Author     : Mahabub Alam
--%>


<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
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

                String psngrName = request.getParameter("usrName");
                String psngrEmail = request.getParameter("email");
                String psngrAddress = request.getParameter("usrAddress");
                String psngrMobile = request.getParameter("usrMobile");
                String psngrGender = request.getParameter("gender");
                String busCODE = request.getParameter("busCode");
                String setNunbers = request.getParameter("busSeatNumber");
                String totalSeat = request.getParameter("busTotalSeat");
                String totalPrice = request.getParameter("busTotalPrice");
                String bookingDate = request.getParameter("bookDate");
                String payStatus = "Not Paid";
                Random randomGenerator = new Random();
                int randInt = randomGenerator.nextInt(100);
                String bookingid = String.valueOf(randInt);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "");

                try {
                    
                    String query = " insert into bookingDetails (bookingID, busCode, totatSeat, seatNumbers, passName, passMobile, bookingDate, totalAnount, payStatus)"
                            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                    // create the mysql insert preparedstatement
                    PreparedStatement preparedStmt = con.prepareStatement(query);
                    preparedStmt.setString(1, bookingid);
                    preparedStmt.setString(2, busCODE);
                    preparedStmt.setString(3, totalSeat);
                    preparedStmt.setString(4, setNunbers);
                    preparedStmt.setString(5, psngrName);
                    preparedStmt.setString(6, psngrMobile);
                    preparedStmt.setString(7, bookingDate);
                    preparedStmt.setString(8, totalPrice);
                    preparedStmt.setString(9, payStatus);
                    preparedStmt.execute();
                    System.out.println("Booking Data Insert Successfully");
                    
                } catch (Exception e) {
                    out.println("Data Insertion Error!");

                }
               

                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                Date date = new Date();
                System.out.println(dateFormat.format(date)); //2014/08/06 15:59:48
                
                                
                try {
                    
                    String query = " insert into passenger (passName, passEmail, passAddress, passMobile, passGender)"
                            + " values (?, ?, ?, ?, ?)";

                    // create the mysql insert preparedstatement
                    PreparedStatement preparedStmt = con.prepareStatement(query);
                    preparedStmt.setString(1, psngrName);
                    preparedStmt.setString(2, psngrEmail);
                    preparedStmt.setString(3, psngrAddress);
                    preparedStmt.setString(4, psngrMobile);
                    preparedStmt.setString(5, psngrGender);
                    
                    preparedStmt.execute();
                    System.out.println("Passenger Insert Successfully");
                } catch (Exception e) {
                    out.println("Data Insertion Error!");

                } 
%>

            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6" style="text-align: center;">
                    <h3>Booking Details</h3>
                </div>
                <div class="col-md-3"></div>
            </div>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10" style="text-align: center;">
                    <table class="table table-responsive table-hover">
                        <tr class="active">
                            <td> Booking ID </td>
                            <td> Bus ID </td>
                            <td> Total Seat </td>
                            <td> Seat Numbers </td>
                            <td> Passenger Name </td>
                            <td> Passenger Mobile </td>
                            <td> Booking Date </td>
                            <td> Total Cost </td>
                            <td> Payment Status </td>
                        </tr>
                        <tr class="info">
                            <td> <%= bookingid%> </td>
                            <td> <%= busCODE%> </td>
                            <td> <%= totalSeat%> </td>
                            <td> <%= setNunbers%> </td>
                            <td> <%= psngrName%> </td>
                            <td> <%= psngrMobile%> </td>
                            <td> <%= bookingDate%> </td>
                            <td> <%= totalPrice%> </td>
                            <td> <%= payStatus%> </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6" style="text-align: center;">
                    <h3>Give Payment</h3>
                </div>
                <div class="col-md-3"></div>
            </div>
            <form action="payment.jsp" method="POST">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-3">
                        <img src="image/Payment-Methods.png">
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="selectZone">Payment Method Information</label>
                            <select type="text" name="trxnMethod" class="form-control">
                                <option>MKash</option>
                                <option>BKash</option>
                                <option>Online Payment</option>
                                <option>Cash</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Transaction ID</label>
                            <input type="text" class="form-control" name="trxnID" required="yes"/>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Paid Amount</label>
                            <input type="text" class="form-control" name="trxnAmount" value="<%= totalPrice%>" required="yes"/>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Pay by</label>
                            <input type="text" class="form-control" name="payBy" value="<%= psngrName%>"/>
                        </div>
                        <div class="form-group">
                            <label for="InputSrcFrom">Pay Date</label>
                            <input type="text" class="form-control" name="payDate" value="<%= dateFormat.format(date)%>">
                        </div>
                        <input type="hidden" class="form-control" name="busCode" value="<%= busCODE%>"/>
                        <input type="hidden" class="form-control" name="totalSeat" value="<%= totalSeat%>"/>
                        <input type="hidden" class="form-control" name="setNumbers" value="<%= setNunbers%>"/>
                        <input type="hidden" class="form-control" name="userMobile" value="<%= psngrMobile%>"/>
                        <input type="hidden" class="form-control" name="bookingID" value="<%= bookingid %>"/>
                        <div class="form-group">
                            <input class="btn btn-lg btn-warning" type="submit" id="bookPayment" value="Do Payment"/>
                        </div>
                    </div>
                    <div class="col-md-2"></div>

                </div>
            </form>

            <jsp:include page="footer.jsp"/>
        </div> 

    </body></html>