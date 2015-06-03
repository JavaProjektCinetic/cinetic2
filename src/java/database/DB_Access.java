/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import beans.Movie;
import beans.Room;
import beans.Seat;
import beans.Show;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Random;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Laura
 */
public class DB_Access {

    private DB_ConnectionPool connPool;
    private static DB_Access theInstance = null;
    private LinkedList<Show> showList = new LinkedList<>();

    public static DB_Access getTheInstance() throws ClassNotFoundException {
        if (theInstance == null) {
            theInstance = new DB_Access();
        }
        return theInstance;
    }

    private DB_Access() throws ClassNotFoundException {
        connPool = DB_ConnectionPool.getTheInstance();
    }

    public LinkedList<Show> getShows() throws Exception
    {
        LinkedList<Show> shows = new LinkedList<>();
        SimpleDateFormat forDate = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat forTime = new SimpleDateFormat("hh:MM:ss");
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT roomid, movieid, date, takenseats, showid, time, freeseats " +
                            "FROM show";
        ResultSet rs = stat.executeQuery(sqlString);
        int roomid, movieid, takenseats, showid, freeseats;
        Date d, time;
        while(rs.next())
        {
            roomid = Integer.parseInt(rs.getString(1));
            movieid = Integer.parseInt(rs.getString(2));
            d = forDate.parse(rs.getString(3));
            takenseats = Integer.parseInt(rs.getString(4));
            showid = Integer.parseInt(rs.getString(5));
            time = forTime.parse(rs.getString(6));
            freeseats = Integer.parseInt(rs.getString(7));           
            Show s = new Show(roomid, movieid, d, takenseats, showid, time, freeseats);
            shows.add(s);
        }  
        return shows;
    }

    public void setShows() throws Exception {
        LinkedList<Show> showList = new LinkedList<>();
        SimpleDateFormat forDate = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat forTime = new SimpleDateFormat("hh:MM:ss");
        LinkedList<Room> rooms = getRoomList();
        LinkedList<String> time = new LinkedList<>();
        time.add("15:00:00");
        time.add("18:00:00");
        time.add("21:00:00");
        time.add("24:00:00");
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT MAX(date)"
                + "FROM show";
        ResultSet rs = stat.executeQuery(sqlString);
        Date dmax;
        String str = "";
        while (rs.next()) {
            str = rs.getString(1);
        }
        dmax = forDate.parse(str);
        int day = dmax.getDate();
        int month = dmax.getMonth();
        int year = 2015;
        stat = conn.createStatement();
        sqlString = "SELECT MAX(showid)"
                + "FROM show";
        rs = stat.executeQuery(sqlString);
        int showID;
        str = "";
        while (rs.next()) {
            str = rs.getString(1);
        }
        showID = Integer.parseInt(str);

        for (int i = 1; i <= 7; i++) {
            switch (month) {
                case 0:
                    if (day == 31) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 1:
                    if (day == 28) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 2:
                    if (day == 31) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 3:
                    if (day == 30) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 4:
                    if (day == 31) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 5:
                    if (day == 30) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 6:
                    if (day == 31) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 7:
                    if (day == 31) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 8:
                    if (day == 30) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 9:
                    if (day == 31) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 10:
                    if (day == 30) {
                        month++;
                        day = 1;
                    } else {
                        day++;
                    }
                    break;
                case 11:
                    if (day == 31) {
                        month = 0;
                        day = 1;
                        year++;
                    } else {
                        day++;
                    }
                    break;
            }
            Random randi = new Random();  
            String dDate = year + "-" + (month+1) + "-" + day;
            Date d = forDate.parse(dDate);

            for (int roomID = 1; roomID <= 3; roomID++) {
                for (int j = 0; j < time.size(); j++) {
                    showID++;
                    int movieID = randi.nextInt(getCountMovies());
                    String t = time.get(j);
                    Date ti = forTime.parse(t);
                    Show s = new Show(roomID, (movieID+1), d, 0, showID, ti, rooms.get(roomID-1).getSeats());
                    showList.add(s);                  
                }
            }
        }
        for (int i = 0; i < showList.size(); i++) {
            Show s = showList.get(i);
            stat = conn.createStatement(); //roomID, movieID, date, showID, takenseats, time, freeseats
            sqlString = "INSERT INTO show VALUES ("+s.getRoomID()+", "+s.getMovieID()+", '"+forDate.format(s.getDate())+"', "+s.getShowid()+", 0, '"+forTime.format(s.getDate())+"', "+rooms.get(s.getRoomID()-1).getSeats()+")";
            stat.executeUpdate(sqlString);
        }
        connPool.releaseConnection(conn);
    }

