<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Главная страница</title>
    </head>
    <body> 
        <h1 style="margin-bottom:0.5em;">Быки и коровы</h1>
        <%
            User user = (User) session.getAttribute("user");
            if (user != null) {
                out.print(user.toString());
                response.sendRedirect("game.jsp"); 
            } else {
                Boolean isFirstAuth = (Boolean) session.getAttribute("auth");
                if (isFirstAuth != null) {
                    out.print("<p>Вы не правильно ввели пользователя или пароль, если вы еще не зарегестрированы пройдите процедуру <a href=''>регистрации</a></p>");
                    out.print("<a href='login.jsp'>Авторизация</a><br>");
                    out.print("<a href=''>Регистрация</a>");
                    session.setAttribute("auth", null);
                } else {
                    out.print("<a href='login.jsp'>Авторизация</a><br>");
                    out.print("<a href=''>Регистрация</a>");
                }
            }
            
            
        %>       
    </body>
</html>
