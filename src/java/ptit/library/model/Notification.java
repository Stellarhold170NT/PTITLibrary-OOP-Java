/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ptit.library.model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Notification {
    private Integer id;
    private String notificationType;
    private String message;
    private String icon;
    private Date notificationDate;

    public Notification(Integer id, String notificationType, String message, String icon, Date notificationDate) {
        this.id = id;
        this.notificationType = notificationType;
        this.message = message;
        this.icon = icon;
        this.notificationDate = notificationDate;
    }

   
    
    
    
}
