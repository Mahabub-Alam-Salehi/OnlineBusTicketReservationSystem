<%-- 
    Document   : seatPlan
    Created on : Apr 22, 2015, 6:31:08 PM
    Author     : Mahabub Alam
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="myPkg.SeatBooking"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type"%>
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
            <% String bName = request.getParameter("busType"); %>
            <% String tSeat = request.getParameter("seatFree");%>
            <% String bCode = request.getParameter("busCode");%>
            <% String price = request.getParameter("busPrice");%>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <h3 style="color: #265a88;"> Bus Name: <%= bName.toString()%> </h3>
                </div>
                <div class="col-md-5">
                    <h3 style="color: #67b168;"> Total Seat: <%= tSeat.toString()%> </h3>
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row"></div>

            <div class="row">
                <div class="col-md-1"></div>
                <div align="center" class="col-md-3">

                    <form action="checkBoxValidation()" method="post">
                        <%

                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "");
                            PreparedStatement preparedStatement;
                            ResultSet resultSet;
                            StringBuffer sb = new StringBuffer("0");
                            String query = "select * from bookingDetails where busCode=" + bCode + "";
                            try {
                                preparedStatement = con.prepareStatement(query);
                                resultSet = preparedStatement.executeQuery();

                                while (resultSet.next()) {
                                    sb.append(resultSet.getString("seatNumbers") + ",");
                                }

                                System.out.println("Booking Data Collect Successfully");
                            } catch (Exception e) {
                                System.out.println("Data not Found!");
                            }

                            String tempSt = sb.toString();
                            String[] stN = tempSt.split(",");

                            int n = Integer.valueOf(tSeat);
                            int i;
                            int k = 0;
                            for (i = 1; i <= n; i++) {

                                for (int j = 0; j < stN.length; j++) {
                                    if (Integer.valueOf(stN[j]) == i) {


                        %>
                        <div  id="seatPlanSep" style="float: left; margin: 5px 10px 5px 10px; alignment-adjust: central; text-align: center;">
                            <input type="button" class="btn btn-danger" readonly="true"  name="<% out.print(i); %>" value="<% out.print(i);%>" id="<%=i%>"/>
                        </div>
                        <%
                                    k = Integer.valueOf(stN[j]);
                                    break;
                                } else {
                                    continue;

                                }

                            }
                            if (i == k) {
                                continue;
                            } else {


                        %>
                        <div  id="seatPlanSep" style="float: left; margin: 5px 10px 5px 10px; alignment-adjust: central; text-align: center;">
                            <input type="button" class="btn btn-default"  onclick="myFunction(this.id)" name="<% out.print(i); %>" value="<% out.print(i);%>" id="<%=i%>"/>
                        </div>
                        <%
                                }
                            }
                        %>

                        <br>
                    </form>           
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-6">
                    <form action="regsiter.jsp" method="POST">
                        <table class="table table-responsive table-striped" id="myTable">
                            <tr>
                                <td>Bus Code</td>
                                <td>Seat No</td>
                                <td>Price</td>
                                <td>Edit</td>
                            </tr>
                        </table>

                        <table class="table table-striped">
                            <tr class="info">
                                <td align="right" colspan="3"> <b>Total Amount: </b></td>
                                <td align="left"> 
                                    <p id="amount" style="color: #009900; font-size: medium;"></p>
                                    <input type="hidden" value="" name="totalAmount" id="amount2" />
                                    <input type="hidden" value="" name="totalSeat" id="tSeat" />
                                    <input type="hidden" name="busID" value="<%= bCode%>" />
                                </td>
                            </tr>
                        </table>
                        <input class="btn btn-lg btn-warning" type="submit" id="booking" value="Submit"/>
                    </form>
                    <script>

                        var y = 0;
                        function myFunction(clicked_id) {
                            var table = document.getElementById("myTable");
                            var row = table.insertRow(-1);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3);

                            var x = document.getElementById(clicked_id).value;


                            cell1.innerHTML = '<input type="text" name="busCode" value="<%= bCode%>"/>';
                            cell2.innerHTML = '<input type="text" name="seatNumber' + y + '" value="' + x + '"/>';
                            cell3.innerHTML = '<input type="text" name="price" value="<%= price%>"/>';
                            cell4.innerHTML = '<input id="cellDelete" type="button" value="x" onclick="SomeDeleteRowFunction(this)"/>';

                            var s = document.getElementById("myTable").rows.length;
                            var p = <%=price%>;
                            var amount = (s - 1) * p;
                            document.getElementById("amount").innerHTML = amount;
                            document.getElementById("amount2").value = amount;
                            document.getElementById("tSeat").value = (s - 1);
                            y++;
                        }


                        function SomeDeleteRowFunction(o) {
                            //no clue what to put here?
                            var p = o.parentNode.parentNode;
                            p.parentNode.removeChild(p);
                            var s = document.getElementById("myTable").rows.length;
                            var p = <%=price%>;
                            var amount = (s - 1) * p;
                            document.getElementById("amount").innerHTML = amount;
                            document.getElementById("amount2").value = amount;
                            document.getElementById("tSeat").value = (s - 1);
                        }


                    </script>
                </div>
                <script>
                    function GetCellValues() {
                        var table = document.getElementById('myTable');
                        for (var r = 0, n = table.rows.length; r < n; r++) {
                            for (var c = 0, m = table.rows[r].cells.length; c < m; c++) {
                                alert(table.rows[r].cells[c].innerHTML);
                            }
                        }
                    }
                </script>
            </div>

            <jsp:include page="footer.jsp"/>
        </div> 
        
    </body></html>