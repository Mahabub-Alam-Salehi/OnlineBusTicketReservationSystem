<%-- 
    Document   : ticket
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

                String busId = request.getParameter("busCode");
                String bokingId = request.getParameter("bookingID");
                String trxnId = request.getParameter("trxnID");
                String payDate = request.getParameter("payDate");
                String payBy = request.getParameter("payBy");
                String busName = null;
                String depFrom = null;
                String arriveAt = null;
                String startTime = null;
                String arriveTime = null;
                String departDate = null;

                String psngrName = null;
                String psngMobile = null;
                String totalSeat = null;
                String seatNumbers = null;
                String payStatus = null;

                String payID = null;

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "");
                ResultSet rs;
                PreparedStatement pstmt;

                try {
                    String sql2 = "select * from payment where sendDate = ? and senderName=?";
                    pstmt = con.prepareStatement(sql2); // create a statement
                    pstmt.setString(1, payDate);
                    pstmt.setString(2, payBy);// set input parameter
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        payID = rs.getString("trxnID");
                    }
                } catch (Exception e) {
                    out.println("Payment details data collecting error");
                }
                
                try {
                    String sql = "select * from bookingdetails where bookingID = ? and passName=?";
                    pstmt = con.prepareStatement(sql); // create a statement
                    pstmt.setString(1, bokingId);
                    pstmt.setString(2, payBy);// set input parameter
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        seatNumbers = rs.getString("seatNumbers");
                        psngrName = rs.getString("passName");
                        psngMobile = rs.getString("passMobile");
                        totalSeat = rs.getString("totatSeat");
                        payStatus = rs.getString("payStatus");
                    }
                    //con.close();
                } catch (Exception e) {
                    out.println("bokking details data collecting error");
                }
                
                try {
                    String sql1 = "select * from busdetails where BusCode=?";
                    pstmt = con.prepareStatement(sql1); // create a statement
                    pstmt.setString(1, busId);
                   // pstmt.setString(2, payBy);// set input parameter
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                         busId = rs.getString("BusCode");
                         busName = rs.getString("BusType");
                         depFrom = rs.getString("From");
                         arriveAt = rs.getString("To");
                         startTime = rs.getString("StartTime");
                         arriveTime = rs.getString("ArivalTime");
                         departDate = rs.getString("DepartureDate");
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Bus details data collecting error");
                }

            %>

            <%                if (trxnId.equals(payID)) {

            %>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <h3 style="color: #009900">Ticket Details</h3>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-4">
                    <h4> <span class="label label-default"> Booking ID: <%= bokingId%> </span> </h4>
                    <h4> <span class="label label-default">Passenger Name: <%= psngrName%> </span> </h4>
                    <h4> <span class="label label-default">Passenger Mobile: <%= psngMobile%> </span></h4>
                    <h4> <span class="label label-default">Total Seat: <%= totalSeat%> </span></h4>
                    <h4> <span class="label label-default">Seat Numbers: <%= seatNumbers%> </span></h4>
                    <h4> <span class="label label-default">Payment Status: <%= payStatus%> </span></h4>
                </div>
                <div class="col-md-4">
                    <h4> <span class="label label-default"> Bus Name: <%= busName%> </span></h4>
                    <h4> <span class="label label-default">Bus ID: <%= busId%> </span> </h4>
                    <h4> <span class="label label-default">Departure From: <%= depFrom%> </span></h4>
                    <h4> <span class="label label-default">Arrive at: <%= arriveAt%> </span></h4>
                    <h4> <span class="label label-default">Start Time: <%= startTime%></span> </h4>
                    <h4> <span class="label label-default"> Arrive Time: <%= arriveTime%></span> </h4>
                    <h4> <span class="label label-default"> Departure Date: <%= departDate%></span> </h4>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="form-group">
                        <input class="btn btn-lg btn-danger" type="button" id="print" value="Print" onclick="window.print();"/>
                    </div>
                </div>
                <div class="col-md-4"></div>

            </div>

            <%
            } else {
            %>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="alert alert-danger" role="alert">
                        <h4>Sorry! your Transaction ID is not Valid. </h4>
                    </div>
                    
                </div>
                <div class="col-md-4"></div>
            </div>
            <%
                }

            %>


            <jsp:include page="footer.jsp"/>
        </div> 




    </body></html>