    public void setSeats() throws Exception {
        LinkedList<Room> roomL = getRoomList();
        LinkedList<Seat> seatList = new LinkedList<>();
        Seat s;
        Connection conn = connPool.getConnection();
        for (int i = 0; i < roomL.size(); i++) {
            Room r = roomL.get(i);
            System.out.println(r.getRoomName());
            if (r.getRoomName().equals("Cozy Room")) {
                for (int row = 1; row <= 6; row++) {
                    for (int column = 1; column <= 16; column++) {
                        s = new Seat(column, row, r.getRoomName());
                        seatList.add(s);
                        if (row <= 5 && column == 12) {
                            column = 17;
                        }
                    }
                }
            } else if (r.getRoomName().equals("Glamour Room")) {
                for (int row = 1; row <= 7; row++) {
                    for (int column = 1; column <= 10; column++) {
                        s = new Seat(column, row, r.getRoomName());
                        seatList.add(s);
                    }
                }
            } else if (r.getRoomName().equals("The Room")) {
                for (int row = 1; row <= 13; row++) {
                    for (int column = 1; column <= 20; column++) {
                        s = new Seat(column, row, r.getRoomName());
                        seatList.add(s);
                        if (row <= 8 && column == 14) {
                            column = 21;
                        } else if (row <= 12 && column == 15) {
                            column = 21;
                        }
                    }
                }
            }
        }
        for (int i = 0; i < seatList.size(); i++) {
            s = seatList.get(i);
            System.out.println("Roomname: " + s.getRoomName() + " Reihe: " + s.getRow() + " Sitz: " + s.getColumn());
            Statement stat = conn.createStatement();
            String sqlString = "INSERT INTO seat VALUES (" + (i + 1) + ", " + s.getColumn() + ", " + s.getRow() + ", (SELECT roomid"
                    + "                                     FROM room"
                    + "                                     WHERE name = '" + s.getRoomName() + "'));";
            stat.executeUpdate(sqlString);
        }
        connPool.releaseConnection(conn);
    }

    public LinkedList<Room> getRoomList() throws Exception {
        Connection conn = connPool.getConnection();
        LinkedList<Room> roomList = new LinkedList<>();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT roomid, name, seats FROM room";
        ResultSet rs = stat.executeQuery(sqlString);
        int id;
        String name;
        int seats;
        while (rs.next()) {
            id = rs.getInt("roomid");
            name = rs.getString("name");
            seats = rs.getInt("seats");
            Room r = new Room(id,name,seats);
            roomList.add(r);
        }
        return roomList;
    }

    public LinkedList<Movie> getMovieList(String t, String g) throws Exception //parameter upper case
    {
        //Int id, String titleEnglish, String picture, String description, String trailer, String music, String titleGerman, int rating, String genreEnglish, String genreGerman, int length
        Connection conn = connPool.getConnection();
        LinkedList<Movie> movieList = new LinkedList<>();
        Statement stat = conn.createStatement();
        t = t.toUpperCase();
        
        if(g.equals("All Movies"))
        {
            g="";
        }
        if(t==null || t.equals(""))
        {
            t="";
        }
        String sqlString = "SELECT movieid, title, picture, description, trailer, music, titlegerman, rating, genre, genregerman, length "
                         + "FROM movie "
                         + "WHERE upper(title) LIKE '%"+t+"%' AND genre LIKE '%"+g+"%';";
        ResultSet rs = stat.executeQuery(sqlString);
        while (rs.next()) {
            Movie m = new Movie(rs.getString("title"), rs.getString("picture"), rs.getString("description"), rs.getString("trailer"), rs.getString("music"), rs.getString("titlegerman"), rs.getInt("rating"), rs.getString("genre"), rs.getString("genregerman"), rs.getInt("length"), rs.getInt("movieid"));
            if (!movieList.contains(m)) {
                movieList.add(m);
            }
        }
        connPool.releaseConnection(conn);
        return movieList;
    }
    
    public int getCountMovies() throws Exception {
        int count = getMovieList("","").size();
        return count;
    }

    public LinkedList<String> getGenres(String lang) throws Exception {
        Connection conn = connPool.getConnection();
        LinkedList<String> genreList = new LinkedList<>();
        Statement stat = conn.createStatement();
        if (lang.equals("e")) {
            String sqlString = "SELECT genre\n"
                    + "FROM movie;";

            ResultSet rs = stat.executeQuery(sqlString);
            String genre;
            genreList.add("All Movies");
            while (rs.next()) {

                genre = rs.getString("genre");
                if (!genreList.contains(genre)) {
                    genreList.add(genre);
                }
            }
        } else if (lang.equals("d")) {
            String sqlString = "SELECT genregerman\n"
                    + "FROM movie;";

            ResultSet rs = stat.executeQuery(sqlString);
            String genre;
            genreList.add("Alle Filme");
            while (rs.next()) {
                genre = rs.getString("genregerman");
                genreList.add(genre);
            }
        }
        connPool.releaseConnection(conn);
        return genreList;
    }
}
