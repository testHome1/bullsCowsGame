<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="loginform" method="post" action="auth">
            <br><br>
            <table align="center"><tr><td><h2>Авторизация</h2></td></tr></table>
            <table width="300px" align="center" style="border:1px solid #000000;background-color:#efefef;">
                <tr><td colspan=2></td></tr>
                <tr><td colspan=2> </td></tr>
                <tr>
                    <td><b>Имя пользователя:</b></td>
                    <td><input type="text" name="userName" value=""></td>
                </tr>
                <tr>
                    <td><b>Пароль:</b></td>
                    <td><input type="password" name="password" value=""></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="Submit" value="Отправить"></td>
                </tr>
                <tr><td colspan=2><a href="">Регистрация</a></td></tr>
            </table>
    </body>
</html>
