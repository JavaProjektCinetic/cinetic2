<%-- 
    Document   : LoginPage
    Created on : 10.04.2015, 09:47:45
    Author     : Laura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script type="text/javascript" src="film.js"></script>
        <style>
            div.header {
                width: 1366px;
                height: 150px;
                margin-left: -8px;
                margin-top: -8px;
            }

            div.logo{
                width: 220px;
                background-color: white;
                color: #644030;
                opacity: 0.7;
                margin-left: 20px;
                margin-top: 20px;
            }

            div.lang{
                height:150px;
                margin-top: 20px;
                margin-right: 20px;
            }

            body
            {
                background-image: url("res/background2.jpg");
                background-size: 1366px;
                background-attachment: fixed;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <form action="ReservationPage.jsp">
            <div name="cinetic_header" class="header">
                <div name="logo" style="text-align:left; float:left" class='logo'>
                    <table>
                        <tr><td><img src="res/logo.png" alt="Cinetic Logo" style="width:120px;height:90px"></img></td><td><span style="font-family: 'Playbill'; font-size:300%">Cinetic</span></td></tr>
                    </table>
                </div>
                <div name="checkbox" style="text-align:right; float:right;" class="lang">
                    <select>
                        <option>German</option>
                        <option>English</option>
                    </select>
                </div>
            </div>
            <center>
                <h1>Login</h1>
                <h4>Please log in before reservating a seat!</h4>
                Name<input type="text" id="username" name="username"/></br>
                Telephone number<input type="text" id="tel" name="tel"/>
                <input type="submit" value="Login"/>
            </center>
        </form>
    </body>
</html>
