<%-- 
    Document   : payment
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

                String trxnID = request.getParameter("trxnID");
                String trxnMethod = request.getParameter("trxnMethod");
                String paidAmount = request.getParameter("trxnAmount");
                String payBy = request.getParameter("payBy");
                String userMobile = request.getParameter("userMobile");
                String payDate = request.getParameter("payDate");
                String busCODE = request.getParameter("busCode");
                String setNunbers = request.getParameter("setNumbers");
                String totalSeat = request.getParameter("totalSeat");
                String bookingId = request.getParameter("bookingID");
                String payStatus = "Paid";

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "");

                try {

                    String query = " insert into transaction (trnx_id, trxnMethod, paidAmount, payBy, payDate, busCode, totalSeat, seatNumbers, userMobile)"
                            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                    // create the mysql insert preparedstatement
                    PreparedStatement preparedStmt = con.prepareStatement(query);
                    preparedStmt.setString(1, trxnID);
                    preparedStmt.setString(2, trxnMethod);
                    preparedStmt.setString(3, paidAmount);
                    preparedStmt.setString(4, payBy);
                    preparedStmt.setString(5, payDate);
                    preparedStmt.setString(6, busCODE);
                    preparedStmt.setString(7, totalSeat);
                    preparedStmt.setString(8, setNunbers);
                    preparedStmt.setString(9, userMobile);
                    preparedStmt.execute();
                    System.out.println("Data Insert Successfully");
                } catch (Exception e) {
                    out.println("Transiction Data Insertion Error!");

                }

                try {

                    String sql = "update bookingdetails set payStatus = ? where bookingID = ?";
                    PreparedStatement pst = con.prepareStatement(sql);
                    pst.setString(1, payStatus);
                    pst.setString(2, bookingId);
                    pst.executeUpdate();
                    System.out.println("Updated Successfully!");

                } catch (Exception e) {
                    out.println("Booking Data update Error!");
                }
            %>

            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6" style="text-align: center;">
                    <h3>Payment Details</h3>
                </div>
                <div class="col-md-3"></div>
            </div>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10" style="text-align: center;">
                    <table class="table table-responsive table-hover">
                        <tr class="active">
                            <td> Transaction ID </td>
                            <td> Transaction Method </td>
                            <td> Paid Amount </td>
                            <td> Pay By </td>
                            <td> User Mobile </td>
                            <td> Pay Date </td>
                            <td> Bus ID </td>
                            <td> Total Seat </td>
                            <td> Seat Numbers </td>
                        </tr>
                        <tr class="info">
                            <td> <%= trxnID%> </td>
                            <td> <%= trxnMethod%> </td>
                            <td> <%= paidAmount%> </td>
                            <td> <%= payBy%> </td>
                            <td> <%= userMobile%> </td>
                            <td> <%= payDate%> </td>
                            <td> <%= busCODE%> </td>
                            <td> <%= totalSeat%> </td>
                            <td> <%= setNunbers%> </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-1"></div>
            </div>

            <form action="ticket.jsp" method="POST">
                <div class="row">
                    <div class="col-md-9"></div>
                    <div class="col-md-2">
                        <input type="hidden" class="form-control" name="busCode" value="<%= busCODE%>"/>
                        <input type="hidden" class="form-control" name="trxnID" value="<%= trxnID %>"/>
                        <input type="hidden" class="form-control" name="payDate" value="<%= payDate %>"/>
                        <input type="hidden" class="form-control" name="payBy" value="<%= payBy %>"/>
                        <input type="hidden" class="form-control" name="bookingID" value="<%= bookingId %>"/>
                        <div class="form-group">
                            <input class="btn btn-lg btn-warning" type="submit" id="getTicket" value="Get Ticket"/>
                        </div>
                    </div>
                    <div class="col-md-1"></div>

                </div>
            </form>



            <jsp:include page="footer.jsp"/>
        </div> 




    </body></html>