<%-- 
    Document   : home
    Created on : Apr 22, 2015, 6:57:20 PM
    Author     : Mahabub Alam
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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

            <%-- Bus Details--%>

            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="alert alert-info" role="alert" style="text-align: center;">
                        <h3>Bus List</h3>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>

            <div class="row">

                <div class="col-md-1"></div>

                <div class="col-md-10">

                    <table class="table table-responsive table-striped" >
                        <tr>
                            <td class="info"><b>Bus Code</b></td>
                            <td class="success"><b>Bus Type</b></td>
                            <td class="active"><b>Start Time</b></td>
                            <td class="warning"><b> Arrival Time</b></td>
                            <td class="info"><b>Available Seats</b></td>
                            <td class="danger"><b>Price</b></td>

                        </tr>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "");
                            String sql = "SELECT * FROM `busdetails`";
                            PreparedStatement ps = connection.prepareStatement(sql);

                            ResultSet resultset = ps.executeQuery();
                            while (resultset.next()) {
                        %>

                        <tr>
                            <td> <%= resultset.getString("BusCode")%> </td>
                            <td > <%= resultset.getString("BusType")%> </td>
                            <td> <%= resultset.getString("StartTime")%> </td>
                            <td> <%= resultset.getString("ArivalTime")%> </td>
                            <td > <%= resultset.getString("Seats")%> </td>
                            <td> <%= resultset.getString("Price")%> </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
                <div class="col-md-1"></div>
            </div>

           
            <jsp:include page="footer.jsp"/>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>