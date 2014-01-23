<%-- 
    Document   : game
    Created on : 23.01.2014, 18:15:27
    Author     : Mvideo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <script type="text/javascript">
        function createXMLHttpRequest(){
            // See http://en.wikipedia.org/wiki/XMLHttpRequest
            // Provide the XMLHttpRequest class for IE 5.x-6.x:
            if( typeof XMLHttpRequest == "undefined" ) XMLHttpRequest = function() {
                try { return new ActiveXObject("Msxml2.XMLHTTP.6.0") } catch(e) {}
                try { return new ActiveXObject("Msxml2.XMLHTTP.3.0") } catch(e) {}
                try { return new ActiveXObject("Msxml2.XMLHTTP") } catch(e) {}
                try { return new ActiveXObject("Microsoft.XMLHTTP") } catch(e) {}
                throw new Error( "This browser does not support XMLHttpRequest." )
            };
            return new XMLHttpRequest();
        }

        var AJAX = createXMLHttpRequest();

        function handler() {
            if(AJAX.readyState == 4 && AJAX.status == 200) {
                var text = AJAX.responseText;
                alert('Success. Result: ' + text);
            }else if (AJAX.readyState == 4 && AJAX.status != 200) {
                alert('Something went wrong...');
            }
        }

        function show(){
            AJAX.onreadystatechange = handler;
            AJAX.open("GET", "getList.jsp", true);
            AJAX.send();
        };
    </script>

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
        <!-- А здесь чувак попробуем AJAX -->
        <!-- СДЕЛАТЬ ТАК ЧТОБЫ ДОБАВЛЯТЬ МОЖНО БЫЛО ДАННЫЕ ОТПРАВЛЯТЬ ИХ В ДРУГОЙ ФАЙЛ И БРАТЬ ОБРАТНО ВЕСЬ СПИСОК -->
        <a href="#" onclick="javascript:show();"> Click here to get JSON data from the server side</a>
        <!-- Для выхода достаточно удалить сессию сделать nullом у user и auth -->
    </body>
</html>
