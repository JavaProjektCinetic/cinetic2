/*
 * Author:      Sarah Resch
 * Date:        10.04.2015
 * Projectname: Cinetic
 */
package beans;

public class Seat {
    private int column;
    private int row;
    private String roomName;
    
    public Seat(int column, int row, String roomName) {
        this.column = column;
        this.row = row;
        this.roomName = roomName;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }   
}
