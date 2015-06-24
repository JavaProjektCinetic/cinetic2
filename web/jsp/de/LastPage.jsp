<%-- 
    Created on : 16.06.2015
    Author     : Sarah Resch
    Projectname: Cinetic
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.LinkedList"%>
<%@page import="beans.ShowAnzeige"%>
<%@page import="beans.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation Summary</title>
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
            div.room{

                width:450px;
                background-color: white;
                opacity: 0.8;
            }

            .datagrid table 
            { border-collapse: collapse; 
              text-align: left; width: 100%;
              width:500px;
            } 

            .datagrid 
            {font: normal 12px/150% Georgia, Times New Roman, Times, serif; 
             background: #fff; 
             overflow: hidden; 
             -webkit-border-radius: 7px; 
             -moz-border-radius: 7px; 
             
            }

            .datagrid table td, .datagrid table th 
            { 
                padding: 5px 14px;
            }

            .datagrid table thead th 
            {
                background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #AD866F), color-stop(1, #644030) );
                background:-moz-linear-gradient( center top, #AD866F 5%, #644030 100% );
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#AD866F', endColorstr='#644030');
                background-color:#AD866F; 
                color:#FFFFFF; 
                font-size: 15px; 
                font-weight: bold; 
            } 

            .datagrid table thead th:first-child 
            { 
                border: none; 
            }

            .datagrid table tbody td
            { 
                color: #AD866F; 
                border-left: 1px solid #AD866F;
                font-size: 13px;
                font-weight: normal; 
            }

            .datagrid table tbody .alt td 
            { background: #AD866F;
              color: #644030; 
            }

            .datagrid table tbody td:first-child 
            { 
                border-left: none; 
            }

            .datagrid table tbody tr:last-child td 
            { 
                border-bottom: none; 
            }

            div.dhtmlx_window_active, div.dhx_modal_cover_dv 
            { 
                position: fixed !important; 
            }
        </style>
    </head>
    <body>
        <%
            HttpSession s = request.getSession();
            String username = (String) s.getAttribute("username");
            String tel = (String)s.getAttribute("tel");
            Movie actMovie2 = (Movie) s.getAttribute("choosenMovie");
            ShowAnzeige sh = (ShowAnzeige) s.getAttribute("choosenShow");
            LinkedList<String> reservatedSeat = (LinkedList<String>) s.getAttribute("reservateSeats");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            int reservatID = (Integer)s.getAttribute("reservationID");
            String str = sdf.format(sh.getDate());
            String strArray[] = str.split("-");
            String date = strArray[2] + "." + strArray[1] + "." + strArray[0] + "     " + sh.getTime();
            String seats="";
            for(int i = 0; i<reservatedSeat.size(); i++)
            {
                String rs = reservatedSeat.get(i);
                String strArray2[] = rs.split("X");
                seats+="Row: "+ (Integer.parseInt(strArray2[0])+1) + " Column: "+(Integer.parseInt(strArray2[1])+1)+"<br>";
            }
            int k = (Integer)s.getAttribute("preis");
            int price = reservatedSeat.size()*k;
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
                    <option value="de">Deutsch</option>
                    <option value="en">Englisch</option>
                </select>
            </div>
            </form>
                 </td></tr></table>
        </div>
        
            <center>
                <h2 style="color: #644030"><span style="font-family: 'Playbill'; font-size:250%">Reservierung für <%=actMovie2.getTitleGerman()%></span></h2>
                <font color="#644030" face='Georgia'>
        <div class="room">

            <table>
                <tr><td><b>Name: </b></td><td><%=username%></td>
                <tr><td><b>Telefon Nummer: </b></td><td><%=tel%></td></tr> 
                <tr><td><b>Datum: </b></td><td><%=date%></td></tr>
                <tr><td><b>Raum: </b></td><td><%=sh.getRoomName()%></td></tr>
                <tr><td><b>Sitze: </b></td><td><%=seats%></td></tr>
                <tr><td><b>Preis: </b></td><td><%=price%>.00 €</td></tr>
                <tr><td><b>Reservierungs Nummer:&nbsp;&nbsp;&nbsp;</b></td><td><%=reservatID%></td></tr>                        
            </table>

        </div>
        </font>
                <p>Bitte vergiss deine Reservierungs Nummer nicht! Du brauchst sie um deine Tickets zu bekommen.</p>
                <form action="CineticServlet6">
                    <input type="submit" value="Reservierung fertigstellen"/>
                </form>
            </center>
        
    </body>
</html>
