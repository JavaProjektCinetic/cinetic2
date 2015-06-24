/*
 * Author:      Sarah Resch
 * Date:        10.04.2015
 * Projectname: Cinetic
 */
package beans;

public class Room {
    private int roomId;
    private String roomName;
    private int seats;
    private int preis;
    

    public Room(int roomId, String roomName, int seats, int preis) {
        this.roomId=roomId;
        this.roomName = roomName;
        this.seats = seats;
        this.preis = preis;
    }
    public int getPreis() {
        return preis;
    }

    public void setPreis(int preis) {
        this.preis = preis;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    
    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }  
}
