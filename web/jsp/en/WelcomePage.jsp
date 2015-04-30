<%-- 
    Document   : WelcomePage
    Created on : 10.04.2015, 09:47:08
    Author     : Laura
--%>

<%@page import="java.util.Random"%>
<%@page import="beans.Movie"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <script type="text/javascript" src="Cinetic.js"></script>
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
                opacity: 0.8;                
            }

            table.table
            {
                height:400px;
                width:500px;
            }

            body{
                background-image: url("res/background2.jpg");
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
        <%
            LinkedList<String> genreListE = (LinkedList<String>) request.getAttribute("genreListE");
            LinkedList<String> genreListD = (LinkedList<String>) request.getAttribute("genreListD");
            LinkedList<Movie> movieList = (LinkedList<Movie>) request.getAttribute("movieList");
            Integer randiArray [] = new Integer[8];
            Random randi = new Random();
            for(int i = 0; i<randiArray.length; i++)
            {
                randiArray[i]= randi.nextInt(49)+1;
            }
        %>
    <center>
        <div class='suggestions' style="display: block">
            Title: <input type="text" name="search" style='margin-top: 20px'/>
            <select>
                <%
                    if (genreListE != null) {
                        for (int i = 0; i < genreListE.size(); i++) {
                            out.println("<option>");
                            out.println(genreListE.get(i));
                            out.println("</option>");
                        }
                    }
                %>
            </select>
            <input type="submit" value="Search"/>

            <div name="suggestions" id="divSuggestions" class="suggestions" style='display: table'>
                <table class="table" style="width: 500px; height: 400px;" >
                    <tr><td align="center"><p style="font-size: 22px;"><b>Movie</b></p></td><td align="center"><p style="font-size: 22px;"><b>Movietitle</b></p></td><td align="center"><p style="font-size: 22px;"><b>Ranking</b></p></td></tr>
                    <tr><td><img src="res/<%=movieList.get(randiArray[0]).getPicture()%>.jpg" alt="<%=movieList.get(randiArray[0]).getTitleEnglish()%>" style="width:150px" onclick="click()"/></td><td><p style="font-size: 16px;"><b><%=movieList.get(randiArray[0]).getTitleEnglish()%></b></p></br><% for(int i = 0; i < movieList.get(randiArray[0]).getRating(); i++){ out.println("<img src='res/stern.png' width='20px'/>"); }%></td></tr>
                    <tr><td><img src="res/<%=movieList.get(randiArray[1]).getPicture()%>.jpg" alt="<%=movieList.get(randiArray[1]).getTitleEnglish()%>" style="width:150px" onclick="click();"/></td><td><p style="font-size: 16px;"><b><%=movieList.get(randiArray[1]).getTitleEnglish()%></b></p></br><% for(int i = 0; i < movieList.get(randiArray[1]).getRating(); i++){ out.println("<img src='res/stern.png' width='20px'/>"); }%></td></tr>
                    <tr><td><img src="res/<%=movieList.get(randiArray[2]).getPicture()%>.jpg" alt="<%=movieList.get(randiArray[2]).getTitleEnglish()%>" style="width:150px" onclick="click();"/></td><td><p style="font-size: 16px;"><b><%=movieList.get(randiArray[2]).getTitleEnglish()%></b></p></br><% for(int i = 0; i < movieList.get(randiArray[2]).getRating(); i++){ out.println("<img src='res/stern.png' width='20px'/>"); }%></td></tr>
                    <tr><td><img src="res/<%=movieList.get(randiArray[3]).getPicture()%>.jpg" alt="<%=movieList.get(randiArray[3]).getTitleEnglish()%>" style="width:150px" onclick="click();"/></td><td><p style="font-size: 16px;"><b><%=movieList.get(randiArray[3]).getTitleEnglish()%></b></p></br><% for(int i = 0; i < movieList.get(randiArray[3]).getRating(); i++){ out.println("<img src='res/stern.png' width='20px'/>"); }%></td></tr>
                </table>
            </div>

            <div name="results" id="divResults" class='table' style='display: block'>
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
