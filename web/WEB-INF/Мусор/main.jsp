<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><a href="auth">Регистрация</a></h1>
        <%
            String userName = (String) session.getAttribute("userName");
            String role = (String) session.getAttribute("role");
            if (userName == null || !"admin".equals(role)) {
                response.sendError(403, "You are not authorized to view this page");
                return;
            }
        %>
        <form action="index.jsp" method="post">
            Enter Username: <input name="userName"> <br>
            Enter Password: <input name="password"> <br>
            <input type="submit">
        </form>
    </body>
</html>
