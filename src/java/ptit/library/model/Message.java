/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Message implements Comparable<Message>{
    private Integer id;
    private String senderID;
    private String receiverID;
    private String content;
    private Integer isDeleted;
    private Integer is_read;
    private Date timestamp;
    private Integer type;

    public Message(Integer id, String senderID, String receiverID, String content, Integer isDeleted, Integer is_read, Date timestamp) {
        this.id = id;
        this.senderID = senderID;
        this.receiverID = receiverID;
        this.content = content;
        this.isDeleted = isDeleted;
        this.is_read = is_read;
        this.timestamp = timestamp;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getSenderID() {
        return senderID;
    }

    public String getReceiverID() {
        return receiverID;
    }

    public Date getTimestamp() {
        return timestamp;
    }
    
    
    

    @Override
    public int compareTo(Message o) {
        Long a = timestamp.getTime();
        Long b = timestamp.getTime();
        return -a.compareTo(b);
    }
    
    
}
