/*
 * Author:      Laura Rössl and Sarah Resch
 * Date:        10.04.2015
 * Projectname: Cinetic
 */
package database;
import beans.Movie;
import beans.Room;
import beans.Seat;
import beans.Show;
import beans.ShowAnzeige;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.Random;

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
    
    /*
     * get the created Shows from the Database and put them into a list
     */
    public LinkedList<ShowAnzeige> getShows() throws Exception {
        LinkedList<ShowAnzeige> shows = new LinkedList<>();
        LinkedList<Room> rooms = getRoomList();
        SimpleDateFormat forDate = new SimpleDateFormat("yyyy-MM-dd");
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT roomid, movieid, date, takenseats, showid, time, freeseats "
                + "FROM show";
        ResultSet rs = stat.executeQuery(sqlString);
        int roomid, movieid, takenseats, showid, freeseats;
        Date d;
        String time, roomName = "";
        while (rs.next()) {
            roomid = Integer.parseInt(rs.getString(1));
            for (int i = 0; i < rooms.size(); i++) {
                if (roomid == rooms.get(i).getRoomId()) {
                    roomName = rooms.get(i).getRoomName();
                }
            }
            movieid = Integer.parseInt(rs.getString(2));
            d = forDate.parse(rs.getString(3));
            takenseats = Integer.parseInt(rs.getString(4));
            showid = Integer.parseInt(rs.getString(5));
            time = rs.getString(6);
            freeseats = Integer.parseInt(rs.getString(7));
            ShowAnzeige s = new ShowAnzeige(roomName, movieid, d, takenseats, showid, time, freeseats);
            shows.add(s);
        }
        connPool.releaseConnection(conn);
        return shows;
    }
    
    /*
     * return the highest reservationID which already exists and add one,
     * to get the new reservationID
     */
    public int getReservationID() throws Exception {
        int reID = 0;
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT MAX(reservationid)"
                + "FROM reservation;";
        ResultSet rs = stat.executeQuery(sqlString);
        while (rs.next()) {
            reID = Integer.parseInt(rs.getString(1)) + 1;
        }
        connPool.releaseConnection(conn);
        return reID;
    }
    
    /*
     * update the ShowList and the database --> delete every Show
     * which isn't playing in the current year or month
     */
    public void setActualShows() throws Exception {
        LinkedList<ShowAnzeige> shows = getShows();
        SimpleDateFormat forDate = new SimpleDateFormat("yyyy-MM-dd");
        Date curDay = new Date();
        int cday = curDay.getDay();
        int cmonth = curDay.getMonth();
        int cyear = curDay.getYear();
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        for (int i = 0; i < shows.size(); i++) {
            ShowAnzeige s = shows.get(i);
            int day = s.getDate().getDay();
            int month = s.getDate().getMonth();
            int year = s.getDate().getYear();
            int sID = s.getShowid();
            String sqlString = "DELETE FROM show WHERE showid = " + sID;
            if (cyear > year) {
                stat.executeUpdate(sqlString);
            } else if (cmonth > month) {
                stat.executeUpdate(sqlString);
            }
        }
        shows = getShows();
        if (shows.size() < 600) {
            setShows();
        }
        connPool.releaseConnection(conn);
    }

    /*
     * creates the Shows and save them at the database
     * the first show starts at 3 p.m., the next one at 6 p.m., the next one at
     * 9 p.m. and the last one at 12 p.m.
     * The movies are chosen randomly
     */
    public void setShows() throws Exception {
        LinkedList<Show> showList = new LinkedList<>();
        SimpleDateFormat forDate = new SimpleDateFormat("yyyy-MM-dd");
        LinkedList<Room> rooms = getRoomList();
        LinkedList<String> time = new LinkedList<>();
        time.add("15:00");
        time.add("18:00");
        time.add("21:00");
        time.add("24:00");
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
        System.out.println("Day in DBAccess:" + day);
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
            String dDate = year + "-" + (month + 1) + "-" + day;
            Date d = forDate.parse(dDate);
            for (int roomID = 1; roomID <= 3; roomID++) {
                for (int j = 0; j < time.size(); j++) {
                    showID++;
                    int movieID = randi.nextInt(getCountMovies());
                    String t = time.get(j);
                    Show s = new Show(roomID, (movieID + 1), d, 0, showID, t, rooms.get(roomID - 1).getSeats());
                    showList.add(s);
                }
            }
        }
        for (int i = 0; i < showList.size(); i++) {
            Show s = showList.get(i);
            stat = conn.createStatement(); //roomID, movieID, date, showID, takenseats, time, freeseats           
            sqlString = "INSERT INTO show VALUES (" + s.getRoomID() + ", " + s.getMovieID() + ", '" + forDate.format(s.getDate()) + "', " + s.getShowid() + ", 0, " + rooms.get(s.getRoomID() - 1).getSeats() + ",'" + s.getTime() + "')";
            stat.executeUpdate(sqlString);
        }
        connPool.releaseConnection(conn);
    }
    
    /*
     * save the seats with room, row, column and seatID at the database
     * everyroom has a different number of seats
     */
    public void setSeats() throws Exception {
        LinkedList<Room> roomL = getRoomList();
        LinkedList<Seat> seatList = new LinkedList<>();
        Seat s;
        Connection conn = connPool.getConnection();
        for (int i = 0; i < roomL.size(); i++) {
            Room r = roomL.get(i);
            System.out.println(r.getRoomId());
            if (r.getRoomName().equals("Cozy Room")) {
                for (int row = 0; row < 5; row++) {
                    for (int column = 0; column < 6; column++) {
                        s = new Seat(column, row, r.getRoomName());
                        seatList.add(s);
                    }
                }
            } else if (r.getRoomName().equals("Glamour Room")) {
                for (int row = 0; row < 7; row++) {
                    for (int column = 0; column < 11; column++) {
                        if (column == 5) {
                            column++;
                        }
                        s = new Seat(column, row, r.getRoomName());
                        seatList.add(s);
                    }
                }
            } else if (r.getRoomName().equals("The Room")) {
                for (int row = 0; row < 2; row++) {
                    for (int column = 0; column < 16; column++) {
                        s = new Seat(column, row, r.getRoomName());
                        seatList.add(s);
                    }
                }
                for (int row = 3; row < 7; row++) {
                    for (int column = 0; column < 16; column++) {
                        s = new Seat(column, row, r.getRoomName());
                        seatList.add(s);
                    }
                }
                for (int row = 8; row < 15; row++) {
                    for (int column = 0; column < 16; column++) {
                        if (column == 5) {
                            column++;
                        } else if (column == 10) {
                            column++;
                        }
                        s = new Seat(column, row, r.getRoomName());
                        seatList.add(s);
                    }
                }
            }
        }
        for (int i = 0; i < seatList.size(); i++) {
            s = seatList.get(i);
            System.out.println("Roomname: " + s.getRoomName() + " Reihe: " + s.getRow() + " Sitz: " + s.getColumn());
            int roomID = 2;
            for (int j = 0; j < roomL.size(); j++) {
                if (roomL.get(j).getRoomName().equals(s.getRoomName())) {
                    roomID = roomL.get(j).getRoomId();
                }
            }
            Statement stat = conn.createStatement();
            String sqlString = "INSERT INTO seat VALUES (" + (i + 1) + ",  " + s.getRow() + ", " + roomID + ", " + s.getColumn() + ")";
            stat.executeUpdate(sqlString);
        }
        connPool.releaseConnection(conn);
    }
    
    /*
     * get the rooms from the database and save them in a list
     */
    public LinkedList<Room> getRoomList() throws Exception {
        Connection conn = connPool.getConnection();
        LinkedList<Room> roomList = new LinkedList<>();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT roomid, name, seats, preis FROM room";
        ResultSet rs = stat.executeQuery(sqlString);
        int id;
        String name;
        int seats;
        int preis;
        while (rs.next()) {
            id = rs.getInt("roomid");
            name = rs.getString("name");
            seats = rs.getInt("seats");
            preis = rs.getInt("preis");
            Room r = new Room(id, name, seats, preis);
            roomList.add(r);
        }
        connPool.releaseConnection(conn);
        return roomList;
    }
    
    /*
     * load the movies from the database into a list
     * if there was chosen any title or genre for filtering it will be considered
     */
    public LinkedList<Movie> getMovieList(String t, String g) throws Exception 
    {
        Connection conn = connPool.getConnection();
        LinkedList<Movie> movieList = new LinkedList<>();
        Statement stat = conn.createStatement();
        t = t.toUpperCase();
        if (g.equals("All Movies")) {
            g = "";
        }
        if (t == null || t.equals("")) {
            t = "";
        }
        String sqlString = "SELECT movieid, title, picture, description, trailer, music, titlegerman, rating, genre, genregerman, length "
                + "FROM movie "
                + "WHERE upper(title) LIKE '%" + t + "%' AND genre LIKE '%" + g + "%';";
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
        int count = getMovieList("", "").size();
        return count;
    }
    
    /*
     * load genres from the database and save them in a list
     */
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
    
    /*
     * create a new reservation and save it in the database with right parameters
     */
    public void newReservation(int resID, String name, String tel, int showID, String room, LinkedList<String> seats) throws Exception {
        int seatID = 0, roomID = 0;
        Connection conn = connPool.getConnection();
        LinkedList<Room> rooms = getRoomList();
        Statement stat = conn.createStatement();
        String sqlString;
        sqlString = "INSERT INTO reservation "
                + "VALUES( "+showID+" , '" + name + "', '" + tel + "', " + resID + ")";
        stat.executeUpdate(sqlString);
        for (int i = 0; i < rooms.size(); i++) {
            if (rooms.get(i).getRoomName().equals(room)) {
                roomID = rooms.get(i).getRoomId();
            }
        }

        for (int i = 0; i < seats.size(); i++) {
            String str = seats.get(i);
            String strArray[] = str.split("X");
            sqlString = "SELECT seatid "
                    + "FROM seat "
                    + "WHERE col=" + strArray[1] + " AND row=" + strArray[0] + " AND roomid=" + roomID + "";
            ResultSet rs = stat.executeQuery(sqlString);
            while (rs.next()) {
                seatID = Integer.parseInt(rs.getString(1));
            }
            sqlString = "INSERT INTO reservationseat "
                    + "VALUES(" + resID + ", " + seatID + ")";
            stat.executeUpdate(sqlString);
        }
        connPool.releaseConnection(conn);
        
    }   
   
    /*
     * get all reservated Seats and where they are located --> save it in a list
     */ 
    public LinkedList<String> getReservatedSeats() throws Exception {
        LinkedList<String> reservatedSeats = new LinkedList<String>();
        Connection conn = connPool.getConnection();
        Statement stat = conn.createStatement();
        String sqlString = "SELECT s.row, s.col, rs.showid "
                + "FROM seat s INNER JOIN reservationseat r ON (s.seatid = r.seatid) "
                + "            INNER JOIN reservation rs ON (r.reservationid = rs.reservationid)";
        ResultSet rs = stat.executeQuery(sqlString);
        String row;
        String col;
        int showID;
        while (rs.next()) {
            row = rs.getString(1);
            col = rs.getString(2);
            showID = Integer.parseInt(rs.getString(3));
            reservatedSeats.add("" + row + "X" + col+"X"+showID);
        }
        connPool.releaseConnection(conn);
        return reservatedSeats;
    }  
}
