<%-- 
    Document   : WelcomePage
    Created on : 10.04.2015, 09:47:08
    Author     : Laura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
        </style>

        <title>Welcome Page</title>
    </head>
    <body>
        <div name="cinetic_heading" style="background-color: lightpink">
        <font face="Calibri light" color="#BF9D6F" size=150">
        <table>
            <tr><td><img src="../res/logo.jpg" alt="Cinetic Logo" style="width:120px;height:90px"></td><td></img><p>Cinetic</p></td></tr>
        </table>
        </font>
        <select>
            <option>GER</option>
            <option>ENG</option>
        </select>
        </div>
        <input type="text" name="search"/>
        <select>
            <option>genre1</option>
            <option>genre2</option>
            <option>genre3</option>
        </select>
        <div name="suggestions">
            <table>
                <tr><td>Movie</td><td>Description</td><td>Ranking</td></tr>
                <tr><td>Bild</td><td>blabla</td><td>Sterniiiis</td></tr>
                <tr><td>Bild</td><td>blabla</td><td>Sterniiiis</td></tr>
                <tr><td>Bild</td><td>blabla</td><td>Sterniiiis</td></tr>
                <tr><td>Bild</td><td>blabla</td><td>Sterniiiis</td></tr>
            </table>
        </div>
        <div>
            <table>
                <tr><td>Title</td><td>Length</td><td>Language</td></tr>
                <tr><td>blabla</td><td>Minutiiiiiis</td><td>GER</td></tr>
                <tr><td>blabla</td><td>Minutiiiiiis</td><td>ENG</td></tr>
                <tr><td>blabla</td><td>Minutiiiiiis</td><td>GER</td></tr>
                <tr><td>blabla</td><td>Minutiiiiiis</td><td>GER</td></tr>
            </table>
        </div>
    </body>
</html>
