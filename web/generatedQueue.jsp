<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/2/2017
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    int id = request.getParameter("id");
    string nric = request.getParameter("nric");
    double timeRemaining = request.getParameter("timeRemaining");

%>
<body>
<form method="post" action="/queuemain" action="QueueMain.jsp">
    <textfield nric="nric">
        <button value="submit"></button></textfield></form>
<h1>Queue number = <%= id%></h1>
<h2>NRIC = <%= id%></h2>
<h3>Estimated time remaining = <%= timeRemaining %></h3>
</body>
</html>
