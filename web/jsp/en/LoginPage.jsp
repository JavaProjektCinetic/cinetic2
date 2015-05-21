<%-- 
    Document   : LoginPage
    Created on : 10.04.2015, 09:47:45
    Author     : Laura
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="beans.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
        </style>
    </head>
    <body>
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
                
                <h1>Login</h1>
                <h4>Please log in before reservating a seat!</h4>
                Name<input type="text" id="username" name="username"/></br>
                Telephone number<input type="text" id="tel" name="tel"/>
                <input type="submit" value="Login"/>
               
            </center>
        
    </body>
</html>
