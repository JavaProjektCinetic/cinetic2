<%-- 
    Document   : MoviePage2
    Created on : 08.05.2015, 08:04:07
    Author     : Laura
--%>

<%@page import="beans.ShowAnzeige"%>
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
            HttpSession s = request.getSession();
            LinkedList<Movie> movieList = (LinkedList<Movie>) s.getAttribute("movieList");
            LinkedList<Movie> actualList = (LinkedList<Movie>) s.getAttribute("al");

            Movie actMovie = null;
            if (request.getParameter("name").endsWith("X")) {
                actMovie = movieList.get(Integer.parseInt(request.getParameter("name").substring(0, request.getParameter("name").lastIndexOf('X'))));
            } else {
                actMovie = actualList.get(Integer.parseInt(request.getParameter("name")));
            }
            s.setAttribute("actMovie", actMovie);
            
            LinkedList<Integer> randiList = new LinkedList<>();
            Random randi = new Random();
            do {
                int temp = randi.nextInt(46) + 1;
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
                    <form action="#" method="get">
            <div name="checkbox" style="text-align:right; float:right;" class="lang">
                <select name="lang" onchange="submit();">
                    <option value="de">Deutsch</option>
                    <option value="en">Englisch</option>
                </select>
            </div>
            </form>
                </right> </td></tr></table>
        </div>

        <table align="center" cellpadding="50">
            <tr><td>
                    <div name="<%=actMovie.getTitleEnglish()%>" class="movie">
                        <center>
                            <table>
                                <tr>
                                    <td>
                                        <img src="res/<%=actMovie.getPicture()%>.jpg" alt="<%=actMovie.getTitleGerman()%>" style="width:300px;"/>
                                    </td>
                                    <td>
                                        <p>
                                            <%if (movieList != null) {
                                                    out.println("<h1 style='font-family:Playbill'>" + actMovie.getTitleGerman()+ "</h1>");
                                                    for (int i = 0; i < actMovie.getRating(); i++) {
                                                        out.println("<img src='res/stern.png' style='width:30px'/>");
                                                    }
                                                    out.println("</br>" + actMovie.getDescription());
                                                } else {
                                                    out.println("ERROR: No description found!");
                                                }
                                            %>
                                        </p>
                                    </td>
                                </tr>
                            </table>

                                <iframe width="500" height="300" src="https://www.youtube.com/embed/<%=actMovie.getTrailer()%>?autoplay=1"></iframe>
                                
                            <form action="CineticServlet3" method="get">
                                <select name="datum">
                                    <%
                                    LinkedList<ShowAnzeige>shows = (LinkedList<ShowAnzeige>)s.getAttribute("showList"); 
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    int movieId = actMovie.getMovieID();
                                    String time;
                                    Date date;
                                    String roomname;
                                    System.out.println(shows.size());
                                    for (int i = 0; i<shows.size(); i++)
                                    {
                                    if(movieId==shows.get(i).getMovieID())
                                        {
                                            out.println("<option>"+sdf.format(shows.get(i).getDate())+" | "+shows.get(i).getTime()+" | "+shows.get(i).getRoomName()+"</option>");                                    
                                        }
                                    }
                                    %>
                                </select>   
                                <input type="submit" value="reserve"/> 
                                <p>Hinweis: um mehr Shows anzuzeigen, lade die Seite neu!</p>
                            </form>
                                                
                        </center>
                    </div>

                </td>
                <td>

                    <div name="suggestions" class="suggestions">
                        <form name="1" method="post">
                            <table  align="center" cellpadding="13">
                                <tr><td><div  onclick="schickenX('' +<%=randiList.get(1)%>)"><img src="res/<%=movieList.get(randiList.get(1)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(1)).getTitleGerman()%>" style="width:150px"/></div> </td></tr>
                                <tr><td><div  onclick="schickenX('' +<%=randiList.get(2)%>)"><img src="res/<%=movieList.get(randiList.get(2)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(2)).getTitleGerman()%>" style="width:150px"/></div> </td></tr>
                                <tr><td><div  onclick="schickenX('' +<%=randiList.get(3)%>)"><img src="res/<%=movieList.get(randiList.get(3)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(3)).getTitleGerman()%>" style="width:150px"/></div> </td></tr>           
                            </table>
                        </form>
                    </div>
                    <script>
                        function schicken(name)
                        {
                            document.forms[1].action = "CineticServlet2?name=" + name;
                            document.forms[1].submit();

                        }
                    
                        function schickenX(name)
                        {
                            document.forms[1].action = "CineticServlet2?name=" + name + "X";
                            document.forms[1].submit();

                        }
                    </script>
                </td>
            </tr>
        </table>              


    </body>
</html>

