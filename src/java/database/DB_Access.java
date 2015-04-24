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

    public HashMap<Integer,String> getDesc() throws Exception {
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT movieid, description FROM movie;";
        HashMap<Integer, String> idDesc = new HashMap<>();
        ResultSet rs = stat.executeQuery(sqlString);
        String desc;
        int id;
        while (rs.next()) 
        {
            desc = rs.getString("description");
            id = rs.getInt("movieid");
            if (!idDesc.containsKey(desc)) 
            {
                idDesc.put(id, desc);
            }
        }
        connPool.releaseConnection(conn);
        return idDesc;
    }

    public HashMap<Integer,String> getTitle() throws Exception {
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT movieid, title FROM movie;";
        HashMap<Integer, String> idTitle = new HashMap<>();
        ResultSet rs = stat.executeQuery(sqlString);
        String title;
        int id;
        while (rs.next()) 
        {
            title = rs.getString("title");
            id = rs.getInt("movieid");
            if (!idTitle.containsKey(title)) 
            {
                idTitle.put(id, title);
            }
        }
        connPool.releaseConnection(conn);
        return idTitle;
    }
    
    public HashMap<Integer,String> getPath() throws Exception {
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT movieid, picture FROM movie;";
        HashMap<Integer, String> idPath = new HashMap<>();
        ResultSet rs = stat.executeQuery(sqlString);
        String path;
        int id;
        while (rs.next()) 
        {
            path = rs.getString("picture");
            id = rs.getInt("movieid");
            if (!idPath.containsKey(path)) 
            {
                idPath.put(id, path);
            }
        }
        connPool.releaseConnection(conn);
        return idPath;
    }
}
