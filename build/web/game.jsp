<%-- 
    Document   : game
    Created on : 23.01.2014, 18:15:27
    Author     : Mvideo
--%>

<%@page import="com.controller.DatabaseManager"%>
<%@page import="com.dao.UserDaoImpl"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.model.User"%>
<%@page import="com.model.User"%>
<%@page import="com.model.User"%>
<%@page import="com.controller.NumberConroller"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Игра</title>
    </head>

    <body>

        <div id="info">
            <h1 style="margin-bottom:0.5em;">Быки и коровы</h1>
            <img alt="[математическая корова]" style="float:left; margin-right:2em;" src="imgs/cow.png">
            <img alt="[математический бык]" style="float:right; margin-left:2em;" src="imgs/bull.png">
            <p>
            <p>Компьютер задумывает четырехзначное число. Цифры в числе не повторяются, 0 может стоять на первом месте. Игрок делает ходы, чтобы узнать это число. В ответ на каждый ход компьютер показывает число отгаданных цифр, стоящих на своих местах (число быков) и число отгаданных цифр, стоящих не на своих местах (число коров).</p>
            <p>
            <p>Компьютер задумал 0834. Игрок походил 8134. Компьютер ответил: 2 быка (цифры 3 и 4) и 1 корова (цифра 8).</p>
            <p>
                <b>Новое число уже задумано компьютером. Играем!</b>
            </p>
        </div>
        <%
            Boolean isBegin = (Boolean) session.getAttribute("isBegin");
            String nameStep = (String) request.getParameter("SubmitStep");
            String nameNewGame = (String) request.getParameter("SubmitNewGame");
            if (nameStep != null) {
                //out.print("Next step");
                Boolean step = (Boolean) session.getAttribute("step");
                if (step == null) {
                    session.setAttribute("step", new Boolean(true));
                    session.setAttribute("list", new ArrayList<String>());
                    session.setAttribute("finalValue", NumberConroller.createNumber());
                    List<String> list = (List<String>) session.getAttribute("list");
                    String number = String.valueOf(request.getParameter("number"));
                    list.add(number);
                    session.setAttribute("victory", new Boolean(false));
                } else {
                    List<String> list = (List<String>) session.getAttribute("list");
                    String number = String.valueOf(request.getParameter("number"));
                    //Todo обработка намбер и задуманного числа
                    list.add(number);
                }

            }
            if (nameNewGame != null) {
                //out.print("New Game");
                session.setAttribute("step", null);
                session.setAttribute("list", null);
                session.setAttribute("finalValue", NumberConroller.createNumber());
                session.setAttribute("victory", new Boolean(false));
            }

            out.print("<form name='gameform' method='post' action='game.jsp'>");
            out.print("<table align='center'><tr><td><h2>Новая игра</h2></td></tr></table>");
            List<String> list = (List<String>) session.getAttribute("list");
            if (list != null) {
                for (String number : list) {
                    String finalValue = String.valueOf(session.getAttribute("finalValue"));
                    List<Integer> bullsCows = NumberConroller.returnCompareNumbers(finalValue, number);
                    Integer countCows = bullsCows.get(0);
                    Integer countBulls = bullsCows.get(1);
                    String text = "";
                    if (countBulls != 4) {
                        text = " Количество коров " + countCows + " количество быков " + countBulls;
                    } else {
                        text = " УРА ВЫ ВЫИГРАЛИ";
                        out.print("<script>alert('ПОБЕДА');</script>");
                        session.setAttribute("step", null);
                        session.setAttribute("list", null);
                        session.setAttribute("finalValue", NumberConroller.createNumber());
                        session.setAttribute("victory", new Boolean(true));
                        break;
                    }
                    out.print(number + text + " " + finalValue + "<br />");

                }
            }
            //Todo когда выиграли не показываем первый tr
            out.print("<table width='300px' align='left' style='border:1px solid #000000;background-color:#efefef;'>");
            Boolean victory = (Boolean) session.getAttribute("victory");
            if (victory != null) {
                if (!victory) {
                    out.print("<tr><td><input type='text' name='number' value=''></td><td><input type='submit' name='SubmitStep' value='Сделать ход'></td></tr>");
                }
            }
            out.print("<tr><td colspan='2'><input type='submit' name='SubmitNewGame' value='Новая игра'></td></tr>");
            out.print("</table>");
            out.print("</form>");

            DatabaseManager db = new DatabaseManager("jdbc:mysql://localhost:3306/", "bullscowsgame", "com.mysql.jdbc.Driver", "root", "050391z");
            UserDao userDao = new UserDaoImpl(db);
//            List<User> users = userDao.getAllUsers();
//            for(User user : users)
//                out.print(user);
            db.closeConnection();
        %>
        <!-- Для выхода достаточно удалить сессию сделать nullом у user и auth -->
    </body>
</html>
