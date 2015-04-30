<%-- 
    Document   : MoviePage
    Created on : 10.04.2015, 09:47:35
    Author     : Laura
--%>

<%@page import="beans.Movie"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Page</title>
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

            div.movie{
                border-style: inset;
                border-width: 5px;
                border-color: #644030;
                width:800px;
                background-color: white;
                opacity: 0.9;
            }

            div.suggestions
            {
                width:180px;
                background-color: white;
                opacity: 0.8;
                float: right;
                border-style: inset;
                border-width: 5px;
                border-color: #644030;
            }

            body
            {
                background-image: url("res/background2.jpg");
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
        <form action="LoginPage.jsp">
            <%
                LinkedList<Movie> movieList = (LinkedList<Movie>) request.getAttribute("movieList");
            
            %>
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
            <table style="float:right" cellpadding="15">
                <tr><td>
                        <div name="<%=movieList.get(1).getTitleEnglish()%>" class="movie">
                            <center>
                                <table>
                                    <tr>
                                        <td>
                                            <img src="res/<%=movieList.get(1).getPicture()%>.jpg" alt="<%=movieList.get(1).getTitleEnglish()%>" style="width:300px;"/>
                                        </td>
                                        <td>
                                            <p class="description">
                                                <%if (movieList != null) {
                                                        out.println("<h1 style='font-family:Playbill'>" + movieList.get(1).getTitleEnglish() + "</h1>");
                                                        for (int i = 0; i < movieList.get(1).getRating(); i++) {
                                                            out.println("<img src='res/stern.png' style='width:30px'/></br>");
                                                        }
                                                        out.println(movieList.get(1).getDescription());
                                                    } else {
                                                        out.println("ERROR: No description found!");
                                                    }
                                                %></p>
                                        </td>
                                    </tr>
                                </table>

                                <div name="videoplatzhalter" style="width:500px; height:300px; background-color: blanchedalmond" ></div>
                                <table>
                                    <tr>
                                        <td>
                                            <input type="date" name="date"/>
                                            <table border="1">
                                                <tr><td>Time</td><td>Room</td>
                                                <tr><td>18:00</td><td>Cozy Room</td></tr>
                                                <tr><td>20:30</td><td>the Room</td></tr>
                                                <tr><td>21:45</td><td>Cozy Room</td></tr>
                                            </table>
                                        </td>
                                        <td>
                                            <input type="submit" value="reserve"/>
                                        </td>
                                    </tr>
                                </table>
                            </center>
                        </div>
                    </td>
                    <td>

                        <div name="suggestions" class="suggestions">
                            <table  align="center" cellpadding="13">
                                <tr><td><img src="res/<%=path.get(6)%>.jpg" alt="<%=title.get(6)%>" style="width:150px" </td></tr>
                                <tr><td><img src="res/<%=path.get(4)%>.jpg" alt="<%=title.get(4)%>" style="width:150px" </td></tr>
                                <tr><td><img src="res/<%=path.get(9)%>.jpg" alt="<%=title.get(9)%>" style="width:150px" </td></tr>           
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
