<%-- 
    Document   : saveBus
    Created on : Apr 22, 2015, 6:31:08 PM
    Author     : Abu Sufian
--%>


<%@page import="java.sql.SQLException"%>
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
                String busId = request.getParameter("busID");
                String busName = request.getParameter("busName");
                String depFrom = request.getParameter("depFrom");
                String arriveAt = request.getParameter("arriveAt");
                String totalSeat = request.getParameter("totalSeat");
                String startTime = request.getParameter("startTime");
                String arriveTime = request.getParameter("arriveTime");
                String depDate = request.getParameter("depDate");
                String price = request.getParameter("price");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "");

                Statement st = con.createStatement();

                String query = "insert into busdetails values ('" + busId + "','" + busName + "','" + depFrom + "','" + arriveAt + "','" + totalSeat + "','" + startTime + "','" + arriveTime + "','" + depDate + "', '" + price + "')";
                int i = st.executeUpdate(query);
                if (i > 0) {
            %>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="alert alert-success" role="alert">
                        <h4>New Bus Data Insert Successfully!</h4>
                    </div>

                </div>
                <div class="col-md-4"></div>
            </div>
            <%
                } else {
                    out.print("fill the all field");
                }


            %>


            <jsp:include page="footer.jsp"/>
        </div> 




    </body></html>