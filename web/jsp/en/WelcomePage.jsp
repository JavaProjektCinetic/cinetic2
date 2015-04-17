<%-- 
    Document   : WelcomePage
    Created on : 10.04.2015, 09:47:08
    Author     : Laura
--%>

<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
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

            div.suggestions
            {
                width:600px;
                height:480px;
                background-color: white;
                opacity: 0.7;                
            }
            
            div.table{
                height:400px;
                width:500px;
            }
            
            body{
                background-image: url("../../res/background2.jpg");
                background-size: 1366px;
                background-attachment: fixed;
                background-repeat: no-repeat;
                
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
    <center>
        <div class='suggestions'>
            Search: <input type="text" name="search" style='margin-top: 20px'/>
            <select>
                <% LinkedList<String> genreList = (LinkedList<String>) request.getAttribute("genreListE");
                    for (int i = 0; i < genreList.size(); i++)
                    {
                        out.println("<option>");
                        out.println(genreList.get(i));
                        out.println("</option>");
                    }
                %>
            </select>
            <div name="suggestions" class="table" style='display: table'>
                <table border="1" style="width: 500px; height: 400px;" >
                    <tr><td align="center"><b>Movie</b></td><td align="center"><b>Description</b></td><td align="center"><b>Ranking</b></td></tr>
                    <tr><td>Bild</td><td>blabla</td><td>Sterniiiis</td></tr>
                    <tr><td>Bild</td><td>blabla</td><td>Sterniiiis</td></tr>
                    <tr><td>Bild</td><td>blabla</td><td>Sterniiiis</td></tr>
                    <tr><td>Bild</td><td>blabla</td><td>Sterniiiis</td></tr>
                </table>
            </div>
            
            <div name="results" class='table' style='display: none'>
                <table border="1" style="width: 500px; height: 400px;">
                    <tr><td align="center"><b>Title</b></td><td align="center"><b>Length</b></td><td align="center"><b>Language</b></td></tr>
                    <tr><td>blabla</td><td>Minutiiiiiis</td><td>GER</td></tr>
                    <tr><td>blabla</td><td>Minutiiiiiis</td><td>ENG</td></tr>
                    <tr><td>blabla</td><td>Minutiiiiiis</td><td>GER</td></tr>
                    <tr><td>blabla</td><td>Minutiiiiiis</td><td>GER</td></tr>
                </table>
            </div>
        </div>
    </center>
</body>
</html>
