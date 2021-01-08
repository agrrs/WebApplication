<%--
  Created by IntelliJ IDEA.
  User: sofih
  Date: 05.01.2021
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        @import "../styles/main.css" screen;
    </style>
</head>
<body>
<h2>Hello from JSP</h2>

<%@ page import="java.util.Date" %>
<%@ page import="logic.BusinessLogic" %>

<%
    String name = (String)session.getAttribute("current_user");
    if (name != null){
        out.println("<div><b> Hello, " + name + "</b></div>");
    }
%>

<%
    for (int i=0; i<10; i++){
        out.println("<p> Number from jsp: " + i + "</p>");
    }
%>
<%
    Date now = new Date ();

%>

<%=
now
%>

<%
    BusinessLogic bl = new BusinessLogic();
    out.println("<div><b>" + bl.getString() + "</b></div>");
%>


</body>
</html>
