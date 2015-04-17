<%-- 
    Document   : MoviePage
    Created on : 10.04.2015, 09:47:35
    Author     : Laura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Page</title>
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

            div.movie{
                border-style: inset;
                border-width: 5px;
                border-color: #644030;
                width:800px;
                background-color: white;
                opacity: 0.7;
            }

            div.suggestions
            {
                width:170px;
                background-color: white;
                opacity: 0.7;
                float: right;
                border-style: inset;
                border-width: 5px;
                border-color: #644030;
            }

            body{
                background-image: url("../../res/background2.jpg");
                background-size: 1366px;
                background-attachment: fixed;
                background-repeat: no-repeat;
            }
            
            p.description{
                font-family: Georgia;
                font-size: 14;
            }
        </style>
    </head>
    <body>
        <div name="cinetic_header" class="header">
            <div name="logo" style="text-align:left; float:left" class='logo'>
                <table>
                    <tr><td><img src="../../res/logo.png" alt="Cinetic Logo" style="width:120px;height:90px"></img></td><td><span style="font-family: 'Playbill'; font-size:300%">Cinetic</span></td></tr>
                </table>
            </div>
            <div name="checkbox" style="text-align:right; float:right;" class="lang">
                <select>
                    <option>German</option>
                    <option>English</option>
                </select>
            </div>
        </div>
        <table style="float:right" cellpadding="15">
            <tr><td>
                    <div name="movie" class="movie">
                        <center>
                            <table>
                                <tr>
                                    <td>
                                        <img src="../../res/WolfOfWallstreet.jpg" alt="Hangover" style="width:300px;"/>
                                    </td>
                                    <td>
                                        <p class="description">The Wolf of Wall Street ist eine US-amerikanische Filmbiografie von Martin Scorsese aus dem Jahr 2013 mit Leonardo DiCaprio, Jonah Hill und Margot Robbie in den Hauptrollen. Der Film basiert auf dem gleichnamigen Bestseller des Börsenmaklers Jordan Belfort.
                                            Der Film feierte seine Premiere am 17. Dezember 2013 in New York City.[2] In den Vereinigten Staaten startete er am 25. Dezember 2013, im deutschsprachigen Raum lief er am 16. Januar 2014 an.</p>
                                    </td>
                                </tr>
                            </table>

                            <div name="videoplatzhalter" style="width:500px; height:300px; background-color: blanchedalmond" ></div>
                        </center>
                    </div>
                </td>
                <td>

                    <div name="suggestions" class="suggestions">
                        <table  align="center" cellpadding="13">
                            <tr><td><img src="../../res/12YearsASlave.jpg" alt="x" style="width:150px" onclick="image()"</td></tr>
                            <tr><td><img src="../../res/22JumpStreet.jpg" alt="x" style="width:150px" onclick="image()"</td></tr>
                            <tr><td><img src="../../res/AllInclusive.jpg" alt="x" style="width:150px" onclick="image()"</td></tr>           
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
