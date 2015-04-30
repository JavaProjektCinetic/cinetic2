/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import beans.Movie;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Set;

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
