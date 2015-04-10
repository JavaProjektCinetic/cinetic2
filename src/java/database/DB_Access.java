

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
import java.util.LinkedList;

/**
 *
 * @author Laura
 */
public class DB_Access {

//    private DB_ConnectionPool connPool;
//    private static DB_Access theInstance = null;
//    
//
//    public static DB_Access getTheInstance() throws ClassNotFoundException {
//        if (theInstance == null) {
//            theInstance = new DB_Access();
//        }
//        return theInstance;
//    }
//
//    private DB_Access() throws ClassNotFoundException {
//        connPool = DB_ConnectionPool.getTheInstance();
//    }
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
//    public LinkedList<String> getGenres() throws Exception {
//        Connection conn = connPool.getConnection();
//        LinkedList<String> genreList = new LinkedList<>();
//        Statement stat = conn.createStatement();
//        String sqlString = "SELECT name\n"
//                + "FROM category;";
//        
//        ResultSet rs = stat.executeQuery(sqlString);
//        String genre;
//        genreList.add("Alle Filme");
//        while (rs.next()) {
//            genre = rs.getString("name");
//            genreList.add(genre);
//        }
//        connPool.releaseConnection(conn);
//        return genreList;
//    }

}
