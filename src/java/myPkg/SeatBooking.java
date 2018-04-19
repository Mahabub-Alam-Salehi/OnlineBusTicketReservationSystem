

package myPkg;

public class SeatBooking {
    public String busCode;
    public int seatNum;
    public int price;

    public SeatBooking(String busCode, int seatNum, int price) {
        this.busCode = busCode;
        this.seatNum = seatNum;
        this.price = price;
    }

    public String getBusCode() {
        return busCode;
    }

    public void setBusCode(String busCode) {
        this.busCode = busCode;
    }

    public int getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(int seatNum) {
        this.seatNum = seatNum;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
    
}
