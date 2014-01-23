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
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            if ("admin".equals(userName) && "adminpass".equals(password)) { //Session start
                session.setAttribute("userName", userName);
                session.setAttribute("role", "admin");
                response.sendRedirect("main.jsp");
            } else {
                out.print("Logon failed");
            }
        %>
        <form action="index.jsp" method="post">
            Enter Username: <input name="userName"> <br>
            Enter Password: <input name="password"> <br>
            <input type="submit">
        </form>
    </body>
</html>
