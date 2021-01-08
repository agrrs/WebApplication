<%--
  Created by IntelliJ IDEA.
  User: sofih
  Date: 07.01.2021
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>

    <%
    Integer id = Integer.valueOf(request.getParameter("id"));
    Connection connection;
    PreparedStatement pst;
    ResultSet resultSet;
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/public?serverTimezone=UTC", "sofih", "olenya2218");
        pst = connection.prepareStatement("delete from subjects where id = ?");
        pst.setInt(1, id);
        pst.executeUpdate();
        connection.close();
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    response.sendRedirect("/courses");
%>

<html>
<body>

</body>
</html>