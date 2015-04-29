<%-- 
    Document   : MoviePage
    Created on : 10.04.2015, 09:47:35
    Author     : Laura
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
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
        <%
            HashMap<Integer, String> desc = (HashMap<Integer, String>) request.getAttribute("desc");
            HashMap<Integer, String> title = (HashMap<Integer, String>) request.getAttribute("title");
            HashMap<Integer, String> path = (HashMap<Integer, String>) request.getAttribute("path");
            HashMap<Integer, String> rate = (HashMap<Integer, String>) request.getAttribute("rate");
            
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
                    <div name="<%=title.get(1)%>" class="movie">
                         <center>
                            <table>
                                <tr>
                                    <td>
                                        <img src="res/<%=path.get(1)%>.jpg" alt="<%=title.get(1)%>" style="width:300px;"/>
                                    </td>
                                    <td>
                                        <p class="description">
                                            <%if (desc != null) {
                                                    out.println("<h1 style='font-family:Playbill'>"+title.get(1)+"</h1>");
                                                    //schauen wie die bewertung ist
                                                    out.println("<img src='res/stern.png' style='width:30px'/></br>");
                                                    out.println(desc.get(1));
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
                                        <table border="1">
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
                            <tr><td><img src="res/<%=path.get(6)%>.jpg" alt="<%=title.get(6)%>" style="width:150px" onclick="click()"</td></tr>
                            <tr><td><img src="res/<%=path.get(4)%>.jpg" alt="<%=title.get(4)%>" style="width:150px" onclick="click()"</td></tr>
                            <tr><td><img src="res/<%=path.get(9)%>.jpg" alt="<%=title.get(9)%>" style="width:150px" onclick="click()"</td></tr>           
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
