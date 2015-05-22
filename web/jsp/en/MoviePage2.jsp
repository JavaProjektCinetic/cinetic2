<%-- 
    Document   : MoviePage2
    Created on : 08.05.2015, 08:04:07
    Author     : Laura
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.Room"%>
<%@page import="beans.Show"%>
<%@page import="java.util.Date"%>
<%@page import="database.DB_Access"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.LinkedList"%>
<%@page import="beans.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Page</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>  
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script>
            $(function () {
                $("#datepicker").datepicker({minDate: 0, maxDate: "+1M -1D"});
                $("#datepicker").datepicker("option", "dateFormat", "dd.mm.yy");
            });
        </script>
        <style>
            div.header 
            {
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

            div.movie{
                border-style: inset;
                border-width: 5px;
                border-color: #644030;
                width:800px;
                background-color: white;
                //opacity: 0.9;
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
        </style>
    </head>
    <body>
        <%
            LinkedList<Movie> movieList = (LinkedList<Movie>) request.getAttribute("movieList");
            int param = Integer.parseInt(request.getParameter("name"));
            LinkedList<Integer> randiList = new LinkedList<>();
            Random randi = new Random();
            do {
                int temp = randi.nextInt(49) + 1;
                if (!randiList.contains(temp)) {
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


        <table style="float:right" cellpadding="15">
            <tr><td>
                    <div name="<%=movieList.get(param).getTitleEnglish()%>" class="movie">
                        <center>
                            <table>
                                <tr>
                                    <td>
                                        <img src="res/<%=movieList.get(param).getPicture()%>.jpg" alt="<%=movieList.get(param).getTitleEnglish()%>" style="width:300px;"/>
                                    </td>
                                    <td>
                                        <p>
                                            <%if (movieList != null) {
                                                    out.println("<h1 style='font-family:Playbill'>" + movieList.get(param).getTitleEnglish() + "</h1>");
                                                    for (int i = 0; i < movieList.get(param).getRating(); i++) {
                                                        out.println("<img src='res/stern.png' style='width:30px'/>");
                                                    }
                                                    out.println("</br>" + movieList.get(param).getDescription());
                                                } else {
                                                    out.println("ERROR: No description found!");
                                                }
                                            %>
                                        </p>
                                    </td>
                                </tr>
                            </table>

                            <div name="videoplatzhalter" style="width:500px; height:300px; background-color: blanchedalmond" ></div>
                            <form action="CineticServlet3" method="post">
                                <table>
                                    <tr>
                                        <td>
                                            <select name="Show">
                                                <%       
                                            LinkedList<Show> showList = (LinkedList<Show>) request.getAttribute("showList");
                                                    LinkedList<Room> roomList = (LinkedList<Room>) request.getAttribute("roomList");
                                                    String room = "";
                                                    SimpleDateFormat forDate = new SimpleDateFormat("yyyy-MM-dd");
                                                    SimpleDateFormat forTime = new SimpleDateFormat("hh:MM:ss");
                                                    for(int i = 0; i<showList.size(); i++)
                                                    {
                                                        if(movieList.get(param).getMovieID() == showList.get(i).getMovieID())
                                                        {
                                                            for(int j = 0; j<roomList.size(); j++)
                                                            {
                                                                System.out.println("id" + roomList.get(j).getRoomID());
                                                                if(showList.get(i).getRoomID() == roomList.get(j).getRoomID())
                                                                {
                                                                    
                                                                    room = roomList.get(j).getRoomName();
                                                                    System.out.println(room);
                                                                }
                                                            }
                                                            out.println("<option>"+ room+" "+forDate.format(showList.get(i).getDate())+" " + forTime.format(showList.get(i).getTime())+"</option>");
                                                        }     
                                                    }
                                                    
                                                %>
                                                
                                            </select>
                                            <input type="text" id="datepicker" name="reservationdate"/>
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
                            </form>
                        </center>
                    </div>

                </td>
                <td>

                    <div name="suggestions" class="suggestions">
                        <form name="1" method="post">
                            <table  align="center" cellpadding="13">
                                <tr><td><div  onclick="schicken('' +<%=randiList.get(1)%>)"><img src="res/<%=movieList.get(randiList.get(1)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(1)).getTitleEnglish()%>" style="width:150px"/></div> </td></tr>
                                <tr><td><div  onclick="schicken('' +<%=randiList.get(2)%>)"><img src="res/<%=movieList.get(randiList.get(2)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(2)).getTitleEnglish()%>" style="width:150px"/></div> </td></tr>
                                <tr><td><div  onclick="schicken('' +<%=randiList.get(3)%>)"><img src="res/<%=movieList.get(randiList.get(3)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(3)).getTitleEnglish()%>" style="width:150px"/></div> </td></tr>           
                            </table>
                        </form>
                    </div>
                    <script>
                        function schicken(name)
                        {
                            document.forms[1].action = "CineticServlet2?name=" + name;
                            document.forms[1].submit();
                        }
                    </script>
                </td>
            </tr>
        </table>              

    </body>
</html>
