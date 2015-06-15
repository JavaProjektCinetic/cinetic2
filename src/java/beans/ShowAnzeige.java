/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.Date;

/**
 *
 * @author Sarah
 */
public class ShowAnzeige {
    
    private String roomName;
    private int movieID;
    private Date date;
    private int takenseats;
    private int showid;
    private String time;
    private int freeseats;

    public ShowAnzeige(String roomName, int movieID, Date date, int takenseats, int showid, String time, int freeseats) {
        this.roomName = roomName;
        this.movieID = movieID;
        this.date = date;
        this.takenseats = takenseats;
        this.showid = showid;
        this.time = time;
        this.freeseats = freeseats;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
   
    public int getMovieID() {
        return movieID;
    }

    public void setMovieID(int movieID) {
        this.movieID = movieID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTakenseats() {
        return takenseats;
    }

    public void setTakenseats(int takenseats) {
        this.takenseats = takenseats;
    }

    public int getShowid() {
        return showid;
    }

    public void setShowid(int showid) {
        this.showid = showid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getFreeseats() {
        return freeseats;
    }

    public void setFreeseats(int freeseats) {
        this.freeseats = freeseats;
    }
    
}
