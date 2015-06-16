<%--
    Document   : ReservationPage
    Created on : 10.04.2015, 09:48:12
    Author     : Laura
--%>

<%@page import="beans.Seat"%>
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
                height:60px;
                width:45px;
                background-color: greenyellow;
                margin-bottom: 15px;
                margin-right: 20px;
            }

            div.aisle3
            {

            }

            div.seats1
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

        <%
            HttpSession s = request.getSession();
            LinkedList<Movie> movieList = (LinkedList<Movie>) s.getAttribute("movieList");
            LinkedList<Room> roomList = (LinkedList<Room>) s.getAttribute("roomList");
            LinkedList<Seat> selectedSeatList = new LinkedList<>();
            
            //Movie actMovie = (Movie) s.getAttribute("actMovie");
            Movie actMovie2 = movieList.get(1);
            //out.println(actMovie2.getTitleEnglish());
            //int roomid = Integer.parseInt(request.getParameter("room"));
            int roomid2 = 2;

            //Date time = (Date) request.getParameter("time");
            LinkedList<Integer> randiList = new LinkedList<>();
            Random randi = new Random();
            do {
                int temp = randi.nextInt(46) + 1;
                if (!randiList.contains(temp) && movieList.get(temp) != null) {
                    randiList.add(temp);
                }
            } while (randiList.size() < 8);
        %>
        <div class="header">
            <table class="table2"><tr><td>
                    <div style="text-align:left; float:left" class='logo'>
                        <table>
                            <tr><td><img src="res/logo.png" alt="Cinetic Logo" style="width:120px;height:90px"></td><td><span style="font-family: 'Playbill'; font-size:300%">Cinetic</span></td></tr>
                        </table>
                    </div>
                </td>
                <td>
                    <form action="#" method="get">
            <div style="text-align:right; float:right;" class="lang">
                <select name="lang" onchange="submit();">
                    <option value="en">English</option>
                    <option value="de">German</option>
                </select>
            </div>
            </form>
                </td></tr></table>
        </div>
    <center>
        <h2 style="color: #644030"><span style="font-family: 'Playbill'; font-size:250%"><%=roomList.get(roomid2).getRoomName()%></span></br>18:00</h2>  
        <div class="room">
            </br>
            <form action="CineticServlet">
                <table id="roomview">

                    <%
                        if (roomid2 == 0) {//cozy
                            for (int i = 0; i < 5; i++) {
                                out.println("<tr>");
                                for (int j = 0; j < 6; j++) {
                                    out.println("<td><div onclick='selectseat("+i+","+j+")' id="+i+"X"+j+" class='seats3'/></td>");
                                }
                                out.println("</tr>");
                            }
                        }

                        if (roomid2 == 1) {//glamour
                            for (int i = 0; i < 7; i++) {
                                out.println("<tr>");
                                for (int j = 0; j < 11; j++) {
                                    if (j == 5) {
                                        out.println("<td><div class='aisle1'/></td>");
                                    } else {
                                        out.println("<td><div onclick='selectseat("+i+","+j+")' id="+i+"X"+j+" class='seats1'/></td>");
                                    }
                                }
                                out.println("</tr>");
                            }
                        }

                        if (roomid2 == 2) {//the room
                            for (int i = 0; i < 15; i++) {
                                out.println("<tr>");
                                for (int j = 0; j < 16; j++) {

                                    if ((j == 10 || j == 5) && i > 7) {
                                        out.println("<td><div class='aisle2'/></td>");
                                    } else if (i == 7 || i == 2) {
                                        out.println("<td><div class='aisle2'/></td>");
                                    } else {
                                        out.println("<td><div onclick='selectseat("+i+","+j+")' id="+i+"X"+j+" class='seats2'/></td>");
                                    }
                                }
                            }

                            out.println("</tr>");
                        }


                    %>
                </table>
            </form>
            </br>
            </br>
            <div style="width: 400px; height: 3px; background-color: black"/>
        </div>
        </br>
        <form action="ReservationPage.jsp">
            <input type="button" onclick="rollback()" value="cancel selection"/>
            <table>
                <tr><td><p>Price:</p></td><td></td></tr>
                <tr><td><p>Reservation Number:</p></td><td><input type="submit" value="reservate"/></td></tr>            
            </table>
        </form>
    </center>


    <script>
        function selectseat(zeile, spalte)
        {
            document.getElementById(zeile+"X"+spalte).style.backgroundColor = '#FF0000';
        }
        
        function rollback()
        {
        }
    </script>
</body>
</html>
