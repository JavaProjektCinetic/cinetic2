/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import beans.Movie;
import beans.Room;
import beans.Seat;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;
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

    public static DB_Access getTheInstance() throws ClassNotFoundException {
        if (theInstance == null) {
            theInstance = new DB_Access();
        }
        return theInstance;
    }

    private DB_Access() throws ClassNotFoundException {
        connPool = DB_ConnectionPool.getTheInstance();
    }
//
//    public LinkedList<Film> getList(String t, String s, String g) throws Exception {
//        Connection conn = connPool.getConnection();
//        LinkedList<Film> filmList = new LinkedList<>();
//        Statement stat = conn.createStatement();
//        t = t.toUpperCase();
//        s = s.toUpperCase();
//        if(g.equals("Alle Filme"))
//        {
//            g="";
//        }
//        String sqlString = "SELECT title, description, category, length, actors, price "
//                         + "FROM film_list "
//                         + "WHERE title LIKE '%"+t+"%' AND actors LIKE '%"+s+"%' AND category LIKE '%"+g+"%';";
//        
//        ResultSet rs = stat.executeQuery(sqlString);
//
//        Film f;
//
//        while (rs.next()) {
//            f = new Film(rs.getString("title"), rs.getString("description"), rs.getString("category"), Integer.parseInt(rs.getString("length")), rs.getString("actors"), Double.parseDouble(rs.getString("price")));
//            if(!filmList.contains(f))
//            {
//                filmList.add(f);
//            }
//        }
//        connPool.releaseConnection(conn);
//        return filmList;
//    }
//

    public void setSeats() throws Exception {
        LinkedList<Room> roomL = getRooms();
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
            String sqlString = "INSERT INTO seat VALUES ("+(i+1)+", "+s.getColumn()+", "+s.getRow()+", (SELECT roomid" +
"                                     FROM room" +
"                                     WHERE name = '"+s.getRoomName()+"'));";
            stat.executeUpdate(sqlString);
        }
    }

    public LinkedList<Room> getRooms() throws Exception {
        Connection conn = connPool.getConnection();
        LinkedList<Room> roomList = new LinkedList<>();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT name, seats FROM room";
        ResultSet rs = stat.executeQuery(sqlString);
        String name;
        String seats;
        while (rs.next()) {
            name = rs.getString(1);
            seats = rs.getString(2);
            Room r = new Room(name, Integer.parseInt(seats));
            roomList.add(r);
        }
        return roomList;


    public LinkedList<Movie> getMovieList() throws Exception {
        //Int id, String titleEnglish, String picture, String description, String trailer, String music, String titleGerman, int rating, String genreEnglish, String genreGerman, int length
        Connection conn = connPool.getConnection();
        LinkedList<Movie> movieList = new LinkedList<>();
        Statement stat = conn.createStatement();

        String sqlString = "SELECT title, picture, description, trailer, music, titlegerman, rating, genre, genregerman, length\n"
                + "FROM movie;";

        ResultSet rs = stat.executeQuery(sqlString);
        while (rs.next()) {
            Movie m = new Movie(rs.getString("title"), rs.getString("picture"), rs.getString("description"),rs.getString("trailer"),rs.getString("music"),rs.getString("titlegerman"),rs.getInt("rating"),rs.getString("genre"),rs.getString("genregerman"),rs.getInt("length"));
            if (!movieList.contains(m)) {
                movieList.add(m);
            }
        }
        connPool.releaseConnection(conn);
        return movieList;
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

//    public HashMap<Integer, String> getDesc() throws Exception {
//        Connection conn = connPool.getConnection();
//        Statement stat = conn.createStatement();
//        String sqlString = "SELECT movieid, description FROM movie;";
//        HashMap<Integer, String> idDesc = new HashMap<>();
//        ResultSet rs = stat.executeQuery(sqlString);
//        String desc;
//        int id;
//        while (rs.next()) {
//            desc = rs.getString("description");
//            id = rs.getInt("movieid");
//            if (!idDesc.containsKey(desc)) {
//                idDesc.put(id, desc);
//            }
//        }
//        connPool.releaseConnection(conn);
//        return idDesc;
//    }
//
//    public HashMap<Integer, String> getTitle() throws Exception {
//        Connection conn = connPool.getConnection();
//        Statement stat = conn.createStatement();
//        String sqlString = "SELECT movieid, title FROM movie;";
//        HashMap<Integer, String> idTitle = new HashMap<>();
//        ResultSet rs = stat.executeQuery(sqlString);
//        String title;
//        int id;
//        while (rs.next()) {
//            title = rs.getString("title");
//            id = rs.getInt("movieid");
//            if (!idTitle.containsKey(title)) {
//                idTitle.put(id, title);
//            }
//        }
//        connPool.releaseConnection(conn);
//        return idTitle;
//    }
//
//    public HashMap<Integer, String> getPath() throws Exception {
//        Connection conn = connPool.getConnection();
//        Statement stat = conn.createStatement();
//        String sqlString = "SELECT movieid, picture FROM movie;";
//        HashMap<Integer, String> idPath = new HashMap<>();
//        ResultSet rs = stat.executeQuery(sqlString);
//        String path;
//        int id;
//        while (rs.next()) {
//            path = rs.getString("picture");
//            id = rs.getInt("movieid");
//            if (!idPath.containsKey(path)) {
//                idPath.put(id, path);
//            }
//        }
//        connPool.releaseConnection(conn);
//        return idPath;
//    }
//
//    public HashMap<Integer, Integer> getRate() throws Exception {
//        Connection conn = connPool.getConnection();
//        Statement stat = conn.createStatement();
//        String sqlString = "SELECT movieid, rating FROM movie;";
//        HashMap<Integer, Integer> idRate = new HashMap<>();
//        ResultSet rs = stat.executeQuery(sqlString);
//        int rate;
//        int id;
//        while (rs.next()) {
//            rate = rs.getInt("rating");
//            id = rs.getInt("movieid");
//            if (!idRate.containsKey(rate)) {
//                idRate.put(id, rate);
//            }
//        }
//        connPool.releaseConnection(conn);
//        return idRate;
//    }
}
