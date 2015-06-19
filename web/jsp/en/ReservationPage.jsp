<%--
    Document   : ReservationPage
    Created on : 10.04.2015, 09:48:12
    Author     : Laura
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.ShowAnzeige"%>
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
                opacity: 0.8;
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

            .seats2 
            {
                font-family: Arial;
                color: #39db51;
                font-size: 21px;
                background: #34d939;
                height:20px;
                width:20px;
                text-decoration: none;
            }

            .seats21 
            {
                font-family: Arial;
                color: #db1b1b;
                font-size: 21px;
                background: #db1b1b;;
                height:20px;
                width:20px;
                text-decoration: none;
            }
            .seats22 
            {
                font-family: Arial;
                color: #c0c0c0;
                font-size: 21px;
                background: #c0c0c0;;
                height:20px;
                width:20px;
                text-decoration: none;
            }

            div.aisle2
            {
                height:20px;
                width:20px;
            }

            .seats3 
            {
                font-family: Arial;
                color: #39db51;
                font-size: 21px;
                background: #34d939;
                height:60px;
                width:45px;
                text-decoration: none;
            }

            .seats31 
            {
                font-family: Arial;
                color: #db1b1b;
                font-size: 21px;
                background: #db1b1b;
                height:60px;
                width:45px;
                text-decoration: none;
            }

            .seats32 
            {
                font-family: Arial;
                color: #c0c0c0;
                font-size: 21px;
                background: #c0c0c0;
                height:60px;
                width:45px;
                text-decoration: none;
            }

            .seats1 
            {
                font-family: Arial;
                color: #39db51;
                font-size: 21px;
                background: #34d939;
                height:20px;
                width:35px;
                text-decoration: none;
            }

            .seats11 
            {
                font-family: Arial;
                color: #db1b1b;
                font-size: 21px;
                background: #db1b1b;
                height:20px;
                width:35px;
                text-decoration: none;
            }

            .seats12 
            {
                font-family: Arial;
                color: #c0c0c0;
                font-size: 21px;
                background: #c0c0c0;
                height:20px;
                width:35px;
                text-decoration: none;
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
            LinkedList<Room> roomList = (LinkedList<Room>) s.getAttribute("roomList");
            LinkedList<String> reservatedSeat = (LinkedList<String>) s.getAttribute("reservateSeats");
            ShowAnzeige sh = (ShowAnzeige) s.getAttribute("choosenShow");
            Movie actMovie2 = (Movie) s.getAttribute("choosenMovie");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            int reservatID = (Integer) s.getAttribute("reservationID");
            int preis = 0;
            LinkedList<String> resSeats = (LinkedList<String>) s.getAttribute("reserSeats");
            String str = sdf.format(sh.getDate());
            String strArray[] = str.split("-");
            String datum = actMovie2.getTitleEnglish() + " " + strArray[2] + "." + strArray[1] + "." + strArray[0] + "     " + sh.getTime();
            int roomid2 = 0;
            for (int i = 0; i < roomList.size(); i++) {
                if (roomList.get(i).getRoomName().equals(sh.getRoomName())) {
                    roomid2 = roomList.get(i).getRoomId();
                }
            }
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
        <h2 style="color: #644030"><span style="font-family: 'Playbill'; font-size:250%"><%=sh.getRoomName()%></span></br><%=datum%></h2>  
        <div class="room">
            </br>
            <form action="CineticServlet4" method="post">
                <table id="roomview">


                    <%
                        if (roomid2 == 2) {//cozy
                            for (int i = 0; i < 5; i++) {
                                out.println("<tr>");
                                for (int j = 0; j < 6; j++) {
                                    if (resSeats.isEmpty()) {
                                        if (!reservatedSeat.isEmpty()) {
                                            String stri = i + "X" + j;
                                            if (reservatedSeat.contains(stri)) {
                                                out.println("<td><input type='submit' class=seats31 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");

                                            } else {
                                                out.println("<td><input type='submit' class=seats3 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                            }
                                        } else {
                                            out.println("<td><input type='submit' class=seats3 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                        }
                                    } else if (!resSeats.isEmpty()) {
                                        String stri = i + "X" + j + "X" + sh.getShowid();
                                        if (resSeats.contains(stri)) {
                                            out.println("<td><input type='submit' class=seats32 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + " disabled='disabled'/></td>");
                                        } else {
                                            if (!reservatedSeat.isEmpty()) {
                                                stri = i + "X" + j;
                                                if (reservatedSeat.contains(stri)) {
                                                    out.println("<td><input type='submit' class=seats31 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");

                                                } else {
                                                    out.println("<td><input type='submit' class=seats3 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                                }
                                            } else {
                                                out.println("<td><input type='submit' class=seats3 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                            }
                                        }
                                    }
                                }
                                out.println("</tr>");
                            }
                            preis = roomList.get(1).getPreis();
                        }

                        if (roomid2 == 3) {//glamour
                            for (int i = 0; i < 7; i++) {
                                out.println("<tr>");
                                for (int j = 0; j < 11; j++) {
                                    if (j == 5) {
                                        out.println("<td><div class='aisle1'/></td>");
                                    } else {
                                        if (resSeats.isEmpty()) {
                                            if (!reservatedSeat.isEmpty()) {
                                                String stri = i + "X" + j;
                                                if (reservatedSeat.contains(stri)) {
                                                    out.println("<td><input type='submit' class=seats11 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");

                                                } else {
                                                    out.println("<td><input type='submit' class=seats1 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                                }
                                            } else {
                                                out.println("<td><input type='submit' class=seats1 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                            }
                                        } else if (!resSeats.isEmpty()) {
                                            String stri = i + "X" + j + "X" + sh.getShowid();
                                            if (resSeats.contains(stri)) {
                                                out.println("<td><input type='submit' class=seats12 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + " disabled='disabled'/></td>");
                                            } else {
                                                if (!reservatedSeat.isEmpty()) {
                                                    stri = i + "X" + j;
                                                    if (reservatedSeat.contains(stri)) {
                                                        out.println("<td><input type='submit' class=seats11 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");

                                                    } else {
                                                        out.println("<td><input type='submit' class=seats1 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                                    }
                                                } else {
                                                    out.println("<td><input type='submit' class=seats1 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                                }

                                            }
                                        }
                                        
                                        
                                        
                                        
                                    }
                                }
                                out.println("</tr>");
                            }
                            preis = roomList.get(2).getPreis();
                        }

                        if (roomid2 == 1) {//the room
                            for (int i = 0; i < 15; i++) {
                                out.println("<tr>");
                                for (int j = 0; j < 16; j++) {
                                    if ((j == 10 || j == 5) && i > 7) {
                                        out.println("<td><div class='aisle2'/></td>");
                                    } else if (i == 7 || i == 2) {
                                        out.println("<td><div class='aisle2'/></td>");
                                    } else {
                                        if (resSeats.isEmpty()) {
                                            if (!reservatedSeat.isEmpty()) {
                                                String stri = i + "X" + j;
                                                if (reservatedSeat.contains(stri)) {
                                                    out.println("<td><input type='submit' class=seats21 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");

                                                } else {
                                                    out.println("<td><input type='submit' class=seats2 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                                }
                                            } else {
                                                out.println("<td><input type='submit' class=seats2 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                            }
                                        } else if (!resSeats.isEmpty()) {
                                            String stri = i + "X" + j + "X" + sh.getShowid();
                                            if (resSeats.contains(stri)) {
                                                out.println("<td><input type='submit' class=seats22 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + " disabled='disabled'/></td>");
                                            } else {
                                                if (!reservatedSeat.isEmpty()) {
                                                    stri = i + "X" + j;
                                                    if (reservatedSeat.contains(stri)) {
                                                        out.println("<td><input type='submit' class=seats21 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");

                                                    } else {
                                                        out.println("<td><input type='submit' class=seats2 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                                    }
                                                } else {
                                                    out.println("<td><input type='submit' class=seats2 value='" + i + "X" + j + "' name='cozy' id=" + i + "X" + j + "/></td>");
                                                }

                                            }
                                        }
                                    }
                                }
                            }

                            out.println("</tr>");
                            preis = roomList.get(0).getPreis();
                        }
                        s.setAttribute("preis", preis);

                    %>
                </table>
            </form>
            </br>
            </br>
            <div style="width: 400px; height: 3px; background-color: black"/>
        </div>
        </br>
        <form action="CineticServlet5">         
            <table>
                <%                    if (reservatedSeat.size() > 0) {
                        out.println("<tr><td><p>Price: </p></td><td><p>" + preis + ".00€ x " + reservatedSeat.size() + " = " + reservatedSeat.size() * preis + ".00 €</p></td></tr>");
                    } else {
                        out.println("<tr><td><p>Price: </p></td><td></td></tr>");
                    }
                %>

                <tr><td><p>Reservation Number: <%=reservatID%></p></td><td><input type="submit" value="reservate"/></td></tr>            
            </table>
        </form>
    </center>
</body>
</html>
