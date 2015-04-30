<%-- 
    Document   : WelcomePage
    Created on : 10.04.2015, 09:47:08
    Author     : Laura
--%>

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
            HashMap<Integer, String> desc = (HashMap<Integer, String>) request.getAttribute("desc");
            HashMap<Integer, String> title = (HashMap<Integer, String>) request.getAttribute("title");
            LinkedList<String> genreListE = (LinkedList<String>) request.getAttribute("genreListE");
            LinkedList<String> genreListD = (LinkedList<String>) request.getAttribute("genreListD");
            HashMap<Integer, String> path = (HashMap<Integer, String>) request.getAttribute("path");
            HashMap<Integer, Integer> rate = (HashMap<Integer, Integer>) request.getAttribute("rate");
        %>
    <center>
        <div class='suggestions' style="display: block">
            <%
                if (title != null) {
                    out.println(title.get(1));
                    out.println(title.get(2));
                    out.println(title.get(3));
                }
            %>
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
                <table border="1" class="table" style="width: 500px; height: 400px;" >
                    <tr><td align="center"><b>Movie</b></td><td align="center"><b>Description</b></td><td align="center"><b>Ranking</b></td></tr>
                    <tr><td><img src="res/<%=path.get(28)%>.jpg" alt="<%=title.get(28)%>" style="width:150px" onclick="click()"/></td><td><p style="font-size: 16px;"><b><%=title.get(28)%></b></p></td><td><% for(int i = 0; i < rate.get(28); i++){ out.println("<img src='res/stern.png' width='30px'/>"); }%></td></tr>
                    <tr><td><img src="res/<%=path.get(29)%>.jpg" alt="<%=title.get(29)%>" style="width:150px" onclick="click();"/></td><td><p style="font-size: 16px;"><b><%=title.get(29)%></b></p></td><td><% for(int i = 0; i < rate.get(29); i++){ out.println("<img src='res/stern.png' width='30px'/>"); }%></td></tr>
                    <tr><td><img src="res/<%=path.get(30)%>.jpg" alt="<%=title.get(30)%>" style="width:150px" onclick="click();"/></td><td><p style="font-size: 16px;"><b><%=title.get(30)%></b></p></td><td><% for(int i = 0; i < rate.get(30); i++){ out.println("<img src='res/stern.png' width='30px'/>"); }%></td></tr>
                    <tr><td><img src="res/<%=path.get(31)%>.jpg" alt="<%=title.get(31)%>" style="width:150px" onclick="click();"/></td><td><p style="font-size: 16px;"><b><%=title.get(31)%></b></p></td><td><% for(int i = 0; i < rate.get(31); i++){ out.println("<img src='res/stern.png' width='30px'/>"); }%></td></tr>
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
