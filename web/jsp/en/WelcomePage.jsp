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

            div.suggestions
            {
                width:600px;
                height:480px;
                background-color: white;
                //opacity: 0.8;                
            }

            table.table
            {
                width:500px;
            }

            body{
                background-image: url("res/background2.jpg");
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover; 
                background-attachment: fixed;
                background-repeat: no-repeat;

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
            HttpSession s = request.getSession();
            LinkedList<String> genreListE = (LinkedList<String>) s.getAttribute("genreListE");
            LinkedList<String> genreListD = (LinkedList<String>) s.getAttribute("genreListD");
            LinkedList<Movie> movieList = (LinkedList<Movie>) s.getAttribute("movieList");
            LinkedList<Movie> actualList = (LinkedList<Movie>) s.getAttribute("actualList");
            
            s.setAttribute("al", actualList);
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
            <form action="CineticServlet" method="get">
                Title: <input type="text" name="titlefilter" style='margin-top: 20px'/>
                <select name="genrefilter">
                    <% if (genreListE != null) {
                            for (int i = 0; i < genreListE.size(); i++) {
                                out.println("<option>");
                                out.println(genreListE.get(i));
                                out.println("</option>");
                            }
                        }
                    %>
                </select>
                <input type="submit" value="Search"/>
                </br>
                </br>
            </form>
            <form>
                <div class="datagrid">
                    <table>
                        <thead><tr><th>Title</th><th>Genre</th><th>Length</th></tr></thead>
                        <tbody>
                            <%
                                for(int i = 0; i<actualList.size(); i++)
                                {
                                    out.println("<tr><td><p onclick='schicken("+i+")'>" + actualList.get(i).getTitleEnglish() + "</p></td><td>" + actualList.get(i).getGenreEnglish() + "</td><td>" + actualList.get(i).getLength() / 60 + ":" + String.format("%02d", actualList.get(i).getLength() % 60) + "</td></tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>

            </form>

            <div name="suggestions" id="divSuggestions" class="suggestions" style='display: table'>
                <form action="CineticServlet2" name="1" method="post">
                    <table class="table" style="width: 500px; height: 400px;" >
                        <tr><td><b>Suggestions</b></td></tr>
                        <tr>
                            <td align="center"><div onclick="schickenX(<%=randiList.get(1)%>)"><img border="1" src="res/<%=movieList.get(randiList.get(1)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(1)).getTitleEnglish()%>" style="width:120px"/></div></td>
                            <td align="center"><div onclick="schickenX(<%=randiList.get(2)%>)"><img border="1" src="res/<%=movieList.get(randiList.get(2)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(2)).getTitleEnglish()%>" style="width:120px" /></div></td>
                            <td align="center"><div onclick="schickenX(<%=randiList.get(3)%>)"><img border="1" src="res/<%=movieList.get(randiList.get(3)).getPicture()%>.jpg" alt="<%=movieList.get(randiList.get(3)).getTitleEnglish()%>" style="width:120px" /></div></td>
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
                    document.forms[2].action = "CineticServlet2?name=" + name;
                    document.forms[2].submit();
                }
                
                function schickenX(name)
                {
                    document.forms[2].action = "CineticServlet2?name=" + name+"X";
                    document.forms[2].submit();
                }
            </script>

        </div>
    </center>
</body>
</html>
