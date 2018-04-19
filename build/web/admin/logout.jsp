<%
    session.setAttribute("userid", null);
    session.invalidate();
    response.sendRedirect("/BusTickettingFinal/index.jsp");
%>