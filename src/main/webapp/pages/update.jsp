<%--
  Created by IntelliJ IDEA.
  User: sofih
  Date: 07.01.2021
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="db.ConnectionFactory" %>

<%@ page isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    Connection connection;
    PreparedStatement pst;
    ResultSet resultSet;
    Integer id;
    if (request.getParameter("submit") != null) {
        String dnum = request.getParameter("course");
        String dname = request.getParameter("cname");
        String descr = request.getParameter("credit");
        id = Integer.valueOf(request.getParameter("id"));
        connection = ConnectionFactory.getConnection();
        try {
            pst = connection.prepareStatement("update subjects set credit = ?, cname = ?, course = ? where id = ?");
            pst.setInt(1, Integer.valueOf(credit));
            pst.setString(2, cname);
            pst.setString(3, course);
            pst.setInt(4, id);
            pst.executeUpdate();
            connection.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("/courses");
    }
%>

<fmt:setBundle basename="message" />
<fmt:setLocale value="${cookie['lang'].value}" scope="application"/>

<html>
<head>
    <title>Редагування</title>
    <style>
        @import "../bootstrap/css/bootstrap.css";
        @import "../bootstrap/css/bootstrap.min.css";
    </style>
</head>
<body>

<div style="padding: 20px">

    <h1><fmt:message key="data.update"/></h1>
    <div class="row">
        <div class="col-sm-4">
            <form method="post" action="#">

                <%
                    connection = ConnectionFactory.getConnection();
                    try {
                        id = Integer.valueOf(request.getParameter("id"));
                        pst = connection.prepareStatement("select * from subjects where id = ? ");
                        pst.setInt(1, id);
                        resultSet = pst.executeQuery();
                        while (resultSet.next()) {
                %>

                </br>
                <div align="left">
                    <label class="form-label"><fmt:message key="entity.credit"/></label>
                    <input type="text" class="form-control" placeholder=<fmt:message key="entity.credit"/> value="<%=resultSet.getInt("credit")%>" name="credit" id="credit" required>
                </div>
                <div align="left">
                    <label class="form-label"><fmt:message key="entity.cname"/></label>
                    <input type="text" class="form-control" placeholder=<fmt:message key="entity.cname"/> value="<%=resultSet.getString("cname")%>" name="cname" id="cname" required>
                </div>
                <div align="left">
                    <label class="form-label"><fmt:message key="entity.course"/></label>
                    <input type="text" class="form-control" placeholder=<fmt:message key="entity.course"/> value="<%=resultSet.getString("course")%>" name="course" id="course" required>
                </div>

                <%
                        }
                        connection.close();
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                %>
                </br>
                <div align="rigth">
                    <input type="submit" id="submit" value=<fmt:message key="button.submit"/> name="submit" class="btn btn-info">
                    <input type="reset" id="reset" value=<fmt:message key="button.cancel"/> name="reset" class="btn btn-warning" onclick="location.href='/courses'">
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>