<%--
    Document   : ReservationPage
    Created on : 10.04.2015, 09:48:12
    Author     : Laura
--%>

<%@page import="beans.Room"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@page import="beans.Movie"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Page</title>
        <script type="text/javascript" src="Cinetic.js"></script>
        <style>
            div.header {
                width: 100%;
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
            
            table.table2
            {
                width:100%;
            }

            div.room{
                height:500px;
                width:450px;
                background-color: white;
                opacity: 0.7;
            }

            body
            {
                background-image: url("res/background2.jpg");
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover; 
                background-attachment: fixed;
                background-repeat: no-repeat;
            }

            div.seats2
            {
                height:20px;
                width:20px;
                background-color: greenyellow;
                margin-bottom: 5px;
            }

            div.aisle2
            {
                height:20px;
                width:20px;
            }

            div.seats3
            {

            }

            div.aisle3
            {

            }

            div.seat1
            {
                height:20px;
                width:35px;
                background-color: greenyellow;
                margin-bottom: 20px;
            }

            div.aisle1
            {
                height:20px;
                width:30px;
            }


        </style>
    </head>
    <body>
        <form action="jsp/en/ReservationPage.jsp">
            <%
                HttpSession s = request.getSession();
                LinkedList<Movie> movieList = (LinkedList<Movie>) s.getAttribute("movieList");
                LinkedList<Room> roomList = (LinkedList<Room>) s.getAttribute("roomList");

                //Movie actMovie = (Movie) s.getAttribute("actMovie");
                Movie actMovie2 = movieList.get(1);
                out.println(actMovie2.getTitleEnglish());
                //int roomid = Integer.parseInt(request.getParameter("room"));
                int roomid2 = 2;

                //Date time = (Date) request.getParameter("time");
                LinkedList<Integer> randiList = new LinkedList<>();
                Random randi = new Random();
                do {
                    int temp = randi.nextInt(49) + 1;
                    if (!randiList.contains(temp) && movieList.get(temp) != null) {
                        randiList.add(temp);
                    }
                } while (randiList.size() < 8);
            %>
            <div name="cinetic_header" class="header">
            <table class="table2"><tr><td><left>
            <div name="logo" style="text-align:left; float:left" class='logo'>
                <table>
                    <tr><td><img src="res/logo.png" alt="Cinetic Logo" style="width:120px;height:90px"></img></td><td><span style="font-family: 'Playbill'; font-size:300%">Cinetic</span></td></tr>
                </table>
            </div>
                </left></td>
                <td><right>
            <div name="checkbox" style="text-align:right;" class="lang">
                
                <select>
                    <option>German</option>
                    <option>English</option>
                </select>
            </div>
                </right> </td></tr></table>
        </div>
            <center>
                <h2 style="color: #644030">
                    <span style="font-family: 'Playbill'; font-size:250%"><%=roomList.get(roomid2).getRoomName()%></span></br>18:00
                </h2>
                <div class="room">
                    </br>
                    <table>
                        <%
                            if (roomid2 == 2) {//the room
                                for (int i = 0; i < 15; i++) {
                                    out.println("<tr>");
                                        for (int j = 0; j < 16; j++) {
                                            
                                            if ((j == 7 || j==8) && i > 7) {
                                                out.println("<td><div class='aisle2'/></td>");
                                            } else if (i == 7 || i == 2) {
                                                out.println("<td><div class='aisle2'/></td>");
                                            } else {
                                                out.println("<td><div class='seats2'/></td>");
                                            }
                                        }
                                    }

                                    out.println("</tr>");
                                }
                            }
                            /*
                             if (roomid2 == 2) {
                                
                             }
                             
                             if (roomid2 == 1) {//glamour
                             for (int i = 0; i < 7; i++) {
                             out.println("<tr>");
                             for (int j = 0; j < 11; j++) {
                             if (j == 5) {
                             out.println("<td><div class='aisle1'/></td>");
                             } else {
                             out.println("<td><div class='seat1'/></td>");
                             }
                             }
                             out.println("</tr>");
                             }
                             }
                             */
                        %>
                    </table>
                    </br>
                    </br>
                    <div style="width: 400px; height: 3px; background-color: black"/>
                </div>
                </br>
                <form action="CineticServlet">
                    <table>
                        <tr><td><p>Price: €12,00</p></td><td></td></tr>
                        <tr><td><p>Reservation Number: 214</p></td><td><input type="submit" value="reservate"/></td></tr>            
                    </table>
                </form>
            </center>
        </form>
    </body>
</html>
