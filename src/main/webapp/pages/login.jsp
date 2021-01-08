<%--
  Created by IntelliJ IDEA.
  User: sofih
  Date: 06.01.2021
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        @import "../bootstrap/css/bootstrap.css";
        @import "../bootstrap/css/bootstrap.min.css";
    </style>
</head>
<body>
<form method="post" action="">
</br>
    <div align="left">
        <label class="form-label">Логін</label>
        <input type="text" class="form-control" placeholder="Логін" name="login" id="login" required>
    </div>

    <div align="left">
        <label class="form-label">Пароль</label>
        <input type="text" class="form-control" placeholder="Пароль" name="pwd" id="pwd" required>
    </div>

    <div align="right">
        <input type="submit" value="Увійти" class="btn btn-info">
    </div>
</form>


</body>
</html>
