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
                //opacity: 0.8;                
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
            LinkedList<Integer> randiList = new LinkedList<>();
            Random randi = new Random();

            do {
                int temp = randi.nextInt(49) + 1;
                if (!randiList.contains(temp)) {
                    randiList.add(temp);
                }
            } while (randiList.size() < 8);
        %>
    <center>
        <div class='suggestions' style="display: block">
            Title: <input type="text" name="search" style='margin-top: 20px'/>
            <select>
                <%                    if (genreListE != null) {
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
                <form action="CineticServlet2" name="1" method="post">
                    <table class="table" style="width: 500px; height: 400px;" >
                        <tr><td><b>Suggestions</b></td></tr>
                        <tr>
                            <td align="center"><div onclick="schicken(''+<%=randiList.get(1)%>)"><img border="1" src="res/<%=movieList.get(randiList.get(1)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(1)).getTitleEnglish()%>" style="width:120px"/></div></td>
                            <td align="center"><div onclick="schicken(''+<%=randiList.get(2)%>)"><img border="1" onclick="schicken()" src="res/<%=movieList.get(randiList.get(2)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(2)).getTitleEnglish()%>" style="width:120px" /></div></td>
                            <td align="center"><div onclick="schicken(''+<%=randiList.get(2)%>)"><img border="1" onclick="click(randiList.get(3))" src="res/<%=movieList.get(randiList.get(3)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(3)).getTitleEnglish()%>" style="width:120px" /></div></td>
                        </tr>
                        <tr>
                            <td align="center"><p style="font-size: 16px;"><b><%=movieList.get(randiList.get(1)).getTitleEnglish()%></b></p></br><% for (int i = 0; i < movieList.get(randiList.get(1)).getRating(); i++) {
                                    out.println("<img src='res/stern.png' width='20px'/>");
                                }%></td>
                            <td align="center"><p style="font-size: 16px;"><b><%=movieList.get(randiList.get(2)).getTitleEnglish()%></b></p></br><% for (int i = 0; i < movieList.get(randiList.get(2)).getRating(); i++) {
                                    out.println("<img src='res/stern.png' width='20px'/>");
                                }%></td>
                            <td align="center"><p style="font-size: 16px;"><b><%=movieList.get(randiList.get(3)).getTitleEnglish()%></b></p></br><% for (int i = 0; i < movieList.get(randiList.get(3)).getRating(); i++) {
                                    out.println("<img src='res/stern.png' width='20px'/>");
                                }%></td>
                        </tr>
                    </table>
                </form>
            </div>
            <script>
                function schicken(name)
                {
                    document.forms[0].action = "CineticServlet2?name="+name;
                    document.forms[0].submit();

                }
            </script>

            <div name="lala" id="demo" onclick="bildAuswahl()">Click me to change my text color.</div>


            <div name="results" id="divResults" class='table' style='display: none'>
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
